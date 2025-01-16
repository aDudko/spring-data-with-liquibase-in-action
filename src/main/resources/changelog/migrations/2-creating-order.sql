CREATE TYPE order_status AS ENUM ('PENDING', 'PAID', 'APPROVED', 'CANCELLED', 'CANCELLING');

CREATE TABLE IF NOT EXISTS "order".orders
(
    id               uuid           NOT NULL,
    customer_id      uuid           NOT NULL,
    price            NUMERIC(10, 2) NOT NULL,
    order_status     order_status   NOT NULL,
    failure_messages CHARACTER VARYING COLLATE pg_catalog."default",
    CONSTRAINT orders_pkey PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS "order".order_items
(
    id         BIGINT         NOT NULL,
    order_id   uuid           NOT NULL,
    product_id uuid           NOT NULL,
    price      NUMERIC(10, 2) NOT NULL,
    CONSTRAINT order_items_pkey PRIMARY KEY (id, order_id)
);

ALTER TABLE IF EXISTS "order".order_items
    ADD CONSTRAINT "FK_ORDER_ID" FOREIGN KEY (order_id)
        REFERENCES "order".orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID;

CREATE TABLE IF NOT EXISTS "order".order_address
(
    id          uuid                                           NOT NULL,
    order_id    uuid UNIQUE                                    NOT NULL,
    street      CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    postal_code CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    city        CHARACTER VARYING COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_address_pkey PRIMARY KEY (id, order_id)
);

ALTER TABLE IF EXISTS "order".order_address
    ADD CONSTRAINT "FK_ORDER_ID" FOREIGN KEY (order_id)
        REFERENCES "order".orders (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
        NOT VALID;