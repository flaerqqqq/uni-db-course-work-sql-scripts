DROP SCHEMA IF EXISTS audit CASCADE;

CREATE SCHEMA audit;

CREATE TABLE audit.critical_table_audit(
    id BIGINT GENERATED ALWAYS AS IDENTITY,
    schema_name TEXT NOT NULL,
    table_name TEXT NOT NULL,
    operation TEXT NOT NULL,
    old_data JSONB,
    new_data JSONB,
    changed_at TIMESTAMPTZ DEFAULT now(),
    db_user TEXT DEFAULT CURRENT_USER,
    CONSTRAINT pk_critical_table_audit PRIMARY KEY (id)
);

CREATE OR REPLACE FUNCTION audit.fn_generic_log()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO audit.critical_table_audit(schema_name, table_name, operation, new_data)
        VALUES (TG_TABLE_SCHEMA, TG_TABLE_NAME, TG_OP, TO_JSONB(NEW));

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO audit.critical_table_audit(schema_name, table_name, operation, old_data, new_data)
        VALUES (TG_TABLE_SCHEMA, TG_TABLE_NAME, TG_OP, TO_JSONB(OLD), TO_JSONB(NEW));

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO audit.critical_table_audit(schema_name, table_name, operation, old_data)
        VALUES (TG_TABLE_SCHEMA, TG_TABLE_NAME, TG_OP, TO_JSONB(OLD));

        RETURN OLD;

    END IF;

    RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER trg_users_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.users
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_users_roles_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.users_roles
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_roles_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.roles
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_clients_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.clients
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_employees_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.employees
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_admins_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON auth.admins
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();

CREATE OR REPLACE TRIGGER trg_books_aiud_audit
AFTER INSERT OR UPDATE OR DELETE
ON book.books
FOR EACH ROW
EXECUTE FUNCTION audit.fn_generic_log();


CREATE OR REPLACE VIEW audit.v_critical_table_audit_short_data AS
SELECT 
    id,
    schema_name,
    table_name,
    operation,
    LEFT(old_data::TEXT, 40) AS old_data,
    LEFT(new_data::TEXT, 40) AS new_data,
    changed_at,
    db_user
FROM
    audit.critical_table_audit
ORDER BY changed_at DESC;
