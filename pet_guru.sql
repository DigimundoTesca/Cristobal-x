--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.11
-- Dumped by pg_dump version 9.5.11

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE auth_group OWNER TO digimundo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_id_seq OWNER TO digimundo;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE auth_group_permissions OWNER TO digimundo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_group_permissions_id_seq OWNER TO digimundo;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE auth_permission OWNER TO digimundo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE auth_permission_id_seq OWNER TO digimundo;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: background_task; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE background_task (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE background_task OWNER TO digimundo;

--
-- Name: background_task_completedtask; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE background_task_completedtask (
    id integer NOT NULL,
    task_name character varying(190) NOT NULL,
    task_params text NOT NULL,
    task_hash character varying(40) NOT NULL,
    verbose_name character varying(255),
    priority integer NOT NULL,
    run_at timestamp with time zone NOT NULL,
    repeat bigint NOT NULL,
    repeat_until timestamp with time zone,
    queue character varying(190),
    attempts integer NOT NULL,
    failed_at timestamp with time zone,
    last_error text NOT NULL,
    locked_by character varying(64),
    locked_at timestamp with time zone,
    creator_object_id integer,
    creator_content_type_id integer,
    CONSTRAINT background_task_completedtask_creator_object_id_check CHECK ((creator_object_id >= 0))
);


ALTER TABLE background_task_completedtask OWNER TO digimundo;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE background_task_completedtask_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE background_task_completedtask_id_seq OWNER TO digimundo;

--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE background_task_completedtask_id_seq OWNED BY background_task_completedtask.id;


--
-- Name: background_task_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE background_task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE background_task_id_seq OWNER TO digimundo;

--
-- Name: background_task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE background_task_id_seq OWNED BY background_task.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE django_admin_log OWNER TO digimundo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_admin_log_id_seq OWNER TO digimundo;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE django_content_type OWNER TO digimundo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_content_type_id_seq OWNER TO digimundo;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE django_migrations OWNER TO digimundo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE django_migrations_id_seq OWNER TO digimundo;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE django_session OWNER TO digimundo;

--
-- Name: home_aquatic; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_aquatic (
    id integer NOT NULL,
    genetic character varying(50) NOT NULL,
    zootechnical character varying(50) NOT NULL,
    age character varying(20) NOT NULL,
    weight integer NOT NULL,
    pond character varying(3) NOT NULL,
    density integer NOT NULL,
    biomass integer NOT NULL,
    aeration boolean,
    recirculation_water boolean,
    aeration_type character varying(3) NOT NULL,
    change_water integer NOT NULL,
    date_sowing character varying(50) NOT NULL,
    temperature_6am integer NOT NULL,
    temperature_3pm integer NOT NULL,
    oxygen_6am integer NOT NULL,
    oxygen_3pm integer NOT NULL,
    ph_6am integer NOT NULL,
    ph_3pm integer NOT NULL,
    no2 integer NOT NULL,
    nh4 integer NOT NULL,
    nh3 integer NOT NULL,
    transparency integer NOT NULL,
    mortality integer NOT NULL,
    start_mortality character varying(30) NOT NULL,
    "position" character varying(3) NOT NULL,
    body_color character varying(3) NOT NULL,
    moves character varying(3) NOT NULL,
    lack_of_appetite boolean,
    type_eat character varying(3) NOT NULL,
    eat_for_day character varying(80) NOT NULL,
    coloration character varying(3) NOT NULL,
    bulging_belly boolean,
    exophthalmia boolean,
    petechia boolean,
    dilated boolean,
    ulcers boolean,
    skin_sores boolean,
    cotton_structures boolean,
    necrosis_epidermal_layer boolean,
    ocular_opacity boolean,
    question_id integer NOT NULL,
    CONSTRAINT home_aquatic_change_water_check CHECK ((change_water >= 0))
);


ALTER TABLE home_aquatic OWNER TO digimundo;

--
-- Name: home_aquatic_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_aquatic_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_aquatic_id_seq OWNER TO digimundo;

--
-- Name: home_aquatic_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_aquatic_id_seq OWNED BY home_aquatic.id;


--
-- Name: home_bee; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_bee (
    id integer NOT NULL,
    specie character varying(30) NOT NULL,
    colony_type character varying(3) NOT NULL,
    hive_review character varying(80) NOT NULL,
    queen_presence character varying(3) NOT NULL,
    disease_signs character varying(80) NOT NULL,
    breeding character varying(3) NOT NULL,
    adult_bee character varying(3) NOT NULL,
    backstage_bee integer NOT NULL,
    real_cell character varying(50) NOT NULL,
    backstage_breeding integer NOT NULL,
    eggs boolean,
    quantity_eggs integer NOT NULL,
    observations text NOT NULL,
    stool_spots character varying(3) NOT NULL,
    piece_larvae character varying(3) NOT NULL,
    dead_bees character varying(3) NOT NULL,
    food_racks character varying(3) NOT NULL,
    number_racks integer NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_bee OWNER TO digimundo;

--
-- Name: home_bee_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_bee_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_bee_id_seq OWNER TO digimundo;

--
-- Name: home_bee_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_bee_id_seq OWNED BY home_bee.id;


--
-- Name: home_bird; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_bird (
    id integer NOT NULL,
    type_animal character varying(60) NOT NULL,
    zootechnical_purpose character varying(30) NOT NULL,
    age character varying(3) NOT NULL,
    age_week integer NOT NULL,
    age_month integer NOT NULL,
    place character varying(3) NOT NULL,
    quantity integer NOT NULL,
    coexistence boolean,
    origin_water character varying(30) NOT NULL,
    morbidity integer NOT NULL,
    mortality integer NOT NULL,
    date_signs character varying(10) NOT NULL,
    water character varying(3) NOT NULL,
    eat character varying(3) NOT NULL,
    vaccine character varying(30) NOT NULL,
    defecation character varying(3) NOT NULL,
    condition_corporal character varying(30) NOT NULL,
    plumage character varying(50) NOT NULL,
    condition_legs character varying(3) NOT NULL,
    breathing_frequency integer NOT NULL,
    dehydration boolean,
    attitude character varying(80) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_bird OWNER TO digimundo;

--
-- Name: home_bird_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_bird_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_bird_id_seq OWNER TO digimundo;

--
-- Name: home_bird_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_bird_id_seq OWNED BY home_bird.id;


--
-- Name: home_bovine; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_bovine (
    specie_ptr_id integer NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    lymph_nodes character varying(50),
    ruminal character varying(80),
    body_condition text
);


ALTER TABLE home_bovine OWNER TO digimundo;

--
-- Name: home_cat; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_cat (
    specie_ptr_id integer NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    cough character varying(80),
    pulse character varying(80),
    skin character varying(80)
);


ALTER TABLE home_cat OWNER TO digimundo;

--
-- Name: home_document; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_document (
    id integer NOT NULL,
    document character varying(100),
    question_id integer NOT NULL
);


ALTER TABLE home_document OWNER TO digimundo;

--
-- Name: home_document_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_document_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_document_id_seq OWNER TO digimundo;

--
-- Name: home_document_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_document_id_seq OWNED BY home_document.id;


--
-- Name: home_dog; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_dog (
    specie_ptr_id integer NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    cough character varying(80),
    pulse character varying(80),
    skin character varying(80)
);


ALTER TABLE home_dog OWNER TO digimundo;

--
-- Name: home_goat; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_goat (
    specie_ptr_id integer NOT NULL,
    physiological_stage character varying(30),
    zootechnical character varying(50),
    production_system character varying(30),
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    lymph_nodes character varying(50),
    ruminal character varying(80),
    body_condition text,
    cough character varying(80)
);


ALTER TABLE home_goat OWNER TO digimundo;

--
-- Name: home_horse; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_horse (
    specie_ptr_id integer NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    lymph_nodes character varying(50),
    body_condition text
);


ALTER TABLE home_horse OWNER TO digimundo;

--
-- Name: home_imagequestion; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_imagequestion (
    id integer NOT NULL,
    image character varying(100) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_imagequestion OWNER TO digimundo;

--
-- Name: home_imagequestion_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_imagequestion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_imagequestion_id_seq OWNER TO digimundo;

--
-- Name: home_imagequestion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_imagequestion_id_seq OWNED BY home_imagequestion.id;


--
-- Name: home_message; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_message (
    id integer NOT NULL,
    handle text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    message text NOT NULL,
    image character varying(100) NOT NULL,
    document character varying(100) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_message OWNER TO digimundo;

--
-- Name: home_message_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_message_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_message_id_seq OWNER TO digimundo;

--
-- Name: home_message_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_message_id_seq OWNED BY home_message.id;


--
-- Name: home_ovine; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_ovine (
    specie_ptr_id integer NOT NULL,
    physiological_stage character varying(30),
    zootechnical character varying(50),
    production_system character varying(30),
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    mucosal_color character varying(30),
    lymph_nodes character varying(50),
    ruminal character varying(80),
    body_condition text
);


ALTER TABLE home_ovine OWNER TO digimundo;

--
-- Name: home_porcine; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_porcine (
    specie_ptr_id integer NOT NULL,
    physiological_stage character varying(30),
    production_system character varying(30),
    curse character varying(60),
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    body_condition text,
    attitude text,
    color character varying(30)
);


ALTER TABLE home_porcine OWNER TO digimundo;

--
-- Name: home_question; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_question (
    id integer NOT NULL,
    title character varying(100),
    description text,
    status character varying(2),
    calification smallint NOT NULL,
    date timestamp with time zone,
    specie character varying(10),
    user_question_id integer NOT NULL,
    user_response_id integer NOT NULL,
    CONSTRAINT home_question_calification_check CHECK ((calification >= 0))
);


ALTER TABLE home_question OWNER TO digimundo;

--
-- Name: home_question_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_question_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_question_id_seq OWNER TO digimundo;

--
-- Name: home_question_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_question_id_seq OWNED BY home_question.id;


--
-- Name: home_rabbit; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_rabbit (
    specie_ptr_id integer NOT NULL,
    productive_stage character varying(10) NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30),
    lymph_nodes character varying(50),
    body_condition text,
    dehydration character varying(50)
);


ALTER TABLE home_rabbit OWNER TO digimundo;

--
-- Name: home_specie; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_specie (
    id integer NOT NULL,
    race character varying(20) NOT NULL,
    age character varying(20) NOT NULL,
    gender character varying(3) NOT NULL,
    weight numeric(7,3) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_specie OWNER TO digimundo;

--
-- Name: home_specie_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_specie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_specie_id_seq OWNER TO digimundo;

--
-- Name: home_specie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_specie_id_seq OWNED BY home_specie.id;


--
-- Name: home_wild; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE home_wild (
    id integer NOT NULL,
    specie character varying(30) NOT NULL,
    zootechnical character varying(50) NOT NULL,
    ambiental_condition character varying(80) NOT NULL,
    feeding character varying(50) NOT NULL,
    background character varying(50) NOT NULL,
    evolution_disease character varying(50) NOT NULL,
    heart_rate integer NOT NULL,
    respiratory_rate integer NOT NULL,
    temperature numeric(5,3) NOT NULL,
    capilar integer NOT NULL,
    mucosal_color character varying(30) NOT NULL,
    lymph_nodes character varying(50) NOT NULL,
    ruminal character varying(80) NOT NULL,
    question_id integer NOT NULL
);


ALTER TABLE home_wild OWNER TO digimundo;

--
-- Name: home_wild_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE home_wild_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE home_wild_id_seq OWNER TO digimundo;

--
-- Name: home_wild_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE home_wild_id_seq OWNED BY home_wild.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    rol character varying(3) NOT NULL,
    speciality character varying(15) NOT NULL,
    date_end date
);


ALTER TABLE users_user OWNER TO digimundo;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE users_user_groups OWNER TO digimundo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE users_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_groups_id_seq OWNER TO digimundo;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE users_user_groups_id_seq OWNED BY users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO digimundo;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE users_user_id_seq OWNED BY users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: digimundo
--

CREATE TABLE users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE users_user_user_permissions OWNER TO digimundo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: digimundo
--

CREATE SEQUENCE users_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_user_permissions_id_seq OWNER TO digimundo;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: digimundo
--

ALTER SEQUENCE users_user_user_permissions_id_seq OWNED BY users_user_user_permissions.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task ALTER COLUMN id SET DEFAULT nextval('background_task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask ALTER COLUMN id SET DEFAULT nextval('background_task_completedtask_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic ALTER COLUMN id SET DEFAULT nextval('home_aquatic_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee ALTER COLUMN id SET DEFAULT nextval('home_bee_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird ALTER COLUMN id SET DEFAULT nextval('home_bird_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document ALTER COLUMN id SET DEFAULT nextval('home_document_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion ALTER COLUMN id SET DEFAULT nextval('home_imagequestion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message ALTER COLUMN id SET DEFAULT nextval('home_message_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question ALTER COLUMN id SET DEFAULT nextval('home_question_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie ALTER COLUMN id SET DEFAULT nextval('home_specie_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild ALTER COLUMN id SET DEFAULT nextval('home_wild_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user ALTER COLUMN id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups ALTER COLUMN id SET DEFAULT nextval('users_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add group	2	add_group
5	Can change group	2	change_group
6	Can delete group	2	delete_group
7	Can add permission	3	add_permission
8	Can change permission	3	change_permission
9	Can delete permission	3	delete_permission
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add image question	7	add_imagequestion
20	Can change image question	7	change_imagequestion
21	Can delete image question	7	delete_imagequestion
22	Can add document	8	add_document
23	Can change document	8	change_document
24	Can delete document	8	delete_document
25	Can add bird	9	add_bird
26	Can change bird	9	change_bird
27	Can delete bird	9	delete_bird
28	Can add specie	10	add_specie
29	Can change specie	10	change_specie
30	Can delete specie	10	delete_specie
31	Can add message	11	add_message
32	Can change message	11	change_message
33	Can delete message	11	delete_message
34	Can add wild	12	add_wild
35	Can change wild	12	change_wild
36	Can delete wild	12	delete_wild
37	Can add cat	13	add_cat
38	Can change cat	13	change_cat
39	Can delete cat	13	delete_cat
40	Can add goat	14	add_goat
41	Can change goat	14	change_goat
42	Can delete goat	14	delete_goat
43	Can add horse	15	add_horse
44	Can change horse	15	change_horse
45	Can delete horse	15	delete_horse
46	Can add aquatic	16	add_aquatic
47	Can change aquatic	16	change_aquatic
48	Can delete aquatic	16	delete_aquatic
49	Can add bee	17	add_bee
50	Can change bee	17	change_bee
51	Can delete bee	17	delete_bee
52	Can add rabbit	18	add_rabbit
53	Can change rabbit	18	change_rabbit
54	Can delete rabbit	18	delete_rabbit
55	Can add dog	19	add_dog
56	Can change dog	19	change_dog
57	Can delete dog	19	delete_dog
58	Can add bovine	20	add_bovine
59	Can change bovine	20	change_bovine
60	Can delete bovine	20	delete_bovine
61	Can add question	21	add_question
62	Can change question	21	change_question
63	Can delete question	21	delete_question
64	Can add porcine	22	add_porcine
65	Can change porcine	22	change_porcine
66	Can delete porcine	22	delete_porcine
67	Can add ovine	23	add_ovine
68	Can change ovine	23	change_ovine
69	Can delete ovine	23	delete_ovine
70	Can add completed task	24	add_completedtask
71	Can change completed task	24	change_completedtask
72	Can delete completed task	24	delete_completedtask
73	Can add task	25	add_task
74	Can change task	25	change_task
75	Can delete task	25	delete_task
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('auth_permission_id_seq', 75, true);


--
-- Data for Name: background_task; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY background_task (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Data for Name: background_task_completedtask; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY background_task_completedtask (id, task_name, task_params, task_hash, verbose_name, priority, run_at, repeat, repeat_until, queue, attempts, failed_at, last_error, locked_by, locked_at, creator_object_id, creator_content_type_id) FROM stdin;
\.


--
-- Name: background_task_completedtask_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('background_task_completedtask_id_seq', 1, false);


--
-- Name: background_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('background_task_id_seq', 1, false);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-02-21 03:51:30.011139-05	1	TescaAdmin	2	[{"changed": {"fields": ["rol", "speciality", "date_end"]}}]	6	1
2	2018-02-21 04:00:59.176878-05	2	karenadmin	1	[{"added": {}}]	6	1
3	2018-02-21 04:03:08.196148-05	2	karenadmin	3		6	1
4	2018-02-26 11:07:07.698134-05	1	TescaAdmin	2	[{"changed": {"fields": ["rol", "speciality"]}}]	6	1
5	2018-02-26 11:07:29.684512-05	1	TescaAdmin	2	[{"changed": {"fields": ["rol"]}}]	6	1
6	2018-02-26 11:22:33.872755-05	14	Test	3		21	6
7	2018-03-06 00:29:06.058606-05	6	TescaDev	2	[{"changed": {"fields": ["speciality", "date_end"]}}]	6	6
8	2018-03-08 01:07:15.17795-05	1	TescaAdmin	2	[{"changed": {"fields": ["speciality"]}}]	6	1
9	2018-03-08 01:54:03.494691-05	1	TescaAdmin	2	[{"changed": {"fields": ["rol"]}}]	6	1
10	2018-03-14 01:08:53.575848-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
11	2018-03-16 23:54:01.953933-04	1	PRUEBA 26 FEBRERO 2018	2	[{"changed": {"fields": ["status"]}}]	21	6
12	2018-03-20 19:49:47.002037-04	6	TescaDev	2	[{"changed": {"fields": ["rol", "speciality"]}}]	6	6
13	2018-03-21 11:18:39.777447-04	6	TescaDev	2	[]	6	6
14	2018-05-10 13:04:50.890642-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
15	2018-05-10 13:14:16.42895-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
16	2018-05-26 00:55:56.873896-04	1	PRUEBA 26 FEBRERO 2018	2	[{"changed": {"fields": ["status", "user_question"]}}]	21	6
17	2018-05-26 00:56:39.327251-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
18	2018-05-30 04:16:32.637333-04	1	TescaAdmin	2	[{"changed": {"fields": ["rol"]}}]	6	1
19	2018-05-30 04:16:44.474072-04	1	TescaAdmin	2	[{"changed": {"fields": ["speciality"]}}]	6	1
20	2018-05-30 04:24:23.639154-04	1	TescaAdmin	2	[{"changed": {"fields": ["rol"]}}]	6	1
21	2018-05-30 04:40:35.992285-04	1	TescaAdmin	2	[{"changed": {"fields": ["rol"]}}]	6	1
22	2018-05-30 14:33:04.976146-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
23	2018-05-30 14:44:04.110917-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
24	2018-06-07 14:02:52.234195-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
25	2018-06-22 14:17:29.455811-04	6	TescaDev	2	[{"changed": {"fields": ["speciality"]}}]	6	6
26	2018-06-22 14:17:57.237249-04	6	TescaDev	2	[]	6	6
27	2018-06-22 14:19:47.091274-04	6	TescaDev	2	[{"changed": {"fields": ["rol"]}}]	6	6
28	2018-07-02 02:36:53.198706-04	194	Rich	2	[{"changed": {"fields": ["speciality", "date_end"]}}]	6	194
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 28, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	home	imagequestion
8	home	document
9	home	bird
10	home	specie
11	home	message
12	home	wild
13	home	cat
14	home	goat
15	home	horse
16	home	aquatic
17	home	bee
18	home	rabbit
19	home	dog
20	home	bovine
21	home	question
22	home	porcine
23	home	ovine
24	background_task	completedtask
25	background_task	task
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('django_content_type_id_seq', 25, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-02-21 03:19:33.171464-05
2	contenttypes	0002_remove_content_type_name	2018-02-21 03:19:33.196121-05
3	auth	0001_initial	2018-02-21 03:19:33.622272-05
4	auth	0002_alter_permission_name_max_length	2018-02-21 03:19:33.646391-05
5	auth	0003_alter_user_email_max_length	2018-02-21 03:19:33.664791-05
6	auth	0004_alter_user_username_opts	2018-02-21 03:19:33.6811-05
7	auth	0005_alter_user_last_login_null	2018-02-21 03:19:33.697077-05
8	auth	0006_require_contenttypes_0002	2018-02-21 03:19:33.705209-05
9	auth	0007_alter_validators_add_error_messages	2018-02-21 03:19:33.722021-05
10	auth	0008_alter_user_username_max_length	2018-02-21 03:19:33.740714-05
11	users	0001_initial	2018-02-21 03:19:34.139834-05
12	admin	0001_initial	2018-02-21 03:19:34.348169-05
13	admin	0002_logentry_remove_auto_add	2018-02-21 03:19:34.372153-05
14	background_task	0001_initial	2018-02-21 03:19:35.632461-05
15	background_task	0002_auto_20170927_1109	2018-02-21 03:19:38.288029-05
16	home	0001_initial	2018-02-21 03:19:39.612181-05
17	home	0002_auto_20180221_0218	2018-02-21 03:19:40.363405-05
18	sessions	0001_initial	2018-02-21 03:19:40.521071-05
19	home	0003_auto_20180305_2258	2018-03-05 23:58:57.548152-05
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('django_migrations_id_seq', 19, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
fs74s3c2zybn0wsssv7ztsj9cvi1dk2l	MDk2MWU5NzQ0YzM1N2ZhYTc2NWU2YWQ4NDVjMjZkOTNhODZlNWZmOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjVkZTQ2NTgzNTlkNTA1MzVhYzAzZDNiNGRkNWU2ZTBjZjEwMTgwNjMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI1In0=	2018-03-14 14:14:38.980569-04
3baosoerjbvbg4det1brhgju0akdd75n	NjA2NDMzMzA2OTAyYTRhN2Q5YzkzMGY2YmE3NGUzOGZmYzQzZGYzNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiODY0ZDEyZDE1NmZiMGMxOGU4N2UxODI0OWFhN2FmMDBjOGVmMjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI0In0=	2018-03-15 17:39:38.671257-04
phr4sujlykd4xf6ae2kes5arsu7c7v41	Y2ZhMmQ5YjYwYmExY2ExODkxNWUwNmEyYmJmMGNlZTRhNmMxMDVmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlZjFmZjFiOTlmYTllNzBjNzk4MDcxMjRlYzA0YTI2Y2I0NDBlMzciLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-29 17:46:13.363789-04
sro5hd7no70bg0oil5iixvvydfzrb0q4	MjQ5Y2IwOTA1ZTQzZWYxZTVhYTQzN2IwOGFkOGRjYTFhN2U2MDRlZDp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3OTIwYjYzNmZmODM4MGRkNDJjYTBlNzQ5YTZjOTdhMDNlNjhhYTIiLCJfYXV0aF91c2VyX2lkIjoiOSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-30 13:20:47.326072-04
cqv5pt0ku1b7xybwmzs8yiy1hjvjxzpk	MTQ3Y2VjYTFiNDg1OTQ0ZTMyMjc5YjRkYjNjZWE2MDg4ZmU4MTNkMjp7Il9hdXRoX3VzZXJfaGFzaCI6IjZiODY0ZDEyZDE1NmZiMGMxOGU4N2UxODI0OWFhN2FmMDBjOGVmMjkiLCJfYXV0aF91c2VyX2lkIjoiNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-12 11:24:42.697379-04
wyba24d4wdvx558d6i52qjgngrzdlw9g	ZWZlNzQxMjQ0ZGU1ZWNhMDYwNDk0ZjU1MWMwZGYxNDZhNGE1YmJkNjp7Il9hdXRoX3VzZXJfaGFzaCI6IjRiOGE0ZGVkNTlmMmUyNzA4ZTlhMDExMmUwNWFlZDkyNmNhYWMwYTYiLCJfYXV0aF91c2VyX2lkIjoiMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-30 14:43:08.870949-04
20zh53b26qkz8p1ccq4294kioroazj3n	NGU4ZGI1M2E3NWFkZjBiMmEwOWQ4MmVjMjZlNTg0MTkzODg1ODMyNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlYTBhNzgwZTFlZjE5ODYwN2M4NWY0NDBhNmQwM2FiYjVkMDZkYWEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-30 21:03:03.528124-04
k2qyka9spspt1t7azkwvmtxl8hooi7vs	ZDdiNGQwYjg2ODdjODUyNGY3YWUwYWU3MjYyNDZjYWY4ZTY3YWUyOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2hhc2giOiIzZWYxZmYxYjk5ZmE5ZTcwYzc5ODA3MTI0ZWMwNGEyNmNiNDQwZTM3In0=	2018-03-19 16:15:03.775231-04
9yn01jm9ifsm9dbch9aeh6y7gx7gkjju	MzkzYmZkYzA5MWFiYzY5YWM5NGJmNDg0NzA0OGVlM2YwMjc2MWVkMzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1NWU1Y2RkNjI1MzhkYWJkNTYyYjI1MzI3MjU4NDM3ODIzOWMyYzUiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-30 22:41:39.223104-04
dskdp3vjmje25tv7z8pepbey42xjxsrj	Y2ZhMmQ5YjYwYmExY2ExODkxNWUwNmEyYmJmMGNlZTRhNmMxMDVmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlZjFmZjFiOTlmYTllNzBjNzk4MDcxMjRlYzA0YTI2Y2I0NDBlMzciLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-31 11:32:08.556505-04
8a00h7ldpcrej46l43j2bb0mp3bhp7ue	NGU4ZGI1M2E3NWFkZjBiMmEwOWQ4MmVjMjZlNTg0MTkzODg1ODMyNzp7Il9hdXRoX3VzZXJfaGFzaCI6ImVlYTBhNzgwZTFlZjE5ODYwN2M4NWY0NDBhNmQwM2FiYjVkMDZkYWEiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-12 12:06:18.728497-04
3i253jcr9hfh1jqpuuqq28gnk2sk6c9a	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-03-20 01:28:32.31285-04
19fb6pc7aqw7pcurvr05wc18jp5hfv3z	YWJhNzU2NmFiZWQ5ZjQyZjY3MzQyZGMyNTk2ZGM1ZjhkZDM1OWI0Nzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1NWU1Y2RkNjI1MzhkYWJkNTYyYjI1MzI3MjU4NDM3ODIzOWMyYzUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI2In0=	2018-03-12 12:20:18.093765-04
bzx7z9f7dx198ddlajzub5goh932wozv	YWNkYzMyNWQ3NjEwNjU3N2UyNDM5ZjFjY2FjODk4ZjVhZjgxOTk2Yjp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiM2YyYTU5OWNiZjVlOWMwYzRlOGIyODgxNjNlY2M2NTdhZTY0N2QiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI4In0=	2018-03-12 12:39:43.515895-04
so1y1tzdo9xrwvhtwbn6sq85su1tqroi	Y2ZhMmQ5YjYwYmExY2ExODkxNWUwNmEyYmJmMGNlZTRhNmMxMDVmYjp7Il9hdXRoX3VzZXJfaGFzaCI6IjNlZjFmZjFiOTlmYTllNzBjNzk4MDcxMjRlYzA0YTI2Y2I0NDBlMzciLCJfYXV0aF91c2VyX2lkIjoiNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-31 13:18:46.678269-04
7irmn6m8n1qdbgygc3664hbez5k30ejw	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-03-20 12:42:54.535803-04
su1gfde9eruauaohkthv6ilvg4ga3sr5	OTU2ZmQ3ZjBhMTE4ZDMxZjU1OGRiZmU1YzRhYjE1M2U0ODQ3YjUyMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiZWVhMGE3ODBlMWVmMTk4NjA3Yzg1ZjQ0MGE2ZDAzYWJiNWQwNmRhYSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-22 02:53:29.639393-04
z0gv19ehr9em78fcpoav2n71nypy74s7	ZGQ4MjdkZjNkOGQ0MTFmYTBjOGQ0MDRiMzFjMTllMjViZTA5ZTAyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiM2YyYTU5OWNiZjVlOWMwYzRlOGIyODgxNjNlY2M2NTdhZTY0N2QiLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-03 18:03:55.370103-04
b1qqm3nd0mffuis8oz1yf1r47tgckfkl	NDk3OWQyZDE2M2Q0ZWJlOGY5OGE3YjRhZjk0MTljMjgzYzM1ZWUxOTp7Il9hdXRoX3VzZXJfaGFzaCI6IjRiOGE0ZGVkNTlmMmUyNzA4ZTlhMDExMmUwNWFlZDkyNmNhYWMwYTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiIzIn0=	2018-03-12 13:13:19.722198-04
jh7n12szbel96oky754p0hjf3z1a32jb	ZGQ4MjdkZjNkOGQ0MTFmYTBjOGQ0MDRiMzFjMTllMjViZTA5ZTAyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiM2YyYTU5OWNiZjVlOWMwYzRlOGIyODgxNjNlY2M2NTdhZTY0N2QiLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-03 18:25:34.644332-04
0r7uszunnm5798if4zjpifr09w1c74lq	ZGQ4MjdkZjNkOGQ0MTFmYTBjOGQ0MDRiMzFjMTllMjViZTA5ZTAyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiM2YyYTU5OWNiZjVlOWMwYzRlOGIyODgxNjNlY2M2NTdhZTY0N2QiLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-26 14:42:29.263098-04
kbtg1hgnr2wy3gt6av1e2xiwniv1zoss	NTkzYTgxN2Q5NDczYjdiYWEyZTE3NDEwZThiZjM4N2IxYTVjMDUwZjp7Il9hdXRoX3VzZXJfaGFzaCI6ImY3OTIwYjYzNmZmODM4MGRkNDJjYTBlNzQ5YTZjOTdhMDNlNjhhYTIiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaWQiOiI5In0=	2018-03-14 12:57:12.428903-04
xt2n9cfwgd59diwahhyq71r0mjoy6jn1	ZGQ4MjdkZjNkOGQ0MTFmYTBjOGQ0MDRiMzFjMTllMjViZTA5ZTAyYzp7Il9hdXRoX3VzZXJfaGFzaCI6IjFiM2YyYTU5OWNiZjVlOWMwYzRlOGIyODgxNjNlY2M2NTdhZTY0N2QiLCJfYXV0aF91c2VyX2lkIjoiOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-03-26 17:03:19.728548-04
t2kih82r4wreqe8j2ho8g4cvgt96isao	MzkzYmZkYzA5MWFiYzY5YWM5NGJmNDg0NzA0OGVlM2YwMjc2MWVkMzp7Il9hdXRoX3VzZXJfaGFzaCI6Ijg1NWU1Y2RkNjI1MzhkYWJkNTYyYjI1MzI3MjU4NDM3ODIzOWMyYzUiLCJfYXV0aF91c2VyX2lkIjoiNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2018-04-04 02:46:40.435837-04
kcq119dtwrjdjbuetnmnahyunhzg95zk	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-29 20:49:13.103836-04
i9obw4nzblnc7qgc45ixj365fg77ekk1	ZjBhODAzNmEyMmYxM2QwMDFiYTYyYjRhMzg2NGFiM2NlNzExMmNjMzp7Il9hdXRoX3VzZXJfaWQiOiIzOCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMjc5MDA0MzY3NzEwMWQ5YTljM2I2MzA2ZjIwZTQ2OTBiMDhiNWYzMSJ9	2018-06-25 11:54:29.82492-04
r7fggo5te5tfrqwp1zfrbtu66a9481tp	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-06-11 13:45:54.210639-04
khvxkk5u0eyxwvfcb2qr7opqkepzkv1y	NTdmN2U0ZmFkMGE4N2RiMTVmNDdjNTZiZTRkY2YyYmI2YzIzOGI5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzM3MmJlOTNkMGIwMmE0NmZhYTVlZGY5NjNhZjlhZTQ3YTI2MzMwOCJ9	2018-06-27 11:11:03.96548-04
zhxk0612xgynpw3b0001i4b46wwcu15m	NjkwYzU0YWY5MTA4NTI3NmMxYjZhNTY1NjNhOTY0ZWYyZGRlNTkwZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEzIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjA2NzAwMWRhZDgxNGM0NWRlZmFjMmRjODZlM2YzYWM0NDA0NTI3YyJ9	2018-06-07 19:14:22.238542-04
6rj92nu2wvvvguva4ilb1mnz0t6yxrco	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-07-06 18:40:15.850696-04
osnsqxzv8f87g394kakpin8hlfb55afa	YjcxOWQ2MjgzYzM1NGE2NzAyNTM4MTMxMmJiZWU0NDI4MTM5OTk0NTp7Il9hdXRoX3VzZXJfaWQiOiIxNTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjRiZTc4NjVkNjk1ZGY2OWY5N2U2YzAzNzU3NTZlNzBiOTRkYTBhMzYifQ==	2018-06-28 19:58:12.217344-04
g8y934x51k3an2jx0olagg5i9a8npb1d	ZTNiMTJlMzdmNjY5MTkxZGQ4ZTI5NDkyNjYzNjNlMzMzYmNjMDY5Mzp7Il9hdXRoX3VzZXJfaGFzaCI6ImU0YTBjOWNkNmZjMzVhNDUwNTY0YTZmMjRiMWZlYzVjODEzOWMxZWIiLCJfYXV0aF91c2VyX2lkIjoiMTk0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQifQ==	2018-07-16 19:40:48.808724-04
aye0hv23yej7d6i29g9l7hvqk8b0r7an	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-29 21:02:33.72435-04
2yfjq04809rorgh9rzsvbyoe68wrn24w	YWI0ZjVjYzUyYTJlMWFhNjRhNDgzZjJhN2FiOGNhMDQ4N2IyNjRhZjp7Il9hdXRoX3VzZXJfaWQiOiIyMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWJkMDU4NGM5ZTc1ZDIzOWZhMGI5YjBmYTg5ZWEyODlhM2UyNGMyMSJ9	2018-06-27 13:36:57.666564-04
eut2cv8y1kx8rdx0dwkdtdfyf9dt01m1	MWZkNjc4ZTRkNGI1MTk2NjQ0ZjQwMDBhNDExYmQxMDM2NTk4MzEwZTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE0IiwiX2F1dGhfdXNlcl9oYXNoIjoiZjg5NDNiZjljNDAzZjQxZjNkYjkzMzNhM2E4YzczMzViZjBlNzVhYiJ9	2018-06-06 13:21:22.054206-04
ocr6lo4upnzgtnkxakc0bg5xxwba1alx	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-28 22:14:13.696903-04
w7brafks5jxkonn3anvfj146r25ho2tr	MTUxNTZjN2ViMjY2OGNlMGExZTFiZmRmZmQxYTk3ZGUyNWRmZGMzNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE3IiwiX2F1dGhfdXNlcl9oYXNoIjoiNzM3MmJlOTNkMGIwMmE0NmZhYTVlZGY5NjNhZjlhZTQ3YTI2MzMwOCJ9	2018-06-07 23:59:45.573359-04
01j3zy93jmzfciwrwh62qwaocgdyazh4	NjYwNTFlODk1YTNkYjZjNDUwNDBhYWNiODJiOTA5YjliZTU1NjAzZTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjA2NzAwMWRhZDgxNGM0NWRlZmFjMmRjODZlM2YzYWM0NDA0NTI3YyJ9	2018-06-21 13:02:41.638207-04
x0v9fyggnjxgtxs4k8dn3c06dk6ghgkh	ZjA0YzUzZTMwZGEyMmZmMTVjYjM4NTJhMDMxMGE2ZTM1MjkxOTk5NTp7Il9hdXRoX3VzZXJfaWQiOiIxNTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyYzY3NjUyMzIyNzRkMGE1NWY3NDcxNDJmNmVkZTE1MGFmODM2YzcifQ==	2018-06-28 11:47:18.864882-04
88mepdkew8pgulv1d4old90z8s1jwa1k	N2JlMWY2ZmJhYzM4YmQ0NWM2MmUzN2NlNGVkMWE1N2I3NjZmNjMyZjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjExNiIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyY2JlOGExMTA5ZTFiYWIwNmJmN2MzN2U5MmEyOGFiOTM0YjQ4ZjUifQ==	2018-07-09 18:07:39.705226-04
0vc53gto0etgrvhdtcif5icsdtei2wf6	MzMyMjVmYmZkMWY1ZGQyMDM1NWQwNzdkMDdiMmM1MWRiMTAwOTgxMjp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjk2ZGExNWUzZTljYTJiMzVlYzQzMzQxOTJmMjgwM2ZiYmZhMDJlNyJ9	2018-06-27 13:45:12.422668-04
4j3to89c0ev67pqrru8fh7cepq66sjzj	MmMwZjI0YTRiYWY2NjUxNGY3NDA2YjA4NWMwOWUzNTQ3NzM0NWVlZDp7Il9hdXRoX3VzZXJfaWQiOiIxNzYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImI2M2U0YWU2YWE0ZjYzMTQ5YzJhNzliMDc0OTQzYzVlZTJkYzYwMjMifQ==	2018-06-28 11:58:52.706157-04
prho12jht4ns6bb67ra2051wyk3zzk4k	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-28 22:21:18.791542-04
8iqpyuko3p03lel2gw52y9ym1xorwl1k	MDhjODVlZDMwNGM3NjY1Yzc5ZDQ3ZTVjZjM1MTQ4N2RjNjUwNDRjNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjI5IiwiX2F1dGhfdXNlcl9oYXNoIjoiZGU3NDI1MjNmMjVkMTI4YmRjMzk0OGUxOTM1ZmEzZjk5YzI3ZjA0NSJ9	2018-06-08 11:17:32.329464-04
ck95e4hrirvpmb7pf98eofut4gyygmic	NTdmN2U0ZmFkMGE4N2RiMTVmNDdjNTZiZTRkY2YyYmI2YzIzOGI5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzM3MmJlOTNkMGIwMmE0NmZhYTVlZGY5NjNhZjlhZTQ3YTI2MzMwOCJ9	2018-06-25 21:31:44.158887-04
c0yhkg152xw368oty3c4jmqhwk69pegx	ZWIxODc1YmZhNDA1Y2QyNjhhY2MxYmYwYmVkMzFlOTI3NWU1MDZiNTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEyNCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhjZDBjOTZmYWZlZTJmODQyNzhlZGJjYWMzMTdhYjI4MGU1NTk4ZWYifQ==	2018-07-09 23:57:47.877172-04
sdbn96qcasdycr8brywnihkqm2jq6tq5	MjY2MTE3ZDlhYTVjYjA3NWI2N2E0MTMyMDE3ZDE3ZTM2ZmY4Y2M5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJmNzkyMGI2MzZmZjgzODBkZDQyY2EwZTc0OWE2Yzk3YTAzZTY4YWEyIn0=	2018-05-30 13:43:23.339253-04
v2xkastvktqu4a4x0j1zpft32ajl6kov	M2I4ZDdmMWQzMzM5NjRhZjIyOGRjMzQ0ODk1ZjAwYzM2NTY5Nzg3Yjp7Il9hdXRoX3VzZXJfaWQiOiIxNjEiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImUwNjI1ZjFhZWI1NTY5OTA0NTc0MDUzOGMzY2M1MDQ0NzhiOWM5MmUifQ==	2018-06-28 12:00:29.459455-04
ldsmx0mqkux9wbncbweyqxjgc26s8ial	MDdkMTQwYmEwNGE0MDFjMDlhYTgxMWU5YjdiNDRmNTNjMmNkY2IwOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEwIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjk2ZGExNWUzZTljYTJiMzVlYzQzMzQxOTJmMjgwM2ZiYmZhMDJlNyJ9	2018-05-29 14:27:52.30417-04
xm9lbueuhgdo7i9mgmmm4659p26o2yui	NTdmN2U0ZmFkMGE4N2RiMTVmNDdjNTZiZTRkY2YyYmI2YzIzOGI5Yzp7Il9hdXRoX3VzZXJfaWQiOiIxNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNzM3MmJlOTNkMGIwMmE0NmZhYTVlZGY5NjNhZjlhZTQ3YTI2MzMwOCJ9	2018-06-25 21:33:48.431939-04
f8e8pg9hh5gnhyirw4foeycilvsdb7vs	NjYwNTFlODk1YTNkYjZjNDUwNDBhYWNiODJiOTA5YjliZTU1NjAzZTp7Il9hdXRoX3VzZXJfaWQiOiIxMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjA2NzAwMWRhZDgxNGM0NWRlZmFjMmRjODZlM2YzYWM0NDA0NTI3YyJ9	2018-06-28 21:24:04.483667-04
xs38khmuglzdn1wtih30z8sq06isyve9	ZDdiNGQwYjg2ODdjODUyNGY3YWUwYWU3MjYyNDZjYWY4ZTY3YWUyOTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjciLCJfYXV0aF91c2VyX2hhc2giOiIzZWYxZmYxYjk5ZmE5ZTcwYzc5ODA3MTI0ZWMwNGEyNmNiNDQwZTM3In0=	2018-04-26 14:24:57.561571-04
l7kahvrmoaskhpyidlczxj6x25pwtwen	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-28 13:09:30.973424-04
9o3mg126q7mqy1tifdhas619gh2bmawo	NmQ2ZTA4YmM3NGZiNjgzNTJjN2Q3ZDllNTg5OWFiOWQ0MjAxNzJkNzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjM1IiwiX2F1dGhfdXNlcl9oYXNoIjoiMzEyMzNkZDc4NThjMmYyZGFkM2UzZDY4ODA4ZGExODdlMjEwNGRiZiJ9	2018-06-06 18:19:20.105639-04
0oxofu7dl2x7v9tl3gkt4fnxvkpj5x3s	OGRkMmE1YjM2MzFmOWFiMThhY2NjM2Q5YTQwMTgzMWQ0OTc4MmVjNjp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-06-21 13:59:17.817023-04
bgu758vfjodkfnqpw75edfd04k65tntv	YmM1MWFkZTgyNjgwYjQ1NjA2Yjc4YjA1MmQ3NGY1N2ZhMWUxMjk1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjI2IiwiX2F1dGhfdXNlcl9oYXNoIjoiMTdkZTFhNmQyZjRmOTJlNDUyYmZkZmU1Yzk4ZDBiNmMwOTk0NWQ2YyJ9	2018-06-11 11:00:41.661548-04
yn71dcdw130npuqcmhzag05xxnvof9jk	YTZmNzkzZDhhNjBmOTE3NDA4MzA1NjhlYmY0NmZjOGJiZmNhZjVmMjp7Il9hdXRoX3VzZXJfaWQiOiIzNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZTgzYTkzYTI5YjNjMDA0ODU2NmIwZTUyMTIzODA3ZmQzM2JmZThiNCJ9	2018-06-25 23:06:46.575362-04
66pl5prtm4smm3wun1rqb074zv9a2nkq	ZjIzMDJkNDU3ZjFkOTJhZWQyNTczOTIzODU0NjRmMDc5ZjZhY2JhOTp7Il9hdXRoX3VzZXJfaWQiOiIxNTUiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY4OWU0ZjQxOGY1MjJiYWYzMGRlYjczY2E3MjU0MzQxNDdhMmY0MjIifQ==	2018-06-28 22:32:46.105381-04
9mmygebtagxtypbwlefpr1ihg8j4jhoa	ZjhmYTU5NjhhZTUwNmEwYWUyZjE2NjdiZDJmMWQxZDBhMmFjN2RjYTp7Il9hdXRoX3VzZXJfaWQiOiIxNDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImY3YzQxNGZkN2U3ZDRjZjhjN2E2MWRmMWQ2OTM4MzdiZWQyMjU1ODQifQ==	2018-06-28 13:38:26.251068-04
1z5ag7iqv2jmyl8h7kbnqp1idbwthmx7	MDllYmUzNTM0NTBmN2E4MDhjMzg4NGRlMzJmYmM5NDMzOWM5NzA0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlZWEwYTc4MGUxZWYxOTg2MDdjODVmNDQwYTZkMDNhYmI1ZDA2ZGFhIn0=	2018-05-23 04:03:17.385109-04
qb593ozdhis0bkvq2xwfmztfrgn6kjyw	MDllYmUzNTM0NTBmN2E4MDhjMzg4NGRlMzJmYmM5NDMzOWM5NzA0ODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJlZWEwYTc4MGUxZWYxOTg2MDdjODVmNDQwYTZkMDNhYmI1ZDA2ZGFhIn0=	2018-06-13 00:24:10.134376-04
dwtd3l86ncqwi7vgt8f3vfqmfq4jh7f8	ZDNlMmE2MmU0OGJlMmM3Zjk3OWYyMjA5ZTM1ZDAyODExNmQ4ODE2Njp7Il9hdXRoX3VzZXJfaWQiOiIxNCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZjg5NDNiZjljNDAzZjQxZjNkYjkzMzNhM2E4YzczMzViZjBlNzVhYiJ9	2018-06-27 16:11:50.958294-04
8h12m08u5l3eiorpe1sm2aqisp5yw4mn	N2M0ZDdiMTZhMDllNDViNTA1ZTUwNzYzNjJhOGM5NGJjYTZhYzhhNjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjUwIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2VhNDAzNmU1MzFiODc4YjU2YTgyNzNkZTllN2RkZDYwYzY4MTIwMyJ9	2018-07-11 23:25:32.353716-04
z4jqp5gqx3wp2ak25lc5yurbxj1funyg	MzMyMjVmYmZkMWY1ZGQyMDM1NWQwNzdkMDdiMmM1MWRiMTAwOTgxMjp7Il9hdXRoX3VzZXJfaWQiOiIxMCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYjk2ZGExNWUzZTljYTJiMzVlYzQzMzQxOTJmMjgwM2ZiYmZhMDJlNyJ9	2018-06-27 17:38:48.98842-04
wytnc3szh4brbmutuec3a18eiyzp20q5	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-05-28 13:31:18.021345-04
0b0zd4jct13z2vqlkqq2zujhm63ygeej	NmEwOWUxNDliMmYzMjhjNTlkOGNhZjljZTUwOGY3MDMyNjI4YTBjMzp7Il9hdXRoX3VzZXJfaWQiOiIzNyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiNTEzMDU0OGYyMGIyZmY3ZDkyZDIwODIzY2ZkM2I1ZjE5YTkyNjA2NSJ9	2018-06-26 14:21:09.186496-04
dlsl2ynv7v6kq0n7pkl3mcbs59krykna	N2E5NGFmY2JkOTFkNTkyNWU2NTVlZjBhYjFkNDdhYjM2MjQ5OGU1ZDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjgiLCJfYXV0aF91c2VyX2hhc2giOiIxYjNmMmE1OTljYmY1ZTljMGM0ZThiMjg4MTYzZWNjNjU3YWU2NDdkIn0=	2018-04-26 17:08:35.900726-04
u7rluhtyrbsfkeu0i6cjdc7kzjuz6o99	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-05-24 13:12:33.892416-04
k7p546odo97xrps9debnrr3sox9ov2jy	ZTYzMTRmOWZhODhjNzNlMzhkMDFlMWJmNTNhMjlhODU1NmIwZGY5Mjp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzkyMGI2MzZmZjgzODBkZDQyY2EwZTc0OWE2Yzk3YTAzZTY4YWEyIn0=	2018-06-27 19:06:48.944239-04
28voiucrpabwyutk2alr1sar77f6zu8q	YWQ1YWMxMGQ2MWNlMzJlMTBhYTg5MTkyMjA3MmFjMzk1Mzg1MGQ5Mjp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjQyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNWRhZGM2YWExMjMzOTNhY2IwZjJhMDgzMWRjMjJlMzE0ZmFiNGUxZiJ9	2018-06-06 19:04:48.034735-04
xda7pupb4aujxpajt1xtp3kjaq3l31q0	MTBkMTEyOTAwNDQzNGYyNGJhYzUwM2RkN2IwNjgyMTE2NmQxN2M0MDp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjE5NCIsIl9hdXRoX3VzZXJfaGFzaCI6ImU0YTBjOWNkNmZjMzVhNDUwNTY0YTZmMjRiMWZlYzVjODEzOWMxZWIifQ==	2018-07-16 01:14:54.345313-04
s9v4q19zp5ntuacc2780yh8ztakojegr	MWM2YjA1OWZjNGRkNmExMjE3MDk1ZGRmNTFjZjI2MGU2NWQ0ZjI0Nzp7Il9hdXRoX3VzZXJfaWQiOiIxMTkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImU5NDU3ZWIwNjA3NTg3ZmE0ODBjMzNiOTY3MjEyY2JlZGYxNjQ5YzQifQ==	2018-06-27 19:35:54.192471-04
rlkzcbsbvb0i9fpiyhy19tn616pazxrh	YjRjMmNhNGFiZDMwNmU5YTA0ZTkzMTNhZjQzYmUyZGZmMGIyODlhNDp7Il9hdXRoX3VzZXJfaWQiOiIxNjkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjY5Njg1MzgyNzkwZDY4YzlmNmE5OGNjZTNiYzFhODRkMjBkOGJiNDQifQ==	2018-06-28 14:14:34.248314-04
8hw7htfcf11jdddlwv4la3ro69psiaqr	YWRhMjEzYWE2Y2VkZjI2ZDliMzZjNDJhZTY3NjgyMTM3NzVmNGY3ODp7Il9hdXRoX3VzZXJfaWQiOiIxODMiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImNhZmI5MTNkYTdjNTllYmJkMDMzYmY3OThjNzBlYWVmMGYxZTQ5ODQifQ==	2018-07-01 01:31:14.876256-04
6x0j00vzejg5biaxt6co4aevyyiuduen	ZmU3OTZiOGExNTAyNDEyN2UyZmYzYWM1OTYxZmJjN2YwYzM5NjBkNzp7Il9hdXRoX3VzZXJfaWQiOiIxMDQiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjhlZGI4OWQ5MDY3ZDQyNmYxOWQzMjE0YTU3OThhYTc0Y2EyODk0MGYifQ==	2018-06-27 20:25:08.440549-04
j6r8htcbqyvfrp75y351ccfrw0hulmx4	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-05-28 13:51:55.705536-04
hfilk9jqudb2ykbt42adcgpvyfpty01w	OGRkMmE1YjM2MzFmOWFiMThhY2NjM2Q5YTQwMTgzMWQ0OTc4MmVjNjp7Il9hdXRoX3VzZXJfaWQiOiI2IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-06-21 14:51:01.824431-04
m2t2yxx5fof1rgrvneuc9pugfe3vvfb8	YmIyYjE5YTIzMTUwZTlhNjgwMzM2YTE4MWVmNTRjMjhmYTcwZDBlYjp7Il9hdXRoX3VzZXJfaWQiOiI5MiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiZmM2ZWVjNGRmYzE3YjBiMDU5NWRmMTYwNzA3YTBjMGI1NzcyZGIxMiJ9	2018-06-28 16:06:36.288734-04
612in9fscg28w1e509p8d9vl1wqxok85	YTQ2ZTFkODFiYmIwMWFhNTY4Zjk3MTY2MzE4ZWQ3ZGZhZjYyYTY2Zjp7Il9hdXRoX3VzZXJfaWQiOiIxNDkiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6ImVhNDYzZTE2OWRhOTE0M2I0ZDg4NjVmMjc0ZDU1YTBjYjAwZTJjYTEifQ==	2018-07-02 00:02:36.250088-04
8nefir94vpi6bwl6rekurf89vyfefvk8	M2Q5MTgzM2M4ZjMwYWU0YjBmOTAzMDg5ZGY1ODU1N2NkMzJjNzJhODp7Il9hdXRoX3VzZXJfaWQiOiIxMTYiLCJfYXV0aF91c2VyX2JhY2tlbmQiOiJkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZCIsIl9hdXRoX3VzZXJfaGFzaCI6IjEyY2JlOGExMTA5ZTFiYWIwNmJmN2MzN2U5MmEyOGFiOTM0YjQ4ZjUifQ==	2018-06-27 21:44:30.663397-04
otpg8km9ri4wzq6xpyuu9026k8ccbltu	ZTYzMTRmOWZhODhjNzNlMzhkMDFlMWJmNTNhMjlhODU1NmIwZGY5Mjp7Il9hdXRoX3VzZXJfaWQiOiI5IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmNzkyMGI2MzZmZjgzODBkZDQyY2EwZTc0OWE2Yzk3YTAzZTY4YWEyIn0=	2018-06-25 01:08:45.469687-04
r2xax6u38kg69su7xd8luiui2f0m2vjj	MjY2MTE3ZDlhYTVjYjA3NWI2N2E0MTMyMDE3ZDE3ZTM2ZmY4Y2M5Mzp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjkiLCJfYXV0aF91c2VyX2hhc2giOiJmNzkyMGI2MzZmZjgzODBkZDQyY2EwZTc0OWE2Yzk3YTAzZTY4YWEyIn0=	2018-05-01 13:17:26.313346-04
imhuqu7n40us87vz8rd30thlmjw5l854	NjI5NjEzNWQyNTcxOWY2YmJmZmNkZGIyNmM2OTg2OTNlMDEyOGRlYTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjYiLCJfYXV0aF91c2VyX2hhc2giOiI4NTVlNWNkZDYyNTM4ZGFiZDU2MmIyNTMyNzI1ODQzNzgyMzljMmM1In0=	2018-06-05 22:22:59.728001-04
sylec3dp9oftpd40eyq00xstsl4fkiyl	NTY0YmVkZmIyNDk2YWVlNmVmYmY3NmU1ZDVkZTJhMWZiNzk3MTgzODp7Il9hdXRoX3VzZXJfaWQiOiI3NSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiMWY5Y2FjODU0NjMwYjdmYTAwZWJkZTNjMzU5ZTI4N2RlOTY3NGU4NiJ9	2018-06-28 00:18:16.67162-04
\.


--
-- Data for Name: home_aquatic; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_aquatic (id, genetic, zootechnical, age, weight, pond, density, biomass, aeration, recirculation_water, aeration_type, change_water, date_sowing, temperature_6am, temperature_3pm, oxygen_6am, oxygen_3pm, ph_6am, ph_3pm, no2, nh4, nh3, transparency, mortality, start_mortality, "position", body_color, moves, lack_of_appetite, type_eat, eat_for_day, coloration, bulging_belly, exophthalmia, petechia, dilated, ulcers, skin_sores, cotton_structures, necrosis_epidermal_layer, ocular_opacity, question_id) FROM stdin;
1	Sin datos	Investigación	1 años	300	GM	0	0	t	f	AVR	0	Junio 2017	20	28	0	0	7	7	0	0	0	0	0	0000	BT	NR	RT	t	APL	0000	NR	f	t	f	t	f	f	f	f	f	44
\.


--
-- Name: home_aquatic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_aquatic_id_seq', 1, true);


--
-- Data for Name: home_bee; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bee (id, specie, colony_type, hive_review, queen_presence, disease_signs, breeding, adult_bee, backstage_bee, real_cell, backstage_breeding, eggs, quantity_eggs, observations, stool_spots, piece_larvae, dead_bees, food_racks, number_racks, question_id) FROM stdin;
5		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	46
6		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	47
7		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	\N	0	Sin datos	NT	PS	NT	PS	0	48
8		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	\N	0	Sin datos	NT	PS	NT	PS	0	49
9		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	50
10		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	51
11		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	52
12		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	53
13		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	54
14		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	55
15		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	56
16		RS	Sin datos	PS	Sin datos	PR	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	57
17		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	t	0	Sin datos	PS	PS	PS	PS	0	58
18		RS	Sin datos	PS	Sin datos	BC	ST	0	Sin datos	0	\N	0	Sin datos	PS	PS	PS	PS	0	61
\.


--
-- Name: home_bee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_bee_id_seq', 18, true);


--
-- Data for Name: home_bird; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bird (id, type_animal, zootechnical_purpose, age, age_week, age_month, place, quantity, coexistence, origin_water, morbidity, mortality, date_signs, water, eat, vaccine, defecation, condition_corporal, plumage, condition_legs, breathing_frequency, dehydration, attitude, question_id) FROM stdin;
\.


--
-- Name: home_bird_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_bird_id_seq', 1, true);


--
-- Data for Name: home_bovine; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bovine (specie_ptr_id, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, ruminal, body_condition) FROM stdin;
30	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
34	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
35	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
36	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
37	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
38	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
39	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
40	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
41	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
42	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
43	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
44	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
\.


--
-- Data for Name: home_cat; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_cat (specie_ptr_id, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, cough, pulse, skin) FROM stdin;
33	180	0	38.600	2	Rosas	Negativo	FLLC	Ninguna
\.


--
-- Data for Name: home_document; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_document (id, document, question_id) FROM stdin;
5	documents/Video_1_Claudicacion_Caballo.mp4	29
6	documents/VID_20170506_133735.mp4	30
7	documents/VID_20170421_160447.mp4	31
9	documents/VID-20180604-WA0015.mp4	37
10	documents/VID-20180604-WA0015_uCTYJ9T.mp4	38
\.


--
-- Name: home_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_document_id_seq', 10, true);


--
-- Data for Name: home_dog; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_dog (specie_ptr_id, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, cough, pulse, skin) FROM stdin;
\.


--
-- Data for Name: home_goat; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_goat (specie_ptr_id, physiological_stage, zootechnical, production_system, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, ruminal, body_condition, cough) FROM stdin;
\.


--
-- Data for Name: home_horse; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_horse (specie_ptr_id, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, body_condition) FROM stdin;
24	32	11	37.000	2	rosas	normales	2/5
25	32	14	37.000	2	rosas	normales	3/5
26	38	12	38.000	2	rosas	normales	3/5
31	36	12	37.200	2	rosas	normales	3/5
32	36	12	37.200	2	rosas	normales	3/5
\.


--
-- Data for Name: home_imagequestion; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_imagequestion (id, image, question_id) FROM stdin;
24	question_images/pruba-video-12-abril-2018-IMG_20170418_100444.jpg	29
25	question_images/prueba-17-abril-2018-DSC_1532.JPG	30
26	question_images/prueba-final-usimage201705190013083315102.jpg	31
\.


--
-- Name: home_imagequestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_imagequestion_id_seq', 26, true);


--
-- Data for Name: home_message; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_message (id, handle, "timestamp", message, image, document, question_id) FROM stdin;
49	Alejandro	2018-05-14 13:36:24.262901-04	solo video 6.6		documents/FormatFactoryAbdominalCryIncomplete_yxrWFVL.mov	31
35	Alejandro	2018-04-12 17:20:35.241097-04	sin foto			29
36	Alejandro	2018-04-12 17:23:02.756237-04	video en dcto		documents/pssm_jd4IQH8.mp4	29
37	Alejandro	2018-04-12 17:23:53.709262-04	imagen en dcto		documents/DSC00281.JPG	29
38	Rafael	2018-04-12 17:26:57.216851-04	Va video en doc, imágen en imagen	image_messages/2014-03-22_17.54.11.jpg	documents/MOV_0137.mp4	29
40	Alejandro	2018-04-17 13:27:40.214244-04	gracias			30
41	Alejandro	2018-04-17 13:31:36.978694-04	va		documents/1_copia_q3k50G3.jpg	30
42	Alejandro	2018-04-17 13:32:52.653481-04	video		documents/pssm_DLFyee7.mp4	30
43	Alejandro	2018-04-17 13:33:48.042205-04	foto	image_messages/1_copia.jpg		30
50	Alejandro	2018-05-14 13:43:13.872029-04	video 5mb		documents/13_r_cc.mpg	31
44	Alejandro	2018-04-17 13:35:56.991317-04	dos	image_messages/1_copia_ejVmxNM.jpg	documents/pssm_1zsrV7q.mp4	30
45	Alejandro	2018-04-17 13:37:50.887187-04	cerrar			29
48	Alejandro	2018-05-14 13:25:29.928444-04	no envia archivos grandes. cual es el limite?\r\n	image_messages/Captura_de_pantalla_2018-02-02_a_las_14.27.21.png	documents/FormatFactoryAbdominalCryIncomplete.mov	31
51	Alejandro	2018-05-14 13:45:55.784154-04	fotto 1.9	image_messages/Captura_de_pantalla_2018-02-02_a_las_14.27.21_TM4rwRE.png		31
52	Alejandro	2018-05-14 13:56:36.428969-04	video avi 7.4mb		documents/usimage201705190010065739314.avi	31
53	Alejandro	2018-05-14 13:58:08.943278-04	video mpg 3 mb		documents/40_r_cc.mpg	31
54	Alejandro	2018-05-14 22:17:12.317776-04	Llego?		documents/9EC70925-C68C-426A-9EA4-3B97A10A25E2.MOV	31
55	Rafael2	2018-05-14 23:04:31.486576-04	Aún no llegan los vídeos		documents/SL_MO_VID_20170325_172147.mp4	31
56	Alejandro	2018-05-15 20:51:42.582347-04	NO LLEGO EL ULTIMO???			31
57	Rafael2	2018-05-15 20:58:39.623599-04	No ha llegado, sigue marcando el mismo error. anexo la captura			31
58	Rafael2	2018-05-15 20:59:05.284304-04	No ha llegado, sigue marcando el mismo error. anexo la captura			31
59	Rafael2	2018-05-15 20:59:29.675024-04	No ha llegado, sigue marcando el mismo error. anexo la captura			31
60	Rafael2	2018-05-15 21:00:05.327491-04	No ha llegado, sigue marcando el mismo error.			31
61	Rafael2	2018-05-15 21:00:34.314005-04	No, sigue siendo el mismo error			31
62	Rafael2	2018-05-23 16:56:02.600253-04	Video 5.5 MB mp4		documents/VID_20170517_164429.mp4	31
67	TescaDev	2018-05-30 14:45:42.63339-04	Prueba video .mov\r\n		documents/stars10_UO3deXJ.mov	36
68	TescaDev	2018-05-30 14:47:27.155469-04	prueba video mp4		documents/videoplayback.mp4	36
69	profesorprueba	2018-06-22 14:22:52.790441-04	hola			42
\.


--
-- Name: home_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_message_id_seq', 69, true);


--
-- Data for Name: home_ovine; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_ovine (specie_ptr_id, physiological_stage, zootechnical, production_system, heart_rate, respiratory_rate, temperature, mucosal_color, lymph_nodes, ruminal, body_condition) FROM stdin;
\.


--
-- Data for Name: home_porcine; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_porcine (specie_ptr_id, physiological_stage, production_system, curse, heart_rate, respiratory_rate, temperature, body_condition, attitude, color) FROM stdin;
\.


--
-- Data for Name: home_question; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_question (id, title, description, status, calification, date, specie, user_question_id, user_response_id) FROM stdin;
36	Prueba develop video	prueba	RP	0	2018-05-30 14:44:43.277407-04	BV	6	6
37	Claudicación caballo de salto	El dueño del caballo reporta que hace un año se calló en una zanja y presentó una claudicación en el miembro posterior derecho y se resolvió a los dos meses sin ningún tratamiento solamente descanso. La semana pasada reporta que al montarse el caballo se siente extraño. Se realizaron flexiones en ambos miembros posteriores y no mostró una exacerbación de la claudicación	OP	0	2018-06-13 13:59:50.212454-04	EQ	13	1
38	Claudicación caballo de salto	El dueño del caballo reporta que hace un año se calló en una zanja y presentó una claudicación en el miembro posterior derecho y se resolvió a los dos meses sin ningún tratamiento solamente descanso. La semana pasada reporta que al montarse el caballo se siente extraño. Se realizaron flexiones en ambos miembros posteriores y no mostró una exacerbación de la claudicación	OP	0	2018-06-13 14:01:36.007305-04	EQ	13	1
39	Gato con pupilas totalmente dilatadas	Gato de 4 años de 4.8 kg llega a consulta por presentar las pupilas totalmente dilatadas todo el tiempo y no ve adecuadamente, no se golpea con las cosas pero no perdone la distancia de las cosas y al saltar se lastima.\r\nCome croquetas Whiskas, no se le da nada diferente, no sale de casa nunca, no sufrió golpes o traumatismos, no presenta convulsiones o tics.\r\nEl dueño comenta que su vida es normal (come, orina, defeca normal) y su vista es lo único que ven mal.\r\nAl EFG presenta pupilas dilatadas y a simple vista no se logra ver el iris, \r\nCon luz se llega a ver el fondo de ojo, ausencia de reflejo pupilar y perdida parcial de la vista. Todos las demás constantes en rangos normales.\r\nNo tiene vacunas ( nunca las aplicaron)	OP	0	2018-06-13 19:50:40.053739-04	FL	119	1
40	Información sobre medicamentos	Estoy investigando sobre medicamentos o tratamientos y poder encontrar algún medicamento que actúe contra bacterias intracelulares, teniendo en cuenta parámetros como Rifampicina, para el tratamiento de brucelosis como experimentación, razón por la cual aún no cuento con animales para evaluar.\r\n\r\nDe antemano muchas gracias.	OP	0	2018-06-14 15:59:24.137999-04	BV	176	1
41	Información sobre medicamentos	Estoy investigando sobre medicamentos o tratamientos y poder encontrar algún medicamento que actúe contra bacterias intracelulares, teniendo en cuenta parámetros como Rifampicina, para el tratamiento de brucelosis como experimentación, razón por la cual aún no cuento con animales para evaluar.\r\n\r\nDe antemano muchas gracias.	OP	0	2018-06-14 16:04:52.512717-04	BV	176	1
42	prueba	123	RP	0	2018-06-22 14:22:45.919196-04	BV	6	189
43	prueba	qwertyui	OP	0	2018-06-22 18:40:50.601335-04	BV	6	1
44	Exoftalmia en tilapia	Lesiones en escamas, aletas incompletas o faltantes, exoftalmia,	OP	0	2018-06-25 18:20:02.143566-04	AQ	116	1
45	prueba	123	OP	0	2018-06-27 16:54:49.109666-04	BV	6	1
46	Test	Esta es una prueba coordinada	OP	0	2018-07-02 01:22:31.581272-04	BJ	194	1
47	Test	Esta es una prueba coordinada	OP	0	2018-07-02 01:24:47.267575-04	BJ	194	1
48	Test	Esta es una prueba	OP	0	2018-07-02 01:33:15.90546-04	BJ	194	1
49	Test	Esta es una prueba	OP	0	2018-07-02 01:39:36.69513-04	BJ	194	1
50	Test	Esta es un prueba, disculpe las molestias	OP	0	2018-07-02 02:37:43.687797-04	BJ	194	1
51	test 8	asdasd	OP	0	2018-07-02 19:41:16.829755-04	BJ	194	1
52	test 9	asdasd	OP	0	2018-07-02 20:04:45.660389-04	BJ	194	1
53	test 9	asdasd	OP	0	2018-07-02 20:08:02.612846-04	BJ	194	1
54	test 9	asdasd	OP	0	2018-07-02 20:10:34.458989-04	BJ	194	1
55	test 9	asdasd	OP	0	2018-07-02 20:12:02.314329-04	BJ	194	1
56	test 10	asdasd	OP	0	2018-07-02 20:14:00.59399-04	BJ	194	1
57	test 11	asdasd	OP	0	2018-07-02 20:20:52.937939-04	BJ	194	1
58	Test 12	asdasdas	OP	0	2018-07-04 17:08:04.899276-04	BJ	194	1
59	Prueba de Emails	Esta es una prueba coordinada, favor de ignorar,	OP	0	2018-07-04 17:16:31.597594-04	BV	194	1
60	Prueba de Emails	Esta es una prueba coordinada, favor de ignorar,	OP	0	2018-07-04 17:17:24.749762-04	BV	194	1
61	Prueba 12	asdasd	OP	0	2018-07-04 17:18:39.54414-04	BJ	194	1
62	Prueba de Emails 2	lol	OP	0	2018-07-04 17:21:47.71733-04	BV	194	1
63	Prueba de Emails 2	lol	OP	0	2018-07-04 17:23:14.253465-04	BV	194	1
64	Prueba de Emails 2	lol	OP	0	2018-07-04 17:25:00.669105-04	BV	194	1
65	Prueba de Emails 2	lol	OP	0	2018-07-04 17:25:48.087315-04	BV	194	1
29	Pruba video 12 abril 2018	Anexo video	CL	5	2018-04-17 13:40:37.330298-04	EQ	7	8
30	Prueba 17 abril 2018	Prueba Video e imagen	CL	5	2018-04-17 13:53:10.385254-04	EQ	7	8
31	Prueba Final?	Prueba para arranque	RP	0	2018-05-14 12:09:29.971131-04	EQ	13	8
\.


--
-- Name: home_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_question_id_seq', 65, true);


--
-- Data for Name: home_rabbit; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_rabbit (specie_ptr_id, productive_stage, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, body_condition, dehydration) FROM stdin;
\.


--
-- Data for Name: home_specie; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_specie (id, race, age, gender, weight, question_id) FROM stdin;
24	PSI	3 años años	ML	350.000	29
25	Burro	8 años	ML	300.000	30
26	PRE	3 años	ML	450.000	31
30	Sin datos	0000	ML	0.000	36
31	WB	8 años	ML	510.000	37
32	WB	8 años	ML	510.000	38
33	Europeo doméstico	4 años	ML	4.800	39
34	Sin datos	0000	ML	0.000	40
35	Sin datos	0000	ML	0.000	41
36	Sin datos	0000	ML	0.000	42
37	Sin datos	0000	ML	0.000	43
38	Sin datos	0000	ML	0.000	45
39	Sin datos	0000	ML	0.000	59
40	Sin datos	0000	ML	0.000	60
41	Sin datos	0000	ML	0.000	62
42	Sin datos	0000	ML	0.000	63
43	Sin datos	0000	ML	0.000	64
44	Sin datos	0000	ML	0.000	65
\.


--
-- Name: home_specie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_specie_id_seq', 44, true);


--
-- Data for Name: home_wild; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_wild (id, specie, zootechnical, ambiental_condition, feeding, background, evolution_disease, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, ruminal, question_id) FROM stdin;
\.


--
-- Name: home_wild_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_wild_id_seq', 1, true);


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, rol, speciality, date_end) FROM stdin;
14	pbkdf2_sha256$36000$VTX8zMrA0J6y$LFqqfYFt0i4mnQpftHFXe4yDruWcaAhQaPlDaKY2oHM=	2018-06-28 11:31:47.206255-04	f	LZarzosa			zvera1@unam.mx	f	t	2018-05-18 13:43:43.303605-04	AD	BV	2050-12-31
6	pbkdf2_sha256$36000$KQLdJ4btyWsw$tROnvY2W6oZlAY05GlHnJgumHTH4NOgYE3xkVCJ6uxE=	2018-06-22 18:40:15.816924-04	t	TescaDev			jonathanbasilio24@outlook.com	t	t	2018-02-22 00:06:57-05	ST	BV	2025-03-03
27	pbkdf2_sha256$36000$1gbbdRxD068U$FtfsKDLLbF8OTBnWW0YY2IcT8rk7R0PBD7keFoSvqlo=	\N	f	YazminAA			yaza_8169@yahoo.com.mx	f	t	2018-05-23 12:16:19.209944-04	TC	CP	2050-12-31
28	pbkdf2_sha256$36000$Iro4exVTZvsS$US1qeocwWITzaWtQ90UMJOSraZm6bj4PtHGmEgc77PM=	\N	f	YazmínL			mvzyaz80@gmail.com	f	t	2018-05-23 12:16:53.219359-04	TC	EQ	2050-12-31
30	pbkdf2_sha256$36000$gf6Bw35UTBzK$9BpkqA9msUNHyVdL5D1HYA3+G+6IAImOXGcILp+ETc4=	\N	f	MolotlaJ			molotla68@gmail.com	f	t	2018-05-23 12:18:52.54935-04	TC	CP	2050-12-31
31	pbkdf2_sha256$36000$Sk7zKXnGQzR4$1VjKX80C649/oHDXxoJkOk8y8vUPfXLB7yAFIAU8w00=	\N	f	JuanCMov			juliocer94@hotmail.com	f	t	2018-05-23 12:19:30.870765-04	TC	OV	2050-12-31
11	pbkdf2_sha256$36000$ZaCA4BRSmp63$sCRG4zKO8xLZsWF3R5cPe1sga+cF5Dy6OYhhGBrWJ7s=	2018-03-14 01:27:47.741001-04	f	Admintest			admintest@test.com	f	t	2018-03-14 01:27:21.143692-04	AD	BV	2020-02-02
4	pbkdf2_sha256$36000$G7oBpZPv43AZ$/FdHUQmyyBmP9wOIlgpWCSglhHTI2AB2svAUVA1p4d4=	2018-03-02 13:25:07.150658-05	f	Patricia			bpatricia.mg@gmail.com	f	t	2018-02-21 14:11:52.993463-05	ST	CP	2018-03-31
32	pbkdf2_sha256$36000$RKhglqbv2y6j$qIqP9vYL9ZuHsJHIsIMZesEIC7FTx2D6wZBvbdtW3FI=	\N	f	JuanJCMcap			juliocer94@hotmail.com	f	t	2018-05-23 12:20:20.24957-04	TC	CP	2050-12-31
15	pbkdf2_sha256$36000$b4DMUKC36njl$OAkxuidr626WqPSqjkO4WpEalOxQBXyjnu19nHWd4/I=	2018-05-23 17:06:57.650034-04	f	RafaelOF			ojedar@unam.mx	f	t	2018-05-23 12:07:16.198555-04	TC	SL	2050-12-31
26	pbkdf2_sha256$36000$WTXXkdlDoe0O$5OQVjacqUx3iZaUTUX0Icvc0TW3pKgUacgZP4xU5y2s=	2018-05-28 11:00:41.653088-04	f	CésarUC			mvzchgranados@gmail.com	f	t	2018-05-23 12:15:39.844555-04	TC	LP	2050-12-31
45	pbkdf2_sha256$36000$eqLAiUUzPt81$Cev4+ItDC0CRX8htQpyB4uOzDJAoMVSjY90VZUMZyMg=	2018-05-24 15:06:59.474453-04	f	JuanCJH			cimarron_12@yahoo.com.mx	f	t	2018-05-23 17:23:49.702926-04	TC	OV	2050-12-31
5	pbkdf2_sha256$36000$LcyxTX3HYKj2$alIMh/NgJQ+unEole4FNKza4rT2e8TtLeDkw42oPQj4=	2018-04-17 13:37:58.723037-04	f	Lizeth			karentajonar@gmail.com	f	t	2018-02-21 14:12:25.54606-05	TC	CP	2018-05-16
36	pbkdf2_sha256$36000$g5RKoAMvKJHw$tyz/+kXGWYh7dK5Dzem0PkvcSAQjME84HYLPamqZ66s=	\N	f	JoséMRR			sejomrr@gmail.com	f	t	2018-05-23 12:24:32.804678-04	TC	EQ	2050-12-31
44	pbkdf2_sha256$36000$e67eJlh67NoZ$G0F1GJyucPp9+L2b62qqdD84/ktug7LOJmj5fBFThcc=	\N	f	MarinJ			jesusmarinh@hotmail.com	f	t	2018-05-23 12:58:22.72529-04	TC	FL	2050-12-31
3	pbkdf2_sha256$36000$X867MoadHLzO$l6v1fxTDnKNDTmj96cYSHC/luMYzlXXtk91QiGl3erc=	2018-03-20 17:27:18.02316-04	f	karen			karentajonar@gmail.com	f	t	2018-02-21 04:03:57.968426-05	AD	PR	2018-11-30
18	pbkdf2_sha256$36000$ZsJ7Ncl86tb5$EzNv0T71LmLzyJFHYuEGkfdazTc1ZiIyYAJrW2BQndw=	\N	f	RamiroCV			ramiro_calderon712@yahoo.com.mx	f	t	2018-05-23 12:10:20.535364-04	TC	EQ	2050-12-31
19	pbkdf2_sha256$36000$Sxzw4iyCFuWs$lQowG+cZ5plA4iA+HbsB4CzzNITtkpNPlxwz/xmyNT4=	\N	f	JuanCML			jmoralesluna@yahoo.com.mx	f	t	2018-05-23 12:10:57.722832-04	TC	AV	2050-12-31
20	pbkdf2_sha256$36000$TFEFIsjTTrCi$pST13hV66pd7xhHRulO86Sp6u5i4sTD8ogMoGOthLd8=	\N	f	CésarFS			ceflose@yahoo.com.mx	f	t	2018-05-23 12:11:34.840015-04	TC	OV	2050-12-31
22	pbkdf2_sha256$36000$XoGv4E6OwylO$vmNj0zcZBNzsXYxiPhHaXe5adzCvo8j15+lWdLlU+WQ=	\N	f	RicardoHA			richa@unam.mx	f	t	2018-05-23 12:13:25.328875-04	TC	OV	2050-12-31
17	pbkdf2_sha256$36000$whlBVDhtMUud$tlsQtpd55MdfBVyQ8xb0MRFul/UVKTdrF97MS4MJ+S0=	2018-06-13 11:11:03.957076-04	f	JonathanUC			jonathanuribe2210@gmail.com	f	t	2018-05-23 12:09:40.674683-04	TC	EQ	2050-12-31
39	pbkdf2_sha256$36000$YflSobV8X2b8$6SVrLDN+x8Wga5Jiyg1cg+R37UQejBuYV0XyAUbkbW0=	\N	f	CerbonJLcan			cerron@unam.mx	f	t	2018-05-23 12:26:14.953823-04	TC	CN	2050-12-31
24	pbkdf2_sha256$36000$bM2HiJKfyxTm$robT3W8F5oReqXiVwZCj8dJL4uPu9QT4D6PaRaNH39o=	\N	f	AlejandroBB			alejandrobb@hotmail.com	f	t	2018-05-23 12:14:31.45537-04	TC	BV	2050-12-31
25	pbkdf2_sha256$36000$FCmFN7KAyrBd$zFDAa6R+qnRi+Sw3ow9ylytGSlcTYG9mFsRA0S1fZaY=	\N	f	TatianaLG			lugo.tatiana@yahoo.com.mx	f	t	2018-05-23 12:15:07.713307-04	TC	AQ	2050-12-31
40	pbkdf2_sha256$36000$tMY2vRWZqyBo$7ILb2pkO0URMM4ONGnFs/kuON5+SqZ+uKrIfbEJp27I=	\N	f	CerbonJLcap			cerron@unam.mx	f	t	2018-05-23 12:27:26.388902-04	TC	CP	2050-12-31
41	pbkdf2_sha256$36000$VPPMAIKq2svL$L4etrScY3cz7kW6DzZyr5Nhp8AZNAzuQPcZ7n1FaIc0=	\N	f	CerbonJLov			cerron@unam.mx	f	t	2018-05-23 12:28:03.522314-04	TC	OV	2050-12-31
43	pbkdf2_sha256$36000$i9oZnbODZFPr$K6aao7LUHxZUp6PaZER80DIq6LPdX+4ZbKSghPU34rY=	\N	f	GerardoRH			grhc@unam.mx	f	t	2018-05-23 12:46:43.004118-04	TC	PR	2050-12-31
7	pbkdf2_sha256$36000$BvAsYe6D0zQm$xzh7DQwYZroSPCLaxuL4+y8CAt9OdEYtryAQji+gMBg=	2018-04-23 11:53:20.944748-04	f	Rafael			rafaelglzcarballo@gmail.com	f	f	2018-02-26 10:12:45.641419-05	ST	EQ	2018-04-30
38	pbkdf2_sha256$36000$TwRFphAqzJ30$FGnPTNq21kQ5CuZUqv3cxBZibp2wI5RXPdUHIRsl5aY=	2018-06-11 11:54:29.816449-04	f	LeticiaGR			lgalindo@unam.mx	f	t	2018-05-23 12:25:37.321016-04	TC	BV	2050-12-31
8	pbkdf2_sha256$36000$FJAkoMVX2NTm$mZFUHAAv8zH8JSPkC69jDgm1XYsOtGba3CdV0Ropskw=	2018-06-18 11:58:59.054318-04	f	Alejandro			aleromo53@gmail.com	f	t	2018-02-26 10:17:31.431845-05	TC	EQ	2018-07-31
37	pbkdf2_sha256$36000$dHY0rGof3azd$nIp7KXhpNRMM6MtD179M3z/VTX5osF/FR4+Ji3fMw9I=	2018-06-12 14:21:09.178063-04	f	ArturoHL			arturher9@hotmail.com	f	t	2018-05-23 12:25:04.338634-04	TC	EQ	2050-12-31
42	pbkdf2_sha256$36000$mn83GRvDLgMV$lsMAEuaVKzAMsQL2REANvMzkvRz7IRd+6X2DcXbB4uI=	2018-05-23 19:04:48.02632-04	f	AdrianaCB			adrianac@unam.mx	f	t	2018-05-23 12:46:02.140257-04	TC	BJ	2050-12-31
9	pbkdf2_sha256$36000$7WSBLTjCBG54$z9JbGYULTG301n8O7mvJIn8jdUSeDvyPJXVUyi8tYlI=	2018-06-13 19:06:48.935394-04	f	Carlos			mvzlopez@gmail.com	f	t	2018-02-26 10:21:22.584945-05	TC	CP	2018-06-30
21	pbkdf2_sha256$36000$iub51UqmUxp1$L5BGDQkwkHIAvOTj29UlxfWw2uv40Z3pXHIBJDRhLAo=	2018-06-13 13:36:57.658138-04	f	RosaAM			rbam@unam.mx	f	t	2018-05-23 12:12:14.119099-04	TC	OV	2050-12-31
33	pbkdf2_sha256$36000$yoeTOTLKjU24$4zg+jdk41nVgKJiPE3ep/Nw2zj9CdkH87HEh/g0o5RU=	2018-05-24 16:17:32.479954-04	f	HildaJD			hildamaiz@hotmail.com	f	t	2018-05-23 12:21:56.081906-04	TC	LP	2050-12-31
29	pbkdf2_sha256$36000$Ce56IgkXXoF6$i+Wn64qBrnPiQUhKBg9ds+zWLlx1y5L8uWCaySH3P48=	2018-05-25 11:17:32.321036-04	f	JuanaBC			jdbc@unam.mx	f	t	2018-05-23 12:17:47.937244-04	TC	SL	2050-12-31
16	pbkdf2_sha256$36000$XoIk9eXTH4yF$zPt/btNYP7SK/O2MS3D5DLh8nJw4l6zbX4BQT67EGYo=	2018-06-15 18:55:06.417459-04	f	KarinaFP			karina_fp@yahoo.com.mx	f	t	2018-05-23 12:08:41.47996-04	TC	SL	2050-12-31
1	pbkdf2_sha256$36000$zzpfSRRnOAKL$8HafIOZxTK5gpcqroFB+odaQxYtr3/0Ua7rz/ou4SHc=	2018-05-30 00:24:10-04	t	TescaAdmin			drdr_2@hotmail.com	t	t	2018-02-21 03:20:11-05	TC	BV	2019-01-19
10	pbkdf2_sha256$36000$kM6rbCk4UuDt$CQiQMs4atajb3bWoZnTtGu6DrNrhsldoGsbPy/rnOVc=	2018-06-13 17:38:48.979994-04	f	Karen			karentajonar@gmail.com	f	t	2018-02-26 10:22:51.449973-05	ST	EQ	2018-06-29
34	pbkdf2_sha256$36000$4pRBebZh0rYJ$Kv66XWDtsxdV0f6K2gfCzt4RKvE6vlNRp3tw6vKEivk=	2018-06-11 23:06:46.566906-04	f	ItzcoatlMR			itzcoatlunam@hotmail.com	f	t	2018-05-23 12:23:04.655468-04	TC	SL	2050-12-31
23	pbkdf2_sha256$36000$fELqPUWLMl8j$q5R367N5j809zFw9E526tBNCzAUMisZUU4GMurXVUeQ=	2018-06-26 13:03:15.24113-04	f	AntonioOH			ortizh@unam.mx	f	t	2018-05-23 12:13:57.041182-04	TC	OV	2050-12-31
12	pbkdf2_sha256$36000$cBz1cMNWhv8q$hYfQbUQHoN4ylLwfQC97DVFjWQ2LI6VYI7gZzJnVQ9w=	2018-06-22 14:17:50.122217-04	f	RafaelGC			rafaelglzcarballo@gmail.com	f	t	2018-03-14 13:10:33.780905-04	AD	EQ	2020-12-31
35	pbkdf2_sha256$36000$IK9C8jimlPzY$vKPuh7qal6WGg4Pd5W4lu5htaGd31IuRMe0SMkWKdrY=	2018-05-23 18:19:20.097167-04	f	GochiCL			gochi@unam.mx	f	t	2018-05-23 12:23:52.941909-04	TC	BV	2050-12-31
47	pbkdf2_sha256$36000$ir4gawJ0l0Us$sZyBbujAlb4AXwHqWF0pIYHdPnQQoDXJlI4yD0naJkw=	\N	f	YahirGG			fernandoblas8@gmail.com	f	t	2018-05-23 18:42:42.997336-04	TC	AQ	2050-12-31
49	pbkdf2_sha256$36000$9g1roTk7vfrq$uTOkjHu6uoMo5jEJU0aED9lCTUONBcsMmDI3wpadM6E=	2018-06-27 23:21:01.71785-04	f	NormaPGcan			perezgallardo55@gmail.com	f	t	2018-05-29 15:07:13.550586-04	TC	CN	2050-12-31
78	pbkdf2_sha256$36000$f0H8FfSiGbAc$zJk3Ijc9tU7aJgOC7I/Qf5Exs8ljF7RXZFLyH4nJQVY=	\N	f	XimenaA			xiimpach@gmail.com	f	t	2018-06-13 17:55:26.860163-04	ST	CN	2018-09-28
48	pbkdf2_sha256$36000$gGtfKlvhzqk4$yeyoFGjImiVASHWRVtpLPz6/F1rUZEF+gF1lcbAIvAA=	2018-05-29 12:29:46.578854-04	f	LedesmaN			neslm@unam.mx	f	t	2018-05-25 15:54:51.231296-04	TC	AV	2050-12-31
51	pbkdf2_sha256$36000$NIXxKX1GJKBQ$WaJOKiKFriyf6keh7hCvyGSk1H7T6sGIcXBt3tF/Yjw=	\N	f	CortesAper			acortesya@gmail.com	f	t	2018-05-29 15:08:24.42704-04	TC	CN	2050-12-31
52	pbkdf2_sha256$36000$dFqzGeMb9W6f$Dl3bBWB2kY/0QOuPRwHgsBMxw9bko49/prbTpHRLnS8=	\N	f	CortesAgat			acortesya@gmail.com	f	t	2018-05-29 15:09:01.817448-04	TC	FL	2050-12-31
53	pbkdf2_sha256$36000$jP54dsqA5p5a$c64xk04ULYzylhOcE0E92yFskoehVA7rvsuLxyMe64g=	\N	f	QuirozJper			oftalmovet_cvpe@yahoo.com	f	t	2018-05-29 15:14:39.901815-04	TC	CN	2050-12-31
54	pbkdf2_sha256$36000$4fzeKz8mxn84$/SqD/iT5n9uTHcXkk9/J5H+EYkzDB3lcqyMgKp8OiGY=	\N	f	QuirozJgat			oftalmovet_cvpe@yahoo.com	f	t	2018-05-29 15:15:11.32164-04	TC	FL	2050-12-31
55	pbkdf2_sha256$36000$pLl5L8pYAIz5$mFUIq7aMkvzkWBP7W2pbKrnhdfmj3OfYFdZrhRVSdbw=	\N	f	MejiaOper			ompvet@hotmail.com	f	t	2018-05-29 15:15:49.535787-04	TC	CN	2050-12-31
56	pbkdf2_sha256$36000$euDdqiksuw0l$sShfbLiBREjA7m6ujuskYHEnYj2d5p9r7zd1thJeidk=	\N	f	MejiaOgat			ompvet@hotmail.com	f	t	2018-05-29 15:16:23.686038-04	TC	FL	2050-12-31
57	pbkdf2_sha256$36000$zhvYi98ceXo6$9U2pxuskqa+x0CuSYwCAXXR58hEloZS6wC8PHCnF/EY=	\N	f	TellezEper			eduardotellezrr@hotmail.com	f	t	2018-05-29 15:17:09.928161-04	TC	CN	2050-12-31
58	pbkdf2_sha256$36000$nQaxCzNaL0ju$+YlnmNcJLUUrGZlRwWlPRrVKc1GhRJFZ47WXoGgbJjw=	\N	f	TellezEbov			eduardotellezrr@hotmail.com	f	t	2018-05-29 15:17:53.545581-04	TC	BV	2050-12-31
59	pbkdf2_sha256$36000$r4caJHtRpno2$RVwMimFjCIcI60iqiFj7Hgd06TsqRN2xZhzOLCdTL7w=	\N	f	CastroIper			isidrocastro@prodigy.net.mx	f	t	2018-05-29 15:18:31.664337-04	TC	CN	2050-12-31
60	pbkdf2_sha256$36000$HFFIhhB8MZdS$TCLIFdngnCeRMOOKWQRspiulnJXlEhW39ITAt2OKyt4=	\N	f	CastroIgat			isidrocastro@prodigy.net.mx	f	t	2018-05-29 15:19:10.140345-04	TC	FL	2050-12-31
79	pbkdf2_sha256$36000$0TqQpD01r2Qz$IF2RP5zyf61PJaHaEoI84Ql5FAfS03Cf2TVa7Y7ZNs0=	\N	f	IsabelA			reenalonso@gmail.com	f	t	2018-06-13 17:56:08.904603-04	ST	AQ	2018-09-06
61	pbkdf2_sha256$36000$fOeU6PxqR72I$IzqQ0boX9KU1Tq3vAegx5B68Xg8RIhTOT7Z68etMIiU=	\N	f	GrisAG			apis1116@hotmail.com	f	t	2018-06-01 15:25:26.40729-04	TC	BJ	2050-12-31
62	pbkdf2_sha256$36000$5SB8aysCyp4S$fUmkmaIW6NvrUqhD+acru8ZP861/V0Qgr7UP6J6br1w=	\N	f	CervantesJMov			jmcs@yahoo.com	f	t	2018-06-01 15:26:09.431015-04	TC	OV	2050-12-31
64	pbkdf2_sha256$36000$mX8k2U3i3hnz$FRmgSSpAhii6voLvrNHs1vLs+pBiLtlNdN5000jH/zk=	\N	f	RuedaG			grueda@unam.mx	f	t	2018-06-01 15:32:44.859837-04	TC	EQ	2050-12-31
80	pbkdf2_sha256$36000$dYks9hmzul0Y$LV7u3FevK5DL4TRvqMZhN6KqDUASc4zoDjf2nlIw05g=	\N	f	SoniaA			ferangel35@gmail.com	f	t	2018-06-13 17:56:49.624282-04	ST	CN	2018-12-07
65	pbkdf2_sha256$36000$IphOvu3dbG2P$tKq4PZSi7TQrHpJ7ZbssSWDDWI6oI9jMZ8IRpS3t+po=	\N	f	prueba_alumno			prueba@prueba.com	f	t	2018-06-07 14:03:53.961022-04	ST	PR	2050-01-25
66	pbkdf2_sha256$36000$HqJpMf5Yk5TN$6A5B/syRp/KXJOYC6UdOLE7Dyz2bh9x/nw7jmyTkyu8=	\N	f	prueba_profesor			prueba@prueba.com	f	t	2018-06-07 14:04:56.313045-04	TC	BV	2050-03-25
67	pbkdf2_sha256$36000$ARuj3etiUSo8$Rs9ASvii5xjvbZcgcVbjtAY/s9O44jcWyfqN+Fs2l38=	\N	f	MonserratH			monserrat_hdz.c.8@hotmail.com	f	t	2018-06-07 14:59:07.972714-04	ST	CN	2019-02-04
63	pbkdf2_sha256$36000$Qn1oKUcGdugj$finZoyEeCatndmnfYC2KLtNEwT72kVKsWmmQ0wYLbsA=	\N	f	CervantesJMcap			jmcs@yahoo.com	f	f	2018-06-01 15:32:14.615554-04	TC	CP	2050-12-31
68	pbkdf2_sha256$36000$ZwChzIyGon2q$Y8SONV3UB0wJNzafSf8/M0pu4gCS0VN5TyjrzyZOaSg=	\N	f	CervantesJMcan			jmcs@yahoo.com	f	t	2018-06-11 11:21:17.704271-04	TC	CN	2050-12-31
69	pbkdf2_sha256$36000$eRcCsD0PQSys$uU16MVmDtPUjsS4CnPJpmO7gNErjc8DshDXurky3nXs=	\N	f	EspirituJ			spirit_mvz@hotmail.com	f	t	2018-06-11 16:09:53.80622-04	TC	BV	2050-12-31
70	pbkdf2_sha256$36000$expvQr8Stutn$x+PKFcUwvlhKP+DJl3MuYgTRHEWiJ534zfx3nDO33QA=	\N	f	CovarrubiasJF			drjfc@hotmail.com	f	t	2018-06-12 12:25:08.750017-04	TC	PR	2050-12-31
71	pbkdf2_sha256$36000$AFSyXA1z15eF$5nqQ0GYNQtStVrfL0FCDLOiFXfvB1bqQZVFWTIhSjVY=	\N	f	PosadasE			eposadasm@yahoo.com	f	t	2018-06-12 12:26:09.211612-04	TC	BV	2050-12-31
72	pbkdf2_sha256$36000$UOE5InXo8FPe$fSRKR/BA9Kvq4iEiWN0i9Xvf/kbDo9IlJnf55ORqgyg=	\N	f	BedollaM			adan_vet@hotmail.com	f	t	2018-06-12 12:26:44.332262-04	TC	BV	2050-12-31
73	pbkdf2_sha256$36000$PRQ9YzpjGUUq$QjWXOgWbXkGIdu3ZzdNVrwJE9HROpV5kLCMaulO6vLE=	\N	f	DavidR			davidrpv1990@gmail.com	f	t	2018-06-12 19:29:31.920358-04	ST	BV	2018-12-28
46	pbkdf2_sha256$36000$nwKdUXGsF7X1$iNI6K8dRGx9FJEaRHE41cREf5C5UcUIV9tAZkOcN+VI=	2018-06-18 17:48:12.52829-04	f	RamírezGH			grh@unam.mx	f	t	2018-05-23 18:32:34.642606-04	TC	PR	2050-12-31
74	pbkdf2_sha256$36000$vhKt1ERDX61H$yGiJniP2eU7sRT5Gl73ZmiFwO/lrsuVhesB+UyLP2aY=	\N	f	MorenoR			reymor@unam.mx	f	t	2018-06-13 14:31:52.141496-04	TC	AV	2050-12-31
76	pbkdf2_sha256$36000$EltUnMmn66bI$8EKSJc37Vqg+TqxLNxzF3R8V8GQvFAcU21kClp6+2TM=	\N	f	AbrahanA			abraham.alhe@gmail.com	f	t	2018-06-13 16:59:54.72437-04	ST	CN	2018-10-10
77	pbkdf2_sha256$36000$ceMgwkMHqypB$1Rg0dtkpClkUlqjSVYygadSnDcUFYENsz8tZB8SxdDM=	\N	f	GracielaA			frida_2204@hotmail.com	f	t	2018-06-13 17:53:42.376914-04	ST	CN	2018-10-04
81	pbkdf2_sha256$36000$5mUTlh1Bu9vl$VnssPTkpVlIhals7USU6taanUjMILaeDaYSoWiOorkQ=	\N	f	AlyneA			alyne_k3@hotmail.com	f	t	2018-06-13 17:57:23.295785-04	ST	BV	2018-10-19
82	pbkdf2_sha256$36000$C2A0ZP17y6L1$5f8KNrR0bsIx6wQzn6iQ332/Lo7Y4bbkCTahiSEe2kI=	\N	f	DanielA			dani-flakito@hotmail.com	f	t	2018-06-13 17:57:55.464884-04	ST	BV	2018-10-12
83	pbkdf2_sha256$36000$QfCoVSMgmZ8h$HLlhyFwcWn1fuFGnFU3xHLI+fPHP1Slc8Uux8Q1IlV0=	\N	f	MiaranaA			marinieto28@gmail.com	f	t	2018-06-13 17:58:33.415672-04	ST	AQ	2018-11-29
84	pbkdf2_sha256$36000$TZ62faFPuTOZ$ZKO/oYHpE8nGEwDznfSLCwJSB6QDOyTmr6ZAye02vJY=	\N	f	CesarA			ces_13@live.com	f	t	2018-06-13 17:59:16.64384-04	ST	CN	2018-09-21
85	pbkdf2_sha256$36000$n85Kt2XjpBhp$guxH37Zq/xEw8cgVhrqDyvvsSs7LIhxWwnIJx/1PCtU=	\N	f	ManuelB			manuel_drs39@hotmail.com	f	t	2018-06-13 18:01:10.704276-04	ST	BV	2018-10-19
86	pbkdf2_sha256$36000$IiJTU2uYp9pL$JTuwVffbUN0Rj93iTYoOS5vC9ctbW4o2kQa1cLX8ABk=	\N	f	DianaB			marijuana_11@hotmail.com	f	t	2018-06-13 18:01:48.592887-04	ST	CN	2018-12-14
87	pbkdf2_sha256$36000$b07A72LzWa2g$y0/1lAwGquq4D5voN32OWFw56aeZhG28cC/6I31qy1s=	\N	f	XochiquetzalliC			pititisx@gmail.com	f	t	2018-06-13 18:02:23.231954-04	ST	AQ	2018-11-23
13	pbkdf2_sha256$36000$9RrvxmWI0fly$FZoqicLfRDf+cTE5wR7gqlKe6FPP00+AjjH+PmLK20U=	2018-06-18 11:47:31.615359-04	f	Rafael2			rafaelglzcarballo@gmail.com	f	t	2018-05-14 12:01:57.817192-04	ST	EQ	2020-12-31
50	pbkdf2_sha256$36000$WMcPQg8n9Lxh$WwsoGou0nZMS29/SILS55UQFf8bvopgkXLlm/Kn31co=	2018-06-27 23:25:32.345798-04	f	NormaPGgat			perezgallardo55@gmail.com	f	t	2018-05-29 15:07:46.119042-04	TC	FL	2050-12-31
88	pbkdf2_sha256$36000$8pkLeaS8uPQ0$ust3Y0mp+VX8yizYO+drr8nQtS27c5MPnWpo8/Hqfxs=	\N	f	ArelyC			arelygranger@gmail.com	f	t	2018-06-13 18:03:36.228621-04	ST	CN	2018-10-05
89	pbkdf2_sha256$36000$RnazRoWePQlD$uqHw5TmiQqFtEMYKtvzXWXcrysBEvTM/Mw5Gt8bBqk8=	\N	f	VeronicaC			ayverocid@gmail.com	f	t	2018-06-13 18:04:29.763712-04	ST	BV	2018-09-07
90	pbkdf2_sha256$36000$GPk0Yx4o72pP$NaSJgaiWubVA2l9D065dVg/hBFYcn5bSn5lluDjoFAU=	\N	f	ElizabetC			elizabetcleto1994@gmail.com	f	t	2018-06-13 18:05:26.068593-04	ST	BV	2018-09-07
91	pbkdf2_sha256$36000$HeTbyHJ9c4VW$xMeSLFh8Esf3m0oUloXF3X4yd1tYqhdOlc5bNlbgCj4=	\N	f	MartinC			martincormo@gmail.com	f	t	2018-06-13 18:06:05.844726-04	ST	BV	2018-09-28
93	pbkdf2_sha256$36000$urynEcmUykXp$6kvwXfVdsecjcA4i6C9Gvcmt374dCvgCxqz6Ok3X8/U=	\N	f	IsaacD			alandelacruzp@gmail.com	f	t	2018-06-13 18:15:42.267118-04	ST	BV	2018-09-07
94	pbkdf2_sha256$36000$yNG1Xh4RFmIW$K+wArPdmYQ/oIh+FRaeTmwaSVxT+svVDl8e6RE2wpQY=	\N	f	JesusD			mvzbjjdg@outlook.es	f	t	2018-06-13 18:16:16.180081-04	ST	OV	2018-09-07
95	pbkdf2_sha256$36000$zWFWFNKterDP$MUs5k90vLeHrZaek3UkJw3VdX/l/JgBoei06mzX0Jnc=	\N	f	AngelesD			marya_purpur@hotmail.com	f	t	2018-06-13 18:16:56.651221-04	ST	CN	2018-09-07
96	pbkdf2_sha256$36000$RjeEaclKPEr6$t/HlkXS931vd9KqXAA7kPTmu7bGL52FiWnEKGj/eBKY=	\N	f	RubiD			vetrub.bio@gmail.com	f	t	2018-06-13 18:17:45.713062-04	ST	BJ	2018-12-07
97	pbkdf2_sha256$36000$R0of3SWlOgAi$lsYNRV683iikovUvdqvc/e+/7A7u8uIFSKPsEveGHxU=	\N	f	ItzelE			diann.espelcastre@gmail.com	f	t	2018-06-13 18:18:23.464275-04	ST	EQ	2018-09-07
98	pbkdf2_sha256$36000$nC6COvo86Q5r$7Ft7ni7ASDZT31TppIsdwNZXgi49HMxVJ2R2YtH6jag=	\N	f	RicardoF			etterno27@gmail.com	f	t	2018-06-13 18:19:00.75617-04	ST	CN	2018-10-05
99	pbkdf2_sha256$36000$Slu2u8vUiDvj$ya32sLU3WY5ieDhi0QTtUcVRSyQ4p637uEstHqFT6R4=	\N	f	CitlalliF			xitlahuatlgoth@gmail.com	f	t	2018-06-13 18:20:05.692786-04	ST	BV	2018-10-05
100	pbkdf2_sha256$36000$r1I4J2ga2gzc$gnMvOGNr7egHw7obTAH66JNZvUJH5qlTVolqN7UrSao=	\N	f	RodrigoG			royhomunculo@hotmail.com	f	t	2018-06-13 18:20:44.098013-04	ST	BV	2018-11-16
102	pbkdf2_sha256$36000$fgQBiocdQMBB$1icYY8IPeGfHRoEfUuS9w389CC71ukm3j835cIPSXVI=	\N	f	AlejandraG			moon-veronica.08_amigi@live.com.mx	f	t	2018-06-13 18:27:45.738834-04	ST	CN	2018-10-12
103	pbkdf2_sha256$36000$eGCnFaYLync7$bLskoW3S66Ju1h5aJcSC1unKf4mWO8/nSvsahR7B7Wc=	\N	f	EmiliaG			emiliagt28@hotmail.com	f	t	2018-06-13 18:28:37.677729-04	ST	CN	2018-09-07
105	pbkdf2_sha256$36000$WOQXS4QExKxB$3813qJIdNfuhOQAC8gNCetXr0mb1cmfpxN/7TSJ4LkU=	\N	f	BeatrizS			mitontis.jtk@gmail.com	f	t	2018-06-13 18:30:14.626022-04	ST	EQ	2018-09-07
106	pbkdf2_sha256$36000$fRnn68Deb5w4$/dX/8tjKwWyi4hmIyaQXYD/iBfRPrfAA2YjYOyO4i0Q=	\N	f	AntonioH			caballusequs@hotmail.com	f	t	2018-06-13 18:31:51.454492-04	ST	CP	2018-09-14
107	pbkdf2_sha256$36000$LbPzEU9gEcdv$hWAPF1vgU5V5lEtczI0a1dB2j7FPdvSSaKI3Te4Z5GU=	\N	f	GabrielaG			gabzgttzz@gmail.com	f	t	2018-06-13 18:34:27.536799-04	ST	OV	2018-09-14
108	pbkdf2_sha256$36000$7cR4QvYFl9ci$89Quqs8IeO6vthtFlFFwnw8+OPSUZFEonYSP48+RNDg=	\N	f	NancyG			nay.axs@hotmail.com	f	t	2018-06-13 18:35:21.150359-04	ST	CP	2018-10-12
109	pbkdf2_sha256$36000$fMek0HY52AU4$ggulSbBCWKn8s8cuLp1+3GHmJfn0+NJz8RelrFIhSGg=	\N	f	DanielaE			daro.sm93@gmail.com	f	t	2018-06-13 18:35:56.908202-04	ST	BV	2018-11-16
110	pbkdf2_sha256$36000$Ae5M7t2COxyg$dfSdBhOYe1//jdO1Cu6C6o7SPmrWz2dziAibjBA8nTE=	\N	f	HugoC			hugo_19892@hotmail.com	f	t	2018-06-13 18:37:01.303422-04	ST	BV	2018-09-28
111	pbkdf2_sha256$36000$EwxvfwRoDHVN$BgNjuzWT/h3WVsCIVjuSfCZ2Qyd99diB394NMYBkFT8=	\N	f	ItzelC			m.itzel.castro@hotmail.com	f	t	2018-06-13 18:37:41.984744-04	ST	BV	2018-09-07
112	pbkdf2_sha256$36000$CFrM8aU9qv3A$Q/ywMZDeLVZtdeMwxhiULb88f3W7PtKGx8ARhQtWs80=	\N	f	RaulA			raulitovet2000@hotmail.com	f	t	2018-06-13 18:47:11.803527-04	ST	OV	2018-10-12
113	pbkdf2_sha256$36000$Zw5D9Zgu937m$ns+rWw3ydCIsV2orUUDBBeOFFjQMzJkC5AWFqS0gx9o=	\N	f	EdithG			alejandrapuma@hotmail.com	f	t	2018-06-13 18:48:35.886924-04	ST	CN	2018-09-14
114	pbkdf2_sha256$36000$GEZpACdG4EyE$jfMeWP1T30jnOlhNLOVpqTOMRMJ9JDwcUJKTj9xSxTM=	\N	f	YasminG			chic-zai24@hotmail.com	f	t	2018-06-13 18:51:25.564418-04	ST	AQ	2018-10-12
115	pbkdf2_sha256$36000$wWXmmnc4uKSJ$N0aiLwraxaZiE3+p6hthbbcInyaUeTQwMEyYQKqd8FI=	\N	f	JosueG			shaichayote@gmail.com	f	t	2018-06-13 18:52:03.908571-04	ST	CN	2018-11-02
117	pbkdf2_sha256$36000$y5qd5fhiSyM5$eb4xAdJXjuiN5YvWcCtG0BLU/kS8yPUhkGQv+rdZsBg=	\N	f	BereniceH			bere_nice5sep@yahoo.com	f	t	2018-06-13 18:53:23.686666-04	ST	CN	2018-09-28
118	pbkdf2_sha256$36000$MKj6nqEycGaF$7nS0YgffVDMz5CYPlCnqlHhlcPrsAleOPORpOd7rMD0=	\N	f	GiovanniH			eclipze_gio92@hotmail.com	f	t	2018-06-13 18:53:55.856114-04	ST	CN	2018-09-07
120	pbkdf2_sha256$36000$PBRQSt4eWU3r$pCBKt+w2efAxF8/ZZXi9QRiksgFUqeCDjmb0UXPJKIE=	\N	f	LauraH			laura_ganel@hotmail.com	f	t	2018-06-13 18:57:52.40357-04	ST	AV	2018-09-07
121	pbkdf2_sha256$36000$VNVDu4CzItMO$97vBjK6aBro00Hvg8CmKrdPakOdtq0aSU2yzOFGsRWU=	\N	f	MarinaH			lizzie.garfield@gmail.com	f	t	2018-06-13 18:58:22.375707-04	ST	BV	2018-12-07
122	pbkdf2_sha256$36000$DW3MX0JvXfDz$FtUR0pHJfuL/d07ENvYucslT9o1rG0sJZRGjXgac/hM=	\N	f	AndreaI			atsujikurumi@gmail.com	f	t	2018-06-13 18:59:23.121032-04	ST	CN	2018-10-12
123	pbkdf2_sha256$36000$I1Rv39Be2fYi$+2/JcyMKp1yOu8e7/me7J2zObeXuGpBBRyDtc72bdrk=	\N	f	LuciaI			tuki.pettite@gmail.com	f	t	2018-06-13 19:00:04.706053-04	ST	AV	2018-09-28
125	pbkdf2_sha256$36000$yZT7yrTDIkfb$H79Rx9yOo8eDiEOE9geRgY6XWp70SKB/vQ2oXNGSXzk=	\N	f	MitchelL			ldguevara27@gmail.com	f	t	2018-06-13 19:01:12.113367-04	ST	SL	2018-09-14
126	pbkdf2_sha256$36000$MkQG6muBbgHz$EdSxzJJFsS+/BQiwEROzjc6yof5uymxP8LnPf0QlY0s=	\N	f	YoaliL			rominalandazuri@gmail.com	f	t	2018-06-13 19:02:08.12138-04	ST	EQ	2018-11-16
127	pbkdf2_sha256$36000$sA1RXGTZmxmp$3mS6zfY+68V8K3KRhMf1tCzGt0sHm8oUip1uZdBV7Q4=	\N	f	GustavoL			lara.erickg@gmail.com	f	t	2018-06-13 19:02:36.629128-04	ST	OV	2018-08-10
128	pbkdf2_sha256$36000$HUnwO35uz8gd$oVyZV+vuJEJ8hWO1UBiCbJ0dFF4vOqM3rv3fcWBGaSg=	\N	f	ViridianaL			virilealc@gmail.com	f	t	2018-06-13 19:03:25.83594-04	ST	CN	2018-10-12
129	pbkdf2_sha256$36000$Fqm9OPTqxcgj$CVCNjgl0MgBqHKL+o50L3ISKSDKERsrXULDCkud5PhQ=	\N	f	MonserratL			monserratlinares94@gmail.com	f	t	2018-06-13 19:03:54.265186-04	ST	OV	2018-10-05
130	pbkdf2_sha256$36000$xTdAuzXcNq0A$hH19tSWbwpE4p42TOpWuOcpsC/7Aye+m3UTKe0C7yWw=	\N	f	AntonioL			zeizjam@gmail.com	f	t	2018-06-13 19:05:19.994934-04	ST	CN	2018-09-07
131	pbkdf2_sha256$36000$XANogWjhqjIb$PwHHKcKj0anM1VjtmlNR9O8wHT+4MKppkDEdvDl/N94=	\N	f	CitlalliL			ixtlixochilunatica@gmail.com	f	t	2018-06-13 19:05:52.674788-04	ST	SL	2018-09-07
104	pbkdf2_sha256$36000$7JMCa81cbyRH$GerzZnW3hSX+waaHsZW492j/Yb6hg92Pwm+OEk66G9A=	2018-06-13 20:25:08.431681-04	f	IvonneG			gabygomezcruz@hotmail.com	f	t	2018-06-13 18:29:17.564519-04	ST	CP	2018-09-14
124	pbkdf2_sha256$36000$JkhSRttzHsmT$ouLdqOxBVlOJZhsvIQbLc1p+DhHFXB5aer0qcJoB6Fo=	2018-06-25 23:57:47.868608-04	f	RicardoI			rif_feria@hotmail.com	f	t	2018-06-13 19:00:39.3879-04	ST	CN	2018-09-07
92	pbkdf2_sha256$36000$yMDn5lJc4pgb$OCsf27qUt7xs+QRp9s2O6tRkDr0Z59UqrO5E0Cq8oik=	2018-06-14 16:06:36.279538-04	f	CarlosC			biocharli_leon@hotmail.com	f	t	2018-06-13 18:10:25.261182-04	ST	CN	2018-12-07
101	pbkdf2_sha256$36000$u5stQxpM8mUG$PDVj8UY9qpijrUCE2FDXTgzbrhP/p90qr/Aot0YGCeg=	2018-06-14 17:43:18.575995-04	f	FernandoJ			fernando._juarez@hotmail.com	f	t	2018-06-13 18:24:23.806388-04	ST	CN	2018-10-19
116	pbkdf2_sha256$36000$TMJmY8nZhS4A$NBq5SrxwezXV8omPpAsm8jxv+cqaduPsmRLrBSdD1ns=	2018-06-25 18:07:39.679545-04	f	ArturoG			arturoguerrero201@gmail.com	f	t	2018-06-13 18:52:56.02509-04	ST	BV	2018-10-12
132	pbkdf2_sha256$36000$Q9j4QOgrZz1B$hHccLYO3RJzdwEEtdRqZG/h5VFo1CNXWVRweuMs5qnQ=	\N	f	CarmenL			gusabusa.azu@gmail.com	f	t	2018-06-13 19:06:24.390937-04	ST	OV	2018-10-05
133	pbkdf2_sha256$36000$hBW9oKpKoUSx$8k4f9WJhsSHkEVOHgdDIstsFm9UyPE7IXVEvqDly8E0=	\N	f	BereniceM			bere9510@gmail.com	f	t	2018-06-13 19:07:00.109001-04	ST	CN	2018-11-23
134	pbkdf2_sha256$36000$lyhxTMvJ2mOB$FqnoRcA3zdDKxHPMnMd/qCfqMztstm+4m9B2v9NFse4=	\N	f	NoeM			axamp.12@gmail.com	f	t	2018-06-13 19:07:45.31941-04	ST	SL	2018-09-07
135	pbkdf2_sha256$36000$iGizzgMnajOV$MVhsrliN9zWiHtoFppXxHKWGWgyOu6xxG/By0TEc5Bk=	\N	f	AlejandroM			alejandro.93.mv@gmail.com	f	t	2018-06-13 19:08:15.487962-04	ST	BV	2018-10-05
136	pbkdf2_sha256$36000$O6Ba5g9PTjIV$9cwn2nQtotoddgC/QtwN/uWbNOwE9Qi+HdjRPfijlxY=	\N	f	DanielM			daniel_ms49@hotmail.com	f	t	2018-06-13 19:08:47.143531-04	ST	CN	2018-11-16
137	pbkdf2_sha256$36000$OomzQnbOd10y$vrIwgm20Y1F30A3tk5niUqmXBgZHyMj8q2aV47LBOoU=	\N	f	JoseM			jmh.fmvz@gmail.com	f	t	2018-06-13 19:09:54.21687-04	ST	CN	2018-10-12
138	pbkdf2_sha256$36000$eXDju4yjzEQ9$i+Je9bbh8K9IyDOCMxm9WRLYobtkIQ2byiJc0JGYy5g=	\N	f	SamanthaM			samy.mendez.mvz@gmail.com	f	t	2018-06-13 19:10:22.356235-04	ST	CN	2018-11-09
139	pbkdf2_sha256$36000$wJjhaHrijh9Q$fHXn51a6pE41iv76lmynVqCULvlk1QgTcZm0g2BIaYM=	\N	f	LourdesM			thorin753@gmail.com	f	t	2018-06-13 19:10:59.928814-04	ST	EQ	2018-09-07
140	pbkdf2_sha256$36000$EjPBVDRRXXix$8zfb5/hvpIu/kv9ri+BSuLDJEAO5LBD6b4XMUq/ezcg=	\N	f	SusanaM			sus.mp@hotmail.com	f	t	2018-06-13 19:11:27.417979-04	ST	BV	2018-11-16
142	pbkdf2_sha256$36000$rkVV4nyngZMJ$0Z5KNBSTRyk9V+jCSILdStJfC+BteD0koRgnQf7yL7I=	\N	f	GuillermoM			nosiparsol@gmail.com	f	t	2018-06-13 19:15:17.727588-04	ST	BV	2018-11-16
143	pbkdf2_sha256$36000$4JUNUlCKm1yy$HgQlTwS0IDXi0S5OxXVtuqGlvN31EvuzhvqzQfjarRY=	\N	f	JavierM			javier_puerquisimo@hotmail.com	f	t	2018-06-13 19:16:00.992251-04	ST	LP	2018-10-12
145	pbkdf2_sha256$36000$1UxC2YvTQZzh$AaBwGBOwgbWAXPbMkyliouh15w9h06fIUMJ3aRCDwyA=	\N	f	AlamZ			ala_fcmu10@hotmail.com	f	t	2018-06-13 19:17:54.521471-04	ST	CN	2018-10-19
146	pbkdf2_sha256$36000$v1HpGhPZoG85$BvipyJRO3STTcDkXhJ7O3WtNghh/kJyCppJYVeV4fBs=	\N	f	ManuelY			paulo.yama14@gmail.com	f	t	2018-06-13 19:18:25.37102-04	ST	AQ	2018-10-26
147	pbkdf2_sha256$36000$exR1vDnduFWN$dXZBz/x4m+DJ7gS7EqLkWHyr2h5FMYh1edtupESabaQ=	\N	f	FernandaV			scroll_love23@hotmail.com	f	t	2018-06-13 19:19:03.750689-04	ST	BV	2018-09-07
148	pbkdf2_sha256$36000$CfWgehRTCT13$L0j07d2hXhfrdPttnCSkT8jHdmqQ8YaR2o3puutF1wI=	\N	f	KarenV			karen.v.c.18@gmail.com	f	t	2018-06-13 19:19:47.51469-04	ST	BJ	2018-09-21
151	pbkdf2_sha256$36000$icLsPVelcIMx$v6eftYAn4W+cOJ+TsOyyQtdlMyGZWiyjsavNTm/aDaE=	\N	f	EugeniaN			ma.nace63@gmail.com	f	t	2018-06-13 19:22:01.398769-04	ST	CN	2018-09-07
152	pbkdf2_sha256$36000$nmt7gFHcydmx$1840LkrtiQMT2Lym3Oj0FTLU4gnGjLyTQepcMVa+bj8=	\N	f	ManuelO			polojoss_84@hotmail.com	f	t	2018-06-13 19:22:31.751938-04	ST	CN	2018-10-05
153	pbkdf2_sha256$36000$uxEsbFclPEAy$ibDP41J3Lvh8zl9MOCSOWLd8EpN4ylo5lRypxoye8/4=	\N	f	MayelaO			karlaguin.9@gmail.com	f	t	2018-06-13 19:23:16.388171-04	ST	CN	2018-11-23
154	pbkdf2_sha256$36000$q5igx91IHG1T$HlYOQZ49RWfPPRmyMzASerePHuEBs/2niipurdKf2lA=	\N	f	GabyG			gabgarciav94@gmail.com	f	t	2018-06-13 19:24:28.986115-04	ST	CN	2019-02-08
157	pbkdf2_sha256$36000$vXNFUOOF1nh7$WQ04E0liug1gRKqGc5101EvT+CcQKfy3kqPfTTPub44=	\N	f	VictoriaP			jobberknoll.von@gmail.com	f	t	2018-06-13 19:26:10.46698-04	ST	AV	2018-12-07
158	pbkdf2_sha256$36000$njbnHf6aZGF4$20KsjSxj9zqk3H9k4yXuTaw6d/HWnLg8cmMYkTAyfmQ=	\N	f	JessicaP			jessy_stars14@hotmail.com	f	t	2018-06-13 19:26:41.528083-04	ST	BV	2018-12-07
160	pbkdf2_sha256$36000$SasFTwsqTff7$Gmy7YrZDcOG/yT/U/mAlymzR1lFixJ8N4k9wDDbJsj0=	\N	f	EduardoV			jeduardo.vq@gmail.com	f	t	2018-06-13 19:27:38.058499-04	ST	BV	2018-09-14
162	pbkdf2_sha256$36000$MFn3yLGcO3UB$ZTeSIZ6jb5ZwQfeJCbl+pLX+l5HX/R/nevR4HKDUy6w=	\N	f	JaelS			hael.sanvi@gmail.com	f	t	2018-06-13 19:28:33.901269-04	ST	BV	2018-09-07
163	pbkdf2_sha256$36000$2sv8eOVO1Dse$0cPnDUHOtMEwTS/JeD+GsWKFrcyfQ6gVzVkwcCYVF5g=	\N	f	GabrielaP			krlaxg1@hotmail.com	f	t	2018-06-13 19:29:02.587548-04	ST	BV	2018-11-09
164	pbkdf2_sha256$36000$Inlql5qDKjsX$S7v1ucvkhp6KEEH56JEfKua90N4U7FH936ZfvsTDaFI=	\N	f	MeztliP			green.1811.mp@gmail.com	f	t	2018-06-13 19:29:36.779236-04	ST	BV	2018-10-12
165	pbkdf2_sha256$36000$iebDBcGr1hHq$N70PNUZezewoV+JXm3+WuMrwbNMc3JqBr8Fx92kn0og=	\N	f	AlanP			alanparusin@gmail.com	f	t	2018-06-13 19:30:04.827142-04	ST	CN	2018-10-05
166	pbkdf2_sha256$36000$mKcr7WaRobDz$Wid+W6iClSrCcR8SahYX7Hjm/nceGWAJ8iTRpTsxWJw=	\N	f	CristobalP			ithewood@hotmail.com	f	t	2018-06-13 19:30:31.70756-04	ST	CN	2018-10-05
167	pbkdf2_sha256$36000$Lj2Ix6qZXN0l$TVpGJcIpEA7xk5r/T1lYimDkDAzviViGVx+wMi0SEhU=	\N	f	MarielaP			jingle_jangle16@hotmail.com	f	t	2018-06-13 19:30:59.788099-04	ST	AQ	2018-10-19
168	pbkdf2_sha256$36000$qbw7yWEYt7aP$fAB/Uv9yu/Cn2XtFY3Kq+LsZs6Z52oPHqq6LO0gFHrM=	\N	f	PaolaP			zogiss@gmail.com	f	t	2018-06-13 19:31:36.70906-04	ST	SL	2018-11-23
170	pbkdf2_sha256$36000$J9dO1odSK3kf$zHFUUuUM9eQxFR9MBxrLWJmd2eXMHWh4P8Ntu+kkNe0=	\N	f	ArturoS			cesar_02_12_12@hotmail.com	f	t	2018-06-13 19:32:30.755598-04	ST	CN	2018-10-12
171	pbkdf2_sha256$36000$i6KcKzskgKs2$K40KUyXmfFhyZJp46Awd4iqdeNPiG3MvmvyZSHt175s=	\N	f	AmariS			princesaarabe2008@hotmail.com	f	t	2018-06-13 19:32:59.6117-04	ST	CN	2018-09-14
172	pbkdf2_sha256$36000$nlv9YZYuTtYM$tfGFB27BMnWkArAFyYsyq01Lulo2oMagUgAnQZA/xf0=	\N	f	SalvadorS			L_kiragreen-green@hotmail.com	f	t	2018-06-13 19:33:27.558293-04	ST	CN	2018-11-16
173	pbkdf2_sha256$36000$1OA7AniV4NZ7$O9pTm4k5qoXFQ7w0shkvXjY8zewRc/U1mcZzZbACS+M=	\N	f	ManuelS			manos1_69@hotmail.com	f	t	2018-06-13 19:33:56.929978-04	ST	BV	2018-09-07
174	pbkdf2_sha256$36000$4stxE5Q9Z0Bt$DD8e98oj4R2Bhl2SSQc0QXlpSsY8wZvaVlyCSGTCQew=	\N	f	LeonardoS			safont_leonardo@yahoo.com.mx	f	t	2018-06-13 19:34:41.40584-04	ST	CN	2018-12-14
175	pbkdf2_sha256$36000$aethdafNEP7s$m1armxI843s2mQUdnYglUIbwu2HdmpGkIMVdEyfjWSU=	\N	f	LeninR			leninalcuadrado@hotmail.com	f	t	2018-06-13 19:35:10.157891-04	ST	SL	2018-10-31
161	pbkdf2_sha256$36000$A3Nknj2ScXPW$MqkzFs3WIGDv2oOx1SU7t3xsXxOoZSBmtGYwK2jUBnI=	2018-06-14 12:00:29.451079-04	f	RicardoT			rido.guerrero@gmail.com	f	t	2018-06-13 19:28:05.566444-04	ST	AQ	2018-09-07
144	pbkdf2_sha256$36000$GH4bpiUT2Ti0$1aPDe70/W5iw9LMx8OlqRQ8uon6c+W+idnHnx4HZv3Y=	2018-06-14 13:38:26.242648-04	f	EstefaniaZ			edest22@gmail.com	f	t	2018-06-13 19:17:22.828139-04	ST	BV	2018-10-31
141	pbkdf2_sha256$36000$9u3aQnAugHFc$efP23ERWdCr9WJey+udchPXQBgCocp3CEcq5kyuY4rM=	2018-06-14 14:03:17.047168-04	f	CeciliaM			montoya.carrillo.cess@gmail.com	f	t	2018-06-13 19:12:57.172891-04	ST	CN	2018-09-07
150	pbkdf2_sha256$36000$oUCfnFNUAGAK$p8YGJXnJklfhCSQ4spLaqkv0Jxbxv4/AEkYQFq/8+IM=	2018-06-14 14:05:48.305167-04	f	DianaV			dianavelazquez.nu@gmail.com	f	t	2018-06-13 19:21:33.58415-04	ST	CN	2018-09-21
169	pbkdf2_sha256$36000$C9y2QsCdUp6H$ElsTZj8kmxj7zZH3gHZi5A5bB5HgxXUFLE2EA/R3TBc=	2018-06-14 14:14:34.239892-04	f	BereniceS			eberest.7@gmail.com	f	t	2018-06-13 19:32:03.370964-04	ST	SL	2018-09-14
156	pbkdf2_sha256$36000$K13p3NZX4Zdx$C01nTlABV8fdLODjhJASMRJnBSo6oFVrhBylTqVLlxU=	2018-06-14 19:58:12.208907-04	f	JuanaO			jog_1992_nena@hotmail.com	f	t	2018-06-13 19:25:36.430387-04	ST	CN	2018-09-07
155	pbkdf2_sha256$36000$GiDqxhZQK4BR$aNuoSmyjtA6IzzpznK+R37N45LIXipSppQoZu/7ubw4=	2018-06-14 22:32:46.097564-04	f	IldefonsoO			angel_1.993@hotmail.com	f	t	2018-06-13 19:25:12.006873-04	ST	CN	2018-10-05
149	pbkdf2_sha256$36000$Vs6xSqCmhDQ7$HSJWeLAoQtGzDdDlaIlcEuIJOp9WrYjhxqKGGk/K724=	2018-06-18 00:02:36.241671-04	f	BiancaV			catvidals@hotmail.com	f	t	2018-06-13 19:20:56.961018-04	ST	BV	2018-09-07
119	pbkdf2_sha256$36000$BuPlRZfc5zwe$XC/pxszN+lt01/RWnZzUoOTv/lgtrzUZiBCwR1wmT7g=	2018-06-13 19:35:54.18403-04	f	LuceroH			luceroibarra06@gmail.com	f	t	2018-06-13 18:54:30.174159-04	ST	CN	2018-09-14
177	pbkdf2_sha256$36000$yNkcdV93eud2$dqOHpOw6rn0j2mKWCfhN/uKrmSCiBZwPsrLXlWxi14c=	\N	f	BereniceR			ceci-tigre@hotmail.com	f	t	2018-06-13 19:36:07.965399-04	ST	CN	2018-09-19
179	pbkdf2_sha256$36000$EsYEO10YpY1i$e6iVNW6m/7p1pcS1WANpFGflEUgOAnPk7P8uQLOw2lg=	\N	f	WendyR			skalibur_1@hotmail.com	f	t	2018-06-13 19:37:13.562093-04	ST	CN	2018-12-14
180	pbkdf2_sha256$36000$wM4z5FrwAmZ2$AP/2F6OPp2vauxQRUD6apfwX0Qh5lV07f6P/Cerb/Dw=	\N	f	HumbertoR			luis-rico-lozano@hotmail.com	f	t	2018-06-13 19:38:08.37794-04	ST	CN	2018-11-30
181	pbkdf2_sha256$36000$uNdkjcuERpxl$/m9rJJo8EpiE8lp6mE5LdDI5lSuqv8jIdqdfvYyR+mw=	\N	f	CesarR			rojastorrescesar11@gmail.com	f	t	2018-06-13 19:38:35.117841-04	ST	CN	2018-10-31
182	pbkdf2_sha256$36000$heTV8FdAjuap$pFs/7ISamnKW/3VN7NjAgHvgzN2YUlbp+dqgc0b8RsA=	\N	f	AntonioR			mountedblack@hotmail.com	f	t	2018-06-13 19:39:01.60611-04	ST	OV	2018-11-16
75	pbkdf2_sha256$36000$OBFxBtzEzlaJ$fODhu/T74f7oKRw1+mAhRswpX4zkO02fXgFGV9S4s7k=	2018-06-14 00:18:16.663104-04	f	LorenaA			mvzlat@hotmail.com	f	t	2018-06-13 16:42:16.102298-04	ST	CN	2018-11-09
159	pbkdf2_sha256$36000$IfHxiNLHcQxr$7Q+m7ebM3niQ9Xt4S5lQMws41zzz2bNRFE7y2odglz0=	2018-06-14 11:47:18.856448-04	f	DanielaP			dannielarguezemvz@gmail.com	f	t	2018-06-13 19:27:07.240626-04	ST	CN	2018-10-05
176	pbkdf2_sha256$36000$Lby6xUcE2LfE$TSTH5RI799NbztBfaczlHiDikv0oZ5wXPL3cv7l1nhM=	2018-06-14 11:58:52.697268-04	f	LourdesR			mvzlourdes.ramos12@gmail.com	f	t	2018-06-13 19:35:39.229062-04	ST	CN	2018-12-14
184	pbkdf2_sha256$36000$akXxPq0YpVFj$okDHj4zVQGaihM+G00cxYQzRdsgjv76676aVc13F8JA=	\N	f	SuárezF			direccionfmvz@unam.mx	f	t	2018-06-14 13:41:04.034733-04	TC	CP	2100-12-31
186	pbkdf2_sha256$36000$2sw603LzIK8u$Vzl1+KraPpksOgFhoytkIPqaD/D35GkXFXs31Fo/Sco=	\N	f	QuirozMA			maqui@unam.mx	f	t	2018-06-14 13:59:52.928539-04	TC	BV	2100-12-31
187	pbkdf2_sha256$36000$OT2epvEY4GSy$91EYW+DVcdl2DdyJLeFbuXqSNXGbIwCJoorRaJDMzEY=	\N	f	OlguinA			arturoo@unam.mx	f	t	2018-06-14 14:00:27.528288-04	TC	BV	2100-12-31
188	pbkdf2_sha256$36000$9k7zoC6vZ3VE$XPwg+njy7iuSuIfE2iYIuMdhGGWtfTJDaDmdfZaeoGw=	\N	f	AlbertiA			alberti@unam.mx	f	t	2018-06-14 14:00:57.958421-04	TC	CP	2100-12-31
178	pbkdf2_sha256$36000$gHkDDpKiCDB7$84HXCHGcgshTTQsLlZu3BykLXpcXc04lmULclPaJmf0=	2018-06-14 20:38:10.661394-04	f	FernandaR			fer.vetunam@gmail.com	f	t	2018-06-13 19:36:37.453634-04	ST	BV	2018-09-14
185	pbkdf2_sha256$36000$NBSWcqvGN9Lp$GVWujfCpl2c6LitYpSB8CHGI0iySrHwfUsaQL/MM0YE=	2018-06-16 10:50:43.690842-04	f	AlvarezJ			jaalvarezleon@hotmail.com	f	t	2018-06-14 13:59:12.484941-04	TC	OV	2100-12-31
183	pbkdf2_sha256$36000$DgmzN2GRx9as$Lix/WNwb/JuKelMODiVFTVF8uFZEz37uzYppf7HsD4Y=	2018-06-17 01:31:14.867863-04	f	PaolaR			pa_ola_280301@hotmail.com	f	t	2018-06-13 19:39:26.92368-04	ST	CP	2018-10-19
189	pbkdf2_sha256$36000$qDFy8M5ds5qe$w07j0s8ToxVWUqqNruzrOGZdMHZ8Vpw8H2okjMhNTaM=	2018-06-22 14:22:35.247933-04	f	profesorprueba			jonathanbasilio24@outlook.com	f	t	2018-06-22 14:18:39.74159-04	TC	BV	2027-12-01
190	pbkdf2_sha256$36000$siwSBML9j3uq$Rtdi+SCK58cwA1ckF7fS473ndId0ylINkXXY0wlUTKE=	\N	f	RibanniP			ribapega@hotmail.com	f	t	2018-06-26 19:44:24.759207-04	ST	CP	2018-12-31
191	pbkdf2_sha256$36000$ieNyu6qDmoc6$sWag/wEdvWZ0ssT6xafYFWwA9A0cBOAw2fZvwPN5BS8=	\N	f	AlmendraM			almendrarey343@gmail.com	f	t	2018-06-26 19:45:26.661684-04	ST	CP	2018-12-31
192	pbkdf2_sha256$36000$Ep4ygRu4S5WM$DCH2rjxwmAhrXYJeXjU+Hd/VRqV6iAe3g0IVYoz8CVw=	\N	f	MariaLuzP			luzperezdelgado@gmail.com	f	t	2018-06-28 11:34:56.221032-04	ST	CP	2019-01-11
193	pbkdf2_sha256$36000$9KVdfhXQ8KNN$nFajYmemrOyyioGjmz7pQ0b9DUXxkvNAZ1y6OCLdQoo=	\N	f	NataliaN			amariioz@hotmail.com	f	t	2018-06-28 11:45:01.608412-04	ST	CN	2018-12-28
194	pbkdf2_sha256$36000$XjOvexXTttGz$KeF16GHAIvheHqMl1e/sWCTpECl2jKJUUhQh0Mc6KoQ=	2018-07-02 19:40:48.799488-04	t	Rich				t	t	2018-07-02 01:14:45-04	ST	BJ	2019-07-02
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('users_user_id_seq', 194, true);


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('users_user_user_permissions_id_seq', 1, false);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: background_task_completedtask_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask
    ADD CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id);


--
-- Name: background_task_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task
    ADD CONSTRAINT background_task_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_aquatic_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_pkey PRIMARY KEY (id);


--
-- Name: home_aquatic_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_question_id_key UNIQUE (question_id);


--
-- Name: home_bee_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_pkey PRIMARY KEY (id);


--
-- Name: home_bee_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_question_id_key UNIQUE (question_id);


--
-- Name: home_bird_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_pkey PRIMARY KEY (id);


--
-- Name: home_bird_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_question_id_key UNIQUE (question_id);


--
-- Name: home_bovine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bovine
    ADD CONSTRAINT home_bovine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_cat
    ADD CONSTRAINT home_cat_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_document_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document
    ADD CONSTRAINT home_document_pkey PRIMARY KEY (id);


--
-- Name: home_dog_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_dog
    ADD CONSTRAINT home_dog_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_goat_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_goat
    ADD CONSTRAINT home_goat_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_horse_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_horse
    ADD CONSTRAINT home_horse_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_imagequestion_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion
    ADD CONSTRAINT home_imagequestion_pkey PRIMARY KEY (id);


--
-- Name: home_message_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message
    ADD CONSTRAINT home_message_pkey PRIMARY KEY (id);


--
-- Name: home_ovine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_ovine
    ADD CONSTRAINT home_ovine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_porcine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_porcine
    ADD CONSTRAINT home_porcine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_question_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_pkey PRIMARY KEY (id);


--
-- Name: home_rabbit_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_rabbit
    ADD CONSTRAINT home_rabbit_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_specie_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_pkey PRIMARY KEY (id);


--
-- Name: home_specie_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_question_id_key UNIQUE (question_id);


--
-- Name: home_wild_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_pkey PRIMARY KEY (id);


--
-- Name: home_wild_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_question_id_key UNIQUE (question_id);


--
-- Name: users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: background_task_attempts_a9ade23d; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_attempts_a9ade23d ON background_task USING btree (attempts);


--
-- Name: background_task_completedtask_attempts_772a6783; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_attempts_772a6783 ON background_task_completedtask USING btree (attempts);


--
-- Name: background_task_completedtask_creator_content_type_id_21d6a741; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_creator_content_type_id_21d6a741 ON background_task_completedtask USING btree (creator_content_type_id);


--
-- Name: background_task_completedtask_failed_at_3de56618; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_failed_at_3de56618 ON background_task_completedtask USING btree (failed_at);


--
-- Name: background_task_completedtask_locked_at_29c62708; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_locked_at_29c62708 ON background_task_completedtask USING btree (locked_at);


--
-- Name: background_task_completedtask_locked_by_edc8a213; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213 ON background_task_completedtask USING btree (locked_by);


--
-- Name: background_task_completedtask_locked_by_edc8a213_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_locked_by_edc8a213_like ON background_task_completedtask USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_completedtask_priority_9080692e; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_priority_9080692e ON background_task_completedtask USING btree (priority);


--
-- Name: background_task_completedtask_queue_61fb0415; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_queue_61fb0415 ON background_task_completedtask USING btree (queue);


--
-- Name: background_task_completedtask_queue_61fb0415_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_queue_61fb0415_like ON background_task_completedtask USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_completedtask_run_at_77c80f34; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_run_at_77c80f34 ON background_task_completedtask USING btree (run_at);


--
-- Name: background_task_completedtask_task_hash_91187576; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_task_hash_91187576 ON background_task_completedtask USING btree (task_hash);


--
-- Name: background_task_completedtask_task_hash_91187576_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_task_hash_91187576_like ON background_task_completedtask USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_completedtask_task_name_388dabc2; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_task_name_388dabc2 ON background_task_completedtask USING btree (task_name);


--
-- Name: background_task_completedtask_task_name_388dabc2_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_completedtask_task_name_388dabc2_like ON background_task_completedtask USING btree (task_name varchar_pattern_ops);


--
-- Name: background_task_creator_content_type_id_61cc9af3; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_creator_content_type_id_61cc9af3 ON background_task USING btree (creator_content_type_id);


--
-- Name: background_task_failed_at_b81bba14; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_failed_at_b81bba14 ON background_task USING btree (failed_at);


--
-- Name: background_task_locked_at_0fb0f225; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_locked_at_0fb0f225 ON background_task USING btree (locked_at);


--
-- Name: background_task_locked_by_db7779e3; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_locked_by_db7779e3 ON background_task USING btree (locked_by);


--
-- Name: background_task_locked_by_db7779e3_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_locked_by_db7779e3_like ON background_task USING btree (locked_by varchar_pattern_ops);


--
-- Name: background_task_priority_88bdbce9; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_priority_88bdbce9 ON background_task USING btree (priority);


--
-- Name: background_task_queue_1d5f3a40; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_queue_1d5f3a40 ON background_task USING btree (queue);


--
-- Name: background_task_queue_1d5f3a40_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_queue_1d5f3a40_like ON background_task USING btree (queue varchar_pattern_ops);


--
-- Name: background_task_run_at_7baca3aa; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_run_at_7baca3aa ON background_task USING btree (run_at);


--
-- Name: background_task_task_hash_d8f233bd; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_task_hash_d8f233bd ON background_task USING btree (task_hash);


--
-- Name: background_task_task_hash_d8f233bd_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_task_hash_d8f233bd_like ON background_task USING btree (task_hash varchar_pattern_ops);


--
-- Name: background_task_task_name_4562d56a; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_task_name_4562d56a ON background_task USING btree (task_name);


--
-- Name: background_task_task_name_4562d56a_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX background_task_task_name_4562d56a_like ON background_task USING btree (task_name varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: home_document_question_id_dd079114; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_document_question_id_dd079114 ON home_document USING btree (question_id);


--
-- Name: home_imagequestion_question_id_0585cd25; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_imagequestion_question_id_0585cd25 ON home_imagequestion USING btree (question_id);


--
-- Name: home_message_question_id_37dfcdf8; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_message_question_id_37dfcdf8 ON home_message USING btree (question_id);


--
-- Name: home_message_timestamp_3f5dda94; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_message_timestamp_3f5dda94 ON home_message USING btree ("timestamp");


--
-- Name: home_question_user_question_id_f1b86479; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_question_user_question_id_f1b86479 ON home_question USING btree (user_question_id);


--
-- Name: home_question_user_response_id_c126cb80; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX home_question_user_response_id_c126cb80 ON home_question USING btree (user_response_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: digimundo
--

CREATE INDEX users_user_username_06e46fe6_like ON users_user USING btree (username varchar_pattern_ops);


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_comp_creator_content_type_21d6a741_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask
    ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_creator_content_type_61cc9af3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task
    ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_aquatic_question_id_46221d43_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_question_id_46221d43_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bee_question_id_bd2730f0_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_question_id_bd2730f0_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bird_question_id_d964ee94_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_question_id_d964ee94_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bovine_specie_ptr_id_108f1255_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bovine
    ADD CONSTRAINT home_bovine_specie_ptr_id_108f1255_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_cat_specie_ptr_id_6263b6cd_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_cat
    ADD CONSTRAINT home_cat_specie_ptr_id_6263b6cd_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_document_question_id_dd079114_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document
    ADD CONSTRAINT home_document_question_id_dd079114_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_dog_specie_ptr_id_f96cbee0_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_dog
    ADD CONSTRAINT home_dog_specie_ptr_id_f96cbee0_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_goat_specie_ptr_id_c953efa8_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_goat
    ADD CONSTRAINT home_goat_specie_ptr_id_c953efa8_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_horse_specie_ptr_id_eecb749f_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_horse
    ADD CONSTRAINT home_horse_specie_ptr_id_eecb749f_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_imagequestion_question_id_0585cd25_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion
    ADD CONSTRAINT home_imagequestion_question_id_0585cd25_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_message_question_id_37dfcdf8_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message
    ADD CONSTRAINT home_message_question_id_37dfcdf8_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_ovine_specie_ptr_id_6e9a0367_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_ovine
    ADD CONSTRAINT home_ovine_specie_ptr_id_6e9a0367_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_porcine_specie_ptr_id_e6e75bb7_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_porcine
    ADD CONSTRAINT home_porcine_specie_ptr_id_e6e75bb7_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_question_user_question_id_f1b86479_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_user_question_id_f1b86479_fk_users_user_id FOREIGN KEY (user_question_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_question_user_response_id_c126cb80_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_user_response_id_c126cb80_fk_users_user_id FOREIGN KEY (user_response_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_rabbit_specie_ptr_id_eba1898a_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_rabbit
    ADD CONSTRAINT home_rabbit_specie_ptr_id_eba1898a_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_specie_question_id_eb8b2fcd_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_question_id_eb8b2fcd_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_wild_question_id_05d27474_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_question_id_05d27474_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

