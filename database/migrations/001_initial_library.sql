-- Table # 1 student
CREATE TABLE IF NOT EXISTS student (

    -- Primary key for the student table
    student_id INT PRIMARY KEY AUTO_INCREMENT,

    -- Student name
    student_first_name VARCHAR(50) NOT NULL,
    student_last_name VARCHAR(50) NOT NULL,

    -- Student Course
    student_course VARCHAR(50) NOT NULL,

    -- Student created at timestamp
    student_created_at TIMESTAMP NOT NULL 
    DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_unicode_ci;


-- Table #2 book
CREATE TABLE IF NOT EXISTS books (

    -- Primary key for the book table
    book_id INT PRIMARY KEY AUTO_INCREMENT,

    -- Book details
    book_title VARCHAR(50) NOT NULL,
    book_author VARCHAR(50) NOT NULL,
    book_category VARCHAR(50) NOT NULL,

    -- Book created at timestamp
    book_created_at TIMESTAMP NOT NULL
    DEFAULT CURRENT_TIMESTAMP

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_unicode_ci;


-- Table #3 borrow

CREATE TABLE IF NOT EXISTS borrow (

    -- Primary key for the borrow table
    borrow_id INT AUTO_INCREMENT PRIMARY KEY,

    -- Foreign key referencing 
    student_id INT NOT NULL,
    book_id INT NOT NULL,
    
    -- Borrow timestamp not null by default
    borrow_date TIMESTAMP NOT NULL 
        DEFAULT CURRENT_TIMESTAMP,

    -- Borrow return timestamp null by default
    borrow_return_date TIMESTAMP NULL 
        DEFAULT NULL,

    -- Borrow table constraints and foreign keys
    CONSTRAINT fk_borrow_student 
        FOREIGN KEY (student_id) 
        REFERENCES student(student_id) 
        ON UPDATE CASCADE
        ON DELETE RESTRICT,

    CONSTRAINT fk_borrow_book
        FOREIGN KEY (book_id) 
        REFERENCES books(book_id) 
        ON UPDATE CASCADE
        ON DELETE RESTRICT

) ENGINE=InnoDB
DEFAULT CHARSET=utf8mb4 
COLLATE=utf8mb4_unicode_ci;


-- Insert statement #1: Insert Students
-- Insert statement #2: Insert Books
-- Insert statement #3: Insert Borrow 

-- STUDENTS
INSERT INTO student
(student_first_name,student_last_name,student_course) VALUES
('STEPHEN', 'COLAO', 'BSIT'),
('KRISTINE', 'COLAO', 'TEP'),
('ROSEBERT', 'BONGCAO', 'BSIT');


-- BOOKS

INSERT INTO books 
(book_title,book_author,book_category) VALUES
('The Hobbit', 'J.R.R. Tolkien', 'Fantasy'),
('Harry Potter', 'J.K. Rowling', 'Fantasy'),
('Pride and Prejudice', 'Jane Austen', 'Romance');


-- BORROW

INSERT INTO borrow (student_id,book_id) VALUES
(1,2),
(2,1),
(3,3);
