--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- Name: categories; Type: TABLE; Schema: public; Owner: nelly
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE categories OWNER TO nelly;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: nelly
--

CREATE SEQUENCE categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO nelly;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nelly
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: nelly
--

CREATE TABLE tasks (
    id integer NOT NULL,
    description character varying,
    categoryid integer
);


ALTER TABLE tasks OWNER TO nelly;

--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: nelly
--

CREATE SEQUENCE tasks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tasks_id_seq OWNER TO nelly;

--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nelly
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: nelly
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: tasks id; Type: DEFAULT; Schema: public; Owner: nelly
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: nelly
--

COPY categories (id, name) FROM stdin;
1	Home
2	Home
3	work
4	Misc
5	School
\.


--
-- Data for Name: tasks; Type: TABLE DATA; Schema: public; Owner: nelly
--

COPY tasks (id, description, categoryid) FROM stdin;
1	mow the lawn	1
3	Finish a report	3
4	sleep	3
5	sleep	2
9	Do laundry	1
10	test	1
11	laundry	1
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nelly
--

SELECT pg_catalog.setval('categories_id_seq', 5, true);


--
-- Name: tasks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nelly
--

SELECT pg_catalog.setval('tasks_id_seq', 11, true);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: nelly
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: tasks tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: nelly
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

