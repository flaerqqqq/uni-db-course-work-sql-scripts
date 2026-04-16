INSERT INTO auth.roles (id, name) VALUES 
(1, 'ADMIN'), (2, 'EMPLOYEE'), (3, 'CLIENT');

INSERT INTO book.genres (name, slug, description) VALUES 
('Science Fiction', 'sci-fi', 'Speculative fiction with futuristic technology'),
('Fantasy', 'fantasy', 'Magical worlds and epic adventures'),
('Mystery', 'mystery', 'Suspenseful whodunits and crime solving'),
('Horror', 'horror', 'Scary stories and supernatural thrills'),
('Biography', 'biography', 'True stories of notable people'),
('History', 'history', 'Non-fiction covering past events'),
('Classic', 'classic', 'Timeless literature of high merit'),
('Poetry', 'poetry', 'Rhythmic and emotional written art'),
('Self-Help', 'self-help', 'Personal development and growth'),
('Thriller', 'thriller', 'High-stakes excitement and tension');

INSERT INTO book.characteristics (name, slug) VALUES 
('Hardcover', 'hardcover'), ('Paperback', 'paperback'), 
('Signed Edition', 'signed'), ('First Edition', 'first-edition'),
('Limited Press', 'limited'), ('Pocket Size', 'pocket'),
('Illustrated', 'illustrated'), ('New Arrival', 'new'),
('Bestseller', 'bestseller'), ('Award Winner', 'award');

INSERT INTO auth.users (email, password, name) VALUES 
('admin@library.com', 'hash_admin_123', 'Artem Polyakov'),
('manager@library.com', 'hash_mgr_456', 'Olena Shevchenko'),
('staff.k@library.com', 'hash_staff_789', 'Ivan Kovalenko'),
('john.doe@gmail.com', 'hash_user_001', 'John Doe'),
('marta.v@yahoo.com', 'hash_user_002', 'Marta Vyshnevska'),
('d.smith@outlook.com', 'hash_user_003', 'David Smith'),
('k.lewis@gmail.com', 'hash_user_004', 'Karen Lewis'),
('b.petrov@ukr.net', 'hash_user_005', 'Borys Petrov'),
('s.miller@gmail.com', 'hash_user_006', 'Sarah Miller'),
('v.hnatyuk@gmail.com', 'hash_user_007', 'Viktor Hnatyuk');

INSERT INTO auth.users_roles (user_id, role_id) VALUES 
(1, 1), (2, 2), (3, 2), (4, 3), (5, 3), (6, 3), (7, 3), (8, 3), (9, 3), (10, 3);

INSERT INTO auth.employees (id, phone, birth_date) VALUES 
(2, '+380501234567', '1988-05-14'),
(3, '+380679876543', '1992-11-20');

INSERT INTO auth.clients (id, balance) VALUES 
(4, 150.00), (5, 45.50), (6, 0.00), (7, 500.25), 
(8, 12.00), (9, 89.90), (10, 210.00);

INSERT INTO book.authors (name, slug, bio) VALUES 
('George Orwell', 'george-orwell', 'English novelist and essayist, famous for 1984.'),
('J.K. Rowling', 'jk-rowling', 'British author best known for the Harry Potter series.'),
('Stephen King', 'stephen-king', 'The King of Horror and supernatural fiction.'),
('Taras Shevchenko', 'taras-shevchenko', 'Greatest Ukrainian poet and artist.'),
('Isaac Asimov', 'isaac-asimov', 'American writer known for hard science fiction.'),
('Agatha Christie', 'agatha-christie', 'The Queen of Crime and detective novels.'),
('Ernest Hemingway', 'ernest-hemingway', 'American novelist known for minimalist style.'),
('J.R.R. Tolkien', 'jrr-tolkien', 'Father of modern high fantasy literature.'),
('Haruki Murakami', 'haruki-murakami', 'Japanese writer of surrealistic fiction.'),
('Mary Shelley', 'mary-shelley', 'Author of Frankenstein and gothic pioneer.');

INSERT INTO book.books (name, age_group, price, publication_date, number_of_pages, description, language) VALUES 
('1984', 'ADULT', 15.99, '1949-06-08', 328, 'Dystopian social science fiction masterpiece.', 'ENGLISH'),
('Kobzar', 'ADULT', 25.00, '1840-04-26', 400, 'Collection of poetic works.', 'UKRAINIAN'),
('The Hobbit', 'TEEN', 12.50, '1937-09-21', 310, 'A fantasy adventure about Bilbo Baggins.', 'ENGLISH'),
('Murder on the Orient Express', 'ADULT', 10.99, '1934-01-01', 256, 'Hercule Poirot solves a train mystery.', 'ENGLISH'),
('The Shining', 'ADULT', 18.00, '1977-01-28', 447, 'Psychological horror at the Overlook Hotel.', 'ENGLISH'),
('Frankenstein', 'TEEN', 9.50, '1818-01-01', 280, 'A scientist creates life with tragic results.', 'ENGLISH'),
('Kafka on the Shore', 'ADULT', 21.00, '2002-09-12', 505, 'Surreal tale of a boy and an old man.', 'JAPANESE'),
('The Old Man and the Sea', 'ADULT', 11.00, '1952-09-01', 127, 'The struggle between an old fisherman and a marlin.', 'ENGLISH'),
('Foundation', 'TEEN', 14.20, '1951-06-01', 255, 'Predicting the fall of a galactic empire.', 'ENGLISH'),
('Harry Potter and the Sorcerer Stone', 'CHILD', 19.99, '1997-06-26', 223, 'A boy discovers he is a wizard.', 'ENGLISH');

INSERT INTO book.books_authors (book_id, author_id) VALUES 
(1, 1), (2, 4), (3, 8), (4, 6), (5, 3), (6, 10), (7, 9), (8, 7), (9, 5), (10, 2);

INSERT INTO book.books_genres (book_id, genre_id) VALUES 
(1, 1), (1, 7), (2, 8), (2, 7), (3, 2), (4, 3), (5, 4), (6, 4), (7, 10), (10, 2);

INSERT INTO book.books_characteristics (book_id, characteristic_id) VALUES 
(1, 1), (1, 10), (2, 4), (3, 2), (10, 8), (10, 9);

INSERT INTO sales.shopping_carts (client_id, total_amount) VALUES (4, 30.98);

INSERT INTO sales.shopping_cart_items (cart_id, book_id, quantity, price_at_add, subtotal) VALUES 
(1, 1, 1, 15.99, 15.99),
(1, 10, 1, 19.99, 19.99);

INSERT INTO sales.orders (client_id, employee_id, order_date, total_amount, delivery_type, status, version) VALUES 
(5, 2, '2024-03-20 14:30:00+02', 25.00, 'STANDARD', 'COMPLETED', 1);

INSERT INTO sales.order_items (order_id, book_public_id, book_name, price_at_purchase, quantity, subtotal) VALUES 
(1, (SELECT public_id FROM book.books WHERE id = 2), 'Kobzar', 25.00, 1, 25.00);
