CREATE DATABASE erickson_business;

CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL,
    password_hash TEXT NOT NULL,
    role VARCHAR(20) DEFAULT 'cliente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE services (
    id SERIAL PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(12,2) DEFAULT 0,
    active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE projects (
    id SERIAL PRIMARY KEY,
    title VARCHAR(150) NOT NULL,
    category VARCHAR(100),
    description TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    service_id INTEGER REFERENCES services(id),
    status VARCHAR(50) DEFAULT 'Solicitado',
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    message TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE invoices (
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id),
    order_id INTEGER REFERENCES orders(id),
    amount DECIMAL(12,2),
    status VARCHAR(50) DEFAULT 'Pendente',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);