--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carts (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    is_current_cart boolean DEFAULT true NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.carts OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: colors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.colors (
    id uuid NOT NULL,
    name character varying(20) NOT NULL,
    hex_code character varying(20) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.colors OWNER TO postgres;

--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: order_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_products (
    id uuid NOT NULL,
    order_id uuid NOT NULL,
    product_id uuid NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.order_products OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id uuid NOT NULL,
    user_id uuid,
    shipping_method uuid NOT NULL,
    payment_method uuid NOT NULL,
    shipping_details uuid NOT NULL,
    price numeric(8,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: payment_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.payment_details (
    id uuid NOT NULL,
    payment_method character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    CONSTRAINT payment_details_payment_method_check CHECK (((payment_method)::text = ANY ((ARRAY['CARD'::character varying, 'CASH'::character varying])::text[])))
);


ALTER TABLE public.payment_details OWNER TO postgres;

--
-- Name: product_carts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_carts (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    cart_id uuid NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    size character varying(255)
);


ALTER TABLE public.product_carts OWNER TO postgres;

--
-- Name: product_images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_images (
    id uuid NOT NULL,
    product_id uuid NOT NULL,
    image_url character varying(500),
    is_main boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.product_images OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id uuid NOT NULL,
    category_id uuid NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(200) NOT NULL,
    in_stock integer DEFAULT 0 NOT NULL,
    price numeric(8,2) DEFAULT '0'::numeric NOT NULL,
    discounted_price numeric(8,2) DEFAULT '0'::numeric NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    color character varying(10)
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id uuid,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: shipping_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping_details (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    address character varying(100) NOT NULL,
    city character varying(80) NOT NULL,
    zip character varying(20) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.shipping_details OWNER TO postgres;

--
-- Name: shippings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shippings (
    id uuid NOT NULL,
    name character varying(50) NOT NULL,
    price numeric(5,2) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.shippings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    is_admin boolean DEFAULT false NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.carts (id, user_id, is_current_cart, created_at, updated_at) FROM stdin;
01965c1b-e418-701c-9fa9-a7e981629089	019653f7-5699-73ae-82ac-1e31d803ec5f	t	2025-04-22 06:07:33	2025-04-22 06:07:33
019682de-773e-72fc-bd7d-1d897416f174	01968077-4d46-7392-8b69-bd7480c873fe	t	2025-04-29 18:45:39	2025-04-29 18:45:39
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
94965e4b-102d-499c-bff7-036e99ea0a6c	T-shirt	2025-04-15 19:32:34	2025-04-15 19:32:34
835439ff-b633-4b84-9578-8b4c3ff51daf	Hat	2025-04-21 21:26:20	2025-04-21 21:26:20
\.


--
-- Data for Name: colors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.colors (id, name, hex_code, created_at, updated_at) FROM stdin;
c6fb51dd-aa99-408e-897f-e92feff059c9	black	000000	2025-04-15 19:40:34	2025-04-15 19:40:34
16d14758-c187-4e93-809b-b08a7ddd0547	white	FFFFFF	2025-04-15 19:41:26	2025-04-15 19:41:26
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
7	2025_04_15_114715_create_colors_table	1
8	2025_04_15_093626_create_categories_table	2
9	2025_04_15_092147_create_products_table	3
10	2025_04_15_091052_create_product_images_table	4
11	0001_01_01_000000_create_users_table	5
12	0001_01_01_000001_create_cache_table	5
13	0001_01_01_000002_create_jobs_table	5
14	2025_04_15_094005_create_carts_table	5
15	2025_04_15_094738_create_product_carts_table	5
16	2025_04_15_094957_create_payment_details_table	5
17	2025_04_15_095228_create_shippings_table	5
18	2025_04_15_095416_create_shipping_details_table	5
19	2025_04_15_113748_create_orders_table	5
20	2025_04_15_114204_create_order_products_table	5
\.


--
-- Data for Name: order_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_products (id, order_id, product_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, user_id, shipping_method, payment_method, shipping_details, price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: payment_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.payment_details (id, payment_method, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: product_carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_carts (id, product_id, cart_id, quantity, created_at, updated_at, size) FROM stdin;
99d8b49b-9023-4e4e-9f28-48759208e8c5	2c3226eb-2cfc-4ec7-8ef8-71c4268480c5	01965c1b-e418-701c-9fa9-a7e981629089	2	2025-04-22 09:32:31	2025-04-22 09:32:31	S
\.


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_images (id, product_id, image_url, is_main, created_at, updated_at) FROM stdin;
b8fb4978-e310-48a6-bb2a-f108fdbb8517	e1815fdb-431a-4c2b-9c09-a98ee28685df	example_shirt_front.png	t	2025-04-15 19:59:09	2025-04-15 19:59:09
75ba266b-43f4-4b90-b142-7ac657151946	e1815fdb-431a-4c2b-9c09-a98ee28685df	example_shirt_side.png	f	2025-04-15 20:00:15	2025-04-15 20:00:15
897cebbe-da8c-4baf-9467-e361a112b936	e1815fdb-431a-4c2b-9c09-a98ee28685df	example_shirt_side1.png	f	2025-04-15 20:00:20	2025-04-15 20:00:20
fbadb7ab-c38e-45c0-b90f-b1a65f14e0fc	2c3226eb-2cfc-4ec7-8ef8-71c4268480c5	example_shirt_side1.png	f	2025-04-19 19:57:38	2025-04-19 19:57:38
78f6f189-57ad-44a2-83e4-e1148f85c014	2c3226eb-2cfc-4ec7-8ef8-71c4268480c5	example_shirt_side.png	f	2025-04-19 19:57:44	2025-04-19 19:57:44
4118ad21-3f0e-4263-b76a-73817c60bf0d	2c3226eb-2cfc-4ec7-8ef8-71c4268480c5	example_shirt_Montag.png	t	2025-04-19 19:57:24	2025-04-19 19:57:24
11ba52d4-4157-49b8-98d3-985e03943142	8e66bfc9-9415-4ba6-9223-61aa49fffbf2	example_shirt_front2.png	t	2025-04-19 20:02:25	2025-04-19 20:02:25
b4d5b6f5-c87d-4554-b0f5-65df1afb2b01	8e66bfc9-9415-4ba6-9223-61aa49fffbf2	example_shirt_side1.png	f	2025-04-19 20:02:35	2025-04-19 20:02:35
f3114481-bbe5-48a2-9a3b-d37e394f0bff	8e66bfc9-9415-4ba6-9223-61aa49fffbf2	example_shirt_side.png	f	2025-04-19 20:02:41	2025-04-19 20:02:41
ae4f8c42-15d3-4e29-be89-8eea7ba8452d	2e4a88ee-feed-4ba2-853c-0cf61d725105	example_shirt_Cool.png	t	2025-04-19 20:04:50	2025-04-19 20:04:50
1d12fa9a-ea5e-4fe7-8010-72af79ac1ad3	2e4a88ee-feed-4ba2-853c-0cf61d725105	example_shirt_side_white1.png	f	2025-04-19 20:05:02	2025-04-19 20:05:02
bff557b4-c617-4f7a-8840-3dc22d28ad4c	2e4a88ee-feed-4ba2-853c-0cf61d725105	example_shirt_side_white.png	f	2025-04-19 20:05:07	2025-04-19 20:05:07
8cbe8e42-3bc3-41dc-998a-a3e1c8dc9586	3c554169-6309-41d5-90cc-4b54d1f54503	example_shirt_front_white.png	t	2025-04-19 20:07:28	2025-04-19 20:07:28
db2ab455-0fbf-4d99-823a-b6ae0d5e5f3f	3c554169-6309-41d5-90cc-4b54d1f54503	example_shirt_side_white.png	f	2025-04-19 20:07:51	2025-04-19 20:07:51
d7227d23-d6aa-4c53-a856-6290dddbedf0	3c554169-6309-41d5-90cc-4b54d1f54503	example_shirt_side_white1.png	f	2025-04-19 20:07:40	2025-04-19 20:07:40
6600ae27-879d-4f52-a668-14adc3267b0f	924119d1-fc24-4bc1-a37b-a25d9ce32e30	hat_front.png	t	2025-04-21 21:40:45	2025-04-21 21:40:45
240b22d8-6858-4d7a-9db2-c779d5b4eb4e	924119d1-fc24-4bc1-a37b-a25d9ce32e30	hat_side_1.png	f	2025-04-21 21:40:57	2025-04-21 21:40:57
7070f81c-7224-4c23-9ea7-a51fc01f4374	924119d1-fc24-4bc1-a37b-a25d9ce32e30	hat_side_2.png	f	2025-04-21 21:41:05	2025-04-21 21:41:05
991dd98b-87d1-413b-8c0e-84593a58b440	fd422b52-6fff-4120-8c55-63ef2b8cb209	hat_front_2.png	t	2025-04-21 21:41:39	2025-04-21 21:41:39
7ec17c1b-3e3d-449f-be2d-7fafa344570f	fd422b52-6fff-4120-8c55-63ef2b8cb209	hat_side_1.png	f	2025-04-21 21:41:52	2025-04-21 21:41:52
099a8828-abd2-48fb-9d18-4080f4912869	fd422b52-6fff-4120-8c55-63ef2b8cb209	hat_side_2.png	f	2025-04-21 21:41:53	2025-04-21 21:41:53
fcebe9ec-1ca0-46e5-ab0d-4890a6126780	373de32e-bd7d-4482-8b74-1f239858cd02	yourTextHereHat.png	t	2025-04-21 21:42:24	2025-04-21 21:42:24
af571a98-d5fc-46f5-80b1-b2bfd397b5d8	373de32e-bd7d-4482-8b74-1f239858cd02	hat_side_1.png	f	2025-04-21 21:42:37	2025-04-21 21:42:37
b162e70e-3e40-4d8b-8a02-d6533fbf45d3	373de32e-bd7d-4482-8b74-1f239858cd02	hat_side_2.png	f	2025-04-21 21:42:41	2025-04-21 21:42:41
8bcf6a8f-78b5-4465-b757-5add81c17bc9	358e6d0e-4b9d-4f2a-a9b3-a4d2419bc49b	weirdHat.png	t	2025-04-21 21:43:02	2025-04-21 21:43:02
117bad66-6ec3-4516-b235-29e7cc012423	358e6d0e-4b9d-4f2a-a9b3-a4d2419bc49b	hat_side_1.png	f	2025-04-21 21:43:10	2025-04-21 21:43:10
92e5e38c-0cba-461e-b349-96fe2ea0438e	358e6d0e-4b9d-4f2a-a9b3-a4d2419bc49b	hat_side_2.png	f	2025-04-21 21:43:12	2025-04-21 21:43:12
b34de7cf-62d3-400c-81d3-fa86bf5dc323	d9a24583-006f-49e0-b788-84931d5413a0	fiitGreatAgainHat.png	t	2025-04-21 21:43:32	2025-04-21 21:43:32
332aa2e1-cac8-4336-90c9-6999ed141388	d9a24583-006f-49e0-b788-84931d5413a0	hat_side_1.png	f	2025-04-21 21:43:40	2025-04-21 21:43:40
89498a1c-6558-4872-8d2e-1dafd66cb065	d9a24583-006f-49e0-b788-84931d5413a0	hat_side_2.png	f	2025-04-21 21:43:41	2025-04-21 21:43:41
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, category_id, name, description, in_stock, price, discounted_price, created_at, updated_at, color) FROM stdin;
e1815fdb-431a-4c2b-9c09-a98ee28685df	94965e4b-102d-499c-bff7-036e99ea0a6c	Black Shirt	A really cool black shirt with cool cat that will make girls LOVE YOU like in Play Boy adds.	100	29.99	19.99	2025-04-15 19:46:24	2025-04-15 19:46:24	000000
8e66bfc9-9415-4ba6-9223-61aa49fffbf2	94965e4b-102d-499c-bff7-036e99ea0a6c	Black Shirt Cute Kitty	Cute kitty... What more needs to be said. Good looking kitty very pettable and has much to spare in terms of cuteness meow meow meow.	100	29.99	19.99	2025-04-19 20:01:33	2025-04-19 20:01:33	000000
2c3226eb-2cfc-4ec7-8ef8-71c4268480c5	94965e4b-102d-499c-bff7-036e99ea0a6c	Black Shirt Guy Morgan	Shirt with picture that is the most realistic depiction of Guy Morgan from Farenheit 451 that modern science could depict.	100	26.99	19.99	2025-04-19 19:56:44	2025-04-19 19:56:44	000000
2e4a88ee-feed-4ba2-853c-0cf61d725105	94965e4b-102d-499c-bff7-036e99ea0a6c	White Shirt with Chill Cat	Chilles dude in the world. Has many hoes but he only cares about his league of lengeds rank because he is chill like that.	100	29.99	19.99	2025-04-19 20:04:21	2025-04-19 20:04:21	FFFFFF
3c554169-6309-41d5-90cc-4b54d1f54503	94965e4b-102d-499c-bff7-036e99ea0a6c	White Shirt with Ugly Creature	White Shirt depicting hideous createure that is impossible to look at but wait... What is this ??? It is just another cat !!!	100	29.99	19.99	2025-04-19 20:07:02	2025-04-19 20:07:02	FFFFFF
924119d1-fc24-4bc1-a37b-a25d9ce32e30	835439ff-b633-4b84-9578-8b4c3ff51daf	Cool hat	A kinda cool hat going brrr moew meow meow	123	9.99	8.99	2025-04-21 21:30:24	2025-04-21 21:30:24	FFFFFF
fd422b52-6fff-4120-8c55-63ef2b8cb209	835439ff-b633-4b84-9578-8b4c3ff51daf	L9 hat	ratirl spacegliding on lowelo stomping their candy parents	123	9.99	8.99	2025-04-21 21:31:26	2025-04-21 21:31:26	FFFFFF
358e6d0e-4b9d-4f2a-a9b3-a4d2419bc49b	835439ff-b633-4b84-9578-8b4c3ff51daf	Hat with everything	Hat that has lot of designs all on top of eachother	123	9.99	9.98	2025-04-21 21:33:57	2025-04-21 21:33:57	FFFFFF
d9a24583-006f-49e0-b788-84931d5413a0	835439ff-b633-4b84-9578-8b4c3ff51daf	Make FIIT GREAT AGAIN	LETS MAKE FIIT GREAT AGAIN BY ALL COMMITTING	123	9.99	8.99	2025-04-21 21:34:53	2025-04-21 21:34:53	FFFFFF
373de32e-bd7d-4482-8b74-1f239858cd02	835439ff-b633-4b84-9578-8b4c3ff51daf	Your text goes here	Hat that literally says "your text goes here"	123	9.99	4.99	2025-04-21 21:32:21	2025-04-21 21:32:21	FFFFFF
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
p30UyUZ1VCv5Lgov1VPGBwt4QrMj2Ux7VefC8D2p	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibnRzWHg5RDd6TVVFaG43VWROWkNWTmQxU1B2aFR3OE1NNmJnRVU3UCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208513
zJWaF2JFXjq11wpTRbvCa3y252ilJeInu354Yqi1	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXpyekhzUzdCbWRmVk9QemtkMFZidmdIV1h1U1dkQjJOdzVaeEU1aCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208724
YUwWEJnfRDtUUFfsgpMeDdejgzLwfWu01AaS7B4D	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY1h0STBscDd3VktaSHJwa3dNcXU1UktBYXl4Q2lYS0JlNWQ2dUdwSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208976
CYp9H3oyx95UoynBZOig6wxjiNzJcqTlCL7grYEu	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGZtVzF5azR0ZEFUNEdHZlZ2eHI3bGNUWnhkdGQ1SENoTjQyZEprZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209707
d2axqZPRNNcm0uHuTM1cmDUX38k8cfXL7KoWfCwJ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTFltZU9JdVRIbmtKdmpmWVF5WlNRMWFiTWJpb20zeW5IcmRBbVZVWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209821
QvPoj8ZfHPZpynhekPMvyv52eArz7xkKfvCsMktf	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUDREbGNwUUNnQVluV2pEeGx0R0c1cmcyemdwa1M4VHdDQlhoMWtWbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209849
g6z6MLC5fBRemYXe1lXSCFDzGMLaG0Nand8l89WZ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoia2hWd21STDIwUVp6U3paWUtyaW5yNjJBdXE0RE92b1NFYmI5dlJsZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257084
RWheS3WVM480pDrpduVbcP234Gyj6VTiaCqveoch	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVm13Qlp1Ynp3TVQyRWR4WlRBNlJTbE91dnVhR0xtS2Vpb0hQSGgxWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746261400
av2Q5qLl2AQwEX8jgMCpLLqxAG7J0oY4BLBtAvuz	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUmtpUTlXSG9WNEs1d2lscTdpUHNGWTE0UmFjRWc1QnNneXJCeXNqbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265208
KPsIFtgFMs7nSsi2x0Dq1ohNKdQC5oN3TuVqCfde	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidmJsazVGRXJxZFJKYnJISDFCeFdPQmhLN0lnMFZQVzZIVDR3VzBSRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266225
AWGIz2pYbxHleUo5G04OtW0iZ72Po591I5u5TRno	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0pzUjJ0dTlJNGZncXRYM1NWalYxUUxtQlVhbUdCVkRsSE13NTB5NCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267450
UxOPtAOXNu5QVtdr1CSMJT1nBMppufgAuZSQo9RK	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS0ZZd3Nzd3lYb1hpekNDTTRtSzlIUWI1OXRkUTBTUnJaTEdWcUNvOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746269007
JzhrUFQLCd2mbYWx8p2tPek1C6LmLNkweoTg9rfW	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTVZjV2Q3clFtSVhEMXZwTmZLRWtzSUV1YmcwR2hYRFZQdkRXcHJoaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523243
KMYkyxmukMHvwQI3GB6yPUdbqzkUZpOpUvxgeQHl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk5vRVJMUDZJQWk0eDBKMFJqZFBINUQ5SmxQR2g5NVJ3UTRYMjJuRCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208516
8b6Ick4edv7qPACRsBYZa0kLQ312oVWvie40jkle	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGMwNlZ0NDQ2N2lOcFdWeEJhYzlwVE9ERGZ0TFRDVFNIRms4blQ3OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208725
NE9lOkiS18nhGtARFoxpFD4CqTMRzXg9pFDN3YOt	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWE5NMlRiQmUwQ2JaMHhEUEdTbnZIMk1OVE5RalFMN1BxS21iR1JFbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208978
tDonGXp1PYafnSXBKGb3z5ejKQTaPvULmYUtfS0B	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXlCSlRQa1BGejhnUDZjQWZnY24zUzJoZWQ2VlN6Z0dJNkhocXZwdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209707
eLGGO541A4po5WiNxcrrE7RIzDcVClZcifpIgYlQ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidHREekppbFpEREx6RDZhWEhaWEtpdlJhbEczdWlqQmJ0b3ZzVlRHWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257086
PDDrP6AIK5MddOsWIXhAaf7MjjUObDSoIygsr3uU	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSFhZN0VtbUszR2ZoSm8ySUNGVE15YTVlSUlsV3EzejdZWUt6TUlLbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746261975
jpjh8gTAjobdhJP5fxE7avYuPVmWOk8D18PUBn5p	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlhzQXF1MVVlQVk1M0ExNkQzTmtaaVdyVFZwUUpPVVhDdEZzZVVUUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265226
huXQdLIl8oxflMX0OCw1vJeIhQfB77Pk7W1lkOSy	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHZmZlRNRE53aE5WOWNsSVN1WGxxVXY3MHZ4MzMxSkw5aHNVU3BSbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266424
reE3zrBRseaggcGcyvSMNYWLmykuLMyQAWIfRZFc	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXF3ck9iQklRQVpEUjJLVjlBcFdraDdnZmNGVlN6enBzWGFGcmdMbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267560
dZH2cM5qAA0P60PIbdSn9YCAurrUdUrXLavxQWxp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2Q0c2NkZ0ZINGZsYm9MNWx0WE1kWE5IMk9XaExMT3NtTDRCUW9pWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746269067
TXzk7ekdjqf2gsLSxmreKffMrgWuZG1W5DENS5Wj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0NyYWt3a0Y4azFsTTF3QkYySkY3NlpLZXpKV2JHVld4Q1lJcUdlRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9OCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523257
w7xpJJALCppxsrshtC9pX7pQ1AxW2zCGkmf1sCiQ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoic1VRWVBPNjdSQ0Fza1ZGNFViYlNTQ3hZa0F1VkNTVkhUTmR4TWVvcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208518
PtmMdqWQkZ0uLHVj2PRx6C93i5hp9VTGQlmvZH7T	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibkV4MTNmTFNjN21ZNGh6Zm9xdTk0eGZwMHdqTnE2c3lXZWZnckNBMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208746
pc637M8hi1tU1lJFCv3k6fJ3sE5D9Yclehy8xsSV	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXB0UUNjc1d2VGlhTVBQVENMV3NSMmNYVEtiMURDeEM0NmN1TlZUNCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208980
VoTdDnqoBSzJ6u3hrq5i7SUkWiLF9UhEwQiLX2jg	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNEpweTBNTFJyUUtrMDczeXNkeUJuTWJVOGFtQ0txemRSVWlrUEx0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209709
qIKmqdoH7BzoWQhDA2lBtOw4eTXJqkt8oQtNO3tK	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRXl0eFVQdWJBQmRXbTJOMWpRWWFxaUxwd0JyUWlvVUFuajFWcVJIaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209853
KFxcoS2mIZCjzns35NR8RYgJSAiMtqc9sBQSo0vY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOWtUTGFDT3lqYk5ucjVIZTFPUGhlQW1hN0hQMkk2YkplUTRnRGptRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257088
BGzkjXtNF49WKs9BkHJJXHsKoDXenkfT9ddVcI3o	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoianNMM3VaWENLSkNNeE0wcU5nOFA2SmlWTnVkaUlxTDJmem1yQUVxWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746261997
1tNASQNT4p4VMmtv19gQRbjRyQnXqlY41GaA6cbE	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnpJcElUUEJHMEh6MU5uQkt3bm9IamVDVWdQbWVoakM1R1lMeU1zViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265229
2d2BhfbVsbXnHTJsiflVRmn5UBQnZGM3JfXdD9H0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidFBLSlBZeWthNHppMElIVThnNGNUQlJPY2ZtaTVVU3A1MWdvT0FhdiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267417
4uiIKWfX0TwQWOv1hkWBkakzZmJzBT1Gab3L53kA	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoic1p3QWdKc1E0d3Vhc09HaFByaUFTTkc1Mzc4TExlNE9aUnFFb0NqSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267564
6wO3QVwsVNG0L9HMEqvos6nVxNzgndmxJy06oWHk	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVDZnT29ydmdzZ0RqSkw3WDduTU1ST3pDMFBhSzRxRzY4RWdLMW1oWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522224
pX3SlilYWoklH4pbzgx8N7E1rqxnSpJDPeNRCmGo	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMEhCRzdvcTg2QXdtdXZaN1dvQVdIQkw1aklSMVdhNVg3bWtKRkE4USI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523269
xNareELUvBTBAKWjfaUHZJdIRxnXgrpYt031rNeW	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYWN1TmpGMkRIemNRS3VxcDYyMmVwekRIaWM0cXhHTzVOU3JETDlOUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208520
aEApX3k4m13WBOmxIzBg8pgRCKZo7sRPxLFYORNI	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoieDZDSjZRanpjY3pkM3UySVRRbnRIQjVVNGxWdFV5Z1YyTzVOT0NsWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208746
PLyDiGAaC4zhC17EjZ9lVdUQzLpYw0uMj4fetVAA	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoianNpUW9YVndHYjdwVmpuT01IelA1eG5kM0pHc2F0NlBZbHFSRUp6ciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208991
mILEWjji8WqFs3w8dnlxuN2kqeRVkQ8SUd8pb7fx	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWJFbHdkYzRrSU9HWDMzN1BqVjlydUU5MEtXbDNqeXFYUXI0TjFOayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209716
LgFOjfthYkZ35VxAgb4l4mcKjU3aVC3nE3jsRKS8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNkU2NXZIOXhrQ25HTUZnbFdyR1l2cUpaMjY0RkhXelJWRng2TUw5cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTgmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209854
q04wTpcWBuVLu6ZyO2Gbuwvh87bTrSlD916dwz5Y	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMGQ1VEF5VFZTSVN1ZGpVUkRvQTdic04ydGtGU0hpZnJhSnlHQTF1OCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257096
SUNA9qvXvjreaUeHXN4NrS4XYl8AM3GDtxtFRLA7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTVzbmczQlVBY0NRRnlDZzBWUUxnOEdjcDVMS213QnlzNmtOUjdDUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265029
Vv9p3ZWLRgpwbzbvcF3tzNf0ihRlGsR1HCdzAV6F	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3UzZGpENmVtQ2Q3OExuc0l0WWwzOGlyenNEbVc0Z1hJeUVERTkycyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265580
rQhv0763TJQFp3DguVTISpv1L1WOfJLb8ZfCZV0K	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoicEI5ZVNKYnJoTWhyTG1VWnJCd1ZPcnM3MkJ4UUYwQjhRbmxoYWl3MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267423
fjifoUN39IKOMfovpr2L8RTDkkJQ9M0UqZujGCo1	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSWVDQW9iMGxSYWVsQWdXSXpGNnN0WWtjNlV6bEV1MEhnWnNUWDlaYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267689
0gQJ9ZcnmbLVggxbPCIr5msDUlXmO66sUfmNRz3U	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYTkyZ0tla1M0azdhYktlMGZOcHJFMXpWQ1BDcXRIZzJFNDNEeVhFYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522231
9ykXexbkW7Tt7K5xTLzAehN1UgWA2NzUtrcnRLsl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaVpQb0djVkRjYXFxN21FR3d3S0p1Vzg3b2dCOEtOMTVYTVlxbm5FNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523269
vumy3vSjYU1SuEFbdCC4WS16nFptt1vEwB6Yb1bu	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibGppOW1ySXpITWdrZ2NSVjlpT0hmbHpabVJvZjVodlplbFU4b2dzbSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208541
9RBh1cSp3g2sajqnlsSi7vCif5IFuAC3a4s1nAOJ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNnNiVFNZSVRZcEQ5RGltcVVyQ2gzREJ4VkxmbmFkWWZ0YWdqQTNORiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208749
OtEufTcbFI4shPTzU0JZGOEsJMPsevri8szli1P1	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOFd0b3VaYkRWTkFWNnZXTGRPVGVEOVBPczFvSkdOS0FYcGNhWm5zdCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9OCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208994
yrpIO7TYAUxixEJvIo1Whf6knCw7KEIk44xGw1SH	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMkFhOVEzcXBSaW1ud3BGcUZocTFxME9GVGFza2FNWmM4VUhRdmJoSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209727
m5cCA5yN3fds2MJkoniY0SgqHmS1f490x5fjBtBm	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOTlSWE5vRFp3YnFaem5ZY2lHeXN5NVJudHg4eUhYVnpsTVNVUHk0ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209864
exPVs7G7hc3HcNEFL2fNSWvu5wtkvBg2qJaA32CJ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZkpTd2RVWEFaMkVxcW9EaFJBdWhjazVhV0cwMmhsR1BqNUVTWTZsdyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257097
4USaDKJe7kaX17uJKFMyLWumYAS5OBkYX4GYmVIi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNXppWUpnaVhIc3lwUzBBaHZxUzhNSGJ2OENPaEZVUm5vY3RscmhxSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265031
lmU91GKC09i1sG61idFFrKoui8HNkOxJFjWIt0Cx	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoic2g0Qmo5MWVHZlB6WEdwZ0Zib0RUcjhXd3pnV1Z5c2E2eElJSEFzWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265789
xUZiPnSa9NgJeCuVKbIvWPi8eyZBAdWA2H5zOyeo	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiekRIZDJPQ1RDNVZ5bmY1UFAwSGlFb3B5TUtDZXVya3VmWjVVb1pmQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267707
fqSstdKHpALBDIRsAIOznROpnXGQmkg1xBNIT3Nb	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoicldha0xDZWdidklsMTRsTVhtNG1wRk93cncwQlJmSjd0aGV1UVpVbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522234
NWHtpMxKRWOOmS4uuARhrGTo0plT2h2MEPf10xov	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2dyQjUzVjJPVDI0OFdwMXdxVE91cEJ1NlRjMkhVelVzZE5BdWd2YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523270
tUktDjcPkf2mNwRfpdkWdLWXGjWqjzn5lnyvAJeR	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRjBrVHZqVWNYYkUyc05OZnJZMGM5amF2NER0VVRvVFozTFVNTUh3dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208547
qddDwaaCxwLAXmAMwDsp52c5J3xT3fizEOEvMBK7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZnZzdGNtaW9zYlBFeXdTM0FFbk5DRjIyeVdkaE11UGpycDBiTE1BYyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208751
8SwlrDbgDIGbhWaEa7RjAw4niN4zrGIuCjFxZ8OD	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFBWZ1NFa2dKYjY0Nkw5eTVDemdCcWlUcVJIZnRtTTRGNmVpUDNNYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209015
Mw7rK0jiMcoRI7J2xDjhclToNL6d6HYvHy1mktEJ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEtyY0V6WDY0YXNjYU5rTGtrU1VOc3ZJNVkzVVJjM2pBMzlLSFlrTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209734
vFx4pgFvY0rsoKiBd9lbgRA6Y5YykCULYk7lv83D	01968077-4d46-7392-8b69-bd7480c873fe	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTo0OntzOjY6Il90b2tlbiI7czo0MDoiUWszc2lGVlI2YmxGdVluWUtGbkREd2U0SUxWTzdLSHhYbHFpZzBKUSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pblByb2R1Y3REZXRhaWwvMmU0YTg4ZWUtZmVlZC00YmEyLTg1M2MtMGNmNjFkNzI1MTA1Ijt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO3M6MzY6IjAxOTY4MDc3LTRkNDYtNzM5Mi04YjY5LWJkNzQ4MGM4NzNmZSI7fQ==	1746269079
tt3vAaVT6v8avv0xT7lh32T0XA5LeNnA0N69hCVK	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWk51MjF1Q2haZENCMldhSnppamFubVR0TmNtOGg0akFXTURZNXE3WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522239
MFZ9If4VDYKVmYBSG7dCbKONP8zqXqGacRBsuLBG	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSXNRME80ZUR5NHl5RkxvTVBjOEpsRnRsZHRUdFYzRDBXcDJQZDY4dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523569
Nu0khl4OCyiUshiBI4jEnLBtMFiWSv7Wtaijj5BT	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSnF0UnZoMFRNOHluWjJETHlvc3c5TXVqeWNGUEQxVmhUVkw0ZVBzQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265840
rC5sEV21gmsElj8UZQnAfaFaP29l1Pe7oR4S9dES	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU2o1WWw5eHhnbFp4OXV1TmR2aVQ3WnZwaTY4d1dVMVNkaEdoS2NPMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257110
Is9rq0lvuhIZ9k52JtL63d73obsRToZ3V8ZlADO5	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNGxZbjlYWnlhdVlYdWRCWko1OUoxT3loTTdHVlhZVHduYkRHRldReiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746267764
MC0S2JrpBM2IU19anM7CswL7oIMaBzq3xYL1xEZi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU1XVllPM0dmMFhobjVmRWU3bUkzcU1MWURlTmY3aWNyTHZqV1VIRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265140
zzzPbWGEIFBNF6ClXS8TwwBKHGQCZHS4bLuyWBTj	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV3JUc1YwYlZCcENQb0o1YnlsQ2J3dmdGelZubWcxbjlQOHRYY2JocyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746265847
bhr6zeA5YpNzRU8OtyFvd4LOlTBGPO1Cld8KR7JG	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVnJCdVRCcDJ5eHo2QXE5THlkSTFLV1FLbENZNjh4bHhybXBRSk5rTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208553
3VPVFeZMnoWZQzuY8XYYvc7AtPvXmr0YePeLgzWG	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS3ZYeTVUM004eVhpN1ViUUc4WTgzNFlPQVZoaFBrOWxPekcxTzdSMyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268062
HDDwfE2FFAMEgdxZMDdfrraR6xaNMmskFBBYpvDc	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTm1pNTJrWjBQeW5XQW9RakFWaUtKZHNSOVRaNDlHUHh4RUwzenE4MSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208758
mJoRiRGekElx50dd79ESDTNDJgOiBxdRTAVcZO8w	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoia3dGU3QyaEgzd09UR0xQUkkyd3ZXNFBBWkEwZ2xGWDByS1ZhQTF4bCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522427
z9B0hKVvNow4q8UwC6oHOW1Udc0FhY9AS7uP46WO	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOXU2VkNaSHV5a1lubWZYRFBPR3RpTHhRUXllb0UxRG92cGJBRXd3TSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209068
qId2fUVx8EUh938ueQ1UE1MItgVz2Ut9yMb4YjZ4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEdKNEY2WXF2aVdEQjd6NmVraWY0Y0lneGRMQVNMWkVOeUtITjdObSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209735
OTNbIbhcf4tz3g8Wi1D2uJiNz04X4RD0beped7tz	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT3JkWU03RDI3cEdyT1FIR01ycFBjeVpJUzNGUFhPVlZrNGlSZkRjWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209869
lkcmYTqRe9lTFELaJ58K2QbqAvzlFNE1wtqKIKdx	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiS1ZOVlpzeW41N0pHNjV5ZElXa2ZxQTRidG5XR292TXFnVWZ4eEZBWiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257302
g6lOM18MiMiyKBARwNFfFIPbJLhS3qJzha7XMWjF	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOU5LT1AxaE9XTFc5cVI0Mlk5a1RqbjJGU1VSTUU3WEY5RUY0Vm0xayI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzM6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hbGxQcm9kdWN0cyI7fX0=	1746524211
ZGnhJECbjH2mWgwECPPMDdWvjQfiUGcTB1WtCQT8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMW03bVlIcmxRZkZ2cmVPSjN3dnAwQUtRM3E5Z0lncUdJMGg3d085ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208553
sQWTZgqrNbzcUCUj9182CM8wtGu17MEhJhDAYp0T	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidE1tMkVldGtaTmkzTWlWdDNQZWRRZWhUMTZHZjFudk54bGJEZU5pNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208927
n3x2KKBW7ekGNERl5pO7uAwBj0px8O8v1K1Vydcr	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM01aOHJZUWd4SG9CaE9YMFhCOU9ES2pPVlZxY042SGV1QmFUN3NPcSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209068
eFSdNAYbZu5cBZ134SBqeAHCQpBEX2d4tCDtIAQC	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0ZQN1pqSGdkeVdscUhObkVnRWtXTE5QTGNGWFJLQmRWVjM5b0plQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209789
zZ8HLxkNQzDi0OlemiLrqg3W4XO2KkeARsbCw6tH	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWXBDTFVrN0Exak9Bb0NLQnZ5TnZGVVZOUXRmRWp2bE9Ed3lFWktRaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209896
56AWB5N7zBJfpjxxQq6fuKHyQlokJCKTfo5Hxxdd	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoieFVQOUttbldYN1FmOUVCMnR3WjRiRUlxOUhXNkxOUXN1Z2J4MWxXaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257336
jnghMK047tNe4CiObdtanv8X58QhhbELmSkAHtX0	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUXVSY2FVMnNjc0FqOWZOaWlWQkc2cWNSSUNuSEVmck41NU9XZ2JyUCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266052
t5gui3UDQx66Yb3uPRcf7K1kawd1mMTzWc82Puj4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSjVkcXJoTzBScmxYdkh3T0IxbEoxTFJhV0hMaTM0NHR2RXY4MUxlTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268076
zQmmP6yktbuHRkhq5Jj8L4OQRrVwwxDhypXIesKL	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoickM3SjA1ZVF1VE50ZG5Ud09zMDI1UUg4MUNyZnhWcGt6VFJnRExvWSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523603
Oq0b1cCGdQkjzSB9RQGwScmdT3CViOF6GGus3pL6	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidlJlZ1RmUW1RTVcxa3FjRWRLV2V2S3N1M3didDBaQlZsN3gwNzRBeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208575
XsqdpuuIxlA8FJWEGgobf6WWHMmtwckzpSbkKfLU	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUNVQWQwVWF1YkhuMFNPaWUxMlFTUFFPdlVEcGs1cHdQZGhEMngzTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208930
TBZWIAoWhfsQthKJxWqpR9uPh0VEX0qz2dF1G8ld	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVW9ieHlRNER3M3lwcEhTWmFoN2lLanMwc1JGS2VTcVV6eWFnVllMaSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209140
idBw8s3kUV2ykJf2JT7Ol5o5H5vGu62qpAJiXr7M	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM1ZYanpXTW15RDlxQUFIWG1BUUVZbnE1bkt0SnZxTG5BVjRGV05OUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209790
t4JyyKZdZSc6QlgGMsR10kxDm7t5ghRzQTfIJniV	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiR3V5VU52dHdBcEU0bUFWQW1iTUJVeFVOR1FsYXMyNmM2N29oY0ZBaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257338
E9yGwcHIZT9d3tSY7YWw6uYNUp0OhkQRap4fFSBa	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWmk5RWdORFNYZXZRaDNETFNBbGFaQ1ZOTDhQOG1ZYW9BY0dBR0tsTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266054
0W8dji60U0DMpa49ewo0lfsKIm54lD6tMJRhmqZy	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZk52bkx1Z3BmWkNOVDJhaU5WaEtzZkVzdkRpQ0dFb2ZFRHlteXdQZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268266
yPmY2bJnVmj4asMmiGO0GVHGLknLJ8NFQDJgtiHY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQzF6RHl6UFJIVDdlUldyaVpKM3A2NUJEOUhRRGM5N2c0dVdYRGY2byI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9jYXJ0QWRkcmVzc0luZm8iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522587
ClJs0Wu2Ai6hjl5ubCBi3Cil77JVos1FGKi1nOtE	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaFVYWVlLd25BOUVuUUVWaVRTbWxkcDJhblpXdG1FSncyRmZlbUFSNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524211
lEEwq02m3jCVuxwY92kUDoeFQt7AoIQcKINu450L	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZTBIOHdJeUU3YW5Ec2FQanNBdlRBSWJ3MXlkbTZndTY2c0YySDJqbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208575
qLcaVQ1inRZBOxelAaV8EEFosd3di9GD1R3WL2bo	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiU3NJZDRobWpHRkNVNWlWZmQ1RzJFTXNMOHpvZk9lWEtVQ3BlMEhTSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208930
BSGbJTDOzfNAmUrTr8MBVJ6VVGczioTvUJhAdBls	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoicDN4ZEhmRDJUdm1KUHk5UUJyd1QzamoyR1F0d1o5cEJkbUJzUzNZZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257346
qzokOZ5kLHMdRzRev17jvXvS9TQ0kJpv7mFZL6AS	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibEhYc1p1UkF2VVA5WmF4RTNkVmY2WHVieHFKa3BqZkt6VGVmTXhrTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266145
jT1Z1oJCFN8O3eIJq0pjmpsItCywB1HdFN5j2Fxu	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVzNEam5FWG1RYnUwNHRCdkdCdzRTM1M5YmJ5MFRDOWpwRmUwb1N4ZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268270
3lWuALW3HdH4Pe87hHjhSIpHkl9Ss6npYTyLQ6EV	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibXhpRFdrclU0M0VLMnRIRHlSbXMyZlk0bWNOeGJjMkVsUERiSVhyZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524218
Zk90GFd61SUNQhfoY5HFZnMDOwhx3pqam3kaVszR	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaWRGM3RPdEsyQk1BWnZYajdHU3RqOXV3QXRkQWt3OXpsTENaVHpDQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208582
3IMk8Jzq6HQXh5SjYavpTtTviVLB43YFvBaJ6MUJ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRnAwUnduSUE3SjEyUFhYdWpaWTNxdW5jRWJhOHBJeEdLWTZ0d0U5aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208933
9hN0JuVeOTGoxSQPfju7X8BHV14vrUusypP1Cpa3	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSHk1T3F6ZzVJMHc1VTZickVYNDNwNjZZUHpDVWVZMXFRTVk2VEllQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209142
6zJbENZCUAdfL7XjDAagvsRnbgdNmGMVfpIDFnmB	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoieG9VTVNsRTlNOUlGREQ1dzNhaDZSVEpHalQ3MEdmeUdhYUprWFBuSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209792
eojckVOer9q1vGFh2tDlKtagp1pjEWe2qvVRKBFl	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOHc2RjF2NlhoUzhqcFZuU3hlUTVQRnU3SThNUUtXUVM2dW1kdzB2cCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257346
N4G7ANUCdTREsbEhlHw2H530YWX3Ga06G7wczxfY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRGZ4VUxYTGJMNU1udFZ2VnBWcVk2UGxZdk9KaWdsVTBtNzZHak4zQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266155
50Pk052TZ9wqJXp905rl0Vm6K4KapXH5OXOICoYa	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoicGMwTUxjbGd4WENnanBpdE5sMjQwMW4wNFU3VFdFRmdYRmNBczJIOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268273
eD8mCosB5coUbbc8kjPO0F10MtmaCPLExSTPbZx2	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ0lEckphVGQzNDIyYlQ3S2lZM1FTcDMwNm9uZDhicnhNaEpKZGU1WCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746522709
pk4PU6l9N4y1arF9J5E9wvR0k57YPh38PzJqtFJC	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoib3pSdEtobWd3ZmxIQ1B4dWMzMVMzc0NSb01lTFFMTVYxR3VrR0dNZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6OTQ6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPUluZmluaXR5JnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524219
pVbk1EVeB2t7VOMMWMbK9E2lrUKsTCFeHJ7ta7aw	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1NndjhITVFnRXhNUnBVNjVDVHg4QXNwellmRDNFWEtETW00NDM0eSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257349
PZq7ggmyiHHgoxSoy5N6SQFml5wamlbra7fdcDmx	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoickducHVtUmlVTkRpRDRBU0R2SHR5SWxSMHhTNHRSSVFOd2laSUtzMCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266159
x8Thtn8bdu9gzsz4e470s6wQgPA41Gnr0e9ivOmQ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoieklDbDBSTDAxQkFuN29rY0Q0UU42bGNMa0UydHBvaVp4NG1jYjBqRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268275
ScXe8GtWi8Jx023N9IHlJdn9fOlFwj36m3Ixov4L	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUJIRFJQT2h2M1A4MnhibktXbEhUaXRweW9zYWpyQ2kxTlQxemYxMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523238
Ks3PsJWwGxOUOkSjXSbvrD0rCNrb8aMEwXlWftCi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY01NdGdJYnAzQnBrcEV1bEU0M2VNOGN6NTVuUnRMUEdNVFRFTU55SSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPTIyJnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524231
6xbAfHRun8RUFL28tRmiTNryKAfVmP4YiF91RWaL	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiN05lTDJSdG54ZVJEWW5Pd3ZUOTdoNU1ERXJ1NkRWalNOTEFLUFhwWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257360
YjpMTz87zl4KqFwadS7EE71DEqJIcnZj8NuhkutI	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoieXA0dUhGYWIweGJsNnFCbDgzN1ZVQkZ2NXpqMVpwVTkzRk9kMTNDaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266161
dwfSfBJ3AryNSHH2gPkf7tsqMoVNb3ZrzEX7JOlO	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOEpLZ2MzTGgybnNHcmtKWVppbW9UOHVOQ1RRQ3lTenV5YVBFMlNnVCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268276
LDBR5Dk9dv5PfBFhXoJR8GJ1imbvy5ofh3pWDRtX	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV2Z2UkNlVHRKOTladDd5NUNEa2FGZ2hPVHAybjN3NXV2Z0IwN0wwTCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523239
VvkfEpMBl6wW08eWh862zS7pTOi7hJewdZKmoxpq	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMFJObWFQdmdOM0l2MFh1YXc3Z3lTU0I4azNRTXFzQVB4NUJRenY5ZiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPTQwJnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524237
E2Bt7WxrWhgMGQ0z0S5Iz7RFpW6jlj4xazY9z09p	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZEhqUzhhbmpXZ3oweGJGdHV5MEE2OXpIWU5tZHliYnVjZURxWHFqQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257361
gMs4xrWgOledeaX6ZkmIKQj1WJBuP4pSW8HOQO2m	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWURoMGtzVkJRVWdLdGQwMFlQN2U2SER3V0pwYXNUT2VFZW1EVWJzeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266164
AOzDeg9P1mQV5nsSRuG6tE23QSmsesNqlbnxSTHn	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiREZyODBkaXFpTVI5QXJLS0JnaUZWNUFyRjJjVnE0OFU3NkVoaEptUSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268278
s7qG9ngOseeyCTpyM7IpzBKFQkiSOSqRzt5nVVIK	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT2JXd2xHZ3JsRjhHd2k3V2FmZUNsRXNkV1Y5SWRpcDh6QVJ6Q0pENyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523239
PvZTqEteZAhyDkWVK98WFCL3ACCdyw5dD9zZ9p6J	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiaEs5bHBaNHpXWktNTFl5SUxSRUVsUE1GZFFBZ3JmNU14b2Zqa3hJUyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y2F0ZWdvcnk9YWxsJmNvdW50PTAmbG9hZD04JnByaWNlPTIxJnNlYXJjaD0mc29ydD1vbGRlc3QiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746524238
Ld7s9BCFCCST5ClIz4WLQf3FOnx4fuysFX6AO9qu	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNVV4TUNDZE9sV0tQOENEazFCYWlpQmN0MlVXOG0yQVMxc0xtZTI0biI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208582
ToznLnJjVZioQktpf3TNaCJoaRTd6hnfyEb1WsC8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVTc3Mm1kdkdLSWlQZ1Rwa0xDOW5sNzY3blg2VEFxZzJjUXNWWXVwbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208935
a25DoBmNNalfjMem1USrUFXR4Yj9wiNqapKZf3hi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQ3pzTWhzQVBRcDYxcnIxQ3JzTFRoMTgxdmxRWmZWek5STFNsbUJFeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209144
yEREC8AhGDS4JIH2XBTWKblwtrDeObqpwAVXzCaN	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUllEc3BZUFYwejNtdHhhc0o1SnVaY2lJdmluSUlESWFjNnZqRFVNTyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209817
e7uibIybz2eErgr5Dv4dG5YHdH0SDlfJgW0B9Fig	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVNvTVVVWm11RzZSQ3VKbk1GbWdkV2xWOTBIVXRldkthMnk3enhtUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266167
UdAIkzeeh0pclMa0Vt24Kb9jkTzIDEG5mnEf5h2T	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT0FIbVRTWW1PdGFYUHJISTBPT0RieldBWlZMcm1NdGVMeTBvVmNSbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746257362
fMECRGF4awZO9S7d9L5mbH1yrvXpZSrarTzYhCm1	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMExGWjJTMHVrTUpoUEU2U0lDdnlOR1RYa1JMbDJtaDlyY2wzWUI4MCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268278
BNw7qk1iCCLuX7wBXITYIfdJDHu2ZnZRrDmkwwSg	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibnRocHhDbHZXaVN1b0dJdW9mMTVoVVN1OGMzdW1ESkF5WEVMUDJYSCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523239
grWxRcpPrL870nN2WigNsVoFCZnL5oPuDBhqbJHv	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNW5pZGgzRXpvYlpZRWo0ZVhuYjFMeTJDNUpncFdhT1VoeVh1RTZxYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266211
nRGjqYOytRigXASGmeWQMtsSKELVVVWRikdpJF9I	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNndLUTNJd3Y1Yzl3Zk1mSnJQelJzbzlBRjhrYUZnaGdTckVIcXhOaCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268284
bCQQmT837jcMKyK3rVd5zH010sEwKpA57ZAMjna3	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZVpwUVh2MVZCcnI4UEk2djZpbjlZVngxeFZlZkNndEVvMDM0NnR6NiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523240
JZaH4iEi6Ht2EZc1MQMp4rtX0B8Gb0BOOk7BptAD	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiclVQN3pHVjdQcTBHazlDQXVCNjc4Qmxhb2VVem9Nek1yb1hxd3BxNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208203
MTmy0rrqlqoPsDqSzs96kZGoUFlMwHypDRAzmaDY	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoienhrMkpOYlltR09yT3c4Tmt1R0xOaldNM2FMaUFUbTJVME16S2twYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208212
tJAIYBWCbnKHDeWuiJIgQAtUgBGDW6NuWeX4O1Ab	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoidlVjQWwyTDhFZDV0UWZFdjZkVmhxanBnUDRsSDkyTm1iYUMyTng0ZCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208214
BFeZ4KIdMcDpgJqquc9UkKSSLQ5zhdUNWAc0XVVS	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoibUNqMDNDZ0ZvUHdGallGVVBHSWtxY2tOc2J0ZzBWRm5CaHdYMVJIQSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208258
zd0P9n4dG0BLWa1hF4PLcig7ipbFOp3XvbCyXCh7	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWVZYZ3hpbmEyWXI1TDUzR0lyUk83WEVldEVhbTg3MXRRTER5R2hSRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208258
73FhOiVFogqZFXG8zVQfWJL0atJf5DMqcowSz7oe	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiOGdNYVpVT0d3RUVqb2hwNE1XYUpyMmFiS1NXclIxbnV1STJnNGxERSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208261
CNzthBcLOjqb6YyRs5TPqaz7ls27IVHWfXbcL4EM	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQnhsTnhyRDJRcHhKZW9yN1U3MldOdEV6Q3FVQzBvY2JVUXdpVlVQOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208270
2afi0EYCDxwRSFXlm0PcQtkrngeNbJRTunlR6Ggi	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYmdTOHAyS05LVHF0ZHQzYzZjd1AyVXdVZDJxMVhxVXNUOUNQbFBpRSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208270
xqnEGLDsn6FLAwr7HgF1v36nFEzhqURTG9Uqot6Z	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHNnQjNnb3pIWHVid3A3cWxISXAxdDNHRXBlR0kzSnRaUmZUNTBvNSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208469
2YsVflECYtmvId9TerTsMWXlJpQRp73stRtEbYV8	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMlNicnB4WmRiOVZmck1nTWpFRnA5TVRNQUMyRXc2eFZQaXlGYTRFYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208469
3SKbTT59Y1cwEwALVcRmQvyGTFrsdbptGOCzx0xb	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTnl1R1hzRzJ0Y2hpSm5hV2doMUtkclpFNmZIVkpsNE5OMklvRWlYciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208585
HNMvlbFhtIQTQoBnfVJ5o7JIne7oNPptZ9qHmZSt	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoia1lMTDU3T2pIdzN3U01NQ3JLc215UHZKODZWWlJzVGVINUltSnZZayI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208963
LFG1W3cM0yagkrqHrCmyBOIVZFrRAKjw1v9Ttmds	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlJtMnliVGQ5YTZocnhhUUNSbUhrOWJ6VzZCM3Jac1MwbDdrUWlSRiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209257
eczItk1temnCVLfFAuq7laEcDDGrJsPuXMXPk5Yn	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV240ZUZjTmFhNm1aYVpDckpiRFhzdW1OWXlhSldmS2ZvMUlUMVJOSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208479
1Qrx3HJQDzPFS32VWNINga7jdmNtgqUte85r9zgr	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUlU0M3JnVTA3Y25jWTA2VEN5dHJBelJjODRjbHcxU0c3d0pTU3dNTiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208587
hu4uYabKG2Q4JSgC5MKqPceysGZdVCG0NQKh91R4	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiMG9PUGtPM2l2SmhyaEg5MjZsazY5TmhTZjJsZ09wZjlQSHA4QlNOciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746208964
Jh7NVC7OY4XAfQqLtflOFjdY5jch3e1AeQ3exPeE	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZHFiT0lRZm82YUJBdURoUzJQeUY4WGtaNFJJdjJuY2UxREpvMlBnaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209274
9iWQqGLIe6icCNTFwr4pZTsbRQfRZ5tXY7h6QRWZ	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQklrRnlQTWhnclNjVXJmN3pLWW5Db1FPM0tvTERIOGRvOEtXUnBMQyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746209818
75goWnNCPA8wUAMBvpX5yDWTMIVBGwzUYApzqllp	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiY0tCRVlqU2lXaFZDV2poUU1oSW9IQlAyWUFYamNwODVPdGg0RU5xYiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746266218
OQyWXwTqQWkKNyiOe3TgQ2iXjfmlToihN2NHlDGz	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiV1hmdTk0RzI1MkRzaVV2YXFFQ2ZaUE54RGN4S2NSMVI5S0hmSFdKWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746268821
KckaBwKfNELdGDcq3wgOC7ICBgUj2ftsbRWSbiZA	\N	127.0.0.1	Mozilla/5.0 (X11; Linux x86_64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiWGw5SkFlRTdtME9jdnRkMVpzM040bGVyQ2RPdWw1ZEU3WnVPUkdQMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDY6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9hcGkvaXRlbXM/Y291bnQ9MCZsb2FkPTgiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746523241
\.


--
-- Data for Name: shipping_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shipping_details (id, user_id, first_name, last_name, address, city, zip, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: shippings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.shippings (id, name, price, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, password, remember_token, is_admin, created_at, updated_at) FROM stdin;
019653f7-5699-73ae-82ac-1e31d803ec5f	name	email@gmail.com	$2y$12$DjMMNkDX9fMPki.L40qwIu1vxdHZ.HyVKE31CjsgaT1uHRtj8DJcS	\N	f	2025-04-20 16:10:40	2025-04-20 16:10:40
01968077-4d46-7392-8b69-bd7480c873fe	admin	admin@email.com	$2y$12$rIdz4CoFcihZccZMvnHcoedaM97h1t78.Lk3KUx5hRUcBhz.qwBtW	\N	t	2025-04-29 07:33:44	2025-04-29 07:33:44
\.


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 20, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: colors colors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.colors
    ADD CONSTRAINT colors_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: order_products order_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: payment_details payment_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.payment_details
    ADD CONSTRAINT payment_details_pkey PRIMARY KEY (id);


--
-- Name: product_carts product_carts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_carts
    ADD CONSTRAINT product_carts_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: shipping_details shipping_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_details
    ADD CONSTRAINT shipping_details_pkey PRIMARY KEY (id);


--
-- Name: shippings shippings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shippings
    ADD CONSTRAINT shippings_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- Name: carts carts_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: order_products order_products_order_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_order_id_foreign FOREIGN KEY (order_id) REFERENCES public.orders(id) ON DELETE CASCADE;


--
-- Name: order_products order_products_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_products
    ADD CONSTRAINT order_products_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: orders orders_payment_method_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_payment_method_foreign FOREIGN KEY (payment_method) REFERENCES public.payment_details(id) ON DELETE CASCADE;


--
-- Name: orders orders_shipping_details_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipping_details_foreign FOREIGN KEY (shipping_details) REFERENCES public.shipping_details(id) ON DELETE CASCADE;


--
-- Name: orders orders_shipping_method_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_shipping_method_foreign FOREIGN KEY (shipping_method) REFERENCES public.shippings(id) ON DELETE CASCADE;


--
-- Name: orders orders_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: product_carts product_carts_cart_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_carts
    ADD CONSTRAINT product_carts_cart_id_foreign FOREIGN KEY (cart_id) REFERENCES public.carts(id) ON DELETE CASCADE;


--
-- Name: product_carts product_carts_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_carts
    ADD CONSTRAINT product_carts_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: product_images product_images_product_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_images
    ADD CONSTRAINT product_images_product_id_foreign FOREIGN KEY (product_id) REFERENCES public.products(id) ON DELETE CASCADE;


--
-- Name: products products_category_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_foreign FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: shipping_details shipping_details_user_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping_details
    ADD CONSTRAINT shipping_details_user_id_foreign FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: pg_database_owner
--

GRANT ALL ON SCHEMA public TO myuser;


--
-- Name: TABLE cache; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache TO myuser;


--
-- Name: TABLE cache_locks; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.cache_locks TO myuser;


--
-- Name: TABLE carts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.carts TO myuser;


--
-- Name: TABLE categories; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.categories TO myuser;


--
-- Name: TABLE colors; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.colors TO myuser;


--
-- Name: TABLE failed_jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.failed_jobs TO myuser;


--
-- Name: TABLE job_batches; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.job_batches TO myuser;


--
-- Name: TABLE jobs; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.jobs TO myuser;


--
-- Name: TABLE migrations; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.migrations TO myuser;


--
-- Name: TABLE order_products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.order_products TO myuser;


--
-- Name: TABLE orders; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.orders TO myuser;


--
-- Name: TABLE password_reset_tokens; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.password_reset_tokens TO myuser;


--
-- Name: TABLE payment_details; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.payment_details TO myuser;


--
-- Name: TABLE product_carts; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_carts TO myuser;


--
-- Name: TABLE product_images; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.product_images TO myuser;


--
-- Name: TABLE products; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.products TO myuser;


--
-- Name: TABLE sessions; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.sessions TO myuser;


--
-- Name: TABLE shipping_details; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shipping_details TO myuser;


--
-- Name: TABLE shippings; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.shippings TO myuser;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO myuser;


--
-- Name: DEFAULT PRIVILEGES FOR TABLES; Type: DEFAULT ACL; Schema: public; Owner: postgres
--

ALTER DEFAULT PRIVILEGES FOR ROLE postgres IN SCHEMA public GRANT ALL ON TABLES TO myuser;


--
-- PostgreSQL database dump complete
--

