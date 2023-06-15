--
-- PostgreSQL database dump
--

-- Dumped from database version 10.1
-- Dumped by pg_dump version 10.1

-- Started on 2018-05-10 15:47:40

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 57869)
-- Name: groups; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE groups (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    descr text
);


--
-- TOC entry 198 (class 1259 OID 57867)
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2838 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- TOC entry 201 (class 1259 OID 57880)
-- Name: pages; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE pages (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    descr text,
    url character varying(255) NOT NULL,
    group_id integer NOT NULL
);


--
-- TOC entry 200 (class 1259 OID 57878)
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2839 (class 0 OID 0)
-- Dependencies: 200
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pages_id_seq OWNED BY pages.id;


--
-- TOC entry 203 (class 1259 OID 57891)
-- Name: user_group_link; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE user_group_link (
    id integer NOT NULL,
    group_id integer NOT NULL,
    user_id integer NOT NULL
);


--
-- TOC entry 202 (class 1259 OID 57889)
-- Name: user_group_link_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE user_group_link_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2840 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_group_link_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE user_group_link_id_seq OWNED BY user_group_link.id;


--
-- TOC entry 197 (class 1259 OID 49665)
-- Name: users; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE users (
    id integer NOT NULL,
    firstname character varying(25),
    lastname character varying(25),
    username character varying(25),
    password character varying(255),
    validationcode character varying(255),
    email character varying(100),
    comments text,
    joined date,
    last_login date,
    active smallint DEFAULT 0
);


--
-- TOC entry 196 (class 1259 OID 49663)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 2841 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2693 (class 2604 OID 57872)
-- Name: groups id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- TOC entry 2694 (class 2604 OID 57883)
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages ALTER COLUMN id SET DEFAULT nextval('pages_id_seq'::regclass);


--
-- TOC entry 2695 (class 2604 OID 57894)
-- Name: user_group_link id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_group_link ALTER COLUMN id SET DEFAULT nextval('user_group_link_id_seq'::regclass);


--
-- TOC entry 2691 (class 2604 OID 49668)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2828 (class 0 OID 57869)
-- Dependencies: 199
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO groups VALUES (1, 'Admin', 'Handle the administration of users, groups, and pages.');
INSERT INTO groups VALUES (2, 'Editeur', 'Editing geographic data and handling access to groups');
INSERT INTO groups VALUES (3, 'Partenaire Editeur', 'View, searching and editing geographic data');
INSERT INTO groups VALUES (4, 'Partenaire Viewer', 'View and searching data in geoportail');


--
-- TOC entry 2830 (class 0 OID 57880)
-- Dependencies: 201
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO pages VALUES (1, 'Administration of CMS', 'Add groups and pages, assign users and pages to groups, edit and delete users, groups, and pages', 'admin.php', 1);
INSERT INTO pages VALUES (2, 'Administation Help', 'Help information for administration page', 'admin_help.php', 1);
INSERT INTO pages VALUES (3, 'Edit Groups', 'Edit access to groups', 'edit_groups.php', 2);
INSERT INTO pages VALUES (4, 'Geoportail Editor', 'Access to Geoportail for viewing, searching and editing', 'geoportail_editor.php', 3);
INSERT INTO pages VALUES (5, 'Geoportail Viewer', 'Access to Geoportail for viewing and searching', 'geoportail_viewer.php', 4);


--
-- TOC entry 2832 (class 0 OID 57891)
-- Dependencies: 203
-- Data for Name: user_group_link; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO user_group_link VALUES (1, 1, 1);
INSERT INTO user_group_link VALUES (2, 2, 2);
INSERT INTO user_group_link VALUES (3, 3, 2);
INSERT INTO user_group_link VALUES (4, 3, 3);
INSERT INTO user_group_link VALUES (5, 4, 4);


--
-- TOC entry 2826 (class 0 OID 49665)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: -
--

INSERT INTO users VALUES (1, 'Ayoub', 'Ighachen', 'ayoub_admin', 'test', 'd6b5866be728b8adbff6a8ffe85caf50', 'ighachen.ayoub@gmail.com', 'Site administrator', '2023-05-05', '2023-05-05', 1);
INSERT INTO users VALUES (2, 'Ayoub', 'Idhssaine', 'ayoubidhssaine', 'test', '2f64f1be221785607135cf7d61e70677', 'idhssaine.ayoub@gmail.com', 'Site editor', '2023-05-05', '2023-05-05', 1);
INSERT INTO users VALUES (3, 'Mr', 'Fadil', 'mrfadil_editor', 'test', '42f418c62abdf95a60e48649e88f4de6', 'mr.fadil@gmail.com', '', '2023-05-05', '2023-05-05', 1);
INSERT INTO users VALUES (4, 'D', 'El Amado', 'delamado_viewer', 'test', '683fcef7fc96f2acb47d23492e9918d8', 'd.elamado@gmail.com', '', '2023-05-05', '2023-05-05', 1);



--
-- TOC entry 2842 (class 0 OID 0)
-- Dependencies: 198
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('groups_id_seq', 7, true);


--
-- TOC entry 2843 (class 0 OID 0)
-- Dependencies: 200
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('pages_id_seq', 8, true);


--
-- TOC entry 2844 (class 0 OID 0)
-- Dependencies: 202
-- Name: user_group_link_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('user_group_link_id_seq', 18, true);


--
-- TOC entry 2845 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('users_id_seq', 29, true);


--
-- TOC entry 2699 (class 2606 OID 57877)
-- Name: groups groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2701 (class 2606 OID 57888)
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- TOC entry 2703 (class 2606 OID 57896)
-- Name: user_group_link user_group_link_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY user_group_link
    ADD CONSTRAINT user_group_link_pkey PRIMARY KEY (id);


--
-- TOC entry 2697 (class 2606 OID 49673)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


-- Completed on 2018-05-10 15:47:42

--
-- PostgreSQL database dump complete
--

