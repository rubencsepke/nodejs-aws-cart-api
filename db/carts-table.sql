CREATE TYPE cart_status AS ENUM ('OPEN', 'ORDERED');

CREATE TABLE IF NOT EXISTS carts (
    id UUID PRIMARY KEY,
    user_id UUID NOT NULL,
    created_at DATE NOT NULL,
    updated_at DATE NOT NULL,
    status cart_status NOT NULL DEFAULT 'OPEN'
); 

INSERT INTO carts (id, user_id, created_at, updated_at, status) VALUES
    ('510d8fbf-0063-4637-91aa-b95373438ae7', '4c599797-9785-498d-8251-312a7ff76fbf', CURRENT_DATE, CURRENT_DATE, 'OPEN'),