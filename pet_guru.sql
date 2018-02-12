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
    mucosal_color character varying(30),
    capilar integer NOT NULL,
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
    mucosal_color character varying(30),
    capilar integer NOT NULL,
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
    message text NOT NULL,
    "timestamp" timestamp with time zone NOT NULL,
    question_id integer NOT NULL,
    document character varying(100) NOT NULL,
    image character varying(100) NOT NULL
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
    user_question_id integer NOT NULL,
    user_response_id integer NOT NULL,
    specie character varying(10),
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
    weight numeric(5,3) NOT NULL,
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
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: background_task id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task ALTER COLUMN id SET DEFAULT nextval('background_task_id_seq'::regclass);


--
-- Name: background_task_completedtask id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask ALTER COLUMN id SET DEFAULT nextval('background_task_completedtask_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Name: home_aquatic id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic ALTER COLUMN id SET DEFAULT nextval('home_aquatic_id_seq'::regclass);


--
-- Name: home_bee id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee ALTER COLUMN id SET DEFAULT nextval('home_bee_id_seq'::regclass);


--
-- Name: home_bird id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird ALTER COLUMN id SET DEFAULT nextval('home_bird_id_seq'::regclass);


--
-- Name: home_document id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document ALTER COLUMN id SET DEFAULT nextval('home_document_id_seq'::regclass);


--
-- Name: home_imagequestion id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion ALTER COLUMN id SET DEFAULT nextval('home_imagequestion_id_seq'::regclass);


--
-- Name: home_message id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message ALTER COLUMN id SET DEFAULT nextval('home_message_id_seq'::regclass);


--
-- Name: home_question id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question ALTER COLUMN id SET DEFAULT nextval('home_question_id_seq'::regclass);


--
-- Name: home_specie id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie ALTER COLUMN id SET DEFAULT nextval('home_specie_id_seq'::regclass);


--
-- Name: home_wild id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild ALTER COLUMN id SET DEFAULT nextval('home_wild_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user ALTER COLUMN id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups ALTER COLUMN id SET DEFAULT nextval('users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: digimundo
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
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add content type	4	add_contenttype
11	Can change content type	4	change_contenttype
12	Can delete content type	4	delete_contenttype
13	Can add session	5	add_session
14	Can change session	5	change_session
15	Can delete session	5	delete_session
16	Can add user	6	add_user
17	Can change user	6	change_user
18	Can delete user	6	delete_user
19	Can add aquatic	7	add_aquatic
20	Can change aquatic	7	change_aquatic
21	Can delete aquatic	7	delete_aquatic
22	Can add bee	8	add_bee
23	Can change bee	8	change_bee
24	Can delete bee	8	delete_bee
25	Can add bird	9	add_bird
26	Can change bird	9	change_bird
27	Can delete bird	9	delete_bird
28	Can add image question	10	add_imagequestion
29	Can change image question	10	change_imagequestion
30	Can delete image question	10	delete_imagequestion
31	Can add question	11	add_question
32	Can change question	11	change_question
33	Can delete question	11	delete_question
34	Can add specie	12	add_specie
35	Can change specie	12	change_specie
36	Can delete specie	12	delete_specie
37	Can add wild	13	add_wild
38	Can change wild	13	change_wild
39	Can delete wild	13	delete_wild
40	Can add bovine	14	add_bovine
41	Can change bovine	14	change_bovine
42	Can delete bovine	14	delete_bovine
43	Can add cat	15	add_cat
44	Can change cat	15	change_cat
45	Can delete cat	15	delete_cat
46	Can add dog	16	add_dog
47	Can change dog	16	change_dog
48	Can delete dog	16	delete_dog
49	Can add goat	17	add_goat
50	Can change goat	17	change_goat
51	Can delete goat	17	delete_goat
52	Can add horse	18	add_horse
53	Can change horse	18	change_horse
54	Can delete horse	18	delete_horse
55	Can add ovine	19	add_ovine
56	Can change ovine	19	change_ovine
57	Can delete ovine	19	delete_ovine
58	Can add porcine	20	add_porcine
59	Can change porcine	20	change_porcine
60	Can delete porcine	20	delete_porcine
61	Can add rabbit	21	add_rabbit
62	Can change rabbit	21	change_rabbit
63	Can delete rabbit	21	delete_rabbit
64	Can add message	22	add_message
65	Can change message	22	change_message
66	Can delete message	22	delete_message
67	Can add document	23	add_document
68	Can change document	23	change_document
69	Can delete document	23	delete_document
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

SELECT pg_catalog.setval('background_task_completedtask_id_seq', 8, true);


--
-- Name: background_task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('background_task_id_seq', 10, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-01-19 02:04:48.786793-06	1	Rich	2	[{"changed": {"fields": ["rol", "speciality", "date_end"]}}]	6	1
2	2018-01-29 14:21:57.008214-06	1	Rich	2	[{"changed": {"fields": ["rol"]}}]	6	1
3	2018-01-29 14:22:57.805243-06	1	Rich	2	[{"changed": {"fields": ["rol"]}}]	6	1
4	2018-02-05 22:33:59.510163-06	1	Rich	2	[{"changed": {"fields": ["rol"]}}]	6	1
5	2018-02-09 01:46:06.361425-06	9	home.tasks.time_on_emails	3		25	1
6	2018-02-09 01:46:17.370415-06	8	home.tasks.time_on_emails - 2018-02-06 05:39:23.216982+00:00	3		24	1
7	2018-02-09 01:46:17.377414-06	7	home.tasks.time_on_emails - 2018-02-06 05:39:13.880484+00:00	3		24	1
8	2018-02-09 01:46:17.379414-06	6	home.tasks.time_on_emails - 2018-02-06 05:38:57.735986+00:00	3		24	1
9	2018-02-09 01:46:17.380413-06	5	home.tasks.time_on_emails - 2018-02-06 05:38:47.292992+00:00	3		24	1
10	2018-02-09 01:46:17.381913-06	4	home.tasks.time_on_emails - 2018-02-06 05:38:34.098489+00:00	3		24	1
11	2018-02-09 01:46:17.383414-06	3	home.tasks.time_on_emails - 2018-02-06 04:53:12.402963+00:00	3		24	1
12	2018-02-09 01:46:17.384414-06	2	home.tasks.time_on_emails - 2018-02-06 04:47:31.582022+00:00	3		24	1
13	2018-02-09 01:46:17.385414-06	1	home.tasks.time_on_emails - 2018-02-06 04:43:01.707069+00:00	3		24	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 13, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	users	user
7	home	aquatic
8	home	bee
9	home	bird
10	home	imagequestion
11	home	question
12	home	specie
13	home	wild
14	home	bovine
15	home	cat
16	home	dog
17	home	goat
18	home	horse
19	home	ovine
20	home	porcine
21	home	rabbit
22	home	message
23	home	document
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
1	contenttypes	0001_initial	2018-01-19 02:03:04.261694-06
2	contenttypes	0002_remove_content_type_name	2018-01-19 02:03:04.280193-06
3	auth	0001_initial	2018-01-19 02:03:04.439194-06
4	auth	0002_alter_permission_name_max_length	2018-01-19 02:03:04.450193-06
5	auth	0003_alter_user_email_max_length	2018-01-19 02:03:04.464194-06
6	auth	0004_alter_user_username_opts	2018-01-19 02:03:04.478193-06
7	auth	0005_alter_user_last_login_null	2018-01-19 02:03:04.498194-06
8	auth	0006_require_contenttypes_0002	2018-01-19 02:03:04.502694-06
9	auth	0007_alter_validators_add_error_messages	2018-01-19 02:03:04.513193-06
10	auth	0008_alter_user_username_max_length	2018-01-19 02:03:04.527193-06
11	users	0001_initial	2018-01-19 02:03:04.693194-06
12	admin	0001_initial	2018-01-19 02:03:04.765194-06
13	admin	0002_logentry_remove_auto_add	2018-01-19 02:03:04.779694-06
14	background_task	0001_initial	2018-01-19 02:03:05.162695-06
15	background_task	0002_auto_20170927_1109	2018-01-19 02:03:05.910194-06
16	home	0001_initial	2018-01-19 02:03:06.446195-06
17	home	0002_auto_20171113_0307	2018-01-19 02:03:06.891696-06
18	home	0003_auto_20171114_1122	2018-01-19 02:03:07.161696-06
19	home	0004_auto_20171123_0112	2018-01-19 02:03:07.193696-06
20	home	0005_message	2018-01-19 02:03:07.321196-06
21	home	0006_auto_20171128_0220	2018-01-19 02:03:07.371196-06
22	home	0007_auto_20171128_0253	2018-01-19 02:03:07.613697-06
23	home	0008_message_document	2018-01-19 02:03:07.704697-06
24	home	0009_message_image	2018-01-19 02:03:07.806197-06
25	home	0010_auto_20171130_0615	2018-01-19 02:03:07.869697-06
26	home	0011_auto_20171130_0623	2018-01-19 02:03:07.941697-06
27	home	0012_auto_20171130_0630	2018-01-19 02:03:08.017197-06
28	home	0013_auto_20171201_0346	2018-01-19 02:03:08.115697-06
29	home	0014_auto_20171204_1948	2018-01-19 02:03:08.416697-06
30	home	0015_auto_20171213_1855	2018-01-19 02:03:08.713198-06
31	home	0016_auto_20180119_0135	2018-01-19 02:03:08.752198-06
32	sessions	0001_initial	2018-01-19 02:03:08.808697-06
33	users	0002_auto_20171114_1122	2018-01-19 02:03:08.827198-06
34	users	0003_auto_20180119_0135	2018-01-19 02:03:08.864698-06
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('django_migrations_id_seq', 34, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
m3u1hrh7uw9m0cbhojhx3okwbkwdgkpl	YzYwODQ3NWMxYWI4ZTQ2N2JiZTBiNGI3NjE0MDk4NjVlMTQ5NGZmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmVjZmMzMzM2YjBlODI5OWQ1MzZjZjFmNjJkMTVjYmUyY2IxNDc4In0=	2018-02-02 02:04:12.380259-06
9a6emhhiyy4axgqyi4sr7kvpoe5kfapg	YzYwODQ3NWMxYWI4ZTQ2N2JiZTBiNGI3NjE0MDk4NjVlMTQ5NGZmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmVjZmMzMzM2YjBlODI5OWQ1MzZjZjFmNjJkMTVjYmUyY2IxNDc4In0=	2018-02-12 14:04:41.736307-06
xxlvgm8645ka4hg8klvhf0bad1kocnb7	NDg4NGY5Mzc2YmZjNGE4MTM5YTA5ZmIzMjhhNmMwYzQ0YjNkZjdhNTp7Il9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIxZjI3NDFkZWJmOGE3NjA2YmUzZGE4NzcwMmI0ZmU0NmEyZWZiOTNiIn0=	2018-02-19 22:42:18.784577-06
dxls6ywv35ozdksuzqptfr4hphvqtyve	YzYwODQ3NWMxYWI4ZTQ2N2JiZTBiNGI3NjE0MDk4NjVlMTQ5NGZmNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiI5MmVjZmMzMzM2YjBlODI5OWQ1MzZjZjFmNjJkMTVjYmUyY2IxNDc4In0=	2018-02-23 01:45:35.608958-06
\.


--
-- Data for Name: home_aquatic; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_aquatic (id, genetic, zootechnical, age, weight, pond, density, biomass, aeration, recirculation_water, aeration_type, change_water, date_sowing, temperature_6am, temperature_3pm, oxygen_6am, oxygen_3pm, ph_6am, ph_3pm, no2, nh4, nh3, transparency, mortality, start_mortality, "position", body_color, moves, lack_of_appetite, type_eat, eat_for_day, coloration, bulging_belly, exophthalmia, petechia, dilated, ulcers, skin_sores, cotton_structures, necrosis_epidermal_layer, ocular_opacity, question_id) FROM stdin;
\.


--
-- Name: home_aquatic_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_aquatic_id_seq', 1, false);


--
-- Data for Name: home_bee; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bee (id, specie, colony_type, hive_review, queen_presence, disease_signs, breeding, adult_bee, backstage_bee, real_cell, backstage_breeding, eggs, quantity_eggs, observations, stool_spots, piece_larvae, dead_bees, food_racks, number_racks, question_id) FROM stdin;
\.


--
-- Name: home_bee_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_bee_id_seq', 1, false);


--
-- Data for Name: home_bird; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bird (id, type_animal, zootechnical_purpose, age, age_week, age_month, place, quantity, coexistence, origin_water, morbidity, mortality, date_signs, water, eat, vaccine, defecation, condition_corporal, plumage, condition_legs, breathing_frequency, dehydration, attitude, question_id) FROM stdin;
\.


--
-- Name: home_bird_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_bird_id_seq', 1, false);


--
-- Data for Name: home_bovine; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_bovine (specie_ptr_id, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, ruminal, body_condition) FROM stdin;
1	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
2	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
3	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
4	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
5	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
6	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
7	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
8	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
9	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
10	0	0	0.000	0	Sin datos	Sin datos	Sin datos	Sin datos
\.


--
-- Data for Name: home_cat; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_cat (specie_ptr_id, heart_rate, respiratory_rate, temperature, mucosal_color, capilar, cough, pulse, skin) FROM stdin;
\.


--
-- Data for Name: home_document; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_document (id, document, question_id) FROM stdin;
\.


--
-- Name: home_document_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_document_id_seq', 1, false);


--
-- Data for Name: home_dog; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_dog (specie_ptr_id, heart_rate, respiratory_rate, temperature, mucosal_color, capilar, cough, pulse, skin) FROM stdin;
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
\.


--
-- Data for Name: home_imagequestion; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_imagequestion (id, image, question_id) FROM stdin;
\.


--
-- Name: home_imagequestion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_imagequestion_id_seq', 1, false);


--
-- Data for Name: home_message; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_message (id, handle, message, "timestamp", question_id, document, image) FROM stdin;
\.


--
-- Name: home_message_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_message_id_seq', 1, false);


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

COPY home_question (id, title, description, status, calification, date, user_question_id, user_response_id, specie) FROM stdin;
1	Test Tiempo	adsasd	OP	0	2018-02-05 21:58:36.189032-06	1	1	BV
2	Tes time	asad	OP	0	2018-02-05 22:06:02.388954-06	1	1	BV
3	dasda	sasdas	OP	0	2018-02-05 22:15:39.434354-06	1	1	BV
4	Test Tiempo 2	asdasd	OP	0	2018-02-05 22:26:22.689242-06	1	1	BV
5	Tes time 3	adad	OP	0	2018-02-05 22:31:27.233689-06	1	1	BV
6	Tes time 3	adad	OP	0	2018-02-05 22:31:27.291189-06	1	1	BV
7	Test1	asdasd	OP	0	2018-02-05 22:42:41.802578-06	3	1	BV
8	qadsasd	adas	OP	0	2018-02-05 22:47:22.319023-06	3	1	BV
9	Test 3	asdads	OP	0	2018-02-05 22:52:59.942965-06	3	1	BV
10	Test tiempo 4	asdasd	OP	0	2018-02-05 23:38:14.021494-06	3	1	BV
\.


--
-- Name: home_question_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_question_id_seq', 10, true);


--
-- Data for Name: home_rabbit; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_rabbit (specie_ptr_id, productive_stage, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, body_condition, dehydration) FROM stdin;
\.


--
-- Data for Name: home_specie; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_specie (id, race, age, gender, weight, question_id) FROM stdin;
1	Sin datos	0000	ML	0.000	1
2	Sin datos	0000	ML	0.000	2
3	Sin datos	0000	ML	0.000	3
4	Sin datos	0000	ML	0.000	4
5	Sin datos	0000	ML	0.000	5
6	Sin datos	0000	ML	0.000	6
7	Sin datos	0000	ML	0.000	7
8	Sin datos	0000	ML	0.000	8
9	Sin datos	0000	ML	0.000	9
10	Sin datos	0000	ML	0.000	10
\.


--
-- Name: home_specie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_specie_id_seq', 10, true);


--
-- Data for Name: home_wild; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY home_wild (id, specie, zootechnical, ambiental_condition, feeding, background, evolution_disease, heart_rate, respiratory_rate, temperature, capilar, mucosal_color, lymph_nodes, ruminal, question_id) FROM stdin;
\.


--
-- Name: home_wild_id_seq; Type: SEQUENCE SET; Schema: public; Owner: digimundo
--

SELECT pg_catalog.setval('home_wild_id_seq', 1, false);


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: digimundo
--

COPY users_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, rol, speciality, date_end) FROM stdin;
2	pbkdf2_sha256$36000$lK6uRsnFx8I7$JYDisl9SekcBD3EmsSGvdUNccIuY624ZLY2e+sqI3vI=	2018-02-05 22:37:27.056136-06	f	Profesor1			drdr_2@hotmail.com	f	t	2018-02-05 22:37:07.55563-06	TC	BV	2020-02-05
3	pbkdf2_sha256$36000$aOKlg0s6uDXx$f9tKMR+otvt1XPnnYyC/XcA8vJQIdKo/tzS4BLqAV0M=	2018-02-05 22:42:18.782076-06	f	Alumno			dari262@hotmail.com	f	t	2018-02-05 22:42:06.324078-06	ST	BV	2020-02-05
1	pbkdf2_sha256$36000$IFI3xRpUndWV$Pfru0wzq/4HC+2NBtjO3Eav//VaCCMJ9EPzTA2aeqJg=	2018-02-09 01:45:35.594956-06	t	Rich			drdr_2@hotmail.com	t	t	2018-01-19 02:03:34-06	AD	BV	2018-01-19
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

SELECT pg_catalog.setval('users_user_id_seq', 3, true);


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
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: background_task_completedtask background_task_completedtask_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask
    ADD CONSTRAINT background_task_completedtask_pkey PRIMARY KEY (id);


--
-- Name: background_task background_task_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task
    ADD CONSTRAINT background_task_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: home_aquatic home_aquatic_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_pkey PRIMARY KEY (id);


--
-- Name: home_aquatic home_aquatic_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_question_id_key UNIQUE (question_id);


--
-- Name: home_bee home_bee_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_pkey PRIMARY KEY (id);


--
-- Name: home_bee home_bee_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_question_id_key UNIQUE (question_id);


--
-- Name: home_bird home_bird_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_pkey PRIMARY KEY (id);


--
-- Name: home_bird home_bird_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_question_id_key UNIQUE (question_id);


--
-- Name: home_bovine home_bovine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bovine
    ADD CONSTRAINT home_bovine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_cat home_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_cat
    ADD CONSTRAINT home_cat_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_document home_document_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document
    ADD CONSTRAINT home_document_pkey PRIMARY KEY (id);


--
-- Name: home_dog home_dog_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_dog
    ADD CONSTRAINT home_dog_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_goat home_goat_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_goat
    ADD CONSTRAINT home_goat_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_horse home_horse_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_horse
    ADD CONSTRAINT home_horse_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_imagequestion home_imagequestion_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion
    ADD CONSTRAINT home_imagequestion_pkey PRIMARY KEY (id);


--
-- Name: home_message home_message_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message
    ADD CONSTRAINT home_message_pkey PRIMARY KEY (id);


--
-- Name: home_ovine home_ovine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_ovine
    ADD CONSTRAINT home_ovine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_porcine home_porcine_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_porcine
    ADD CONSTRAINT home_porcine_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_question home_question_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_pkey PRIMARY KEY (id);


--
-- Name: home_rabbit home_rabbit_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_rabbit
    ADD CONSTRAINT home_rabbit_pkey PRIMARY KEY (specie_ptr_id);


--
-- Name: home_specie home_specie_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_pkey PRIMARY KEY (id);


--
-- Name: home_specie home_specie_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_question_id_key UNIQUE (question_id);


--
-- Name: home_wild home_wild_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_pkey PRIMARY KEY (id);


--
-- Name: home_wild home_wild_question_id_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_question_id_key UNIQUE (question_id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: digimundo
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
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task_completedtask background_task_comp_creator_content_type_21d6a741_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task_completedtask
    ADD CONSTRAINT background_task_comp_creator_content_type_21d6a741_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: background_task background_task_creator_content_type_61cc9af3_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY background_task
    ADD CONSTRAINT background_task_creator_content_type_61cc9af3_fk_django_co FOREIGN KEY (creator_content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_aquatic home_aquatic_question_id_46221d43_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_aquatic
    ADD CONSTRAINT home_aquatic_question_id_46221d43_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bee home_bee_question_id_bd2730f0_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bee
    ADD CONSTRAINT home_bee_question_id_bd2730f0_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bird home_bird_question_id_d964ee94_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bird
    ADD CONSTRAINT home_bird_question_id_d964ee94_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_bovine home_bovine_specie_ptr_id_108f1255_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_bovine
    ADD CONSTRAINT home_bovine_specie_ptr_id_108f1255_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_cat home_cat_specie_ptr_id_6263b6cd_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_cat
    ADD CONSTRAINT home_cat_specie_ptr_id_6263b6cd_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_document home_document_question_id_dd079114_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_document
    ADD CONSTRAINT home_document_question_id_dd079114_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_dog home_dog_specie_ptr_id_f96cbee0_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_dog
    ADD CONSTRAINT home_dog_specie_ptr_id_f96cbee0_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_goat home_goat_specie_ptr_id_c953efa8_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_goat
    ADD CONSTRAINT home_goat_specie_ptr_id_c953efa8_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_horse home_horse_specie_ptr_id_eecb749f_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_horse
    ADD CONSTRAINT home_horse_specie_ptr_id_eecb749f_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_imagequestion home_imagequestion_question_id_0585cd25_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_imagequestion
    ADD CONSTRAINT home_imagequestion_question_id_0585cd25_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_message home_message_question_id_37dfcdf8_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_message
    ADD CONSTRAINT home_message_question_id_37dfcdf8_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_ovine home_ovine_specie_ptr_id_6e9a0367_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_ovine
    ADD CONSTRAINT home_ovine_specie_ptr_id_6e9a0367_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_porcine home_porcine_specie_ptr_id_e6e75bb7_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_porcine
    ADD CONSTRAINT home_porcine_specie_ptr_id_e6e75bb7_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_question home_question_user_question_id_f1b86479_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_user_question_id_f1b86479_fk_users_user_id FOREIGN KEY (user_question_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_question home_question_user_response_id_c126cb80_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_question
    ADD CONSTRAINT home_question_user_response_id_c126cb80_fk_users_user_id FOREIGN KEY (user_response_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_rabbit home_rabbit_specie_ptr_id_eba1898a_fk_home_specie_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_rabbit
    ADD CONSTRAINT home_rabbit_specie_ptr_id_eba1898a_fk_home_specie_id FOREIGN KEY (specie_ptr_id) REFERENCES home_specie(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_specie home_specie_question_id_eb8b2fcd_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_specie
    ADD CONSTRAINT home_specie_question_id_eb8b2fcd_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: home_wild home_wild_question_id_05d27474_fk_home_question_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY home_wild
    ADD CONSTRAINT home_wild_question_id_05d27474_fk_home_question_id FOREIGN KEY (question_id) REFERENCES home_question(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: digimundo
--

ALTER TABLE ONLY users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

