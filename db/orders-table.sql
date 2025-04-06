CREATE TYPE order_status AS ENUM ('CREATED', 'PAID', 'DELIVERED', 'CANCELLED');

CREATE TABLE IF NOT EXISTS orders (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    cart_id UUID NOT NULL,
    payment JSONB NOT NULL,
    delivery JSONB NOT NULL,
    comments TEXT,
    status order_status NOT NULL DEFAULT 'CREATED',
    total DECIMAL(10,2) NOT NULL CHECK (total >= 0),
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_DATE,
);

INSERT INTO orders ( id, user_id, cart_id, payment, delivery, comments, status, total) VALUES
    ( '0402bef1-8cde-4e4e-bffa-d11c3b926bb5', 'a2b74cef-a762-49be-a353-e0e54289ebf0', '71d9f3bb-fda9-453d-85a9-d720ee77df9d', '{"method": "creditcard", "amount": 72}'::jsonb, '{"address": "Fake St", "city": "Livonia", "state": "Michigan", "zip": " 48150"}'::jsonb, NULL, 'PAID', 72 )