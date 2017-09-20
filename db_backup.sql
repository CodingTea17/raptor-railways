--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

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
-- Name: cities; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE cities (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE cities OWNER TO "Guest";

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO "Guest";

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: routes; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE routes (
    id integer NOT NULL,
    train_id integer,
    "time" timestamp without time zone,
    city_start_id integer,
    city_end_id integer
);


ALTER TABLE routes OWNER TO "Guest";

--
-- Name: routes_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE routes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE routes_id_seq OWNER TO "Guest";

--
-- Name: routes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE routes_id_seq OWNED BY routes.id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE trains (
    id integer NOT NULL,
    name character varying,
    color character varying
);


ALTER TABLE trains OWNER TO "Guest";

--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE trains_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trains_id_seq OWNER TO "Guest";

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE trains_id_seq OWNED BY trains.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: routes id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY routes ALTER COLUMN id SET DEFAULT nextval('routes_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY trains ALTER COLUMN id SET DEFAULT nextval('trains_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY cities (id, name) FROM stdin;
15	test
17	Bob
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('cities_id_seq', 19, true);


--
-- Data for Name: routes; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY routes (id, train_id, "time", city_start_id, city_end_id) FROM stdin;
\.


--
-- Name: routes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('routes_id_seq', 1, false);


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY trains (id, name, color) FROM stdin;
2	golden tricaratops	purple
\.


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('trains_id_seq', 3, true);


--
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (id);


--
-- Name: routes routes_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY routes
    ADD CONSTRAINT routes_pkey PRIMARY KEY (id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

