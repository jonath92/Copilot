-- Initialize the tasks database
CREATE DATABASE taskdb;

-- Use the tasks database
\c taskdb;

-- Create the tasks table
CREATE TABLE IF NOT EXISTS tasks (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    duration INTEGER -- Duration in minutes
);

-- Insert some sample data
INSERT INTO tasks (title, description, duration) VALUES
    ('Setup Development Environment', 'Install and configure development tools', 120),
    ('Create Database Schema', 'Design and implement database structure', 90),
    ('Build API Endpoints', 'Develop REST API for task management', 180),
    ('Frontend Implementation', 'Create user interface for task management', 240);

-- Create indexes for better performance
CREATE INDEX idx_tasks_title ON tasks(title);
CREATE INDEX idx_tasks_duration ON tasks(duration);

-- Grant permissions to the task user
GRANT ALL PRIVILEGES ON DATABASE taskdb TO taskuser;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO taskuser;
GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO taskuser;