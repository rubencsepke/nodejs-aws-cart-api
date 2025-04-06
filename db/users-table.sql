CREATE TABLE IF NOT EXISTS users (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO users (id, email, password) VALUES
    ( 'a2b74cef-a762-49be-a353-e0e54289ebf0', 'jon@doe.com', 'password' ),
    ( '0c317c81-9813-4eb8-b82e-b6f792f4ddd3', 'jane@doe.com', 'password' ),
    ( '4c599797-9785-498d-8251-312a7ff76fbf', 'user@user.com', 'password' );