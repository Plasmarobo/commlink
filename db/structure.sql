--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: gamesessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE gamesessions (
    id integer NOT NULL,
    group_id integer,
    gm_id integer,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: gamesessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE gamesessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: gamesessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE gamesessions_id_seq OWNED BY gamesessions.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    gamesession_id integer,
    player_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: node_templates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE node_templates (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    "desc" text,
    programset_id integer,
    system integer,
    firewall integer,
    response integer,
    pilot integer,
    signal integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: node_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE node_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: node_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE node_templates_id_seq OWNED BY node_templates.id;


--
-- Name: nodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE nodes (
    id integer NOT NULL,
    player_id integer,
    name character varying(255),
    "desc" text,
    programset_id integer,
    system integer,
    firewall integer,
    response integer,
    pilot integer,
    signal integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    gamesession_id integer
);


--
-- Name: nodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE nodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: nodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE nodes_id_seq OWNED BY nodes.id;


--
-- Name: npcs; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE npcs (
    id integer NOT NULL,
    name character varying(255),
    "desc" text,
    secret text,
    node_id integer,
    gamesession_id integer,
    gm_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: npcs_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE npcs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: npcs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE npcs_id_seq OWNED BY npcs.id;


--
-- Name: pals; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE pals (
    id integer NOT NULL,
    user_id integer,
    pal_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: pals_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE pals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: pals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE pals_id_seq OWNED BY pals.id;


--
-- Name: players; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE players (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    user_id integer,
    condition integer,
    stun integer
);


--
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE players_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE players_id_seq OWNED BY players.id;


--
-- Name: programset_templates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programset_templates (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    "analyze" integer DEFAULT 1,
    browse integer DEFAULT 1,
    command integer DEFAULT 0,
    edit integer DEFAULT 1,
    encrypt integer DEFAULT 0,
    reality_filter integer DEFAULT 0,
    scan integer DEFAULT 1,
    armor integer DEFAULT 0,
    attack integer DEFAULT 0,
    biofeedback_filter integer DEFAULT 0,
    black_hammer integer DEFAULT 0,
    blackout integer DEFAULT 0,
    data_bomb integer DEFAULT 0,
    decrypt integer DEFAULT 0,
    defuse integer DEFAULT 0,
    eccm integer DEFAULT 0,
    exploit integer DEFAULT 0,
    medic integer DEFAULT 0,
    sniffer integer DEFAULT 0,
    spoof integer DEFAULT 0,
    stealth integer DEFAULT 0,
    track integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: programset_templates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programset_templates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: programset_templates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programset_templates_id_seq OWNED BY programset_templates.id;


--
-- Name: programsets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE programsets (
    id integer NOT NULL,
    node_id integer,
    "analyze" integer DEFAULT 1,
    browse integer DEFAULT 1,
    command integer DEFAULT 0,
    edit integer DEFAULT 1,
    encrypt integer DEFAULT 0,
    reality_filter integer DEFAULT 0,
    scan integer DEFAULT 1,
    armor integer DEFAULT 0,
    attack integer DEFAULT 0,
    biofeedback_filter integer DEFAULT 0,
    black_hammer integer DEFAULT 0,
    blackout integer DEFAULT 0,
    data_bomb integer DEFAULT 0,
    decrypt integer DEFAULT 0,
    defuse integer DEFAULT 0,
    eccm integer DEFAULT 0,
    exploit integer DEFAULT 0,
    medic integer DEFAULT 0,
    sniffer integer DEFAULT 0,
    spoof integer DEFAULT 0,
    stealth integer DEFAULT 0,
    track integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: programsets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE programsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: programsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE programsets_id_seq OWNED BY programsets.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: skillsets; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE skillsets (
    id integer NOT NULL,
    npc_id integer,
    hacking integer DEFAULT 0,
    computer integer DEFAULT 1,
    electronic_warfare integer DEFAULT 0,
    hardware integer DEFAULT 0,
    datasearch integer DEFAULT 1,
    software integer DEFAULT 1,
    cybercombat integer DEFAULT 0,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: skillsets_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE skillsets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: skillsets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE skillsets_id_seq OWNED BY skillsets.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    email character varying(255),
    password character varying(255),
    salt character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    password_digest character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: visiblenodes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE visiblenodes (
    id integer NOT NULL,
    player_id integer,
    node_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: visiblenodes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE visiblenodes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


--
-- Name: visiblenodes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE visiblenodes_id_seq OWNED BY visiblenodes.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY gamesessions ALTER COLUMN id SET DEFAULT nextval('gamesessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY node_templates ALTER COLUMN id SET DEFAULT nextval('node_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY nodes ALTER COLUMN id SET DEFAULT nextval('nodes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY npcs ALTER COLUMN id SET DEFAULT nextval('npcs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY pals ALTER COLUMN id SET DEFAULT nextval('pals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY players ALTER COLUMN id SET DEFAULT nextval('players_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programset_templates ALTER COLUMN id SET DEFAULT nextval('programset_templates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY programsets ALTER COLUMN id SET DEFAULT nextval('programsets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY skillsets ALTER COLUMN id SET DEFAULT nextval('skillsets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY visiblenodes ALTER COLUMN id SET DEFAULT nextval('visiblenodes_id_seq'::regclass);


--
-- Name: gamesessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY gamesessions
    ADD CONSTRAINT gamesessions_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: node_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY node_templates
    ADD CONSTRAINT node_templates_pkey PRIMARY KEY (id);


--
-- Name: nodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY nodes
    ADD CONSTRAINT nodes_pkey PRIMARY KEY (id);


--
-- Name: npcs_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY npcs
    ADD CONSTRAINT npcs_pkey PRIMARY KEY (id);


--
-- Name: pals_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY pals
    ADD CONSTRAINT pals_pkey PRIMARY KEY (id);


--
-- Name: players_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- Name: programset_templates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programset_templates
    ADD CONSTRAINT programset_templates_pkey PRIMARY KEY (id);


--
-- Name: programsets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY programsets
    ADD CONSTRAINT programsets_pkey PRIMARY KEY (id);


--
-- Name: skillsets_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY skillsets
    ADD CONSTRAINT skillsets_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: visiblenodes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY visiblenodes
    ADD CONSTRAINT visiblenodes_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20130502145831');

INSERT INTO schema_migrations (version) VALUES ('20130502174126');

INSERT INTO schema_migrations (version) VALUES ('20130503140242');

INSERT INTO schema_migrations (version) VALUES ('20130503140312');

INSERT INTO schema_migrations (version) VALUES ('20130503140408');

INSERT INTO schema_migrations (version) VALUES ('20130503140705');

INSERT INTO schema_migrations (version) VALUES ('20130503140801');

INSERT INTO schema_migrations (version) VALUES ('20130503141706');

INSERT INTO schema_migrations (version) VALUES ('20130503142027');

INSERT INTO schema_migrations (version) VALUES ('20130503142728');

INSERT INTO schema_migrations (version) VALUES ('20130503143913');

INSERT INTO schema_migrations (version) VALUES ('20130503151443');

INSERT INTO schema_migrations (version) VALUES ('20130503233402');

INSERT INTO schema_migrations (version) VALUES ('20130503234052');

INSERT INTO schema_migrations (version) VALUES ('20130505171806');

INSERT INTO schema_migrations (version) VALUES ('20130505174324');

INSERT INTO schema_migrations (version) VALUES ('20130505200457');

INSERT INTO schema_migrations (version) VALUES ('20130505202550');

INSERT INTO schema_migrations (version) VALUES ('20130506212947');

INSERT INTO schema_migrations (version) VALUES ('20130508223544');

INSERT INTO schema_migrations (version) VALUES ('20130508225540');