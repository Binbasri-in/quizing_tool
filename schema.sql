CREATE TABLE Teachers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE Students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    student_number TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL
);

CREATE TABLE Categories (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

CREATE TABLE Questions (
    id SERIAL PRIMARY KEY,
    question TEXT NOT NULL,
    type TEXT NOT NULL,
    category_id INTEGER NOT NULL,
    live INTEGER DEFAULT 0,
    FOREIGN KEY (category_id) REFERENCES Categories(id)
);

CREATE TABLE Options (
    id SERIAL PRIMARY KEY,
    option TEXT NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions(id)
);

CREATE TABLE Documents (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE,
    teacher_id INTEGER NOT NULL,
    live INTEGER DEFAULT 0,
    FOREIGN KEY (teacher_id) REFERENCES Teachers(id)
);

CREATE TABLE Document_Questions (
    document_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (document_id) REFERENCES Documents(id),
    FOREIGN KEY (question_id) REFERENCES Questions(id)
);

CREATE TABLE Answers (
    id SERIAL PRIMARY KEY,
    student_id INTEGER NOT NULL,
    question_id INTEGER NOT NULL,
    answer TEXT NOT NULL,
    timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (student_id) REFERENCES Students(id),
    FOREIGN KEY (question_id) REFERENCES Questions(id)
);
