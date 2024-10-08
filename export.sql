--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

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
-- Name: gift_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gift_cards (
    id integer NOT NULL,
    user_id integer,
    balance integer NOT NULL,
    point_balance integer DEFAULT 0,
    redeem_at integer DEFAULT 100,
    store_id integer,
    created_at timestamp without time zone DEFAULT now(),
    edited_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.gift_cards OWNER TO postgres;

--
-- Name: gift_cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gift_cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gift_cards_id_seq OWNER TO postgres;

--
-- Name: gift_cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gift_cards_id_seq OWNED BY public.gift_cards.id;


--
-- Name: stores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.stores (
    id integer NOT NULL,
    owner_id integer,
    name character varying(255) NOT NULL,
    category character varying NOT NULL,
    description character varying,
    photo_url character varying,
    address character varying,
    created_at timestamp without time zone DEFAULT now(),
    edited_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.stores OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.stores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.stores_id_seq OWNER TO postgres;

--
-- Name: stores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.stores_id_seq OWNED BY public.stores.id;


--
-- Name: transactions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.transactions (
    id integer NOT NULL,
    giftcard_id integer,
    store_id integer,
    amount integer,
    receiver_id integer,
    created_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.transactions OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.transactions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.transactions_id_seq OWNER TO postgres;

--
-- Name: transactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.transactions_id_seq OWNED BY public.transactions.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    points integer,
    first_name character varying(255) NOT NULL,
    last_name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    isstoreowner boolean,
    city character varying(255) NOT NULL,
    created_at timestamp without time zone DEFAULT now(),
    edited_at timestamp without time zone DEFAULT now()
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: gift_cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards ALTER COLUMN id SET DEFAULT nextval('public.gift_cards_id_seq'::regclass);


--
-- Name: stores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores ALTER COLUMN id SET DEFAULT nextval('public.stores_id_seq'::regclass);


--
-- Name: transactions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions ALTER COLUMN id SET DEFAULT nextval('public.transactions_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: gift_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gift_cards (id, user_id, balance, point_balance, redeem_at, store_id, created_at, edited_at) FROM stdin;
1	1	5000	0	100	8	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
2	1	3579	0	100	2	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
3	1	2000	0	100	7	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
4	2	6900	0	100	1	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
5	2	2499	0	100	5	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
6	2	1034	0	100	3	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
7	3	7500	0	100	4	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
8	3	8343	0	100	4	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
9	3	5450	0	100	10	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
10	1	4731	0	100	9	2022-02-01 10:22:59.387142	2022-02-01 10:22:59.387142
11	1	10000	0	100	7	2024-10-08 14:27:27.583183	2024-10-08 14:27:27.583183
\.


--
-- Data for Name: stores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.stores (id, owner_id, name, category, description, photo_url, address, created_at, edited_at) FROM stdin;
1	10	Paws Pet Shop	Retail pets	Hey there. Welcome to Paws Pet Shop! We're a family-owned pet shop that specializes in high-quality pet food, toys, accessories, and grooming services. We also know and love our petsâ€”our family has three dogs and four cats to prove it! And we only sell products we've used on our own pets, so you can be sure your little fluffball is getting the best. Our mission is to help you and your furry friends live happier, healthier lives together. That's why we offer grooming services and premium products if you want themâ€”and we're always here to answer questions or offer advice if you need it.	https://imgur.com/6fZTX3U.gif	1432 store street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
2	7	Hook Seabar	Restaurant food	Imagine the most succulent fish you've ever tasted.\r\n\r\nNow imagine that, but it was caught just hours ago.\r\n\r\nAnd now imagine that, but it's in your mouth, and you're chomping down on it like a little kid getting a new toy for their birthday.\r\n\r\nYou're not imagining anymore. You're at Hook Seabar!	https://imgur.com/3sSWmJk.gif	2345 Government street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
3	8	Fox Clothing Co.	Retail clothes	Your little ones are the most precious thing in your life. You want to do everything you can to make sure they're taken care of, and that they always have high-quality clothing that will last them until they grow out of it.\r\n\r\nAt Fox Clothing Co., we know that you want to give your children the best things in life. That's why we carry a wide range of clothing for kids and babies, including clothes for all seasons. From cute graphic tees for toddlers and babies to adorable jumpers for young girls and boys, and even formal wear for special occasions like weddings and christenings, we have it all.	https://imgur.com/qeX5Q5f.gif	8625 Wharf street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
4	4	Nobu Sushi	Restaurant food drink	Nobu Sushi has been a staple of the local culinary community for over 25 years. We specialize in sushi, sashimi, rolls, bento boxes, and miso soup. Our chefs have traveled the world and trained with some of the best chefs in Japan to deliver only the freshest, most authentic sushi experience available at an affordable price. Bring your friends and family to our casual atmosphere for an evening of fresh fish and delicious drinks.	https://imgur.com/rB4IGYm.gif	3623 Granville street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
5	1	Yes Sir Auto Shop	Auto services	At Yes Sir Auto Shop, we've been the name you can trust for all your automotive needs for over 50 years. We know that sometimes you need more than a quick oil change or tire rotation, and that's why we're here to help. Our professional mechanics are trained to work on everything from regular-sized cars to heavy farm equipment, so you can trust them to handle anything.\r\n\r\nWe offer free estimates on repairs and maintenance, and we'll never surprise you with hidden costs. Our prices are some of the fairest in town, and we always strive to make sure that our customers are getting the best deal possible.\r\n\r\nOur services include: auto repair, oil changes, tire rotation, car washes, and detailing services.	https://imgur.com/9jAYTbK.gif	 8352 Maple drive	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
6	9	The Horizon Closet	Retail clothes	What's your closet's horizon?\r\n\r\nThe open sea of possibilities is yours to explore with the Horizon Closetâ€”our flagship, high-end luxury closet system that can be customized to fit any space, personality, and budget. The Horizon Closet is made with the finest materials available, including real palmwood and rose gold. We employ only the most experienced closet designers and craftsmen to ensure that you are getting the highest quality product on the market today.\r\n\r\nWhether you are looking for a walk-in closet for your master bedroom, a wall unit for your guest room, or just want to make sure your accessories stay organized, there is a Horizon Closet option for you. Come see why The Horizon Closet is not just a wardrobeâ€”it's an experience!	https://imgur.com/J0gmk6r.gif	6332 Marine drive	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
7	2	The Leaky Cauldron	Restaurant food drink	C'mon in!\r\n\r\nThe Leaky Cauldron is a local pub and gastropub serving beer and spirits from all over the world. We have an extensive menu of food to pair with your drink of choice, and our bartenders are always happy to help you make a selection. Whether you're looking for a quiet place to spend an evening with friends or a lively spot for your next birthday party, the Leaky Cauldron is the place for you!	https://imgur.com/CLoKIRs.gif	2923 Alder ave	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
8	6	The Roasted Bean	Restaurant food drink local coffee	The Roasted Bean is a quaint coffee shop in the heart of downtown New York City. They offer baked goods and exceptional coffee with a relaxing atmosphere. They are open from 7:00am to 11:00pm every day. Stop by today!\r\n\r\nThey provide delicious coffee and baked goods to their customers.\r\n\r\nTheir baked goods include scones, muffins, and cookies.\r\n\r\nThey also serve tea, hot chocolate, and other beverages\r\n\r\nThey are famous for their vanilla bean scones\r\n\r\nTheir coffee beans are roasted on site	https://imgur.com/kQR76M6.gif	2927 Broadway	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
9	5	Full Swing Pro Shop	Retail sports	Full Swing Pro Shop is your one-stop destination for all things golf.\r\n\r\nWhen it comes to the sport of golf, there is nothing we love more than helping our customers find the right clubs, balls, bags, and shoes to help them be the best golfer they can be.\r\n\r\nWe are proud to offer individualized attention and personalized recommendations to each customer who walks through our doors. We want you to walk out of Full Swing Pro Shop feeling like you have everything you need to improve your game.\r\n\r\nIf you're looking for a new set of clubs, we will make sure that they are fitted specifically for your body and skill level, so that you have the best chance at improving your swing.\r\n\r\nIf you're in need of a new set of golf shoes, we will make sure that those shoes are comfortable enough for an entire day on the course.\r\n\r\nWe offer unmatched service to our customers because we care about making the game of golf as fun and as accessible as possible. After all, whether it's your first time playing or you've been playing for years, there's nothing quite like hitting a hole-in-one.	https://imgur.com/XvpGZ3d.gif	3452 Mountain ave	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
10	11	The Carb Life Bakery	Restaurant food	Carb Life Bakery is a local, family-owned business that's been a staple in the community for years. Their delicious, house-made baked goods will keep you coming back for more. Each morning, you'll find fresh-baked scones and muffins to go along with their always-available selection of breads.	https://imgur.com/KzPoWg2.gif	2342 5th street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
11	10	Indigo Wild	Food Artisan	Indigo Wild started out as a small company selling homemade honey, but quickly grew into a retail and wholesale business that provides thousands of homes across the nation with products made from natural ingredients.	https://imgur.com/bpaqNjh.gif	1432 store street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
12	10	Paparazi	Photography services	With over 15 years of experience in the photography industry, Paparzzi has the skill and expertise to deliver you the pictures you've always dreamed of. We provide a variety of services, from professional headshots, family photos, and baby announcements to engagement shoots and wedding photography.\r\n\r\nWe have the ability to take the perfect picture for any occasion or purpose.	https://imgur.com/ZQ3ZuVH.gif	2345 Government street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
13	10	The Mowing Magician	lawn care services	Hi! We're The Mowing Magician. We just wanted to stop in and let you know about the services we offer hereâ€”lawn mowing, landscaping, and compost removal.\r\n\r\nWe're a small business, but we've got big dreams. We know that you'll be seeing us around the neighborhood soon, but if you'd like to get in touch before then, please feel free to reach out to us via email or phone at any time.\r\n\r\nThanks for your time. Have an amazing day!	https://imgur.com/OzkwBui.gif	3623 Granville street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
14	10	Swagger	food drink	What do you get when you combine super-fresh, hand-made juices, fresh fruit, and fruit juice? A whole lot of "Hallelujah!"\r\n\r\nSwagger is all about starting your day with the most delicious and nutritious ingredients possible.  It's a little slice of heaven in a jar. And best of all, it's so good for you that you can feel good about indulging in it every single morning.\r\n\r\nSo we invite you to try a jar today. If you don't feel like jumping out of bed and singing "Hallelujah" louder than ever before after drinking our juice, we'll give you your money back!	https://imgur.com/yW0r2IM.gif	 8352 Maple drive	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
15	10	Gentle Mane Barbers	Service barber	Gentle Mane Barbers is the only barber shop in the area dedicated to taking care of all your grooming needs.\r\n\r\nWe offer haircuts, trims, hair washes, and straight razor shaves. We also do beard trims, eyebrows, and mustache maintenance. Our employees are highly trained and can give any style you wantâ€”from classic barber shop cuts to contemporary hair styles. If you're not sure what you want, don't worry! Our team of skilled stylists will consult with you to find the perfect cut for your hair type and face shape.\r\n\r\nOur hours are flexible, so we can accommodate almost any schedule. We're open seven days a week from 8am to 6pm, but appointments can be scheduled outside these hours if necessary. Book an appointment online or call us at 555-555-5555!\r\n	https://imgur.com/u0kMLlG.gif	6332 Marine drive	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
16	10	Henderson Outdoor	service sports adventure	Looking for a new way to experience the outdoors? \r\n\r\nHenderson Outdoor has everything you need. We offer camping, hiking, and mountain biking gear, as well as all kinds of equipment you'll need to experience the great outdoors. Whether you're looking for a tent for your next camping trip or a new bike for your next time on a trail, visit one of our stores or check out our website today!	https://imgur.com/OkrsgUu.gif	2923 Alder ave	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
17	10	Cool Beans	Restaurant coffee food drink	Do you love coffee? Are you ready to take a deep dive into the world of artisanal beans?\r\n\r\nWhether you're a caffeine addict or just a casual fan, we've got something that's going to make your taste buds explode.\r\n\r\nMeet Cool Beans, your new favorite coffee shop. We specialize in espresso, lattes, and cappuccinos, along with all kinds of delicious baked goodsâ€”and it's all made fresh right on the spot.	https://imgur.com/Sj2L6KS.gif	2927 Broadway	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
18	10	Petrakis	pets	Stop by Petrakis for all your pet's needs!\r\n\r\nWe offer a variety of pet toys, food, and accessories. Our staff is trained to assist you with any questions you have regarding the care of your pets. We also offer treats for you! Stop by our cafe to buy yourself a coffee or sandwich, and receive 10% off all store purchases that day! Come see us at Petrakis today!	https://imgur.com/C7Cbxl8.gif	3452 Mountain ave	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
19	3	Camila Johnson	retail clothes	Avid shopper, fashionista and lover of all things beautiful? Then you've come to the right place!\r\n\r\nCamilla Johnson is your go-to for all the best pieces for women. From blouses to tanks, dresses to shoes, and everything in between, we have everything you need to feel like the best version of yourself. Spice up your jewelry collection with a new necklace, or change up your look with a brand-new blazerâ€”whatever you choose, we guarantee our wide selection will have exactly what you're looking for.\r\n\r\nWe are committed to providing you with top-quality goods that will make you feel confident and beautiful no matter where life takes you. We offer some of the most versatile pieces on the market so that you can be dressed to impress in whatever situation. Whether it's a big job interview or just a fun day out with friends, our products are sure to make you feel like a certified #GirlBoss.\r\n\r\nLooking for women's clothing? You've come to the right place.	https://imgur.com/0bgXNH9.gif	2342 5th street	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
20	10	Lighthouse Labs	service education coding programming	Lighthouse Labs is a coding bootcamp that teaches students how to code. We offer free tutoring and on-site assistance with a variety of programming languages. Our students are also eligible for a free upgrade to a full-time job after graduation.	https://imgur.com/2hixaIA.gif	9213 Main st	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
21	10	Loyaltree	service gift cards ecommerce	Loyaltree was built to help merchants grow their business. We help you create customer loyalty programs that keep customers coming back for more. The Loyaltree app makes it easy for your customers to engage with your brand. They can scan a QR code, purchase gift cards, track their points, and claim great rewards - all in one place.	https://i.imgur.com/6ZAWAgA.gif	1530 West Broadway	2024-10-08 14:05:07.953042	2024-10-08 14:05:07.953042
\.


--
-- Data for Name: transactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.transactions (id, giftcard_id, store_id, amount, receiver_id, created_at) FROM stdin;
1	1	10	1000	\N	2022-03-01 10:22:59.387142
2	1	10	4648	\N	2022-03-04 10:22:59.387142
3	1	10	5673	\N	2022-03-09 10:22:59.387142
4	1	10	1299	\N	2022-03-13 10:22:59.387142
5	1	10	2465	\N	2022-03-16 10:22:59.387142
6	2	9	8367	\N	2022-03-02 10:22:59.387142
7	2	9	6712	\N	2022-03-02 10:22:59.387142
8	2	9	4499	\N	2022-03-02 10:22:59.387142
9	2	9	2399	\N	2022-03-02 10:22:59.387142
10	2	9	7832	\N	2022-03-02 10:22:59.387142
11	2	9	1000	\N	2022-03-02 10:22:59.387142
12	3	8	1599	\N	2022-03-03 10:22:59.387142
13	3	8	9890	\N	2022-03-03 10:22:59.387142
14	3	8	7846	\N	2022-03-03 10:22:59.387142
15	3	8	6341	\N	2022-03-03 10:22:59.387142
16	3	8	2250	\N	2022-03-03 10:22:59.387142
17	3	8	3265	\N	2022-03-03 10:22:59.387142
18	4	7	9956	\N	2022-03-04 10:22:59.387142
19	4	7	4959	\N	2022-03-04 10:22:59.387142
20	4	7	9014	\N	2022-03-04 10:22:59.387142
21	4	7	5785	\N	2022-03-04 10:22:59.387142
22	4	7	7184	\N	2022-03-04 10:22:59.387142
23	5	6	3137	\N	2022-03-05 10:22:59.387142
24	5	6	8762	\N	2022-03-05 10:22:59.387142
25	5	6	2955	\N	2022-03-05 10:22:59.387142
26	5	6	5153	\N	2022-03-05 10:22:59.387142
27	5	6	3326	\N	2022-03-05 10:22:59.387142
28	6	5	6696	\N	2022-03-05 10:22:59.387142
29	6	5	3329	\N	2022-03-05 10:22:59.387142
30	6	5	2071	\N	2022-03-05 10:22:59.387142
31	6	5	7441	\N	2022-03-05 10:22:59.387142
32	6	5	3926	\N	2022-03-05 10:22:59.387142
33	7	4	8183	\N	2024-09-26 23:33:07.226941
34	7	4	4491	\N	2024-08-29 20:16:09.491235
35	7	4	6313	\N	2024-09-29 12:46:47.861699
36	7	4	7414	\N	2024-08-30 22:42:18.359401
37	3	4	514	\N	2024-09-05 10:44:26.917205
38	6	4	583	\N	2024-07-27 22:25:37.669845
39	3	4	6171	\N	2024-08-17 06:34:46.370248
40	2	4	7655	\N	2024-07-20 14:34:15.375006
41	8	4	6703	\N	2024-09-07 19:37:43.142774
42	9	1	2158	\N	2024-08-12 03:03:10.283972
43	8	3	2917	\N	2022-03-07 10:22:59.387142
44	8	3	1769	\N	2022-03-07 10:22:59.387142
45	8	3	9347	\N	2022-03-07 10:22:59.387142
46	8	3	8778	\N	2022-03-07 10:22:59.387142
47	8	3	6262	\N	2022-03-07 10:22:59.387142
48	8	3	7021	\N	2022-03-07 10:22:59.387142
49	9	2	3741	\N	2022-03-08 10:22:59.387142
50	9	2	3239	\N	2022-03-08 10:22:59.387142
51	9	2	7153	\N	2022-03-08 10:22:59.387142
52	9	2	3058	\N	2022-03-08 10:22:59.387142
53	9	2	2202	\N	2022-03-08 10:22:59.387142
54	10	1	8662	\N	2024-09-29 06:40:51.874585
55	10	1	4222	\N	2024-07-30 05:40:50.111848
56	10	1	6222	\N	2024-07-27 16:07:15.56424
57	10	1	9504	\N	2024-09-24 03:56:42.686426
58	10	1	9326	\N	2024-09-16 21:03:36.520446
59	10	1	2955	\N	2022-03-10 10:22:59.387142
60	11	7	10000	\N	2024-10-08 14:27:27.58619
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, points, first_name, last_name, password, email, isstoreowner, city, created_at, edited_at) FROM stdin;
2	12	Casey	Tite	password	casey@example.com	t	Victoria	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
3	15	Logan	Woolf	password	logan@example.com	f	Lethbridge	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
4	11	Bill	Bell	password	bill@example.com	t	Vancouver	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
5	53	Juan	Tite	password	juan@example.com	t	Victoria	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
6	67	Miroslav	Woolf	password	mir@example.com	f	Lethbridge	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
7	16	Lauren	Bell	password	lo@example.com	t	Vancouver	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
8	34	Felix	Tite	password	fefe@example.com	t	Victoria	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
9	21	Candy	Woolf	password	cans@example.com	f	Lethbridge	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
10	54	Yuri	Bell	password	yuri@example.com	t	Vancouver	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
11	45	Warwick	Tite	password	warwick@example.com	t	Victoria	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
12	1	Barcy	Phillipe	password	barcy@example.com	f	Lethbridge	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
1	20	Chris	Bell	password	chris@example.com	t	Vancouver	2024-10-08 14:05:03.988178	2024-10-08 14:05:03.988178
\.


--
-- Name: gift_cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gift_cards_id_seq', 11, true);


--
-- Name: stores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.stores_id_seq', 21, true);


--
-- Name: transactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.transactions_id_seq', 60, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 12, true);


--
-- Name: gift_cards gift_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards
    ADD CONSTRAINT gift_cards_pkey PRIMARY KEY (id);


--
-- Name: stores stores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_pkey PRIMARY KEY (id);


--
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: gift_cards gift_cards_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards
    ADD CONSTRAINT gift_cards_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(id) ON DELETE CASCADE;


--
-- Name: gift_cards gift_cards_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gift_cards
    ADD CONSTRAINT gift_cards_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: stores stores_owner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.stores
    ADD CONSTRAINT stores_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: transactions transactions_giftcard_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_giftcard_id_fkey FOREIGN KEY (giftcard_id) REFERENCES public.gift_cards(id);


--
-- Name: transactions transactions_receiver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_receiver_id_fkey FOREIGN KEY (receiver_id) REFERENCES public.users(id);


--
-- Name: transactions transactions_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.stores(id);


--
-- PostgreSQL database dump complete
--

