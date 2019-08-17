create user root with password 'root';
create user crm with password 'crm';
create user reader with password 'reader';
create user dataroot with password 'dataroot';
create user locations with password 'locations';

create database crm template template0 owner root
  encoding 'utf8'
  lc_collate = 'en_US.UTF-8'
  lc_ctype = 'en_US.UTF-8';

\connect crm

grant connect on database crm to crm;
grant connect on database crm to reader;
grant connect on database crm to dataroot;
grant connect on database crm to locations;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO root;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO crm;

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

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: masters; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE masters (
    id integer NOT NULL,
    name text NOT NULL,
    surname text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE masters OWNER TO root;

--
-- Name: masters_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE masters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE masters_id_seq OWNER TO root;

--
-- Name: masters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE masters_id_seq OWNED BY masters.id;


--
-- Name: order_master; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_master (
    order_id integer NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE order_master OWNER TO root;

--
-- Name: order_procedures; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE order_procedures (
    order_id integer NOT NULL,
    procedure_id integer NOT NULL
);


ALTER TABLE order_procedures OWNER TO root;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE orders (
    id integer NOT NULL,
    name text,
    phone text,
    price numeric NOT NULL,
    comment text
);


ALTER TABLE orders OWNER TO root;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO root;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: procedures; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE procedures (
    id integer NOT NULL,
    name text NOT NULL,
    preferred_price numeric NOT NULL
);


ALTER TABLE procedures OWNER TO root;

--
-- Name: procedures_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE procedures_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE procedures_id_seq OWNER TO root;

--
-- Name: procedures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE procedures_id_seq OWNED BY procedures.id;


--
-- Name: schedule; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE schedule (
    id integer NOT NULL,
    master_id integer NOT NULL,
    start timestamp without time zone NOT NULL,
    finish timestamp without time zone NOT NULL
);


ALTER TABLE schedule OWNER TO root;

--
-- Name: schedule_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE schedule_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schedule_id_seq OWNER TO root;

--
-- Name: schedule_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE schedule_id_seq OWNED BY schedule.id;


--
-- Name: user_types; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE user_types (
    id integer NOT NULL,
    name text
);


ALTER TABLE user_types OWNER TO root;

--
-- Name: user_types_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE user_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_types_id_seq OWNER TO root;

--
-- Name: user_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE user_types_id_seq OWNED BY user_types.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: root
--

CREATE TABLE users (
    id integer NOT NULL,
    password text NOT NULL,
    name text,
    surname text,
    type integer,
    login text
);


ALTER TABLE users OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: root
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO root;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: root
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY masters ALTER COLUMN id SET DEFAULT nextval('masters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY procedures ALTER COLUMN id SET DEFAULT nextval('procedures_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY schedule ALTER COLUMN id SET DEFAULT nextval('schedule_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_types ALTER COLUMN id SET DEFAULT nextval('user_types_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: root
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: masters_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY masters
    ADD CONSTRAINT masters_pkey PRIMARY KEY (id);


--
-- Name: orders_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: procedures_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY procedures
    ADD CONSTRAINT procedures_pkey PRIMARY KEY (id);


--
-- Name: schedule_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_pkey PRIMARY KEY (id);


--
-- Name: user_types_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY user_types
    ADD CONSTRAINT user_types_pkey PRIMARY KEY (id);


--
-- Name: users_login_key; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_login_key UNIQUE (login);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: order_master_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_master
    ADD CONSTRAINT order_master_master_id_fkey FOREIGN KEY (master_id) REFERENCES masters(id);


--
-- Name: order_master_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_master
    ADD CONSTRAINT order_master_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: order_procedures_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_procedures
    ADD CONSTRAINT order_procedures_order_id_fkey FOREIGN KEY (order_id) REFERENCES orders(id);


--
-- Name: order_procedures_procedure_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY order_procedures
    ADD CONSTRAINT order_procedures_procedure_id_fkey FOREIGN KEY (procedure_id) REFERENCES procedures(id);


--
-- Name: schedule_master_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY schedule
    ADD CONSTRAINT schedule_master_id_fkey FOREIGN KEY (master_id) REFERENCES masters(id);


--
-- Name: users_type_fkey; Type: FK CONSTRAINT; Schema: public; Owner: root
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_type_fkey FOREIGN KEY (type) REFERENCES user_types(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: masters; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE masters FROM PUBLIC;
REVOKE ALL ON TABLE masters FROM root;
GRANT ALL ON TABLE masters TO root;
GRANT ALL ON TABLE masters TO crm;


--
-- Name: order_master; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE order_master FROM PUBLIC;
REVOKE ALL ON TABLE order_master FROM root;
GRANT ALL ON TABLE order_master TO root;
GRANT ALL ON TABLE order_master TO crm;


--
-- Name: order_procedures; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE order_procedures FROM PUBLIC;
REVOKE ALL ON TABLE order_procedures FROM root;
GRANT ALL ON TABLE order_procedures TO root;
GRANT ALL ON TABLE order_procedures TO crm;


--
-- Name: orders; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE orders FROM PUBLIC;
REVOKE ALL ON TABLE orders FROM root;
GRANT ALL ON TABLE orders TO root;
GRANT ALL ON TABLE orders TO crm;


--
-- Name: procedures; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE procedures FROM PUBLIC;
REVOKE ALL ON TABLE procedures FROM root;
GRANT ALL ON TABLE procedures TO root;
GRANT ALL ON TABLE procedures TO crm;


--
-- Name: schedule; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE schedule FROM PUBLIC;
REVOKE ALL ON TABLE schedule FROM root;
GRANT ALL ON TABLE schedule TO root;
GRANT ALL ON TABLE schedule TO crm;


--
-- Name: user_types; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE user_types FROM PUBLIC;
REVOKE ALL ON TABLE user_types FROM root;
GRANT ALL ON TABLE user_types TO root;
GRANT ALL ON TABLE user_types TO crm;


--
-- Name: users; Type: ACL; Schema: public; Owner: root
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM root;
GRANT ALL ON TABLE users TO root;
GRANT ALL ON TABLE users TO crm;


--
-- PostgreSQL database dump complete
--

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

