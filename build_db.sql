CREATE DATABASE IF NOT EXISTS diary;

USE diary;

CREATE TABLE IF NOT EXISTS users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(256) UNIQUE,
    password VARCHAR(256),
    user_name VARCHAR(256),
    user_email VARCHAR(256),
    address_f VARCHAR(256),
    address_l VARCHAR(256),
    img VARCHAR(256)
);

INSERT INTO users (user_id, password, user_name, user_email, address_f, address_l, img)
VALUES ("abc123", "4119f341f23c55ebf02d7bd735946d6a8cf03f390ff6a9c7c1ce6641a5469b16", "JunHyeongPark", 
"abc123@extemp.com", "119 songdo moonwha-ro", "Incheon, Yeonsu-gu, Korea", "");

-- ID: abc123 , pwd: 112980317 password is crypted in SHA256 in crypto-js SHA256

CREATE TABLE IF NOT EXISTS questions(
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id VARCHAR(256),
    question VARCHAR(256),
    qeustion_selection JSON,
    question_type VARCHAR(256),
    question_answers JSON
);

INSERT INTO questions(user_id, question, qeustion_selection, question_type, question_answers) VALUES(
    "abc123", "You good?", '["Good", "Soso", "Bad"]', "multiple choice", '[{"date": "2022-12-1", "answer": "Good"}, {"date": "2022-12-1", "answer": "Bad"}]'
);

INSERT INTO questions(user_id, question, qeustion_selection, question_type, question_answers) VALUES(
    "abc123", "How many times did you push up?", "[]", "number", '[{"date": "2022-12-1", "answer": "10"}, {"date": "2022-12-1", "answer": "40"}]'
);

INSERT INTO questions(user_id, question, qeustion_selection, question_type, question_answers) VALUES(
    "abc123", "Did you have a good day?", "[]", "boolean", '[{"date": "2022-12-1", "answer": "TRUE"}, {"date": "2022-12-1", "answer": "FALSE"}]'
);

INSERT INTO questions(user_id, question, qeustion_selection, question_type, question_answers) VALUES(
    "abc123", "Decribe your day", "[]", "text", '[{"date": "2022-12-1", "answer": "It was good"}, {"date": "2022-12-1", "answer": "It was bad"}]'
);

-- compare with date and user_id and get question and questoion_value
-- we dont need to think about question_type since it is varchar
-- order is the order of question set, if we change the question set, reassemble question set
-- and put into question_set, split the question_set and put index number into order and String into question