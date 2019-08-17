--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.9
-- Dumped by pg_dump version 9.5.9

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: masters; Type: TABLE DATA; Schema: public; Owner: root
--

COPY masters (id, name, surname, phone) FROM stdin;
\.


--
-- Name: masters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('masters_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: root
--

COPY orders (id, name, phone, price, comment) FROM stdin;
\.


--
-- Data for Name: order_master; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_master (order_id, master_id) FROM stdin;
\.


--
-- Data for Name: procedures; Type: TABLE DATA; Schema: public; Owner: root
--

COPY procedures (id, name, preferred_price) FROM stdin;
\.


--
-- Data for Name: order_procedures; Type: TABLE DATA; Schema: public; Owner: root
--

COPY order_procedures (order_id, procedure_id) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Name: procedures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('procedures_id_seq', 1, false);


--
-- Data for Name: schedule; Type: TABLE DATA; Schema: public; Owner: root
--

COPY schedule (id, master_id, start, finish) FROM stdin;
\.


--
-- Name: schedule_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('schedule_id_seq', 1, false);


--
-- Data for Name: user_types; Type: TABLE DATA; Schema: public; Owner: root
--

COPY user_types (id, name) FROM stdin;
1	master
2	admin
\.


--
-- Name: user_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('user_types_id_seq', 2, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: root
--

COPY users (id, password, name, surname, type, login) FROM stdin;
3	admin	\N	\N	2	admin
4	master	\N	\N	1	master
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: root
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- PostgreSQL database dump complete
--

