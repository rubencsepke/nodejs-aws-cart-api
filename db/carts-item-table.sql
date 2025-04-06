CREATE TABLE IF NOT EXISTS cart_items (
    cart_id UUID NOT NULL,
    product_id UUID NOT NULL,
    count INTEGER NOT NULL,
    PRIMARY KEY (cart_id, product_id),
    FOREIGN KEY (cart_id) REFERENCES carts(id)
);

INSERT INTO cart_items (cart_id, product_id, count) VALUES
    ('510d8fbf-0063-4637-91aa-b95373438ae7', '2b5500c9-e813-4627-adcd-5f7bc29f0633', 8),
    ('510d8fbf-0063-4637-91aa-b95373438ae7', '688fedce-ff9f-45c5-a85f-3ce714576162', 10),