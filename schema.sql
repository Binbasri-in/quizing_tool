-- Author: Mohammed Ali
-- Date: 2023-03-19
-- Description: This file contains the Schema for the Quizing tool database using SQLite

-- Drop tables if they exist
DROP TABLE IF EXISTS Answers;
DROP TABLE IF EXISTS Document_Questions;
DROP TABLE IF EXISTS Documents;
DROP TABLE IF EXISTS Options;
DROP TABLE IF EXISTS Questions;
DROP TABLE IF EXISTS Categories;
DROP TABLE IF EXISTS Students;
DROP TABLE IF EXISTS Teachers;

-- Create tables
CREATE TABLE Teachers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    hash TEXT NOT NULL
);


CREATE TABLE Students (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    student_number TEXT NOT NULL UNIQUE,
    hash TEXT NOT NULL
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

-- a table for each question and document that are live
CREATE TABLE Live_Questions (
    id SERIAL PRIMARY KEY,
    question_id INTEGER NOT NULL,
    FOREIGN KEY (question_id) REFERENCES Questions(id)
);

CREATE TABLE Live_Documents (
    id SERIAL PRIMARY KEY,
    document_id INTEGER NOT NULL,
    FOREIGN KEY (document_id) REFERENCES Documents(id)
);