--
-- PostgreSQL database dump
--

-- Dumped from database version 13.8 (Debian 13.8-1.pgdg110+1)
-- Dumped by pg_dump version 13.8 (Debian 13.8-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: tiger; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA tiger;


ALTER SCHEMA tiger OWNER TO directus;

--
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO directus;

--
-- Name: topology; Type: SCHEMA; Schema: -; Owner: directus
--

CREATE SCHEMA topology;


ALTER SCHEMA topology OWNER TO directus;

--
-- Name: SCHEMA topology; Type: COMMENT; Schema: -; Owner: directus
--

COMMENT ON SCHEMA topology IS 'PostGIS Topology schema';


--
-- Name: fuzzystrmatch; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS fuzzystrmatch WITH SCHEMA public;


--
-- Name: EXTENSION fuzzystrmatch; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION fuzzystrmatch IS 'determine similarities and distance between strings';


--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


--
-- Name: postgis_tiger_geocoder; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_tiger_geocoder WITH SCHEMA tiger;


--
-- Name: EXTENSION postgis_tiger_geocoder; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_tiger_geocoder IS 'PostGIS tiger geocoder and reverse geocoder';


--
-- Name: postgis_topology; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis_topology WITH SCHEMA topology;


--
-- Name: EXTENSION postgis_topology; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis_topology IS 'PostGIS topology spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: TTA_htmltemplates; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."TTA_htmltemplates" (
    id integer NOT NULL,
    description text,
    collection character varying(255),
    name text,
    template text,
    format character varying(255),
    orientation character varying(255)
);


ALTER TABLE public."TTA_htmltemplates" OWNER TO directus;

--
-- Name: TTA_htmltemplates_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."TTA_htmltemplates_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."TTA_htmltemplates_id_seq" OWNER TO directus;

--
-- Name: TTA_htmltemplates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."TTA_htmltemplates_id_seq" OWNED BY public."TTA_htmltemplates".id;


--
-- Name: asfd; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.asfd (
    id integer NOT NULL
);


ALTER TABLE public.asfd OWNER TO directus;

--
-- Name: asfd_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.asfd_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asfd_id_seq OWNER TO directus;

--
-- Name: asfd_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.asfd_id_seq OWNED BY public.asfd.id;


--
-- Name: blockedEmail; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."blockedEmail" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'published'::character varying,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    email character varying(255) DEFAULT NULL::character varying
);


ALTER TABLE public."blockedEmail" OWNER TO directus;

--
-- Name: blockedEmail_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."blockedEmail_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."blockedEmail_id_seq" OWNER TO directus;

--
-- Name: blockedEmail_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."blockedEmail_id_seq" OWNED BY public."blockedEmail".id;


--
-- Name: contact; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.contact (
    id integer NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    address text,
    map public.geometry(Point,4326)
);


ALTER TABLE public.contact OWNER TO directus;

--
-- Name: contact_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.contact_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contact_id_seq OWNER TO directus;

--
-- Name: contact_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.contact_id_seq OWNED BY public.contact.id;


--
-- Name: directus_activity; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_activity (
    id integer NOT NULL,
    action character varying(45) NOT NULL,
    "user" uuid,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    ip character varying(50),
    user_agent character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    comment text,
    origin character varying(255)
);


ALTER TABLE public.directus_activity OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_activity_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_activity_id_seq OWNER TO directus;

--
-- Name: directus_activity_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_activity_id_seq OWNED BY public.directus_activity.id;


--
-- Name: directus_collections; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_collections (
    collection character varying(64) NOT NULL,
    icon character varying(30),
    note text,
    display_template character varying(255),
    hidden boolean DEFAULT false NOT NULL,
    singleton boolean DEFAULT false NOT NULL,
    translations json,
    archive_field character varying(64),
    archive_app_filter boolean DEFAULT true NOT NULL,
    archive_value character varying(255),
    unarchive_value character varying(255),
    sort_field character varying(64),
    accountability character varying(255) DEFAULT 'all'::character varying,
    color character varying(255),
    item_duplication_fields json,
    sort integer,
    "group" character varying(64),
    collapse character varying(255) DEFAULT 'open'::character varying NOT NULL,
    preview_url character varying(255),
    versioning boolean DEFAULT false NOT NULL
);


ALTER TABLE public.directus_collections OWNER TO directus;

--
-- Name: directus_dashboards; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_dashboards (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30) DEFAULT 'dashboard'::character varying NOT NULL,
    note text,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    color character varying(255)
);


ALTER TABLE public.directus_dashboards OWNER TO directus;

--
-- Name: directus_extensions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_extensions (
    name character varying(255) NOT NULL,
    enabled boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_extensions OWNER TO directus;

--
-- Name: directus_fields; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_fields (
    id integer NOT NULL,
    collection character varying(64) NOT NULL,
    field character varying(64) NOT NULL,
    special character varying(64),
    interface character varying(64),
    options json,
    display character varying(64),
    display_options json,
    readonly boolean DEFAULT false NOT NULL,
    hidden boolean DEFAULT false NOT NULL,
    sort integer,
    width character varying(30) DEFAULT 'full'::character varying,
    translations json,
    note text,
    conditions json,
    required boolean DEFAULT false,
    "group" character varying(64),
    validation json,
    validation_message text
);


ALTER TABLE public.directus_fields OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_fields_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_fields_id_seq OWNER TO directus;

--
-- Name: directus_fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_fields_id_seq OWNED BY public.directus_fields.id;


--
-- Name: directus_files; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_files (
    id uuid NOT NULL,
    storage character varying(255) NOT NULL,
    filename_disk character varying(255),
    filename_download character varying(255) NOT NULL,
    title character varying(255),
    type character varying(255),
    folder uuid,
    uploaded_by uuid,
    uploaded_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    modified_by uuid,
    modified_on timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    charset character varying(50),
    filesize bigint,
    width integer,
    height integer,
    duration integer,
    embed character varying(200),
    description text,
    location text,
    tags text,
    metadata json,
    focal_point_x integer,
    focal_point_y integer
);


ALTER TABLE public.directus_files OWNER TO directus;

--
-- Name: directus_flows; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_flows (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    icon character varying(30),
    color character varying(255),
    description text,
    status character varying(255) DEFAULT 'active'::character varying NOT NULL,
    trigger character varying(255),
    accountability character varying(255) DEFAULT 'all'::character varying,
    options json,
    operation uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_flows OWNER TO directus;

--
-- Name: directus_folders; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_folders (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    parent uuid
);


ALTER TABLE public.directus_folders OWNER TO directus;

--
-- Name: directus_migrations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_migrations (
    version character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.directus_migrations OWNER TO directus;

--
-- Name: directus_notifications; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_notifications (
    id integer NOT NULL,
    "timestamp" timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(255) DEFAULT 'inbox'::character varying,
    recipient uuid NOT NULL,
    sender uuid,
    subject character varying(255) NOT NULL,
    message text,
    collection character varying(64),
    item character varying(255)
);


ALTER TABLE public.directus_notifications OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_notifications_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_notifications_id_seq OWNER TO directus;

--
-- Name: directus_notifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_notifications_id_seq OWNED BY public.directus_notifications.id;


--
-- Name: directus_operations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_operations (
    id uuid NOT NULL,
    name character varying(255),
    key character varying(255) NOT NULL,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    options json,
    resolve uuid,
    reject uuid,
    flow uuid NOT NULL,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_operations OWNER TO directus;

--
-- Name: directus_panels; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_panels (
    id uuid NOT NULL,
    dashboard uuid NOT NULL,
    name character varying(255),
    icon character varying(30) DEFAULT NULL::character varying,
    color character varying(10),
    show_header boolean DEFAULT false NOT NULL,
    note text,
    type character varying(255) NOT NULL,
    position_x integer NOT NULL,
    position_y integer NOT NULL,
    width integer NOT NULL,
    height integer NOT NULL,
    options json,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid
);


ALTER TABLE public.directus_panels OWNER TO directus;

--
-- Name: directus_permissions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_permissions (
    id integer NOT NULL,
    role uuid,
    collection character varying(64) NOT NULL,
    action character varying(10) NOT NULL,
    permissions json,
    validation json,
    presets json,
    fields text
);


ALTER TABLE public.directus_permissions OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_permissions_id_seq OWNER TO directus;

--
-- Name: directus_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_permissions_id_seq OWNED BY public.directus_permissions.id;


--
-- Name: directus_presets; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_presets (
    id integer NOT NULL,
    bookmark character varying(255),
    "user" uuid,
    role uuid,
    collection character varying(64),
    search character varying(100),
    layout character varying(100) DEFAULT 'tabular'::character varying,
    layout_query json,
    layout_options json,
    refresh_interval integer,
    filter json,
    icon character varying(30) DEFAULT 'bookmark'::character varying,
    color character varying(255)
);


ALTER TABLE public.directus_presets OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_presets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_presets_id_seq OWNER TO directus;

--
-- Name: directus_presets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_presets_id_seq OWNED BY public.directus_presets.id;


--
-- Name: directus_relations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_relations (
    id integer NOT NULL,
    many_collection character varying(64) NOT NULL,
    many_field character varying(64) NOT NULL,
    one_collection character varying(64),
    one_field character varying(64),
    one_collection_field character varying(64),
    one_allowed_collections text,
    junction_field character varying(64),
    sort_field character varying(64),
    one_deselect_action character varying(255) DEFAULT 'nullify'::character varying NOT NULL
);


ALTER TABLE public.directus_relations OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_relations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_relations_id_seq OWNER TO directus;

--
-- Name: directus_relations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_relations_id_seq OWNED BY public.directus_relations.id;


--
-- Name: directus_revisions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_revisions (
    id integer NOT NULL,
    activity integer NOT NULL,
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    data json,
    delta json,
    parent integer,
    version uuid
);


ALTER TABLE public.directus_revisions OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_revisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_revisions_id_seq OWNER TO directus;

--
-- Name: directus_revisions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_revisions_id_seq OWNED BY public.directus_revisions.id;


--
-- Name: directus_roles; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_roles (
    id uuid NOT NULL,
    name character varying(100) NOT NULL,
    icon character varying(30) DEFAULT 'supervised_user_circle'::character varying NOT NULL,
    description text,
    ip_access text,
    enforce_tfa boolean DEFAULT false NOT NULL,
    admin_access boolean DEFAULT false NOT NULL,
    app_access boolean DEFAULT true NOT NULL
);


ALTER TABLE public.directus_roles OWNER TO directus;

--
-- Name: directus_sessions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_sessions (
    token character varying(64) NOT NULL,
    "user" uuid,
    expires timestamp with time zone NOT NULL,
    ip character varying(255),
    user_agent character varying(255),
    share uuid,
    origin character varying(255)
);


ALTER TABLE public.directus_sessions OWNER TO directus;

--
-- Name: directus_settings; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_settings (
    id integer NOT NULL,
    project_name character varying(100) DEFAULT 'Directus'::character varying NOT NULL,
    project_url character varying(255),
    project_color character varying(255) DEFAULT '#6644FF'::character varying NOT NULL,
    project_logo uuid,
    public_foreground uuid,
    public_background uuid,
    public_note text,
    auth_login_attempts integer DEFAULT 25,
    auth_password_policy character varying(100),
    storage_asset_transform character varying(7) DEFAULT 'all'::character varying,
    storage_asset_presets json,
    custom_css text,
    storage_default_folder uuid,
    basemaps json,
    mapbox_key character varying(255),
    module_bar json,
    project_descriptor character varying(100),
    default_language character varying(255) DEFAULT 'en-US'::character varying NOT NULL,
    custom_aspect_ratios json,
    public_favicon uuid,
    default_appearance character varying(255) DEFAULT 'auto'::character varying NOT NULL,
    default_theme_light character varying(255),
    theme_light_overrides json,
    default_theme_dark character varying(255),
    theme_dark_overrides json,
    "TTA_KEY" character varying(255)
);


ALTER TABLE public.directus_settings OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_settings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_settings_id_seq OWNER TO directus;

--
-- Name: directus_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_settings_id_seq OWNED BY public.directus_settings.id;


--
-- Name: directus_shares; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_shares (
    id uuid NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    role uuid,
    password character varying(255),
    user_created uuid,
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_start timestamp with time zone,
    date_end timestamp with time zone,
    times_used integer DEFAULT 0,
    max_uses integer
);


ALTER TABLE public.directus_shares OWNER TO directus;

--
-- Name: directus_translations; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_translations (
    id uuid NOT NULL,
    language character varying(255) NOT NULL,
    key character varying(255) NOT NULL,
    value text NOT NULL
);


ALTER TABLE public.directus_translations OWNER TO directus;

--
-- Name: directus_users; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_users (
    id uuid NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(128),
    password character varying(255),
    location character varying(255),
    title character varying(50),
    description text,
    tags json,
    avatar uuid,
    language character varying(255) DEFAULT NULL::character varying,
    tfa_secret character varying(255),
    status character varying(16) DEFAULT 'active'::character varying NOT NULL,
    role uuid,
    token character varying(255),
    last_access timestamp with time zone,
    last_page character varying(255),
    provider character varying(128) DEFAULT 'default'::character varying NOT NULL,
    external_identifier character varying(255),
    auth_data json,
    email_notifications boolean DEFAULT true,
    appearance character varying(255),
    theme_dark character varying(255),
    theme_light character varying(255),
    theme_light_overrides json,
    theme_dark_overrides json
);


ALTER TABLE public.directus_users OWNER TO directus;

--
-- Name: directus_versions; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_versions (
    id uuid NOT NULL,
    key character varying(64) NOT NULL,
    name character varying(255),
    collection character varying(64) NOT NULL,
    item character varying(255) NOT NULL,
    hash character varying(255),
    date_created timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    date_updated timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_created uuid,
    user_updated uuid
);


ALTER TABLE public.directus_versions OWNER TO directus;

--
-- Name: directus_webhooks; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.directus_webhooks (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    method character varying(10) DEFAULT 'POST'::character varying NOT NULL,
    url character varying(255) NOT NULL,
    status character varying(10) DEFAULT 'active'::character varying NOT NULL,
    data boolean DEFAULT true NOT NULL,
    actions character varying(100) NOT NULL,
    collections character varying(255) NOT NULL,
    headers json
);


ALTER TABLE public.directus_webhooks OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.directus_webhooks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.directus_webhooks_id_seq OWNER TO directus;

--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.directus_webhooks_id_seq OWNED BY public.directus_webhooks.id;


--
-- Name: entrance; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.entrance (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255) DEFAULT NULL::character varying,
    contingent character varying(255) DEFAULT '50'::character varying
);


ALTER TABLE public.entrance OWNER TO directus;

--
-- Name: entrance_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.entrance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrance_id_seq OWNER TO directus;

--
-- Name: entrance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.entrance_id_seq OWNED BY public.entrance.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.event (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'published'::character varying,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    name character varying(255) DEFAULT 'Markt'::character varying,
    date timestamp without time zone,
    "isNextEvent" boolean DEFAULT true,
    "activeSubscriptions" boolean DEFAULT true
);


ALTER TABLE public.event OWNER TO directus;

--
-- Name: event_entrance; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.event_entrance (
    id integer NOT NULL,
    event_id integer,
    entrance_id integer
);


ALTER TABLE public.event_entrance OWNER TO directus;

--
-- Name: event_entrance_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.event_entrance_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_entrance_id_seq OWNER TO directus;

--
-- Name: event_entrance_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.event_entrance_id_seq OWNED BY public.event_entrance.id;


--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO directus;

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.event_id_seq OWNED BY public.event.id;


--
-- Name: event_seller; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.event_seller (
    id integer NOT NULL,
    event_id integer,
    seller_id integer
);


ALTER TABLE public.event_seller OWNER TO directus;

--
-- Name: event_seller_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.event_seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_seller_id_seq OWNER TO directus;

--
-- Name: event_seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.event_seller_id_seq OWNED BY public.event_seller.id;


--
-- Name: faq; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.faq (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'published'::character varying,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    question character varying(255) DEFAULT NULL::character varying,
    answer text
);


ALTER TABLE public.faq OWNER TO directus;

--
-- Name: faq_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.faq_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.faq_id_seq OWNER TO directus;

--
-- Name: faq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.faq_id_seq OWNED BY public.faq.id;


--
-- Name: marktOrdnung; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public."marktOrdnung" (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    pdf uuid
);


ALTER TABLE public."marktOrdnung" OWNER TO directus;

--
-- Name: marktOrdnung_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public."marktOrdnung_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."marktOrdnung_id_seq" OWNER TO directus;

--
-- Name: marktOrdnung_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public."marktOrdnung_id_seq" OWNED BY public."marktOrdnung".id;


--
-- Name: pages; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.pages (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    title character varying(255) DEFAULT NULL::character varying,
    slug character varying(255) DEFAULT NULL::character varying,
    body text,
    image uuid
);


ALTER TABLE public.pages OWNER TO directus;

--
-- Name: pages_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.pages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pages_id_seq OWNER TO directus;

--
-- Name: pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.pages_id_seq OWNED BY public.pages.id;


--
-- Name: seat; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.seat (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'published'::character varying,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    entrance integer,
    event integer,
    seller integer
);


ALTER TABLE public.seat OWNER TO directus;

--
-- Name: seat_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.seat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seat_id_seq OWNER TO directus;

--
-- Name: seat_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.seat_id_seq OWNED BY public.seat.id;


--
-- Name: seller; Type: TABLE; Schema: public; Owner: directus
--

CREATE TABLE public.seller (
    id integer NOT NULL,
    status character varying(255) DEFAULT 'draft'::character varying NOT NULL,
    sort integer,
    user_created uuid,
    date_created timestamp with time zone,
    user_updated uuid,
    date_updated timestamp with time zone,
    email character varying(255) DEFAULT NULL::character varying,
    "firstName" character varying(255) DEFAULT NULL::character varying,
    "lastName" character varying(255) DEFAULT NULL::character varying,
    address character varying(255) DEFAULT NULL::character varying,
    nr character varying(255) DEFAULT NULL::character varying,
    zip character varying(255) DEFAULT NULL::character varying,
    city character varying(255) DEFAULT NULL::character varying,
    "birthDate" date,
    "licensePlate" character varying(255) DEFAULT NULL::character varying,
    "driverName" character varying(255) DEFAULT NULL::character varying,
    "driverNationality" character varying(255) DEFAULT NULL::character varying,
    "isActualDriver" boolean DEFAULT false,
    "marktOrdnung" boolean DEFAULT false,
    nationality character varying(255) DEFAULT NULL::character varying,
    map public.geometry(Point,4326) DEFAULT NULL::public.geometry
);


ALTER TABLE public.seller OWNER TO directus;

--
-- Name: seller_id_seq; Type: SEQUENCE; Schema: public; Owner: directus
--

CREATE SEQUENCE public.seller_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seller_id_seq OWNER TO directus;

--
-- Name: seller_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: directus
--

ALTER SEQUENCE public.seller_id_seq OWNED BY public.seller.id;


--
-- Name: TTA_htmltemplates id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."TTA_htmltemplates" ALTER COLUMN id SET DEFAULT nextval('public."TTA_htmltemplates_id_seq"'::regclass);


--
-- Name: asfd id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.asfd ALTER COLUMN id SET DEFAULT nextval('public.asfd_id_seq'::regclass);


--
-- Name: blockedEmail id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."blockedEmail" ALTER COLUMN id SET DEFAULT nextval('public."blockedEmail_id_seq"'::regclass);


--
-- Name: contact id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact ALTER COLUMN id SET DEFAULT nextval('public.contact_id_seq'::regclass);


--
-- Name: directus_activity id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity ALTER COLUMN id SET DEFAULT nextval('public.directus_activity_id_seq'::regclass);


--
-- Name: directus_fields id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields ALTER COLUMN id SET DEFAULT nextval('public.directus_fields_id_seq'::regclass);


--
-- Name: directus_notifications id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications ALTER COLUMN id SET DEFAULT nextval('public.directus_notifications_id_seq'::regclass);


--
-- Name: directus_permissions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions ALTER COLUMN id SET DEFAULT nextval('public.directus_permissions_id_seq'::regclass);


--
-- Name: directus_presets id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets ALTER COLUMN id SET DEFAULT nextval('public.directus_presets_id_seq'::regclass);


--
-- Name: directus_relations id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations ALTER COLUMN id SET DEFAULT nextval('public.directus_relations_id_seq'::regclass);


--
-- Name: directus_revisions id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions ALTER COLUMN id SET DEFAULT nextval('public.directus_revisions_id_seq'::regclass);


--
-- Name: directus_settings id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings ALTER COLUMN id SET DEFAULT nextval('public.directus_settings_id_seq'::regclass);


--
-- Name: directus_webhooks id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks ALTER COLUMN id SET DEFAULT nextval('public.directus_webhooks_id_seq'::regclass);


--
-- Name: entrance id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.entrance ALTER COLUMN id SET DEFAULT nextval('public.entrance_id_seq'::regclass);


--
-- Name: event id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event ALTER COLUMN id SET DEFAULT nextval('public.event_id_seq'::regclass);


--
-- Name: event_entrance id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_entrance ALTER COLUMN id SET DEFAULT nextval('public.event_entrance_id_seq'::regclass);


--
-- Name: event_seller id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_seller ALTER COLUMN id SET DEFAULT nextval('public.event_seller_id_seq'::regclass);


--
-- Name: faq id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.faq ALTER COLUMN id SET DEFAULT nextval('public.faq_id_seq'::regclass);


--
-- Name: marktOrdnung id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."marktOrdnung" ALTER COLUMN id SET DEFAULT nextval('public."marktOrdnung_id_seq"'::regclass);


--
-- Name: pages id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages ALTER COLUMN id SET DEFAULT nextval('public.pages_id_seq'::regclass);


--
-- Name: seat id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat ALTER COLUMN id SET DEFAULT nextval('public.seat_id_seq'::regclass);


--
-- Name: seller id; Type: DEFAULT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seller ALTER COLUMN id SET DEFAULT nextval('public.seller_id_seq'::regclass);


--
-- Data for Name: TTA_htmltemplates; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."TTA_htmltemplates" (id, description, collection, name, template, format, orientation) FROM stdin;
\.


--
-- Data for Name: asfd; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.asfd (id) FROM stdin;
\.


--
-- Data for Name: blockedEmail; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."blockedEmail" (id, status, sort, user_created, date_created, user_updated, date_updated, email) FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:35.127+00	\N	\N	gaga@super.com
\.


--
-- Data for Name: contact; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.contact (id, user_created, date_created, user_updated, date_updated, address, map) FROM stdin;
1	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:05:00.372+00	\N	\N	<p>Flohmarkt Kanzlei<br>Kanzleistrasse 56<br>8004 Z&uuml;rich</p>	\N
\.


--
-- Data for Name: directus_activity; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_activity (id, action, "user", "timestamp", ip, user_agent, collection, item, comment, origin) FROM stdin;
1	login	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:09:49.807+00	10.183.233.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	2048a671-cc31-48db-b1e6-561d5285837b	\N	https://directus.cmsflohmarktkanzleich.orb.local
2	login	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:17:29.836+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	2048a671-cc31-48db-b1e6-561d5285837b	\N	http://0.0.0.0:8055
3	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:33:12.49+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
4	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:33:24.001+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
5	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:34:08.676+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
6	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:37:22.386+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
7	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:39:08.305+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
8	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:39:17.924+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
9	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:39:54.597+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
10	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:02.246+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
11	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.796+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_roles	7ea3fad0-0160-4355-8a11-0a60f478392a	\N	http://0.0.0.0:8055
12	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.847+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	1	\N	http://0.0.0.0:8055
13	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.854+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	2	\N	http://0.0.0.0:8055
14	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.863+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	3	\N	http://0.0.0.0:8055
15	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.872+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	4	\N	http://0.0.0.0:8055
16	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.879+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	5	\N	http://0.0.0.0:8055
17	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.887+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	6	\N	http://0.0.0.0:8055
18	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.893+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	7	\N	http://0.0.0.0:8055
19	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.901+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	8	\N	http://0.0.0.0:8055
20	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.908+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	9	\N	http://0.0.0.0:8055
21	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.941+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	10	\N	http://0.0.0.0:8055
22	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.951+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	11	\N	http://0.0.0.0:8055
23	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.961+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	12	\N	http://0.0.0.0:8055
24	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.972+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	13	\N	http://0.0.0.0:8055
25	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.982+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	14	\N	http://0.0.0.0:8055
26	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:19.998+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	15	\N	http://0.0.0.0:8055
27	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.008+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	16	\N	http://0.0.0.0:8055
28	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.016+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	17	\N	http://0.0.0.0:8055
29	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.023+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	18	\N	http://0.0.0.0:8055
30	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.029+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	19	\N	http://0.0.0.0:8055
31	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.038+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	20	\N	http://0.0.0.0:8055
32	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.043+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	21	\N	http://0.0.0.0:8055
33	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.05+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	22	\N	http://0.0.0.0:8055
34	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.054+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	23	\N	http://0.0.0.0:8055
35	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:20.06+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	24	\N	http://0.0.0.0:8055
36	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:40:24.214+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	25	\N	http://0.0.0.0:8055
37	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:55:38.789+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	26	\N	http://0.0.0.0:8055
38	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:55:40.323+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	27	\N	http://0.0.0.0:8055
39	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:58:47.121+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	28	\N	http://0.0.0.0:8055
40	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:58:55.738+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	29	\N	http://0.0.0.0:8055
41	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:58:57.311+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	30	\N	http://0.0.0.0:8055
42	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:59:04.015+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	31	\N	http://0.0.0.0:8055
43	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:59:33.455+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	32	\N	http://0.0.0.0:8055
44	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 07:59:35.255+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	33	\N	http://0.0.0.0:8055
45	delete	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:04:52.698+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	33	\N	http://0.0.0.0:8055
46	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:04:54.542+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	34	\N	http://0.0.0.0:8055
47	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:04:55.784+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	35	\N	http://0.0.0.0:8055
48	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:04:56.775+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	36	\N	http://0.0.0.0:8055
49	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:04:58.021+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	37	\N	http://0.0.0.0:8055
50	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:01.131+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	38	\N	http://0.0.0.0:8055
51	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:02.131+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	39	\N	http://0.0.0.0:8055
52	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:03.061+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	40	\N	http://0.0.0.0:8055
53	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:03.976+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	41	\N	http://0.0.0.0:8055
54	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:41.019+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	f338bd04-7a55-45c7-9435-e2b0b6ad1968	\N	http://0.0.0.0:8055
55	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:41.032+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_roles	7ea3fad0-0160-4355-8a11-0a60f478392a	\N	http://0.0.0.0:8055
56	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:49.073+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	42	\N	http://0.0.0.0:8055
57	delete	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:05:56.081+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	42	\N	http://0.0.0.0:8055
58	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:06:05.02+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_permissions	43	\N	http://0.0.0.0:8055
59	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:07:46.63+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
60	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:07:53.219+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
61	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:09:52.077+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	\N	http://0.0.0.0:8055
62	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:10:11.49+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	a5aae15c-6850-4c93-a862-ba72f92fd23b	\N	http://0.0.0.0:8055
63	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:10:11.517+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	\N	http://0.0.0.0:8055
64	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:11:12.778+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
65	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:13:06.384+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	\N	http://0.0.0.0:8055
66	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:13:06.401+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	\N	http://0.0.0.0:8055
67	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:13:06.411+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	\N	http://0.0.0.0:8055
68	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:13:06.43+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
69	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:14:44.173+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
70	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:15:19.623+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	\N	http://0.0.0.0:8055
71	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:15:19.65+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
72	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:15:55.262+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
73	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:16:47.516+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	\N	http://0.0.0.0:8055
74	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:17:46.854+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	10a26cf6-b2b6-40a3-abb7-8523eeef8f6a	\N	http://0.0.0.0:8055
75	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:17:46.884+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	\N	http://0.0.0.0:8055
76	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:07.386+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	\N	http://0.0.0.0:8055
77	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:07.435+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	\N	http://0.0.0.0:8055
78	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:07.45+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	\N	http://0.0.0.0:8055
79	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:07.471+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
80	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:42.451+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	\N	http://0.0.0.0:8055
81	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:42.496+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	\N	http://0.0.0.0:8055
82	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:42.51+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	\N	http://0.0.0.0:8055
83	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:18:42.564+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
84	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:20:40.386+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
85	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:20:46.499+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
86	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:20:46.506+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
87	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:21:27.476+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
88	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:21:27.525+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
89	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:21:32.478+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
90	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:21:32.521+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
91	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:06.807+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	\N	http://0.0.0.0:8055
92	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:24.285+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
93	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:29.061+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
94	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:56.165+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	\N	http://0.0.0.0:8055
95	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:56.187+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
96	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:22:59.566+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
97	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:23:35.565+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	\N	http://0.0.0.0:8055
98	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:23:35.609+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
99	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:23:37.792+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
100	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:23:37.802+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
104	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:45.406+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	entrance	1	\N	http://0.0.0.0:8055
105	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:53.403+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	entrance	2	\N	http://0.0.0.0:8055
106	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:01.514+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	entrance	3	\N	http://0.0.0.0:8055
101	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:23:49.568+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	\N	http://0.0.0.0:8055
102	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:13.326+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
103	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:22.081+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	event	1	\N	http://0.0.0.0:8055
107	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:10.194+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	entrance	4	\N	http://0.0.0.0:8055
108	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:35.141+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	blockedEmail	1	\N	http://0.0.0.0:8055
109	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:45.734+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	marktOrdnung	1	\N	http://0.0.0.0:8055
110	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:26:02.195+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	117	\N	http://0.0.0.0:8055
111	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:55:45.941+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	1	\N	http://0.0.0.0:8055
112	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:05.871+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	2	\N	http://0.0.0.0:8055
113	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:42.617+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	3	\N	http://0.0.0.0:8055
114	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:54.416+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	4	\N	http://0.0.0.0:8055
115	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:04.833+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	5	\N	http://0.0.0.0:8055
116	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:16.919+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	6	\N	http://0.0.0.0:8055
117	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:28.862+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	7	\N	http://0.0.0.0:8055
118	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:41.43+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	8	\N	http://0.0.0.0:8055
119	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:51.447+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	9	\N	http://0.0.0.0:8055
120	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:07.181+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	10	\N	http://0.0.0.0:8055
121	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:18.638+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	11	\N	http://0.0.0.0:8055
122	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:29.191+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	12	\N	http://0.0.0.0:8055
123	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:39.347+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	13	\N	http://0.0.0.0:8055
124	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:50.57+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	14	\N	http://0.0.0.0:8055
125	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:02.299+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	15	\N	http://0.0.0.0:8055
126	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:13.458+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	16	\N	http://0.0.0.0:8055
127	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:24.293+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	faq	17	\N	http://0.0.0.0:8055
128	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:00:15.187+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_collections	marktOrdnung	\N	http://0.0.0.0:8055
129	login	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:00:26.867+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	2048a671-cc31-48db-b1e6-561d5285837b	\N	http://0.0.0.0:8055
130	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:00:50.274+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_collections	marktOrdnung	\N	http://0.0.0.0:8055
131	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:02:03.994+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_collections	contact	\N	http://0.0.0.0:8055
132	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:04:28.173+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
133	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:05:00.407+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	contact	1	\N	http://0.0.0.0:8055
134	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:09:22.237+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	4e9154a4-9417-4fa0-93ff-31c2fe4b63f8	\N	http://0.0.0.0:8055
135	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:11:14.568+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_extensions	directus-extension-texttoanything	\N	http://0.0.0.0:8055
136	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:12:26.016+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	118	\N	http://0.0.0.0:8055
137	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:12:26.049+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_collections	asfd	\N	http://0.0.0.0:8055
138	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:12:43.483+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	119	\N	http://0.0.0.0:8055
139	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:13:33.191+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	119	\N	http://0.0.0.0:8055
140	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:13:52.273+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	119	\N	http://0.0.0.0:8055
141	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:16:47.306+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	\N	http://0.0.0.0:8055
142	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:17:00.004+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	\N	http://0.0.0.0:8055
143	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:17:08.214+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	\N	http://0.0.0.0:8055
144	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:18:26.788+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seat	1	\N	http://0.0.0.0:8055
145	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:19:29.933+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
146	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:22:10.574+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
147	create	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:22:34.462+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	d3ca4018-6fd9-4ccf-bbfc-1216c669021a	\N	http://0.0.0.0:8055
148	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:22:34.483+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
149	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:23:14.406+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
150	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:23:14.44+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
151	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:29:05.069+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_settings	1	\N	http://0.0.0.0:8055
152	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:30:24.283+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
153	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:30:24.379+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
154	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:31:55.457+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
155	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:32:35.99+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
156	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:32:36.064+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
157	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:32:53.896+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_operations	d3ca4018-6fd9-4ccf-bbfc-1216c669021a	\N	http://0.0.0.0:8055
158	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:32:53.953+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
159	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:33:28.052+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_fields	108	\N	http://0.0.0.0:8055
160	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:35:28.981+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
161	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:35:29.032+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
162	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:35:56.568+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
163	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:35:56.598+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
164	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:37:35.421+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
165	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:37:35.472+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
166	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:38:36.238+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
167	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:38:36.292+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
168	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:38:47.351+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
169	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:38:47.379+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
170	login	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:39:28.847+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_users	2048a671-cc31-48db-b1e6-561d5285837b	\N	http://0.0.0.0:8055
171	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:39:35.613+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
172	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:39:35.656+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
173	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:41:27.193+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
174	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:41:27.249+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
175	run	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:43:09.363+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	\N	http://0.0.0.0:8055
176	update	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:43:09.412+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	seller	1	\N	http://0.0.0.0:8055
\.


--
-- Data for Name: directus_collections; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_collections (collection, icon, note, display_template, hidden, singleton, translations, archive_field, archive_app_filter, archive_value, unarchive_value, sort_field, accountability, color, item_duplication_fields, sort, "group", collapse, preview_url, versioning) FROM stdin;
Settings	folder	\N	\N	f	f	[{"language":"de-DE","translation":"Einstellungen"}]	\N	t	\N	\N	\N	all	\N	\N	4	\N	open	\N	f
blockedEmail	account_circle_off	\N	\N	f	f	[{"language":"de-DE","translation":"Blockierte E-Mails","singular":"Blockierte E-Mail","plural":"Blockierte E-Mails"}]	status	t	archived	draft	sort	all	\N	\N	2	Settings	open	\N	f
entrance	door_open	\N	{{name}}	f	f	[{"language":"de-DE","translation":"Eingangstore","singular":"Eingangstor","plural":"Eingangstore"}]	status	t	archived	draft	sort	all	\N	\N	1	Settings	open	\N	f
event	theater_comedy	\N	\N	f	f	[{"language":"de-DE","translation":"Märkte","singular":"Markt","plural":"Märkte"}]	status	t	archived	draft	sort	all	\N	\N	1	\N	open	\N	f
seat	perm_contact_calendar	\N	\N	f	f	[{"language":"de-DE","translation":"Anmeldungen","singular":"Anmeldung","plural":"Anmeldungen"}]	status	t	archived	draft	sort	all	\N	\N	1	event	open	\N	f
event_entrance	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	6	\N	open	\N	f
event_seller	import_export	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	7	\N	open	\N	f
faq	question_mark	\N	{{question}}	f	f	\N	status	t	archived	draft	sort	all	\N	\N	5	\N	open	\N	f
pages	note	\N	\N	f	f	[{"language":"de-DE","translation":"Seiten","singular":"Seite","plural":"Seiten"}]	status	t	archived	draft	sort	all	\N	\N	3	\N	open	\N	f
seller	mode_standby	\N	{{firstName}}{{lastName}}	f	f	[{"language":"de-DE","translation":"Verkäufer","singular":"Verkäufer","plural":"Verkäufer"}]	status	t	archived	draft	sort	all	\N	\N	2	\N	open	\N	f
TTA_htmltemplates	code	\N	\N	t	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
marktOrdnung	sim_card_download	\N	\N	f	t	[{"language":"de-DE","translation":"Marktordnung","singular":"Marktordnung","plural":"Marktordnung"}]	status	t	archived	draft	\N	all	\N	\N	4	Settings	open	\N	f
contact	person_pin	\N	\N	f	t	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
asfd	\N	\N	\N	f	f	\N	\N	t	\N	\N	\N	all	\N	\N	\N	\N	open	\N	f
\.


--
-- Data for Name: directus_dashboards; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_dashboards (id, name, icon, note, date_created, user_created, color) FROM stdin;
\.


--
-- Data for Name: directus_extensions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_extensions (name, enabled) FROM stdin;
directus-extension-api-trigger-interface	t
directus-extension-board-layout	t
directus-extension-computed-interface	t
directus-extension-grid-layout	t
directus-extension-group-modal-interface	t
directus-extension-inline-form-interface	t
directus-extension-flow2pdf	t
directus-extension-flow2pdf/flow2pdf-interface	t
directus-extension-flow2pdf/flow2pdf-endpoint	t
directus-extension-texttoanything	f
directus-extension-texttoanything/GenerateBarcode	f
directus-extension-texttoanything/GeneratePDF	f
directus-extension-texttoanything/GeneratePDFFromTemplate	f
directus-extension-texttoanything/GenerateQRCode	f
directus-extension-texttoanything/bootstrap	f
directus-extension-texttoanything/settings module	f
directus-extension-texttoanything/PDF template selector	f
directus-extension-texttoanything/PDF preview	f
\.


--
-- Data for Name: directus_fields; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_fields (id, collection, field, special, interface, options, display, display_options, readonly, hidden, sort, width, translations, note, conditions, required, "group", validation, validation_message) FROM stdin;
9	blockedEmail	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
10	blockedEmail	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
11	blockedEmail	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
12	blockedEmail	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
13	blockedEmail	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
14	blockedEmail	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
15	blockedEmail	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
16	blockedEmail	email	\N	input	{"iconLeft":"mail"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
17	entrance	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
18	entrance	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
19	entrance	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
20	entrance	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
21	entrance	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
22	entrance	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
23	entrance	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
24	entrance	name	\N	input	{"iconLeft":"text_fields"}	formatted-value	{"format":true}	f	f	8	full	\N	\N	\N	f	\N	\N	\N
25	entrance	contingent	\N	input	{"iconLeft":"123"}	\N	\N	f	f	9	full	[{"language":"de-DE","translation":"Kontingent"}]	\N	\N	f	\N	\N	\N
26	marktOrdnung	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
27	marktOrdnung	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
28	marktOrdnung	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	3	half	\N	\N	\N	f	\N	\N	\N
29	marktOrdnung	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	4	half	\N	\N	\N	f	\N	\N	\N
30	marktOrdnung	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	5	half	\N	\N	\N	f	\N	\N	\N
31	marktOrdnung	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	6	half	\N	\N	\N	f	\N	\N	\N
32	marktOrdnung	pdf	file	file	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
33	contact	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
34	contact	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	2	half	\N	\N	\N	f	\N	\N	\N
35	contact	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	3	half	\N	\N	\N	f	\N	\N	\N
36	contact	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
37	contact	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
38	contact	address	\N	input-rich-text-html	{"toolbar":["bold","code","customLink","fullscreen","removeformat","underline"]}	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
39	event	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
40	event	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
41	event	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
42	event	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
43	event	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
44	event	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
45	event	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
46	event	name	\N	input	{"iconLeft":"text_fields"}	\N	\N	f	f	8	half	\N	\N	\N	f	\N	\N	\N
47	event	date	\N	datetime	\N	datetime	\N	f	f	9	half	[{"language":"de-DE","translation":"Datum"}]	\N	\N	t	\N	\N	\N
48	event	isNextEvent	cast-boolean	boolean	\N	\N	\N	f	f	10	half	[{"language":"de-DE","translation":"Ist der nächste Markt"}]	\N	\N	f	\N	\N	\N
49	event	activeSubscriptions	cast-boolean	boolean	\N	\N	\N	f	f	11	half	[{"language":"de-DE","translation":"Man kann sich anmelden"}]	\N	\N	f	\N	\N	\N
50	seat	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
51	seat	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
52	seat	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
53	seat	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
54	seat	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
55	seat	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
56	seat	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
57	seat	entrance	m2o	select-dropdown-m2o	{"enableCreate":false,"template":"{{name}}{{contingent}}"}	related-values	{"template":"{{name}}"}	f	f	9	half	[{"language":"de-DE","translation":"Eingangstor"}]	\N	\N	f	\N	\N	\N
58	seat	event	m2o	select-dropdown-m2o	{"enableCreate":false,"template":"{{date}}"}	formatted-value	\N	f	f	8	half	[{"language":"de-DE","translation":"Markt"}]	\N	\N	f	\N	\N	\N
59	seat	seller	m2o	select-dropdown-m2o	{"template":"{{email}}"}	\N	\N	f	f	10	full	[{"language":"de-DE","translation":"Verkäufer"}]	\N	\N	f	\N	\N	\N
60	event_entrance	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
61	event_entrance	event_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
62	event_entrance	entrance_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
63	event_seller	id	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
64	event_seller	event_id	\N	\N	\N	\N	\N	f	t	2	full	\N	\N	\N	f	\N	\N	\N
65	event_seller	seller_id	\N	\N	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
66	faq	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
67	faq	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
68	faq	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
69	faq	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
70	faq	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
71	faq	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
72	faq	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
73	faq	question	\N	input	{"iconLeft":"question_mark"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
74	faq	answer	\N	input-rich-text-html	{"toolbar":["blockquote","bold","bullist","customImage","customLink","customMedia","fullscreen","h2","h3","italic","numlist","removeformat","subscript","superscript","underline"]}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
75	pages	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
76	pages	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
77	pages	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
78	pages	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
79	pages	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
80	pages	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
81	pages	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
82	pages	title	\N	input	{"iconLeft":"text_fields"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
83	pages	slug	\N	input	{"iconLeft":"conversion_path"}	\N	\N	f	f	9	full	\N	\N	\N	f	\N	\N	\N
84	pages	body	\N	input-rich-text-html	{"toolbar":["blockquote","bold","bullist","code","customImage","customLink","customMedia","fullscreen","h2","h3","hr","italic","numlist","removeformat","underline"]}	\N	\N	f	f	11	full	\N	\N	\N	f	\N	\N	\N
85	pages	image	file	file-image	\N	\N	\N	f	f	10	full	\N	\N	\N	f	\N	\N	\N
86	seller	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
87	seller	status	\N	select-dropdown	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)"}]}	labels	{"choices":[{"text":"$t:published","value":"published","color":"var(--theme--primary)","foreground":"var(--theme--primary)","background":"var(--theme--primary-background)"},{"text":"$t:draft","value":"draft","color":"var(--theme--foreground)","foreground":"var(--theme--foreground)","background":"var(--theme--background-normal)"},{"text":"$t:archived","value":"archived","color":"var(--theme--warning)","foreground":"var(--theme--warning)","background":"var(--theme--warning-background)"}],"showAsDot":true}	f	f	2	full	\N	\N	\N	f	\N	\N	\N
88	seller	sort	\N	input	\N	\N	\N	f	t	3	full	\N	\N	\N	f	\N	\N	\N
89	seller	user_created	user-created	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	4	half	\N	\N	\N	f	\N	\N	\N
90	seller	date_created	cast-timestamp,date-created	datetime	\N	datetime	{"relative":true}	t	t	5	half	\N	\N	\N	f	\N	\N	\N
91	seller	user_updated	user-updated	select-dropdown-m2o	{"template":"{{avatar.$thumbnail}} {{first_name}} {{last_name}}"}	user	\N	t	t	6	half	\N	\N	\N	f	\N	\N	\N
92	seller	date_updated	cast-timestamp,date-updated	datetime	\N	datetime	{"relative":true}	t	t	7	half	\N	\N	\N	f	\N	\N	\N
93	seller	email	\N	input	{"iconLeft":"alternate_email"}	\N	\N	f	f	8	full	\N	\N	\N	f	\N	\N	\N
94	seller	firstName	\N	input	{"iconLeft":"text_fields","placeholder":null}	\N	\N	f	f	9	half	[{"language":"de-DE","translation":"Vorname"}]	\N	\N	t	\N	\N	\N
95	seller	lastName	\N	input	{"iconLeft":"text_fields"}	\N	\N	f	f	10	half	[{"language":"de-DE","translation":"Nachname"}]	\N	\N	t	\N	\N	\N
96	seller	address	\N	input	{"iconLeft":"house"}	\N	\N	f	f	11	half	[{"language":"de-DE","translation":"Adresse"}]	\N	\N	t	\N	\N	\N
97	seller	nr	\N	input	{"iconLeft":"numbers"}	\N	\N	f	f	12	half	\N	\N	\N	f	\N	\N	\N
98	seller	zip	\N	input	{"iconLeft":"numbers"}	\N	\N	f	f	13	half	[{"language":"de-DE","translation":"PLZ"}]	\N	\N	t	\N	\N	\N
99	seller	city	\N	input	{"iconLeft":"home_pin"}	\N	\N	f	f	14	half	[{"language":"de-DE","translation":"Ort"}]	\N	\N	t	\N	\N	\N
100	seller	birthDate	\N	datetime	\N	\N	\N	f	f	16	full	[{"language":"de-DE","translation":"Geburtsdatum"}]	\N	\N	t	\N	\N	\N
101	seller	licensePlate	\N	input	{"iconLeft":"directions_car"}	\N	\N	f	f	18	full	[{"language":"de-DE","translation":"Autonummer"}]	\N	\N	f	\N	\N	\N
102	seller	driverName	\N	input	{"iconLeft":"man"}	\N	\N	f	f	19	half	[{"language":"de-DE","translation":"Name d. Fahrers"}]	\N	\N	f	\N	\N	\N
103	seller	driverNationality	\N	input	{"iconLeft":"badge"}	\N	\N	f	f	21	full	[{"language":"de-DE","translation":"Nationalität des Fahrers"}]	\N	\N	f	\N	\N	\N
104	seller	isActualDriver	cast-boolean	boolean	\N	\N	\N	f	f	20	half	[{"language":"de-DE","translation":"Fahrer verkauft auch"}]	\N	\N	f	\N	\N	\N
105	seller	divider-l39br_	alias,no-data	presentation-divider	{"inlineTitle":true,"title":"Driver"}	\N	\N	f	f	17	full	\N	\N	\N	f	\N	\N	\N
106	seller	marktOrdnung	cast-boolean	boolean	\N	\N	\N	f	f	22	full	[{"language":"de-DE","translation":"Marktordnung gelesen"}]	\N	\N	f	\N	\N	\N
107	seller	nationality	\N	input	{"iconLeft":"globe_uk"}	\N	\N	f	f	15	full	[{"language":"de-DE","translation":"Nationalität"}]	\N	\N	t	\N	\N	\N
109	TTA_htmltemplates	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
110	TTA_htmltemplates	description	\N	\N	\N	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
111	TTA_htmltemplates	collection	\N	\N	\N	\N	\N	f	f	3	full	\N	\N	\N	f	\N	\N	\N
112	TTA_htmltemplates	name	\N	\N	\N	\N	\N	f	f	4	full	\N	\N	\N	f	\N	\N	\N
113	TTA_htmltemplates	template	\N	\N	\N	\N	\N	f	f	5	full	\N	\N	\N	f	\N	\N	\N
114	TTA_htmltemplates	format	\N	\N	\N	\N	\N	f	f	6	full	\N	\N	\N	f	\N	\N	\N
115	TTA_htmltemplates	orientation	\N	\N	\N	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
116	directus_settings	TTA_KEY	\N	\N	\N	\N	\N	f	t	1	full	\N	\N	\N	f	\N	\N	\N
117	contact	map	\N	map	{"defaultView":{"center":{"lng":-40.06037182553442,"lat":2.842170943040401e-14},"zoom":-0.3706434003783813,"bearing":0,"pitch":0},"geometryType":"Point"}	\N	\N	f	f	7	full	\N	\N	\N	f	\N	\N	\N
118	asfd	id	\N	input	\N	\N	\N	t	t	1	full	\N	\N	\N	f	\N	\N	\N
119	asfd	interface-nvhste	alias,no-data	flow2pdf-interface	{"flow_id":"downloadParticipants","behavior":"download"}	\N	\N	f	f	2	full	\N	\N	\N	f	\N	\N	\N
108	seller	map	\N	map	{"defaultView":{"bearing":0,"center":{"lat":39.99689526132639,"lng":-77.18853914268647},"pitch":0,"zoom":5.64627252856377},"geometryType":"Point"}	raw	\N	f	f	23	full	\N	\N	\N	f	\N	\N	\N
\.


--
-- Data for Name: directus_files; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_files (id, storage, filename_disk, filename_download, title, type, folder, uploaded_by, uploaded_on, modified_by, modified_on, charset, filesize, width, height, duration, embed, description, location, tags, metadata, focal_point_x, focal_point_y) FROM stdin;
\.


--
-- Data for Name: directus_flows; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_flows (id, name, icon, color, description, status, trigger, accountability, options, operation, date_created, user_created) FROM stdin;
8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	slugify	conversion_path	\N	Slugify from a Title of an Article or Post.	active	event	all	{"type":"filter","scope":["items.create","items.update"],"collections":["pages"]}	a5aae15c-6850-4c93-a862-ba72f92fd23b	2024-02-17 08:09:52.038+00	2048a671-cc31-48db-b1e6-561d5285837b
6482fa24-2ebe-4938-ac40-2b3f77f65916	1. Create Next Event	start	#2ECDA7	Creates next Event. Every Thursday at 12.00.	active	schedule	all	{"cron":"0 12 * * 4"}	13e9a54e-7558-4f77-9ba2-3c289047fcc7	2024-02-17 08:11:12.749+00	2048a671-cc31-48db-b1e6-561d5285837b
ba4a8d02-534f-4c64-a435-14be72c4af91	2. Close Subscriptions	block	#E35169	Closes subscriptions by Friday, 18.00.	active	schedule	all	{"cron":"0 18 * * 5"}	66a46269-97cf-40ab-954e-9852edd07fd4	2024-02-17 08:14:44.156+00	2048a671-cc31-48db-b1e6-561d5285837b
4e9154a4-9417-4fa0-93ff-31c2fe4b63f8	to PDF	bolt	\N	asf	active	event	all	{"type":"action","scope":["items.create","items.update"],"collections":["event"]}	\N	2024-02-17 10:09:22.214+00	2048a671-cc31-48db-b1e6-561d5285837b
f3d245a1-709f-4fa7-94a0-b8accc4f2474	3. Export Attendance List	checklist	\N	Get Seats for next Event every Friday 18:05.	active	manual	all	{"collections":["event"],"requireSelection":false}	10a26cf6-b2b6-40a3-abb7-8523eeef8f6a	2024-02-17 08:16:47.508+00	2048a671-cc31-48db-b1e6-561d5285837b
7965a5c5-1c5a-447b-b71c-5fe5fd96282d	enterMapData	not_listed_location	#2ECDA7	Enters Address Data into Map	active	event	all	{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$all"}	d3ca4018-6fd9-4ccf-bbfc-1216c669021a	2024-02-17 10:22:10.552+00	2048a671-cc31-48db-b1e6-561d5285837b
\.


--
-- Data for Name: directus_folders; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_folders (id, name, parent) FROM stdin;
\.


--
-- Data for Name: directus_migrations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_migrations (version, name, "timestamp") FROM stdin;
20201028A	Remove Collection Foreign Keys	2024-02-17 07:09:22.864067+00
20201029A	Remove System Relations	2024-02-17 07:09:22.874517+00
20201029B	Remove System Collections	2024-02-17 07:09:22.878274+00
20201029C	Remove System Fields	2024-02-17 07:09:22.88701+00
20201105A	Add Cascade System Relations	2024-02-17 07:09:22.915867+00
20201105B	Change Webhook URL Type	2024-02-17 07:09:22.923338+00
20210225A	Add Relations Sort Field	2024-02-17 07:09:22.92974+00
20210304A	Remove Locked Fields	2024-02-17 07:09:22.933199+00
20210312A	Webhooks Collections Text	2024-02-17 07:09:22.937731+00
20210331A	Add Refresh Interval	2024-02-17 07:09:22.939908+00
20210415A	Make Filesize Nullable	2024-02-17 07:09:22.945326+00
20210416A	Add Collections Accountability	2024-02-17 07:09:22.949329+00
20210422A	Remove Files Interface	2024-02-17 07:09:22.951844+00
20210506A	Rename Interfaces	2024-02-17 07:09:22.971817+00
20210510A	Restructure Relations	2024-02-17 07:09:23.010807+00
20210518A	Add Foreign Key Constraints	2024-02-17 07:09:23.02384+00
20210519A	Add System Fk Triggers	2024-02-17 07:09:23.041282+00
20210521A	Add Collections Icon Color	2024-02-17 07:09:23.042969+00
20210525A	Add Insights	2024-02-17 07:09:23.05916+00
20210608A	Add Deep Clone Config	2024-02-17 07:09:23.061575+00
20210626A	Change Filesize Bigint	2024-02-17 07:09:23.07382+00
20210716A	Add Conditions to Fields	2024-02-17 07:09:23.076913+00
20210721A	Add Default Folder	2024-02-17 07:09:23.08365+00
20210802A	Replace Groups	2024-02-17 07:09:23.091687+00
20210803A	Add Required to Fields	2024-02-17 07:09:23.094803+00
20210805A	Update Groups	2024-02-17 07:09:23.098188+00
20210805B	Change Image Metadata Structure	2024-02-17 07:09:23.101774+00
20210811A	Add Geometry Config	2024-02-17 07:09:23.103976+00
20210831A	Remove Limit Column	2024-02-17 07:09:23.105398+00
20210903A	Add Auth Provider	2024-02-17 07:09:23.117901+00
20210907A	Webhooks Collections Not Null	2024-02-17 07:09:23.122573+00
20210910A	Move Module Setup	2024-02-17 07:09:23.124605+00
20210920A	Webhooks URL Not Null	2024-02-17 07:09:23.128975+00
20210924A	Add Collection Organization	2024-02-17 07:09:23.1326+00
20210927A	Replace Fields Group	2024-02-17 07:09:23.138235+00
20210927B	Replace M2M Interface	2024-02-17 07:09:23.140766+00
20210929A	Rename Login Action	2024-02-17 07:09:23.142245+00
20211007A	Update Presets	2024-02-17 07:09:23.14623+00
20211009A	Add Auth Data	2024-02-17 07:09:23.147598+00
20211016A	Add Webhook Headers	2024-02-17 07:09:23.149641+00
20211103A	Set Unique to User Token	2024-02-17 07:09:23.153911+00
20211103B	Update Special Geometry	2024-02-17 07:09:23.156058+00
20211104A	Remove Collections Listing	2024-02-17 07:09:23.157849+00
20211118A	Add Notifications	2024-02-17 07:09:23.170293+00
20211211A	Add Shares	2024-02-17 07:09:23.197115+00
20211230A	Add Project Descriptor	2024-02-17 07:09:23.199799+00
20220303A	Remove Default Project Color	2024-02-17 07:09:23.204959+00
20220308A	Add Bookmark Icon and Color	2024-02-17 07:09:23.206668+00
20220314A	Add Translation Strings	2024-02-17 07:09:23.20815+00
20220322A	Rename Field Typecast Flags	2024-02-17 07:09:23.21207+00
20220323A	Add Field Validation	2024-02-17 07:09:23.213925+00
20220325A	Fix Typecast Flags	2024-02-17 07:09:23.21876+00
20220325B	Add Default Language	2024-02-17 07:09:23.224112+00
20220402A	Remove Default Value Panel Icon	2024-02-17 07:09:23.228956+00
20220429A	Add Flows	2024-02-17 07:09:23.254077+00
20220429B	Add Color to Insights Icon	2024-02-17 07:09:23.256479+00
20220429C	Drop Non Null From IP of Activity	2024-02-17 07:09:23.25787+00
20220429D	Drop Non Null From Sender of Notifications	2024-02-17 07:09:23.258922+00
20220614A	Rename Hook Trigger to Event	2024-02-17 07:09:23.260778+00
20220801A	Update Notifications Timestamp Column	2024-02-17 07:09:23.264422+00
20220802A	Add Custom Aspect Ratios	2024-02-17 07:09:23.265704+00
20220826A	Add Origin to Accountability	2024-02-17 07:09:23.267504+00
20230401A	Update Material Icons	2024-02-17 07:09:23.272462+00
20230525A	Add Preview Settings	2024-02-17 07:09:23.274008+00
20230526A	Migrate Translation Strings	2024-02-17 07:09:23.28258+00
20230721A	Require Shares Fields	2024-02-17 07:09:23.287834+00
20230823A	Add Content Versioning	2024-02-17 07:09:23.303401+00
20230927A	Themes	2024-02-17 07:09:23.315465+00
20231009A	Update CSV Fields to Text	2024-02-17 07:09:23.320272+00
20231009B	Update Panel Options	2024-02-17 07:09:23.323329+00
20231010A	Add Extensions	2024-02-17 07:09:23.327637+00
20231215A	Add Focalpoints	2024-02-17 07:21:27.253177+00
\.


--
-- Data for Name: directus_notifications; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_notifications (id, "timestamp", status, recipient, sender, subject, message, collection, item) FROM stdin;
\.


--
-- Data for Name: directus_operations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_operations (id, name, key, type, position_x, position_y, options, resolve, reject, flow, date_created, user_created) FROM stdin;
a5aae15c-6850-4c93-a862-ba72f92fd23b	Run Script	exec_am65z	exec	19	1	{"code":"const slugify = text => {\\n  // Spezifische Ersetzungen für deutsche Umlaute\\n  const replacements = {\\n    'ä': 'ae',\\n    'ö': 'oe',\\n    'ü': 'ue',\\n    'ß': 'ss'\\n  };\\n\\n  // Ersetze Umlaute zuerst\\n  let slug = text.toString().toLowerCase();\\n  slug = slug.replace(/[äöüß]/g, match => replacements[match]);\\n\\n  // Normalisiere Unicode-Zeichen, entferne diakritische Zeichen\\n  slug = slug.normalize('NFD').replace(/[\\\\u0300-\\\\u036f]/g, '');\\n\\n  // Führe weitere Bereinigungen durch\\n  slug = slug\\n    .trim()\\n    .replace(/\\\\s+/g, '-') // Ersetze Leerzeichen durch Bindestriche\\n    .replace(/[^\\\\w-]+/g, '') // Entferne nicht-Wort-Zeichen\\n    .replace(/--+/g, '-'); // Ersetze mehrere Bindestriche durch einen\\n\\n  return slug;\\n};\\n\\nmodule.exports = async function(data) {\\n  // Prüfe, ob bereits ein Slug vorhanden ist\\n  if (data.$trigger.payload.slug) {\\n    // Wenn ja, gebe die vorhandenen Daten unverändert zurück\\n    return data.$trigger.payload;\\n  }\\n\\n  let textToSlugify = data.$trigger.payload.title || data.$trigger.payload.name;\\n\\n  // Wenn weder title noch name übergeben wurden\\n  if (textToSlugify === undefined) return data.$trigger.payload;\\n\\n  // Generiere den Slug, falls noch keiner existiert\\n  const slug = slugify(textToSlugify);\\n  return { ...data.$trigger.payload, slug };\\n};\\n"}	\N	\N	8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	2024-02-17 08:10:11.453+00	2048a671-cc31-48db-b1e6-561d5285837b
10a26cf6-b2b6-40a3-abb7-8523eeef8f6a	getEventData	get_event_data	item-read	19	1	{"collection":"seat","query":{"filter":{"event":{"isNextEvent":"true"}},"fields":["event.date","seller.firstName","seller.lastName","seller.email","seller.city","seller.birthDate","seller.licensePlate","seller.driverName","seller.isActualDriver","seller.driverNationality","seller.marktOrdnung","entrance.name"]},"emitEvents":true}	\N	\N	f3d245a1-709f-4fa7-94a0-b8accc4f2474	2024-02-17 08:17:46.813+00	2048a671-cc31-48db-b1e6-561d5285837b
9fd99bb4-53e2-4e99-9c66-105a900f1b0d	createEvent	create_event	item-create	55	1	{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}	\N	\N	6482fa24-2ebe-4938-ac40-2b3f77f65916	2024-02-17 08:13:06.357+00	2048a671-cc31-48db-b1e6-561d5285837b
7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	timeNow	time_now	exec	37	1	{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"}	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	\N	6482fa24-2ebe-4938-ac40-2b3f77f65916	2024-02-17 08:13:06.398+00	2048a671-cc31-48db-b1e6-561d5285837b
13e9a54e-7558-4f77-9ba2-3c289047fcc7	deactivateAllEvents	deactivate_all_events	item-update	19	1	{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}}	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	\N	6482fa24-2ebe-4938-ac40-2b3f77f65916	2024-02-17 08:13:06.409+00	2048a671-cc31-48db-b1e6-561d5285837b
66a46269-97cf-40ab-954e-9852edd07fd4	Daten aktualisieren	daten_aktualisieren	item-update	19	1	{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":null}	\N	\N	ba4a8d02-534f-4c64-a435-14be72c4af91	2024-02-17 08:15:19.601+00	2048a671-cc31-48db-b1e6-561d5285837b
d3ca4018-6fd9-4ccf-bbfc-1216c669021a	Update Data	item_update_rh8vw	item-update	19	1	{"collection":"seller","emitEvents":true}	\N	\N	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	2024-02-17 10:22:34.452+00	2048a671-cc31-48db-b1e6-561d5285837b
\.


--
-- Data for Name: directus_panels; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_panels (id, dashboard, name, icon, color, show_header, note, type, position_x, position_y, width, height, options, date_created, user_created) FROM stdin;
\.


--
-- Data for Name: directus_permissions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_permissions (id, role, collection, action, permissions, validation, presets, fields) FROM stdin;
1	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_files	create	{}	\N	\N	*
2	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_files	read	{}	\N	\N	*
3	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_files	update	{}	\N	\N	*
4	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_files	delete	{}	\N	\N	*
5	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_dashboards	create	{}	\N	\N	*
6	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_dashboards	read	{}	\N	\N	*
7	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_dashboards	update	{}	\N	\N	*
8	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_dashboards	delete	{}	\N	\N	*
9	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_panels	create	{}	\N	\N	*
10	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_panels	read	{}	\N	\N	*
11	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_panels	update	{}	\N	\N	*
12	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_panels	delete	{}	\N	\N	*
13	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_folders	create	{}	\N	\N	*
14	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_folders	read	{}	\N	\N	*
15	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_folders	update	{}	\N	\N	*
16	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_folders	delete	{}	\N	\N	\N
17	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_users	read	{}	\N	\N	*
18	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_users	update	{"id":{"_eq":"$CURRENT_USER"}}	\N	\N	first_name,last_name,email,password,location,title,description,avatar,language,appearance,theme_light,theme_dark,theme_light_overrides,theme_dark_overrides,tfa_secret
19	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_roles	read	{}	\N	\N	*
20	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_shares	read	{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]}	\N	\N	*
21	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_shares	create	{}	\N	\N	*
22	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_shares	update	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
23	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_shares	delete	{"user_created":{"_eq":"$CURRENT_USER"}}	\N	\N	*
24	7ea3fad0-0160-4355-8a11-0a60f478392a	directus_flows	read	{"trigger":{"_eq":"manual"}}	\N	\N	id,status,name,icon,color,options,trigger
25	7ea3fad0-0160-4355-8a11-0a60f478392a	entrance	read	{}	{}	\N	*
26	7ea3fad0-0160-4355-8a11-0a60f478392a	event	read	{}	{}	\N	*
27	7ea3fad0-0160-4355-8a11-0a60f478392a	seat	read	{}	{}	\N	*
28	7ea3fad0-0160-4355-8a11-0a60f478392a	event	read	{}	{}	\N	*
29	7ea3fad0-0160-4355-8a11-0a60f478392a	event	read	{}	{}	\N	*
30	7ea3fad0-0160-4355-8a11-0a60f478392a	marktOrdnung	read	{}	{}	\N	*
31	7ea3fad0-0160-4355-8a11-0a60f478392a	marktOrdnung	read	{}	{}	\N	*
32	7ea3fad0-0160-4355-8a11-0a60f478392a	event	read	{}	{}	\N	*
34	7ea3fad0-0160-4355-8a11-0a60f478392a	blockedEmail	read	{}	{}	\N	*
35	7ea3fad0-0160-4355-8a11-0a60f478392a	seller	read	{}	{}	\N	*
36	7ea3fad0-0160-4355-8a11-0a60f478392a	pages	read	{}	{}	\N	*
37	7ea3fad0-0160-4355-8a11-0a60f478392a	faq	read	{}	{}	\N	*
38	7ea3fad0-0160-4355-8a11-0a60f478392a	event_entrance	read	{}	{}	\N	*
39	7ea3fad0-0160-4355-8a11-0a60f478392a	event_seller	read	{}	{}	\N	*
40	7ea3fad0-0160-4355-8a11-0a60f478392a	TTA_htmltemplates	read	{}	{}	\N	*
41	7ea3fad0-0160-4355-8a11-0a60f478392a	contact	read	{}	{}	\N	*
43	\N	directus_files	read	{}	{}	\N	*
\.


--
-- Data for Name: directus_presets; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_presets (id, bookmark, "user", role, collection, search, layout, layout_query, layout_options, refresh_interval, filter, icon, color) FROM stdin;
6	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	seller	\N	tabular	{"map":{"limit":1000,"page":1}}	{"map":{"geometryField":"map","cameraOptions":{"center":{"lng":-83.60545719875415,"lat":36.92190313125445},"zoom":4.30693621776182,"bearing":0,"pitch":0,"bbox":[-111.26048922450484,17.00237494245947,-55.950425173002245,52.74164695692414]},"displayTemplate":"{{address}}{{nr}}{{zip}}{{city}}"}}	\N	\N	bookmark	\N
2	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	entrance	\N	\N	{"tabular":{"fields":["status","name","contingent"]}}	{"tabular":{"widths":{"status":32,"name":233.1171875}}}	\N	\N	bookmark	\N
4	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	faq	\N	\N	{"tabular":{"page":1,"fields":["status","question","answer"]}}	{"tabular":{"widths":{"status":35.9375,"question":355.44140625}}}	\N	\N	bookmark	\N
3	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	contact	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
5	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	asfd	\N	\N	{"tabular":{"page":1}}	\N	\N	\N	bookmark	\N
1	\N	2048a671-cc31-48db-b1e6-561d5285837b	\N	event	\N	\N	{"tabular":{"fields":["status","name","date","isNextEvent","activeSubscriptions"],"page":1}}	{"tabular":{"widths":{"status":32,"date":299.07421875}}}	\N	\N	bookmark	\N
\.


--
-- Data for Name: directus_relations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_relations (id, many_collection, many_field, one_collection, one_field, one_collection_field, one_allowed_collections, junction_field, sort_field, one_deselect_action) FROM stdin;
1	blockedEmail	user_created	directus_users	\N	\N	\N	\N	\N	nullify
2	blockedEmail	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
3	contact	user_created	directus_users	\N	\N	\N	\N	\N	nullify
4	contact	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
5	entrance	user_created	directus_users	\N	\N	\N	\N	\N	nullify
6	entrance	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
7	event	user_created	directus_users	\N	\N	\N	\N	\N	nullify
8	event	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
9	event_entrance	entrance_id	entrance	\N	\N	\N	event_id	\N	nullify
10	event_entrance	event_id	event	\N	\N	\N	entrance_id	\N	nullify
11	event_seller	seller_id	seller	\N	\N	\N	event_id	\N	nullify
12	event_seller	event_id	event	\N	\N	\N	seller_id	\N	nullify
13	faq	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
14	faq	user_created	directus_users	\N	\N	\N	\N	\N	nullify
15	marktOrdnung	user_created	directus_users	\N	\N	\N	\N	\N	nullify
16	marktOrdnung	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
17	marktOrdnung	pdf	directus_files	\N	\N	\N	\N	\N	nullify
18	pages	user_created	directus_users	\N	\N	\N	\N	\N	nullify
19	pages	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
20	pages	image	directus_files	\N	\N	\N	\N	\N	nullify
21	seat	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
22	seat	user_created	directus_users	\N	\N	\N	\N	\N	nullify
23	seat	entrance	entrance	\N	\N	\N	\N	\N	nullify
24	seat	event	event	\N	\N	\N	\N	\N	nullify
25	seat	seller	seller	\N	\N	\N	\N	\N	nullify
26	seller	user_updated	directus_users	\N	\N	\N	\N	\N	nullify
27	seller	user_created	directus_users	\N	\N	\N	\N	\N	nullify
\.


--
-- Data for Name: directus_revisions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_revisions (id, activity, collection, item, data, delta, parent, version) FROM stdin;
1	3	directus_settings	1	{"project_color":"#FFD800"}	{"project_color":"#FFD800"}	\N	\N
2	4	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFD800","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFD800"}	\N	\N
3	5	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFD800","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFD800"}	\N	\N
4	6	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFA439","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFA439"}	\N	\N
5	7	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#E35169","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#E35169"}	\N	\N
6	8	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFC23B","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFC23B"}	\N	\N
7	9	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFC23B","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFC23B"}	\N	\N
8	10	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#E35169","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#E35169"}	\N	\N
9	11	directus_roles	7ea3fad0-0160-4355-8a11-0a60f478392a	{"name":"API","admin_access":false,"app_access":true}	{"name":"API","admin_access":false,"app_access":true}	\N	\N
10	12	directus_permissions	1	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_files","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
11	13	directus_permissions	2	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_files","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
12	14	directus_permissions	3	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_files","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
13	15	directus_permissions	4	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_files","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
14	16	directus_permissions	5	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_dashboards","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
15	17	directus_permissions	6	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_dashboards","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
16	18	directus_permissions	7	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_dashboards","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
17	19	directus_permissions	8	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_dashboards","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
18	20	directus_permissions	9	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_panels","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
19	21	directus_permissions	10	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_panels","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
20	22	directus_permissions	11	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_panels","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
21	23	directus_permissions	12	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_panels","action":"delete","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
22	24	directus_permissions	13	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_folders","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
23	25	directus_permissions	14	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_folders","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
24	26	directus_permissions	15	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_folders","action":"update","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
25	27	directus_permissions	16	{"collection":"directus_folders","action":"delete","permissions":{},"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_folders","action":"delete","permissions":{},"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
26	28	directus_permissions	17	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_users","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
27	29	directus_permissions	18	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","appearance","theme_light","theme_dark","theme_light_overrides","theme_dark_overrides","tfa_secret"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_users","action":"update","permissions":{"id":{"_eq":"$CURRENT_USER"}},"fields":["first_name","last_name","email","password","location","title","description","avatar","language","appearance","theme_light","theme_dark","theme_light_overrides","theme_dark_overrides","tfa_secret"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
28	30	directus_permissions	19	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_roles","action":"read","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
29	31	directus_permissions	20	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_shares","action":"read","permissions":{"_or":[{"role":{"_eq":"$CURRENT_ROLE"}},{"role":{"_null":true}}]},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
30	32	directus_permissions	21	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_shares","action":"create","permissions":{},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
31	33	directus_permissions	22	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_shares","action":"update","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
32	34	directus_permissions	23	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_shares","action":"delete","permissions":{"user_created":{"_eq":"$CURRENT_USER"}},"fields":["*"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
33	35	directus_permissions	24	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","status","name","icon","color","options","trigger"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"collection":"directus_flows","action":"read","permissions":{"trigger":{"_eq":"manual"}},"fields":["id","status","name","icon","color","options","trigger"],"role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
34	36	directus_permissions	25	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"entrance","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"entrance","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
35	37	directus_permissions	26	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
36	38	directus_permissions	27	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"seat","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"seat","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
37	39	directus_permissions	28	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
38	40	directus_permissions	29	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
39	41	directus_permissions	30	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"marktOrdnung","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"marktOrdnung","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
40	42	directus_permissions	31	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"marktOrdnung","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"marktOrdnung","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
41	43	directus_permissions	32	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
42	44	directus_permissions	33	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"update","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event","action":"update","fields":["*"],"permissions":{},"validation":{}}	\N	\N
43	46	directus_permissions	34	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"blockedEmail","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"blockedEmail","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
44	47	directus_permissions	35	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"seller","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"seller","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
45	48	directus_permissions	36	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"pages","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"pages","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
46	49	directus_permissions	37	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"faq","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"faq","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
47	50	directus_permissions	38	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event_entrance","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event_entrance","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
48	51	directus_permissions	39	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event_seller","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"event_seller","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
49	52	directus_permissions	40	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"TTA_htmltemplates","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"TTA_htmltemplates","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
50	53	directus_permissions	41	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"contact","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":"7ea3fad0-0160-4355-8a11-0a60f478392a","collection":"contact","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
51	54	directus_users	f338bd04-7a55-45c7-9435-e2b0b6ad1968	{"first_name":"Api","last_name":"Role","email":"api@abteilung.ch","password":"**********","token":"**********","role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	{"first_name":"Api","last_name":"Role","email":"api@abteilung.ch","password":"**********","token":"**********","role":"7ea3fad0-0160-4355-8a11-0a60f478392a"}	\N	\N
52	56	directus_permissions	42	{"role":null,"collection":"directus_files","action":"read"}	{"role":null,"collection":"directus_files","action":"read"}	\N	\N
53	58	directus_permissions	43	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	{"role":null,"collection":"directus_files","action":"read","fields":["*"],"permissions":{},"validation":{}}	\N	\N
54	59	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFD800","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFD800"}	\N	\N
55	60	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFC23B","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":null,"module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"project_color":"#FFC23B"}	\N	\N
56	61	directus_flows	8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	{"name":"slugify","icon":"conversion_path","color":null,"description":"Slugify from a Title of an Article or Post.","status":"active","accountability":"all","trigger":"event","options":{"type":"filter","scope":["items.create","items.update"],"collections":["pages"]}}	{"name":"slugify","icon":"conversion_path","color":null,"description":"Slugify from a Title of an Article or Post.","status":"active","accountability":"all","trigger":"event","options":{"type":"filter","scope":["items.create","items.update"],"collections":["pages"]}}	\N	\N
58	63	directus_flows	8d0398b8-bcab-4609-8b6e-ec7ea6225eb0	{"id":"8d0398b8-bcab-4609-8b6e-ec7ea6225eb0","name":"slugify","icon":"conversion_path","color":null,"description":"Slugify from a Title of an Article or Post.","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["pages"]},"operation":"a5aae15c-6850-4c93-a862-ba72f92fd23b","date_created":"2024-02-17T08:09:52.038Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["a5aae15c-6850-4c93-a862-ba72f92fd23b"]}	{"operation":"a5aae15c-6850-4c93-a862-ba72f92fd23b"}	\N	\N
57	62	directus_operations	a5aae15c-6850-4c93-a862-ba72f92fd23b	{"flow":"8d0398b8-bcab-4609-8b6e-ec7ea6225eb0","position_x":19,"position_y":1,"name":"Run Script","key":"exec_am65z","type":"exec","options":{"code":"const slugify = text => {\\n  // Spezifische Ersetzungen für deutsche Umlaute\\n  const replacements = {\\n    'ä': 'ae',\\n    'ö': 'oe',\\n    'ü': 'ue',\\n    'ß': 'ss'\\n  };\\n\\n  // Ersetze Umlaute zuerst\\n  let slug = text.toString().toLowerCase();\\n  slug = slug.replace(/[äöüß]/g, match => replacements[match]);\\n\\n  // Normalisiere Unicode-Zeichen, entferne diakritische Zeichen\\n  slug = slug.normalize('NFD').replace(/[\\\\u0300-\\\\u036f]/g, '');\\n\\n  // Führe weitere Bereinigungen durch\\n  slug = slug\\n    .trim()\\n    .replace(/\\\\s+/g, '-') // Ersetze Leerzeichen durch Bindestriche\\n    .replace(/[^\\\\w-]+/g, '') // Entferne nicht-Wort-Zeichen\\n    .replace(/--+/g, '-'); // Ersetze mehrere Bindestriche durch einen\\n\\n  return slug;\\n};\\n\\nmodule.exports = async function(data) {\\n  // Prüfe, ob bereits ein Slug vorhanden ist\\n  if (data.$trigger.payload.slug) {\\n    // Wenn ja, gebe die vorhandenen Daten unverändert zurück\\n    return data.$trigger.payload;\\n  }\\n\\n  let textToSlugify = data.$trigger.payload.title || data.$trigger.payload.name;\\n\\n  // Wenn weder title noch name übergeben wurden\\n  if (textToSlugify === undefined) return data.$trigger.payload;\\n\\n  // Generiere den Slug, falls noch keiner existiert\\n  const slug = slugify(textToSlugify);\\n  return { ...data.$trigger.payload, slug };\\n};\\n"}}	{"flow":"8d0398b8-bcab-4609-8b6e-ec7ea6225eb0","position_x":19,"position_y":1,"name":"Run Script","key":"exec_am65z","type":"exec","options":{"code":"const slugify = text => {\\n  // Spezifische Ersetzungen für deutsche Umlaute\\n  const replacements = {\\n    'ä': 'ae',\\n    'ö': 'oe',\\n    'ü': 'ue',\\n    'ß': 'ss'\\n  };\\n\\n  // Ersetze Umlaute zuerst\\n  let slug = text.toString().toLowerCase();\\n  slug = slug.replace(/[äöüß]/g, match => replacements[match]);\\n\\n  // Normalisiere Unicode-Zeichen, entferne diakritische Zeichen\\n  slug = slug.normalize('NFD').replace(/[\\\\u0300-\\\\u036f]/g, '');\\n\\n  // Führe weitere Bereinigungen durch\\n  slug = slug\\n    .trim()\\n    .replace(/\\\\s+/g, '-') // Ersetze Leerzeichen durch Bindestriche\\n    .replace(/[^\\\\w-]+/g, '') // Entferne nicht-Wort-Zeichen\\n    .replace(/--+/g, '-'); // Ersetze mehrere Bindestriche durch einen\\n\\n  return slug;\\n};\\n\\nmodule.exports = async function(data) {\\n  // Prüfe, ob bereits ein Slug vorhanden ist\\n  if (data.$trigger.payload.slug) {\\n    // Wenn ja, gebe die vorhandenen Daten unverändert zurück\\n    return data.$trigger.payload;\\n  }\\n\\n  let textToSlugify = data.$trigger.payload.title || data.$trigger.payload.name;\\n\\n  // Wenn weder title noch name übergeben wurden\\n  if (textToSlugify === undefined) return data.$trigger.payload;\\n\\n  // Generiere den Slug, falls noch keiner existiert\\n  const slug = slugify(textToSlugify);\\n  return { ...data.$trigger.payload, slug };\\n};\\n"}}	58	\N
59	64	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","accountability":"all","trigger":"schedule","options":{"cron":"0 12 * * 4"}}	{"name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","accountability":"all","trigger":"schedule","options":{"cron":"0 12 * * 4"}}	\N	\N
60	65	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}	61	\N
68	73	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	{"name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","accountability":"all","trigger":"schedule","options":{"cron":"5 18 * * 5"}}	{"name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","accountability":"all","trigger":"schedule","options":{"cron":"5 18 * * 5"}}	\N	\N
70	75	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	{"id":"f3d245a1-709f-4fa7-94a0-b8accc4f2474","name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"5 18 * * 5"},"operation":"10a26cf6-b2b6-40a3-abb7-8523eeef8f6a","date_created":"2024-02-17T08:16:47.508Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["10a26cf6-b2b6-40a3-abb7-8523eeef8f6a"]}	{"operation":"10a26cf6-b2b6-40a3-abb7-8523eeef8f6a"}	\N	\N
69	74	directus_operations	10a26cf6-b2b6-40a3-abb7-8523eeef8f6a	{"flow":"f3d245a1-709f-4fa7-94a0-b8accc4f2474","position_x":19,"position_y":1,"name":"getEventData","key":"get_event_data","type":"item-read","options":{"collection":"seat","query":{"filter":{"event":{"isNextEvent":"true"}},"fields":["event.date","seller.firstName","seller.lastName","seller.email","seller.city","seller.birthDate","seller.licensePlate","seller.driverName","seller.isActualDriver","seller.driverNationality","seller.marktOrdnung","entrance.name"]},"emitEvents":true}}	{"flow":"f3d245a1-709f-4fa7-94a0-b8accc4f2474","position_x":19,"position_y":1,"name":"getEventData","key":"get_event_data","type":"item-read","options":{"collection":"seat","query":{"filter":{"event":{"isNextEvent":"true"}},"fields":["event.date","seller.firstName","seller.lastName","seller.email","seller.city","seller.birthDate","seller.licensePlate","seller.driverName","seller.isActualDriver","seller.driverNationality","seller.marktOrdnung","entrance.name"]},"emitEvents":true}}	70	\N
71	76	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	{"id":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","name":"createEvent","key":"create_event","type":"item-create","position_x":55,"position_y":1,"options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}},"resolve":null,"reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.357Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	72	\N
61	66	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":37,"position_y":1,"name":"timeNow","key":"time_now","type":"exec","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}}	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":37,"position_y":1,"name":"timeNow","key":"time_now","type":"exec","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}}	62	\N
63	68	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"id":"6482fa24-2ebe-4938-ac40-2b3f77f65916","name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["13e9a54e-7558-4f77-9ba2-3c289047fcc7","7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","9fd99bb4-53e2-4e99-9c66-105a900f1b0d"]}	{"name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	\N	\N
62	67	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":19,"position_y":1,"name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"is_next_market":"false"}},"reject":null,"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":37,"position_y":1,"name":"timeNow","key":"time_now","type":"exec","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}}}	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":19,"position_y":1,"name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"is_next_market":"false"}},"reject":null,"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":37,"position_y":1,"name":"timeNow","key":"time_now","type":"exec","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","position_x":55,"position_y":1,"name":"createEvent","key":"create_event","type":"item-create","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}}}}}	63	\N
64	69	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","accountability":"all","trigger":"manual","options":{"collections":["event"],"requireSelection":false}}	{"name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","accountability":"all","trigger":"manual","options":{"collections":["event"],"requireSelection":false}}	\N	\N
66	71	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["event"],"requireSelection":false},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4"}	\N	\N
65	70	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	{"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91","position_x":19,"position_y":1,"name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","options":{"collection":"event","permissions":"$full","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}}}	{"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91","position_x":19,"position_y":1,"name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","options":{"collection":"event","permissions":"$full","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}}}	66	\N
67	72	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 18 * * 5"},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 18 * * 5"}}	\N	\N
115	120	faq	10	{"answer":"<p>Nein. Sie m&uuml;ssen eigenes Standmaterial mitbringen. Zelte oder Pavillons sind erlaubt.</p>","question":"Können Sie Standmaterial bei uns mieten?"}	{"answer":"<p>Nein. Sie m&uuml;ssen eigenes Standmaterial mitbringen. Zelte oder Pavillons sind erlaubt.</p>","question":"Können Sie Standmaterial bei uns mieten?"}	\N	\N
72	77	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	{"id":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","name":"timeNow","key":"time_now","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.398Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"resolve":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	73	\N
74	79	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"id":"6482fa24-2ebe-4938-ac40-2b3f77f65916","name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["13e9a54e-7558-4f77-9ba2-3c289047fcc7","7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","9fd99bb4-53e2-4e99-9c66-105a900f1b0d"]}	{"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7"}	\N	\N
73	78	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	{"id":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","position_x":19,"position_y":1,"options":{"collection":"event","emitEvents":true,"payload":{"isNextMarket":"false"}},"resolve":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.409Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"isNextMarket":"false"}},"resolve":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	74	\N
75	80	directus_operations	9fd99bb4-53e2-4e99-9c66-105a900f1b0d	{"id":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","name":"createEvent","key":"create_event","type":"item-create","position_x":55,"position_y":1,"options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"{{time_now}}"}},"resolve":null,"reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.357Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	76	\N
76	81	directus_operations	7f381d0e-c06c-4c2d-a80b-3f9c836a82e8	{"id":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","name":"timeNow","key":"time_now","type":"exec","position_x":37,"position_y":1,"options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"},"resolve":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.398Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"resolve":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	77	\N
78	83	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"id":"6482fa24-2ebe-4938-ac40-2b3f77f65916","name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["13e9a54e-7558-4f77-9ba2-3c289047fcc7","7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","9fd99bb4-53e2-4e99-9c66-105a900f1b0d"]}	{"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7"}	\N	\N
77	82	directus_operations	13e9a54e-7558-4f77-9ba2-3c289047fcc7	{"id":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","position_x":19,"position_y":1,"options":{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}},"resolve":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","reject":null,"flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916","date_created":"2024-02-17T08:13:06.409Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"name":"deactivateAllEvents","key":"deactivate_all_events","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}},"resolve":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","flow":"6482fa24-2ebe-4938-ac40-2b3f77f65916"}	78	\N
79	84	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"id":"6482fa24-2ebe-4938-ac40-2b3f77f65916","name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["13e9a54e-7558-4f77-9ba2-3c289047fcc7","7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","9fd99bb4-53e2-4e99-9c66-105a900f1b0d"]}	{"name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]}}	\N	\N
80	85	event	1	{"isNextMarket":"true","name":"Markt","date":"2024-02-24T06:00:00"}	{"isNextMarket":"true","name":"Markt","date":"2024-02-24T06:00:00"}	\N	\N
81	86	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"steps":[{"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","key":"deactivate_all_events","status":"resolve","options":{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}}},{"operation":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","key":"time_now","status":"resolve","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"}},{"operation":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","key":"create_event","status":"resolve","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"2024-02-24T06:00:00.000Z"}}}],"data":{"$trigger":{"path":"/trigger/6482fa24-2ebe-4938-ac40-2b3f77f65916","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":[1],"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"deactivate_all_events":[],"time_now":"2024-02-24T06:00:00.000Z","create_event":[1]}}	\N	\N	\N
82	87	event	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T08:20:46.480Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:21:27.467Z","name":"Markt","date":"2024-02-24T06:00:00","isNextEvent":false,"activeSubscriptions":true}	{"isNextEvent":"false","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:21:27.467Z"}	\N	\N
83	88	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"steps":[{"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","key":"deactivate_all_events","status":"resolve","options":{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}}},{"operation":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","key":"time_now","status":"resolve","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"}},{"operation":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","key":"create_event","status":"reject","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"2024-02-24T06:00:00.000Z"}}}],"data":{"$trigger":{"path":"/trigger/6482fa24-2ebe-4938-ac40-2b3f77f65916","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":{"name":"DirectusError","message":"Value for field \\"date\\" in collection \\"event\\" has to be unique."},"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"deactivate_all_events":[1],"time_now":"2024-02-24T06:00:00.000Z","create_event":{"name":"DirectusError","message":"Value for field \\"date\\" in collection \\"event\\" has to be unique."}}}	\N	\N	\N
84	89	event	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T08:20:46.480Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:21:32.473Z","name":"Markt","date":"2024-02-24T06:00:00","isNextEvent":false,"activeSubscriptions":true}	{"isNextEvent":"false","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:21:32.473Z"}	\N	\N
85	90	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"steps":[{"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","key":"deactivate_all_events","status":"resolve","options":{"collection":"event","emitEvents":true,"payload":{"isNextEvent":"false"}}},{"operation":"7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","key":"time_now","status":"resolve","options":{"code":"module.exports = async function(data) {\\n    // Erstellt ein neues Datum für \\"jetzt\\"\\n    const now = new Date();\\n    \\n    // Berechnet, wie viele Tage bis zum nächsten Samstag fehlen\\n    const daysUntilNextSaturday = (6 - now.getDay() + 7) % 7 || 7;\\n    \\n    // Erstellt ein neues Datum für den nächsten Samstag\\n    const nextSaturday = new Date(now);\\n    nextSaturday.setDate(now.getDate() + daysUntilNextSaturday);\\n    \\n    // Setzt die Zeit auf 6:00 Uhr\\n    nextSaturday.setHours(6, 0, 0, 0);\\n    \\n    // Gibt das Datum als ISO-String zurück\\n    return nextSaturday.toISOString();\\n}\\n"}},{"operation":"9fd99bb4-53e2-4e99-9c66-105a900f1b0d","key":"create_event","status":"reject","options":{"collection":"event","payload":{"isNextMarket":"true","name":"Markt","date":"2024-02-24T06:00:00.000Z"}}}],"data":{"$trigger":{"path":"/trigger/6482fa24-2ebe-4938-ac40-2b3f77f65916","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":{"name":"DirectusError","message":"Value for field \\"date\\" in collection \\"event\\" has to be unique."},"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"deactivate_all_events":[1],"time_now":"2024-02-24T06:00:00.000Z","create_event":{"name":"DirectusError","message":"Value for field \\"date\\" in collection \\"event\\" has to be unique."}}}	\N	\N	\N
86	91	directus_flows	6482fa24-2ebe-4938-ac40-2b3f77f65916	{"id":"6482fa24-2ebe-4938-ac40-2b3f77f65916","name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"},"operation":"13e9a54e-7558-4f77-9ba2-3c289047fcc7","date_created":"2024-02-17T08:11:12.749Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["13e9a54e-7558-4f77-9ba2-3c289047fcc7","7f381d0e-c06c-4c2d-a80b-3f9c836a82e8","9fd99bb4-53e2-4e99-9c66-105a900f1b0d"]}	{"name":"1. Create Next Event","icon":"start","color":"#2ECDA7","description":"Creates next Event. Every Thursday at 12.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 12 * * 4"}}	\N	\N
87	92	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]}}	\N	\N
88	93	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"steps":[{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","key":"daten_aktualisieren","status":"resolve","options":{"collection":"event","permissions":"$full","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}}}],"data":{"$trigger":{"path":"/trigger/ba4a8d02-534f-4c64-a435-14be72c4af91","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":[],"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"daten_aktualisieren":[]}}	\N	\N	\N
90	95	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4"}	\N	\N
89	94	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	{"id":"66a46269-97cf-40ab-954e-9852edd07fd4","name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","position_x":19,"position_y":1,"options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}},"resolve":null,"reject":null,"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91","date_created":"2024-02-17T08:15:19.601Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}},"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91"}	90	\N
91	96	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"steps":[{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","key":"daten_aktualisieren","status":"resolve","options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":{"filter":{"isNextEvent":{"_eq":"true"}}}}}],"data":{"$trigger":{"path":"/trigger/ba4a8d02-534f-4c64-a435-14be72c4af91","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":[],"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"daten_aktualisieren":[]}}	\N	\N	\N
92	97	directus_operations	66a46269-97cf-40ab-954e-9852edd07fd4	{"id":"66a46269-97cf-40ab-954e-9852edd07fd4","name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","position_x":19,"position_y":1,"options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":null},"resolve":null,"reject":null,"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91","date_created":"2024-02-17T08:15:19.601Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"name":"Daten aktualisieren","key":"daten_aktualisieren","type":"item-update","options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":null},"flow":"ba4a8d02-534f-4c64-a435-14be72c4af91"}	93	\N
93	98	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"manual","accountability":"all","options":{"requireSelection":false,"collections":["event"]},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4"}	\N	\N
94	99	event	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T08:20:46.480Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:23:37.786Z","name":"Markt","date":"2024-02-24T06:00:00","isNextEvent":false,"activeSubscriptions":false}	{"activeSubscriptions":"false","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:23:37.786Z"}	\N	\N
95	100	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"steps":[{"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","key":"daten_aktualisieren","status":"resolve","options":{"collection":"event","emitEvents":true,"payload":{"activeSubscriptions":"false"},"query":null}}],"data":{"$trigger":{"path":"/trigger/ba4a8d02-534f-4c64-a435-14be72c4af91","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":[1],"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"daten_aktualisieren":[1]}}	\N	\N	\N
96	101	directus_flows	ba4a8d02-534f-4c64-a435-14be72c4af91	{"id":"ba4a8d02-534f-4c64-a435-14be72c4af91","name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 18 * * 5"},"operation":"66a46269-97cf-40ab-954e-9852edd07fd4","date_created":"2024-02-17T08:14:44.156Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["66a46269-97cf-40ab-954e-9852edd07fd4"]}	{"name":"2. Close Subscriptions","icon":"block","color":"#E35169","description":"Closes subscriptions by Friday, 18.00.","status":"active","trigger":"schedule","accountability":"all","options":{"cron":"0 18 * * 5"}}	\N	\N
97	102	event	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T08:20:46.480Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:24:13.318Z","name":"Markt","date":"2024-02-24T06:00:00","isNextEvent":true,"activeSubscriptions":false}	{"isNextEvent":true,"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:24:13.318Z"}	\N	\N
98	103	event	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T08:20:46.480Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:24:22.072Z","name":"Markt","date":"2024-02-24T06:00:00","isNextEvent":true,"activeSubscriptions":true}	{"activeSubscriptions":true,"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T08:24:22.072Z"}	\N	\N
99	104	entrance	1	{"status":"published","name":"Ankerstrasse"}	{"status":"published","name":"Ankerstrasse"}	\N	\N
100	105	entrance	2	{"status":"published","name":"Kanzleistrasse"}	{"status":"published","name":"Kanzleistrasse"}	\N	\N
101	106	entrance	3	{"status":"published","name":"Langstrasse"}	{"status":"published","name":"Langstrasse"}	\N	\N
102	107	entrance	4	{"status":"published","name":"Stauffacherstrasse"}	{"status":"published","name":"Stauffacherstrasse"}	\N	\N
103	108	blockedEmail	1	{"email":"gaga@super.com"}	{"email":"gaga@super.com"}	\N	\N
104	109	marktOrdnung	1	{"status":"published"}	{"status":"published"}	\N	\N
105	110	directus_fields	117	{"sort":7,"interface":"map","special":null,"options":{"defaultView":{"center":{"lng":-40.06037182553442,"lat":2.842170943040401e-14},"zoom":-0.3706434003783813,"bearing":0,"pitch":0},"geometryType":"Point"},"collection":"contact","field":"map"}	{"sort":7,"interface":"map","special":null,"options":{"defaultView":{"center":{"lng":-40.06037182553442,"lat":2.842170943040401e-14},"zoom":-0.3706434003783813,"bearing":0,"pitch":0},"geometryType":"Point"},"collection":"contact","field":"map"}	\N	\N
106	111	faq	1	{"question":"Wie reservieren Sie einen Standplatz?","answer":"<p>Eine Reservation ist nicht m&ouml;glich. Sie haben zwei M&ouml;glichkeiten, wie Sie an unserem Flohmarkt teilnehmen k&ouml;nnen. Sie melden sich elektronisch an und werden f&uuml;r den Einlass um 06:40 Uhr registriert. Oder Sie nutzen den freien Einlass, der ohne vorg&auml;ngige Anmeldung erfolgt.</p>"}	{"question":"Wie reservieren Sie einen Standplatz?","answer":"<p>Eine Reservation ist nicht m&ouml;glich. Sie haben zwei M&ouml;glichkeiten, wie Sie an unserem Flohmarkt teilnehmen k&ouml;nnen. Sie melden sich elektronisch an und werden f&uuml;r den Einlass um 06:40 Uhr registriert. Oder Sie nutzen den freien Einlass, der ohne vorg&auml;ngige Anmeldung erfolgt.</p>"}	\N	\N
107	112	faq	2	{"question":"Wann können Sie sich elektronisch anmelden?","answer":"<p>Sie k&ouml;nnen sich ab Donnerstag 12:00 Uhr bis Freitag 18:00 Uhr elektronisch auf unserer Webseite anmelden. Mit der Anmeldungsbest&auml;tigung erhalten Sie eine Einlass-Nummer. Am entsprechenden Markttag werden Sie ab 06:40 Uhr, an dem von Ihnen bei der Anmeldung gew&auml;hlten Tor, eingelassen. Beim Einlass m&uuml;ssen Sie Ihren Ausweis vorzeigen.</p>"}	{"question":"Wann können Sie sich elektronisch anmelden?","answer":"<p>Sie k&ouml;nnen sich ab Donnerstag 12:00 Uhr bis Freitag 18:00 Uhr elektronisch auf unserer Webseite anmelden. Mit der Anmeldungsbest&auml;tigung erhalten Sie eine Einlass-Nummer. Am entsprechenden Markttag werden Sie ab 06:40 Uhr, an dem von Ihnen bei der Anmeldung gew&auml;hlten Tor, eingelassen. Beim Einlass m&uuml;ssen Sie Ihren Ausweis vorzeigen.</p>"}	\N	\N
108	113	faq	3	{"question":"Alle Einlass-Nummern für den besagten Samstag sind ausverkauft.","answer":"<p>Wir vergeben nur eine begrenzte Anzahl an Einlass-Nummern, damit Verk&auml;uferInnen, die sich nicht elektronisch anmelden k&ouml;nnen, die M&ouml;glichkeit haben teilzunehmen.</p>"}	{"question":"Alle Einlass-Nummern für den besagten Samstag sind ausverkauft.","answer":"<p>Wir vergeben nur eine begrenzte Anzahl an Einlass-Nummern, damit Verk&auml;uferInnen, die sich nicht elektronisch anmelden k&ouml;nnen, die M&ouml;glichkeit haben teilzunehmen.</p>"}	\N	\N
109	114	faq	4	{"question":"Wann genau ist der Einlass und wo?","answer":"<p>Der Einlass f&uuml;r Verk&auml;uferInnen mit Einlass-Nummer ist ab 06:40 Uhr. Der Einlass f&uuml;r Verk&auml;uferInnen ohne Einlass-Nummer ist ab 07:20 Uhr. Der Einlass erfolgt an vier Toren (Kanzlei-, Lang-, Stauffacher- und Ankerstrasse).</p>"}	{"question":"Wann genau ist der Einlass und wo?","answer":"<p>Der Einlass f&uuml;r Verk&auml;uferInnen mit Einlass-Nummer ist ab 06:40 Uhr. Der Einlass f&uuml;r Verk&auml;uferInnen ohne Einlass-Nummer ist ab 07:20 Uhr. Der Einlass erfolgt an vier Toren (Kanzlei-, Lang-, Stauffacher- und Ankerstrasse).</p>"}	\N	\N
110	115	faq	5	{"question":"Wie funktioniert der Einlass mit Einlass-Nummer?","answer":"<p>Alle Verk&auml;uferInnen, die sich f&uuml;r den Einlass registriert haben, erhalten eine Einlass-Nummer und stellen sich der Nummer nach beim gew&auml;hlten Tor an. Wenn Sie zu zweit verkaufen, brauchen beide Verkaufspersonen eine Einlass-Nummer. Erfolgt dann der Einlass ab 06:40 Uhr, kontrollieren unsere Mitarbeitenden Ihren Personenausweis (Identit&auml;tskarte, Pass, Ausl&auml;nderausweis) und Ihre Einlass-Nummer. Bitte beachten Sie, dass Sie ohne Ihren Ausweis nicht eingelassen werden. Nun k&ouml;nnen Sie Ihren Standplatz belegen.</p>"}	{"question":"Wie funktioniert der Einlass mit Einlass-Nummer?","answer":"<p>Alle Verk&auml;uferInnen, die sich f&uuml;r den Einlass registriert haben, erhalten eine Einlass-Nummer und stellen sich der Nummer nach beim gew&auml;hlten Tor an. Wenn Sie zu zweit verkaufen, brauchen beide Verkaufspersonen eine Einlass-Nummer. Erfolgt dann der Einlass ab 06:40 Uhr, kontrollieren unsere Mitarbeitenden Ihren Personenausweis (Identit&auml;tskarte, Pass, Ausl&auml;nderausweis) und Ihre Einlass-Nummer. Bitte beachten Sie, dass Sie ohne Ihren Ausweis nicht eingelassen werden. Nun k&ouml;nnen Sie Ihren Standplatz belegen.</p>"}	\N	\N
111	116	faq	6	{"answer":"<p>Die Platzkapazit&auml;t ist so berechnet, dass gen&uuml;gend Belegungsm&ouml;glichkeiten f&uuml;r Verk&auml;uferInnen ohne Anmeldung bestehen. Bei grossem Andrang kann es vorkommen, dass die Platzkapazit&auml;t ersch&ouml;pft ist.</p>","question":"Hat es immer freie Standplätze?"}	{"answer":"<p>Die Platzkapazit&auml;t ist so berechnet, dass gen&uuml;gend Belegungsm&ouml;glichkeiten f&uuml;r Verk&auml;uferInnen ohne Anmeldung bestehen. Bei grossem Andrang kann es vorkommen, dass die Platzkapazit&auml;t ersch&ouml;pft ist.</p>","question":"Hat es immer freie Standplätze?"}	\N	\N
112	117	faq	7	{"question":"Wie belegen Sie Ihren Standplatz?","answer":"<p>Nehmen Sie eine Matte oder ein Tuch in der gew&uuml;nschten Standgr&ouml;sse mit. Markieren Sie damit den Standort Ihres Standes. Bitte beachten Sie, dass beim Einlass ab 06:40 bzw. 07:20 Uhr noch keine Waren hinein transportiert werden d&uuml;rfen. Die Ware d&uuml;rfen Sie erst reintransportieren, nachdem Sie Ihren Standplatz belegt haben.</p>"}	{"question":"Wie belegen Sie Ihren Standplatz?","answer":"<p>Nehmen Sie eine Matte oder ein Tuch in der gew&uuml;nschten Standgr&ouml;sse mit. Markieren Sie damit den Standort Ihres Standes. Bitte beachten Sie, dass beim Einlass ab 06:40 bzw. 07:20 Uhr noch keine Waren hinein transportiert werden d&uuml;rfen. Die Ware d&uuml;rfen Sie erst reintransportieren, nachdem Sie Ihren Standplatz belegt haben.</p>"}	\N	\N
113	118	faq	8	{"question":"Wieviel kostet Sie ein Stand?","answer":"<p>Bis 6m<sup>2</sup> kosten Fr. 20.&mdash;. Eine detaillierte Aufstellung der Kosten finden Sie in der Marktordnung.</p>"}	{"question":"Wieviel kostet Sie ein Stand?","answer":"<p>Bis 6m<sup>2</sup> kosten Fr. 20.&mdash;. Eine detaillierte Aufstellung der Kosten finden Sie in der Marktordnung.</p>"}	\N	\N
114	119	faq	9	{"answer":"<p>Die St&auml;nde d&uuml;rfen auf dem Kiesbelag des Areals aufgestellt werden. Beachten Sie die vorgegebenen Absperrungen von unseren Mitarbeitenden. Sie finden eine Zeichnung des Areals hier.</p>","question":"Wo dürfen Sie Ihren Stand aufstellen?"}	{"answer":"<p>Die St&auml;nde d&uuml;rfen auf dem Kiesbelag des Areals aufgestellt werden. Beachten Sie die vorgegebenen Absperrungen von unseren Mitarbeitenden. Sie finden eine Zeichnung des Areals hier.</p>","question":"Wo dürfen Sie Ihren Stand aufstellen?"}	\N	\N
116	121	faq	11	{"question":"Dürfen Sie mit dem Auto reinfahren?","answer":"<p>Ja. Die Einfahrt ist am Kanzleitor. Bei der Anmeldung im Internet m&uuml;ssen Sie angeben, ob Sie mit dem Auto reinfahren. Der Auto-Einlass erfolgt, sobald der Einlass an den vier Toren abgeschlossen ist. Auch hier ist zwingend, dass Sie den Auto-Einlass-Schein und Ihren pers&ouml;nlichen Ausweis vorzeigen. Ohne diese Angaben d&uuml;rfen Sie nicht ausladen und werden von unseren Mitarbeitenden zur direkten Ausfahrt angewiesen. Wenn Sie Wartezeiten, Stau und Parkplatzprobleme vermeiden wollen, empfehlen wir Ihnen, die Ware vorher auszuladen, auf dem Trottoir zu deponieren bis der Einlass erfolgt und mit Sackrollis, Anh&auml;nger oder Schubkarren zu transportieren. Es sind nur Fahrzeuge mit einer L&auml;nge von 5.50m und ohne Anh&auml;nger und Hebeb&uuml;hne erlaubt.</p>"}	{"question":"Dürfen Sie mit dem Auto reinfahren?","answer":"<p>Ja. Die Einfahrt ist am Kanzleitor. Bei der Anmeldung im Internet m&uuml;ssen Sie angeben, ob Sie mit dem Auto reinfahren. Der Auto-Einlass erfolgt, sobald der Einlass an den vier Toren abgeschlossen ist. Auch hier ist zwingend, dass Sie den Auto-Einlass-Schein und Ihren pers&ouml;nlichen Ausweis vorzeigen. Ohne diese Angaben d&uuml;rfen Sie nicht ausladen und werden von unseren Mitarbeitenden zur direkten Ausfahrt angewiesen. Wenn Sie Wartezeiten, Stau und Parkplatzprobleme vermeiden wollen, empfehlen wir Ihnen, die Ware vorher auszuladen, auf dem Trottoir zu deponieren bis der Einlass erfolgt und mit Sackrollis, Anh&auml;nger oder Schubkarren zu transportieren. Es sind nur Fahrzeuge mit einer L&auml;nge von 5.50m und ohne Anh&auml;nger und Hebeb&uuml;hne erlaubt.</p>"}	\N	\N
117	122	faq	12	{"question":"Wo können Sie parkieren?","answer":"<p>Die Parkpl&auml;tze im Umkreis des Flohmarktes sind rar. Eine gute M&ouml;glichkeit ist eine &laquo;Tageskarte f&uuml;r unbeschr&auml;nktes Parkieren in blauen Zonen&raquo;.</p>"}	{"question":"Wo können Sie parkieren?","answer":"<p>Die Parkpl&auml;tze im Umkreis des Flohmarktes sind rar. Eine gute M&ouml;glichkeit ist eine &laquo;Tageskarte f&uuml;r unbeschr&auml;nktes Parkieren in blauen Zonen&raquo;.</p>"}	\N	\N
119	124	faq	14	{"question":"Wie präsentieren Sie Ihre Ware am besten?","answer":"<p>Wer seine Waren einfach auf dem Boden ausbreitet, macht es K&auml;uferInnen recht schwer, das Angebot anzuschauen. Wir empfehlen Ihnen leicht transportierbare Tischsysteme, wie Campingtisch oder Tischsysteme bestehend aus Holzb&ouml;cken und Platten, Kleiderst&auml;nder f&uuml;r Kleider, Kisten und Kartonschachteln.</p>"}	{"question":"Wie präsentieren Sie Ihre Ware am besten?","answer":"<p>Wer seine Waren einfach auf dem Boden ausbreitet, macht es K&auml;uferInnen recht schwer, das Angebot anzuschauen. Wir empfehlen Ihnen leicht transportierbare Tischsysteme, wie Campingtisch oder Tischsysteme bestehend aus Holzb&ouml;cken und Platten, Kleiderst&auml;nder f&uuml;r Kleider, Kisten und Kartonschachteln.</p>"}	\N	\N
123	128	directus_collections	marktOrdnung	{"collection":"marktOrdnung","icon":"sim_card_download","note":null,"display_template":"Marktordnung","hidden":false,"singleton":true,"translations":[{"language":"de-DE","translation":"Marktordnung","singular":"Marktordnung","plural":"Marktordnung"}],"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Settings","collapse":"open","preview_url":null,"versioning":false}	{"display_template":"Marktordnung"}	\N	\N
118	123	faq	13	{"question":"Dürfen Sie Abfälle auf dem Platz liegenlassen?","answer":"<p>Auf keinen Fall. Die Abfallentsorgung ist sehr teuer und schl&auml;gt sich auf die Standplatzpreise nieder. An der Kasse k&ouml;nnen Sie jedoch f&uuml;r Fr. 2.&mdash; Abfalls&auml;cke kaufen und ab 15:30 Uhr dann beim Eingang Kanzlei deponieren.</p>"}	{"question":"Dürfen Sie Abfälle auf dem Platz liegenlassen?","answer":"<p>Auf keinen Fall. Die Abfallentsorgung ist sehr teuer und schl&auml;gt sich auf die Standplatzpreise nieder. An der Kasse k&ouml;nnen Sie jedoch f&uuml;r Fr. 2.&mdash; Abfalls&auml;cke kaufen und ab 15:30 Uhr dann beim Eingang Kanzlei deponieren.</p>"}	\N	\N
120	125	faq	15	{"question":"Wo bezahlen Sie den Stand?","answer":"<p>Die Kasse befindet sich in der Spielbaracke, beim Tor Langstrasse, ab 08:00 Uhr bis 11.00 Uhr. Je fr&uuml;her Sie bezahlen, desto k&uuml;rzer ist die Wartezeit vor der Kasse.</p>"}	{"question":"Wo bezahlen Sie den Stand?","answer":"<p>Die Kasse befindet sich in der Spielbaracke, beim Tor Langstrasse, ab 08:00 Uhr bis 11.00 Uhr. Je fr&uuml;her Sie bezahlen, desto k&uuml;rzer ist die Wartezeit vor der Kasse.</p>"}	\N	\N
121	126	faq	16	{"question":"Was passiert, wenn Sie die Standfläche zu klein ausgemessen haben?","answer":"<p>Wir messen die Standfl&auml;che nach. Auch wenn das Standmass nur 10cm gr&ouml;sser ist als bezahlt, k&ouml;nnen wir keine Kulanz walten lassen und werden Ihnen nebst der Differenz eine Geb&uuml;hr von Fr. 20.&mdash; verrechnen. Runden Sie also grossz&uuml;gig auf.</p>"}	{"question":"Was passiert, wenn Sie die Standfläche zu klein ausgemessen haben?","answer":"<p>Wir messen die Standfl&auml;che nach. Auch wenn das Standmass nur 10cm gr&ouml;sser ist als bezahlt, k&ouml;nnen wir keine Kulanz walten lassen und werden Ihnen nebst der Differenz eine Geb&uuml;hr von Fr. 20.&mdash; verrechnen. Runden Sie also grossz&uuml;gig auf.</p>"}	\N	\N
122	127	faq	17	{"question":"Wo können Sie sich informieren?","answer":"<p>Am Samstag vor Ort bei unseren Mitarbeitenden mit orangen Westen.</p>"}	{"question":"Wo können Sie sich informieren?","answer":"<p>Am Samstag vor Ort bei unseren Mitarbeitenden mit orangen Westen.</p>"}	\N	\N
124	130	directus_collections	marktOrdnung	{"collection":"marktOrdnung","icon":"sim_card_download","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":[{"language":"de-DE","translation":"Marktordnung","singular":"Marktordnung","plural":"Marktordnung"}],"archive_field":"status","archive_app_filter":true,"archive_value":"archived","unarchive_value":"draft","sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":4,"group":"Settings","collapse":"open","preview_url":null,"versioning":false}	{"display_template":null}	\N	\N
125	131	directus_collections	contact	{"collection":"contact","icon":"person_pin","note":null,"display_template":null,"hidden":false,"singleton":true,"translations":null,"archive_field":null,"archive_app_filter":true,"archive_value":null,"unarchive_value":null,"sort_field":null,"accountability":"all","color":null,"item_duplication_fields":null,"sort":null,"group":null,"collapse":"open","preview_url":null,"versioning":false}	{"singleton":true}	\N	\N
126	132	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFC23B","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":"pk.eyJ1IjoiYWJ0ZWlsdW5nIiwiYSI6ImNsbWozejBqNTAwNzQybW9vdWltOWtobW0ifQ.0h43xcEFQU3P_6VHJsLtDA","module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"mapbox_key":"pk.eyJ1IjoiYWJ0ZWlsdW5nIiwiYSI6ImNsbWozejBqNTAwNzQybW9vdWltOWtobW0ifQ.0h43xcEFQU3P_6VHJsLtDA"}	\N	\N
127	133	contact	1	{"address":"<p>Flohmarkt Kanzlei<br>Kanzleistrasse 56<br>8004 Z&uuml;rich</p>"}	{"address":"<p>Flohmarkt Kanzlei<br>Kanzleistrasse 56<br>8004 Z&uuml;rich</p>"}	\N	\N
128	134	directus_flows	4e9154a4-9417-4fa0-93ff-31c2fe4b63f8	{"name":"to PDF","icon":"bolt","color":null,"description":"asf","status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update"],"collections":["event"]}}	{"name":"to PDF","icon":"bolt","color":null,"description":"asf","status":"active","accountability":"all","trigger":"event","options":{"type":"action","scope":["items.create","items.update"],"collections":["event"]}}	\N	\N
129	135	directus_extensions	directus-extension-texttoanything	{"name":"directus-extension-texttoanything","enabled":false}	{"enabled":false}	\N	\N
130	136	directus_fields	118	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"asfd"}	{"sort":1,"hidden":true,"interface":"input","readonly":true,"field":"id","collection":"asfd"}	\N	\N
131	137	directus_collections	asfd	{"singleton":false,"collection":"asfd"}	{"singleton":false,"collection":"asfd"}	\N	\N
132	138	directus_fields	119	{"sort":2,"interface":"flow2pdf-interface","special":["alias","no-data"],"collection":"asfd","field":"interface-nvhste"}	{"sort":2,"interface":"flow2pdf-interface","special":["alias","no-data"],"collection":"asfd","field":"interface-nvhste"}	\N	\N
133	139	directus_fields	119	{"id":119,"collection":"asfd","field":"interface-nvhste","special":["alias","no-data"],"interface":"flow2pdf-interface","options":{"flow_id":"printParticipants"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"asfd","field":"interface-nvhste","special":["alias","no-data"],"interface":"flow2pdf-interface","options":{"flow_id":"printParticipants"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
134	140	directus_fields	119	{"id":119,"collection":"asfd","field":"interface-nvhste","special":["alias","no-data"],"interface":"flow2pdf-interface","options":{"flow_id":"downloadParticipants","behavior":"download"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"asfd","field":"interface-nvhste","special":["alias","no-data"],"interface":"flow2pdf-interface","options":{"flow_id":"downloadParticipants","behavior":"download"},"display":null,"display_options":null,"readonly":false,"hidden":false,"sort":2,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
135	141	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	{"id":"f3d245a1-709f-4fa7-94a0-b8accc4f2474","name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","trigger":"manual","accountability":"all","options":{},"operation":"10a26cf6-b2b6-40a3-abb7-8523eeef8f6a","date_created":"2024-02-17T08:16:47.508Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["10a26cf6-b2b6-40a3-abb7-8523eeef8f6a"]}	{"name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","trigger":"manual","accountability":"all","options":{}}	\N	\N
136	142	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	{"id":"f3d245a1-709f-4fa7-94a0-b8accc4f2474","name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["event"],"requireSelection":false},"operation":"10a26cf6-b2b6-40a3-abb7-8523eeef8f6a","date_created":"2024-02-17T08:16:47.508Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["10a26cf6-b2b6-40a3-abb7-8523eeef8f6a"]}	{"name":"3. Export Attendance List","icon":"checklist","color":null,"description":"Get Seats for next Event every Friday 18:05.","status":"active","trigger":"manual","accountability":"all","options":{"collections":["event"],"requireSelection":false}}	\N	\N
137	143	directus_flows	f3d245a1-709f-4fa7-94a0-b8accc4f2474	{"steps":[{"operation":"10a26cf6-b2b6-40a3-abb7-8523eeef8f6a","key":"get_event_data","status":"resolve","options":{"collection":"seat","query":{"filter":{"event":{"isNextEvent":"true"}},"fields":["event.date","seller.firstName","seller.lastName","seller.email","seller.city","seller.birthDate","seller.licensePlate","seller.driverName","seller.isActualDriver","seller.driverNationality","seller.marktOrdnung","entrance.name"]},"emitEvents":true}}],"data":{"$trigger":{"path":"/trigger/f3d245a1-709f-4fa7-94a0-b8accc4f2474","query":{},"body":{"collection":"event"},"method":"POST","headers":{"host":"0.0.0.0:8055","connection":"keep-alive","content-length":"22","accept":"application/json, text/plain, */*","authorization":"--redacted--","user-agent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","content-type":"application/json","origin":"http://0.0.0.0:8055","referer":"http://0.0.0.0:8055/admin/content/event","accept-encoding":"gzip, deflate","accept-language":"de,en;q=0.9,de-DE;q=0.8,en-US;q=0.7,nb;q=0.6,fr;q=0.5,it;q=0.4,la;q=0.3,lb;q=0.2","cookie":"--redacted--"}},"$last":[],"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"get_event_data":[]}}	\N	\N	\N
138	144	seat	1	{"event":1,"entrance":2}	{"event":1,"entrance":2}	\N	\N
139	145	seller	1	{"status":"published","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","nationality":"Schweiz","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","isActualDriver":true,"driverNationality":"Schweiz","marktOrdnung":true}	{"status":"published","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","nationality":"Schweiz","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","isActualDriver":true,"driverNationality":"Schweiz","marktOrdnung":true}	\N	\N
140	146	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","accountability":"all","trigger":"event","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$last"}}	{"name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","accountability":"all","trigger":"event","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$last"}}	\N	\N
142	148	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"id":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$last"},"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","date_created":"2024-02-17T10:22:10.552Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["d3ca4018-6fd9-4ccf-bbfc-1216c669021a"]}	{"name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$last"},"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","date_created":"2024-02-17T10:22:10.552Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	\N	\N
141	147	directus_operations	d3ca4018-6fd9-4ccf-bbfc-1216c669021a	{"flow":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","position_x":19,"position_y":1,"name":"Update Data","key":"item_update_rh8vw","type":"item-update","options":{"collection":"seller","emitEvents":true}}	{"flow":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","position_x":19,"position_y":1,"name":"Update Data","key":"item_update_rh8vw","type":"item-update","options":{"collection":"seller","emitEvents":true}}	142	\N
143	149	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"email":"pascal@abteilung.ch "},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
144	150	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:23:14.436Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:23:14.436Z"}	\N	\N
145	151	directus_settings	1	{"id":1,"project_name":"Directus","project_url":null,"project_color":"#FFC23B","project_logo":null,"public_foreground":null,"public_background":null,"public_note":null,"auth_login_attempts":25,"auth_password_policy":null,"storage_asset_transform":"all","storage_asset_presets":null,"custom_css":null,"storage_default_folder":null,"basemaps":null,"mapbox_key":"pk.eyJ1IjoiYWJ0ZWlsdW5nIiwiYSI6ImNsc3B4cnZudTBxbmcya25zY3Q3dTVjeHQifQ.6uFKM4yKkgf0PAEWN8ZRZg","module_bar":null,"project_descriptor":null,"default_language":"en-US","custom_aspect_ratios":null,"public_favicon":null,"default_appearance":"auto","default_theme_light":null,"theme_light_overrides":null,"default_theme_dark":null,"theme_dark_overrides":null,"TTA_KEY":null}	{"mapbox_key":"pk.eyJ1IjoiYWJ0ZWlsdW5nIiwiYSI6ImNsc3B4cnZudTBxbmcya25zY3Q3dTVjeHQifQ.6uFKM4yKkgf0PAEWN8ZRZg"}	\N	\N
146	152	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"map":{"coordinates":[8.332375779099578,47.28452131117808],"type":"Point"}},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
147	153	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:30:24.369Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:30:24.369Z"}	\N	\N
148	154	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"id":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$all"},"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","date_created":"2024-02-17T10:22:10.552Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["d3ca4018-6fd9-4ccf-bbfc-1216c669021a"]}	{"name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$all"}}	\N	\N
149	155	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"address":"Rüdigerstrasse","nr":"12","zip":"8045","city":"Zürich"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
150	156	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:32:36.055Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:32:36.055Z"}	\N	\N
152	158	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"id":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","name":"enterMapData","icon":"not_listed_location","color":"#2ECDA7","description":"Enters Address Data into Map","status":"active","trigger":"event","accountability":"all","options":{"type":"filter","scope":["items.create","items.update"],"collections":["seller"],"return":"$all"},"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","date_created":"2024-02-17T10:22:10.552Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b","operations":["d3ca4018-6fd9-4ccf-bbfc-1216c669021a"]}	{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a"}	\N	\N
151	157	directus_operations	d3ca4018-6fd9-4ccf-bbfc-1216c669021a	{"id":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","name":"Update Data","key":"item_update_rh8vw","type":"item-update","position_x":19,"position_y":1,"options":{"collection":"seller","emitEvents":true},"resolve":null,"reject":null,"flow":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d","date_created":"2024-02-17T10:22:34.452Z","user_created":"2048a671-cc31-48db-b1e6-561d5285837b"}	{"name":"Update Data","key":"item_update_rh8vw","type":"item-update","options":{"collection":"seller","emitEvents":true},"flow":"7965a5c5-1c5a-447b-b71c-5fe5fd96282d"}	152	\N
153	159	directus_fields	108	{"id":108,"collection":"seller","field":"map","special":null,"interface":"map","options":{"defaultView":{"bearing":0,"center":{"lat":39.99689526132639,"lng":-77.18853914268647},"pitch":0,"zoom":5.64627252856377},"geometryType":"Point"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	{"collection":"seller","field":"map","special":null,"interface":"map","options":{"defaultView":{"bearing":0,"center":{"lat":39.99689526132639,"lng":-77.18853914268647},"pitch":0,"zoom":5.64627252856377},"geometryType":"Point"},"display":"raw","display_options":null,"readonly":false,"hidden":false,"sort":23,"width":"full","translations":null,"note":null,"conditions":null,"required":false,"group":null,"validation":null,"validation_message":null}	\N	\N
154	160	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"driverNationality":"Schweiz "},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
155	161	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:35:29.028Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:35:29.028Z"}	\N	\N
156	162	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"map":{"coordinates":[8.521955355820637,47.36067290126684],"type":"Point"}},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
157	163	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:35:56.596Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:35:56.596Z"}	\N	\N
158	164	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"zip":"8045","city":"Zürich","address":"Rüdigerstrasse","nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
159	165	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:37:35.462Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:37:35.462Z"}	\N	\N
160	166	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
161	167	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:38:36.286Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:38:36.286Z"}	\N	\N
162	168	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
163	169	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:38:47.368Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:38:47.368Z"}	\N	\N
164	171	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
165	172	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:39:35.651Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:39:35.651Z"}	\N	\N
166	173	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
167	174	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:41:27.244Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:41:27.244Z"}	\N	\N
168	175	directus_flows	7965a5c5-1c5a-447b-b71c-5fe5fd96282d	{"steps":[{"operation":"d3ca4018-6fd9-4ccf-bbfc-1216c669021a","key":"item_update_rh8vw","status":"resolve","options":{"collection":"seller","emitEvents":true}}],"data":{"$trigger":{"payload":{"nr":"12"},"event":"seller.items.update","keys":["1"],"collection":"seller"},"$last":null,"$accountability":{"user":"2048a671-cc31-48db-b1e6-561d5285837b","role":"9bbabdb0-e11b-4efb-93be-499b0e591ce8","admin":true,"app":true,"ip":"192.168.97.1","userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36","origin":"http://0.0.0.0:8055"},"$env":{},"item_update_rh8vw":null}}	\N	\N	\N
169	176	seller	1	{"id":1,"status":"published","sort":null,"user_created":"2048a671-cc31-48db-b1e6-561d5285837b","date_created":"2024-02-17T10:19:29.914Z","user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:43:09.407Z","email":"pascal@abteilung.ch","firstName":"Pascal","lastName":"Widmer","address":"Wili","nr":"529","zip":"5630","city":"Muri","birthDate":"1974-03-25","licensePlate":"AG 567626","driverName":"Paxton","driverNationality":"Schweiz","isActualDriver":true,"marktOrdnung":true,"nationality":"Schweiz","map":null}	{"user_updated":"2048a671-cc31-48db-b1e6-561d5285837b","date_updated":"2024-02-17T10:43:09.407Z"}	\N	\N
\.


--
-- Data for Name: directus_roles; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_roles (id, name, icon, description, ip_access, enforce_tfa, admin_access, app_access) FROM stdin;
9bbabdb0-e11b-4efb-93be-499b0e591ce8	Administrator	verified	$t:admin_description	\N	f	t	t
7ea3fad0-0160-4355-8a11-0a60f478392a	API	supervised_user_circle	\N	\N	f	f	t
\.


--
-- Data for Name: directus_sessions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_sessions (token, "user", expires, ip, user_agent, share, origin) FROM stdin;
fHZnJ41G1v8nXbWjc9_tUyhU3SIfXHXgmPiJ7BApmMdaXmA9wijgklWrkg8t2Tud	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-24 07:09:49.795+00	10.183.233.241	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	\N	https://directus.cmsflohmarktkanzleich.orb.local
EBZzPpZl8ZM-0qOEXeVy20Rdn5FcRgWg_HJPq9Uum5WZlxtA-49hx2IXZ1eCiFCU	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-24 09:55:16.436+00	192.168.156.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	\N	http://0.0.0.0:8055
Lgz5Pgd93Nhw0ty3R7u65nhwmMPE_Dv0FBBPZMM8MFQcScrK53lS5T6lCWc_e8hV	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-25 10:54:04.365+00	192.168.97.1	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36	\N	http://0.0.0.0:8055
\.


--
-- Data for Name: directus_settings; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_settings (id, project_name, project_url, project_color, project_logo, public_foreground, public_background, public_note, auth_login_attempts, auth_password_policy, storage_asset_transform, storage_asset_presets, custom_css, storage_default_folder, basemaps, mapbox_key, module_bar, project_descriptor, default_language, custom_aspect_ratios, public_favicon, default_appearance, default_theme_light, theme_light_overrides, default_theme_dark, theme_dark_overrides, "TTA_KEY") FROM stdin;
1	Directus	\N	#FFC23B	\N	\N	\N	\N	25	\N	all	\N	\N	\N	\N	pk.eyJ1IjoiYWJ0ZWlsdW5nIiwiYSI6ImNsc3B4cnZudTBxbmcya25zY3Q3dTVjeHQifQ.6uFKM4yKkgf0PAEWN8ZRZg	\N	\N	en-US	\N	\N	auto	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_shares; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_shares (id, name, collection, item, role, password, user_created, date_created, date_start, date_end, times_used, max_uses) FROM stdin;
\.


--
-- Data for Name: directus_translations; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_translations (id, language, key, value) FROM stdin;
\.


--
-- Data for Name: directus_users; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_users (id, first_name, last_name, email, password, location, title, description, tags, avatar, language, tfa_secret, status, role, token, last_access, last_page, provider, external_identifier, auth_data, email_notifications, appearance, theme_dark, theme_light, theme_light_overrides, theme_dark_overrides) FROM stdin;
f338bd04-7a55-45c7-9435-e2b0b6ad1968	Api	Role	api@abteilung.ch	$argon2id$v=19$m=65536,t=3,p=4$dnpZpqEbuN9O0WumgMf7bg$Qs2TNwhbjNdjMKFvDcrcOTLc8+HU94fDR/LC/WmiGeM	\N	\N	\N	\N	\N	\N	\N	active	7ea3fad0-0160-4355-8a11-0a60f478392a	4RQiarH-RATTslwvemjVe6_6IGo_42gl	\N	\N	default	\N	\N	t	\N	\N	\N	\N	\N
2048a671-cc31-48db-b1e6-561d5285837b	Admin	User	kontakt@abteilung.ch	$argon2id$v=19$m=65536,t=3,p=4$zulGMk6+0M1gh6SCt1hq4g$6dBkyZZ6OIc8m4wnHk9FH6UR0e7SDt+zyfYlKDdP8Yw	\N	\N	\N	\N	\N	\N	\N	active	9bbabdb0-e11b-4efb-93be-499b0e591ce8	\N	2024-02-18 10:54:04.381+00	/content/seller/1	default	\N	\N	t	\N	\N	\N	\N	\N
\.


--
-- Data for Name: directus_versions; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_versions (id, key, name, collection, item, hash, date_created, date_updated, user_created, user_updated) FROM stdin;
\.


--
-- Data for Name: directus_webhooks; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.directus_webhooks (id, name, method, url, status, data, actions, collections, headers) FROM stdin;
\.


--
-- Data for Name: entrance; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.entrance (id, status, sort, user_created, date_created, user_updated, date_updated, name, contingent) FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:45.395+00	\N	\N	Ankerstrasse	50
2	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:53.396+00	\N	\N	Kanzleistrasse	50
3	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:01.509+00	\N	\N	Langstrasse	50
4	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:10.171+00	\N	\N	Stauffacherstrasse	50
\.


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.event (id, status, sort, user_created, date_created, user_updated, date_updated, name, date, "isNextEvent", "activeSubscriptions") FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:20:46.48+00	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:24:22.072+00	Markt	2024-02-24 06:00:00	t	t
\.


--
-- Data for Name: event_entrance; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.event_entrance (id, event_id, entrance_id) FROM stdin;
\.


--
-- Data for Name: event_seller; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.event_seller (id, event_id, seller_id) FROM stdin;
\.


--
-- Data for Name: faq; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.faq (id, status, sort, user_created, date_created, user_updated, date_updated, question, answer) FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:55:45.906+00	\N	\N	Wie reservieren Sie einen Standplatz?	<p>Eine Reservation ist nicht m&ouml;glich. Sie haben zwei M&ouml;glichkeiten, wie Sie an unserem Flohmarkt teilnehmen k&ouml;nnen. Sie melden sich elektronisch an und werden f&uuml;r den Einlass um 06:40 Uhr registriert. Oder Sie nutzen den freien Einlass, der ohne vorg&auml;ngige Anmeldung erfolgt.</p>
2	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:05.852+00	\N	\N	Wann können Sie sich elektronisch anmelden?	<p>Sie k&ouml;nnen sich ab Donnerstag 12:00 Uhr bis Freitag 18:00 Uhr elektronisch auf unserer Webseite anmelden. Mit der Anmeldungsbest&auml;tigung erhalten Sie eine Einlass-Nummer. Am entsprechenden Markttag werden Sie ab 06:40 Uhr, an dem von Ihnen bei der Anmeldung gew&auml;hlten Tor, eingelassen. Beim Einlass m&uuml;ssen Sie Ihren Ausweis vorzeigen.</p>
3	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:42.59+00	\N	\N	Alle Einlass-Nummern für den besagten Samstag sind ausverkauft.	<p>Wir vergeben nur eine begrenzte Anzahl an Einlass-Nummern, damit Verk&auml;uferInnen, die sich nicht elektronisch anmelden k&ouml;nnen, die M&ouml;glichkeit haben teilzunehmen.</p>
4	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:56:54.373+00	\N	\N	Wann genau ist der Einlass und wo?	<p>Der Einlass f&uuml;r Verk&auml;uferInnen mit Einlass-Nummer ist ab 06:40 Uhr. Der Einlass f&uuml;r Verk&auml;uferInnen ohne Einlass-Nummer ist ab 07:20 Uhr. Der Einlass erfolgt an vier Toren (Kanzlei-, Lang-, Stauffacher- und Ankerstrasse).</p>
5	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:04.81+00	\N	\N	Wie funktioniert der Einlass mit Einlass-Nummer?	<p>Alle Verk&auml;uferInnen, die sich f&uuml;r den Einlass registriert haben, erhalten eine Einlass-Nummer und stellen sich der Nummer nach beim gew&auml;hlten Tor an. Wenn Sie zu zweit verkaufen, brauchen beide Verkaufspersonen eine Einlass-Nummer. Erfolgt dann der Einlass ab 06:40 Uhr, kontrollieren unsere Mitarbeitenden Ihren Personenausweis (Identit&auml;tskarte, Pass, Ausl&auml;nderausweis) und Ihre Einlass-Nummer. Bitte beachten Sie, dass Sie ohne Ihren Ausweis nicht eingelassen werden. Nun k&ouml;nnen Sie Ihren Standplatz belegen.</p>
6	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:16.871+00	\N	\N	Hat es immer freie Standplätze?	<p>Die Platzkapazit&auml;t ist so berechnet, dass gen&uuml;gend Belegungsm&ouml;glichkeiten f&uuml;r Verk&auml;uferInnen ohne Anmeldung bestehen. Bei grossem Andrang kann es vorkommen, dass die Platzkapazit&auml;t ersch&ouml;pft ist.</p>
7	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:28.854+00	\N	\N	Wie belegen Sie Ihren Standplatz?	<p>Nehmen Sie eine Matte oder ein Tuch in der gew&uuml;nschten Standgr&ouml;sse mit. Markieren Sie damit den Standort Ihres Standes. Bitte beachten Sie, dass beim Einlass ab 06:40 bzw. 07:20 Uhr noch keine Waren hinein transportiert werden d&uuml;rfen. Die Ware d&uuml;rfen Sie erst reintransportieren, nachdem Sie Ihren Standplatz belegt haben.</p>
8	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:41.396+00	\N	\N	Wieviel kostet Sie ein Stand?	<p>Bis 6m<sup>2</sup> kosten Fr. 20.&mdash;. Eine detaillierte Aufstellung der Kosten finden Sie in der Marktordnung.</p>
9	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:57:51.438+00	\N	\N	Wo dürfen Sie Ihren Stand aufstellen?	<p>Die St&auml;nde d&uuml;rfen auf dem Kiesbelag des Areals aufgestellt werden. Beachten Sie die vorgegebenen Absperrungen von unseren Mitarbeitenden. Sie finden eine Zeichnung des Areals hier.</p>
10	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:07.172+00	\N	\N	Können Sie Standmaterial bei uns mieten?	<p>Nein. Sie m&uuml;ssen eigenes Standmaterial mitbringen. Zelte oder Pavillons sind erlaubt.</p>
11	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:18.632+00	\N	\N	Dürfen Sie mit dem Auto reinfahren?	<p>Ja. Die Einfahrt ist am Kanzleitor. Bei der Anmeldung im Internet m&uuml;ssen Sie angeben, ob Sie mit dem Auto reinfahren. Der Auto-Einlass erfolgt, sobald der Einlass an den vier Toren abgeschlossen ist. Auch hier ist zwingend, dass Sie den Auto-Einlass-Schein und Ihren pers&ouml;nlichen Ausweis vorzeigen. Ohne diese Angaben d&uuml;rfen Sie nicht ausladen und werden von unseren Mitarbeitenden zur direkten Ausfahrt angewiesen. Wenn Sie Wartezeiten, Stau und Parkplatzprobleme vermeiden wollen, empfehlen wir Ihnen, die Ware vorher auszuladen, auf dem Trottoir zu deponieren bis der Einlass erfolgt und mit Sackrollis, Anh&auml;nger oder Schubkarren zu transportieren. Es sind nur Fahrzeuge mit einer L&auml;nge von 5.50m und ohne Anh&auml;nger und Hebeb&uuml;hne erlaubt.</p>
12	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:29.163+00	\N	\N	Wo können Sie parkieren?	<p>Die Parkpl&auml;tze im Umkreis des Flohmarktes sind rar. Eine gute M&ouml;glichkeit ist eine &laquo;Tageskarte f&uuml;r unbeschr&auml;nktes Parkieren in blauen Zonen&raquo;.</p>
13	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:39.339+00	\N	\N	Dürfen Sie Abfälle auf dem Platz liegenlassen?	<p>Auf keinen Fall. Die Abfallentsorgung ist sehr teuer und schl&auml;gt sich auf die Standplatzpreise nieder. An der Kasse k&ouml;nnen Sie jedoch f&uuml;r Fr. 2.&mdash; Abfalls&auml;cke kaufen und ab 15:30 Uhr dann beim Eingang Kanzlei deponieren.</p>
14	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:58:50.565+00	\N	\N	Wie präsentieren Sie Ihre Ware am besten?	<p>Wer seine Waren einfach auf dem Boden ausbreitet, macht es K&auml;uferInnen recht schwer, das Angebot anzuschauen. Wir empfehlen Ihnen leicht transportierbare Tischsysteme, wie Campingtisch oder Tischsysteme bestehend aus Holzb&ouml;cken und Platten, Kleiderst&auml;nder f&uuml;r Kleider, Kisten und Kartonschachteln.</p>
15	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:02.286+00	\N	\N	Wo bezahlen Sie den Stand?	<p>Die Kasse befindet sich in der Spielbaracke, beim Tor Langstrasse, ab 08:00 Uhr bis 11.00 Uhr. Je fr&uuml;her Sie bezahlen, desto k&uuml;rzer ist die Wartezeit vor der Kasse.</p>
16	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:13.432+00	\N	\N	Was passiert, wenn Sie die Standfläche zu klein ausgemessen haben?	<p>Wir messen die Standfl&auml;che nach. Auch wenn das Standmass nur 10cm gr&ouml;sser ist als bezahlt, k&ouml;nnen wir keine Kulanz walten lassen und werden Ihnen nebst der Differenz eine Geb&uuml;hr von Fr. 20.&mdash; verrechnen. Runden Sie also grossz&uuml;gig auf.</p>
17	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 09:59:24.284+00	\N	\N	Wo können Sie sich informieren?	<p>Am Samstag vor Ort bei unseren Mitarbeitenden mit orangen Westen.</p>
\.


--
-- Data for Name: marktOrdnung; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public."marktOrdnung" (id, status, user_created, date_created, user_updated, date_updated, pdf) FROM stdin;
1	published	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 08:25:45.702+00	\N	\N	\N
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.pages (id, status, sort, user_created, date_created, user_updated, date_updated, title, slug, body, image) FROM stdin;
\.


--
-- Data for Name: seat; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.seat (id, status, sort, user_created, date_created, user_updated, date_updated, entrance, event, seller) FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:18:26.759+00	\N	\N	2	1	\N
\.


--
-- Data for Name: seller; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.seller (id, status, sort, user_created, date_created, user_updated, date_updated, email, "firstName", "lastName", address, nr, zip, city, "birthDate", "licensePlate", "driverName", "driverNationality", "isActualDriver", "marktOrdnung", nationality, map) FROM stdin;
1	published	\N	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:19:29.914+00	2048a671-cc31-48db-b1e6-561d5285837b	2024-02-17 10:43:09.407+00	pascal@abteilung.ch	Pascal	Widmer	Wili	529	5630	Muri	1974-03-25	AG 567626	Paxton	Schweiz	t	t	Schweiz	\N
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: directus
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Data for Name: geocode_settings; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.geocode_settings (name, setting, unit, category, short_desc) FROM stdin;
\.


--
-- Data for Name: pagc_gaz; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_gaz (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_lex; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_lex (id, seq, word, stdword, token, is_custom) FROM stdin;
\.


--
-- Data for Name: pagc_rules; Type: TABLE DATA; Schema: tiger; Owner: directus
--

COPY tiger.pagc_rules (id, rule, is_custom) FROM stdin;
\.


--
-- Data for Name: topology; Type: TABLE DATA; Schema: topology; Owner: directus
--

COPY topology.topology (id, name, srid, "precision", hasz) FROM stdin;
\.


--
-- Data for Name: layer; Type: TABLE DATA; Schema: topology; Owner: directus
--

COPY topology.layer (topology_id, layer_id, schema_name, table_name, feature_column, feature_type, level, child_id) FROM stdin;
\.


--
-- Name: TTA_htmltemplates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."TTA_htmltemplates_id_seq"', 1, false);


--
-- Name: asfd_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.asfd_id_seq', 1, false);


--
-- Name: blockedEmail_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."blockedEmail_id_seq"', 1, true);


--
-- Name: contact_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.contact_id_seq', 1, true);


--
-- Name: directus_activity_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_activity_id_seq', 176, true);


--
-- Name: directus_fields_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_fields_id_seq', 119, true);


--
-- Name: directus_notifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_notifications_id_seq', 1, false);


--
-- Name: directus_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_permissions_id_seq', 43, true);


--
-- Name: directus_presets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_presets_id_seq', 6, true);


--
-- Name: directus_relations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_relations_id_seq', 27, true);


--
-- Name: directus_revisions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_revisions_id_seq', 169, true);


--
-- Name: directus_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_settings_id_seq', 1, true);


--
-- Name: directus_webhooks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.directus_webhooks_id_seq', 1, false);


--
-- Name: entrance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.entrance_id_seq', 4, true);


--
-- Name: event_entrance_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.event_entrance_id_seq', 1, false);


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.event_id_seq', 3, true);


--
-- Name: event_seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.event_seller_id_seq', 1, false);


--
-- Name: faq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.faq_id_seq', 17, true);


--
-- Name: marktOrdnung_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public."marktOrdnung_id_seq"', 1, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.pages_id_seq', 1, false);


--
-- Name: seat_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.seat_id_seq', 1, true);


--
-- Name: seller_id_seq; Type: SEQUENCE SET; Schema: public; Owner: directus
--

SELECT pg_catalog.setval('public.seller_id_seq', 1, true);


--
-- Name: TTA_htmltemplates TTA_htmltemplates_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."TTA_htmltemplates"
    ADD CONSTRAINT "TTA_htmltemplates_pkey" PRIMARY KEY (id);


--
-- Name: asfd asfd_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.asfd
    ADD CONSTRAINT asfd_pkey PRIMARY KEY (id);


--
-- Name: blockedEmail blockedEmail_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."blockedEmail"
    ADD CONSTRAINT "blockedEmail_pkey" PRIMARY KEY (id);


--
-- Name: contact contact_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_pkey PRIMARY KEY (id);


--
-- Name: directus_activity directus_activity_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_activity
    ADD CONSTRAINT directus_activity_pkey PRIMARY KEY (id);


--
-- Name: directus_collections directus_collections_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_pkey PRIMARY KEY (collection);


--
-- Name: directus_dashboards directus_dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_pkey PRIMARY KEY (id);


--
-- Name: directus_extensions directus_extensions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_extensions
    ADD CONSTRAINT directus_extensions_pkey PRIMARY KEY (name);


--
-- Name: directus_fields directus_fields_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_fields
    ADD CONSTRAINT directus_fields_pkey PRIMARY KEY (id);


--
-- Name: directus_files directus_files_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_pkey PRIMARY KEY (id);


--
-- Name: directus_flows directus_flows_operation_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_operation_unique UNIQUE (operation);


--
-- Name: directus_flows directus_flows_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_pkey PRIMARY KEY (id);


--
-- Name: directus_folders directus_folders_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_pkey PRIMARY KEY (id);


--
-- Name: directus_migrations directus_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_migrations
    ADD CONSTRAINT directus_migrations_pkey PRIMARY KEY (version);


--
-- Name: directus_notifications directus_notifications_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_pkey PRIMARY KEY (id);


--
-- Name: directus_operations directus_operations_reject_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_unique UNIQUE (reject);


--
-- Name: directus_operations directus_operations_resolve_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_unique UNIQUE (resolve);


--
-- Name: directus_panels directus_panels_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_pkey PRIMARY KEY (id);


--
-- Name: directus_permissions directus_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_pkey PRIMARY KEY (id);


--
-- Name: directus_presets directus_presets_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_pkey PRIMARY KEY (id);


--
-- Name: directus_relations directus_relations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_relations
    ADD CONSTRAINT directus_relations_pkey PRIMARY KEY (id);


--
-- Name: directus_revisions directus_revisions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_pkey PRIMARY KEY (id);


--
-- Name: directus_roles directus_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_roles
    ADD CONSTRAINT directus_roles_pkey PRIMARY KEY (id);


--
-- Name: directus_sessions directus_sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_pkey PRIMARY KEY (token);


--
-- Name: directus_settings directus_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_pkey PRIMARY KEY (id);


--
-- Name: directus_shares directus_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_pkey PRIMARY KEY (id);


--
-- Name: directus_translations directus_translations_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_translations
    ADD CONSTRAINT directus_translations_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_email_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_email_unique UNIQUE (email);


--
-- Name: directus_users directus_users_external_identifier_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_external_identifier_unique UNIQUE (external_identifier);


--
-- Name: directus_users directus_users_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_pkey PRIMARY KEY (id);


--
-- Name: directus_users directus_users_token_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_token_unique UNIQUE (token);


--
-- Name: directus_versions directus_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_pkey PRIMARY KEY (id);


--
-- Name: directus_webhooks directus_webhooks_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_webhooks
    ADD CONSTRAINT directus_webhooks_pkey PRIMARY KEY (id);


--
-- Name: entrance entrance_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.entrance
    ADD CONSTRAINT entrance_pkey PRIMARY KEY (id);


--
-- Name: event event_date_unique; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_date_unique UNIQUE (date);


--
-- Name: event_entrance event_entrance_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_entrance
    ADD CONSTRAINT event_entrance_pkey PRIMARY KEY (id);


--
-- Name: event event_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: event_seller event_seller_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_seller
    ADD CONSTRAINT event_seller_pkey PRIMARY KEY (id);


--
-- Name: faq faq_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_pkey PRIMARY KEY (id);


--
-- Name: marktOrdnung marktOrdnung_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."marktOrdnung"
    ADD CONSTRAINT "marktOrdnung_pkey" PRIMARY KEY (id);


--
-- Name: pages pages_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_pkey PRIMARY KEY (id);


--
-- Name: seat seat_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_pkey PRIMARY KEY (id);


--
-- Name: seller seller_pkey; Type: CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_pkey PRIMARY KEY (id);


--
-- Name: blockedEmail blockedemail_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."blockedEmail"
    ADD CONSTRAINT blockedemail_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: blockedEmail blockedemail_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."blockedEmail"
    ADD CONSTRAINT blockedemail_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: contact contact_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: contact contact_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.contact
    ADD CONSTRAINT contact_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: directus_collections directus_collections_group_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_collections
    ADD CONSTRAINT directus_collections_group_foreign FOREIGN KEY ("group") REFERENCES public.directus_collections(collection);


--
-- Name: directus_dashboards directus_dashboards_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_dashboards
    ADD CONSTRAINT directus_dashboards_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_folder_foreign FOREIGN KEY (folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_files directus_files_modified_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_modified_by_foreign FOREIGN KEY (modified_by) REFERENCES public.directus_users(id);


--
-- Name: directus_files directus_files_uploaded_by_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_files
    ADD CONSTRAINT directus_files_uploaded_by_foreign FOREIGN KEY (uploaded_by) REFERENCES public.directus_users(id);


--
-- Name: directus_flows directus_flows_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_flows
    ADD CONSTRAINT directus_flows_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_folders directus_folders_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_folders
    ADD CONSTRAINT directus_folders_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_folders(id);


--
-- Name: directus_notifications directus_notifications_recipient_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_recipient_foreign FOREIGN KEY (recipient) REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_notifications directus_notifications_sender_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_notifications
    ADD CONSTRAINT directus_notifications_sender_foreign FOREIGN KEY (sender) REFERENCES public.directus_users(id);


--
-- Name: directus_operations directus_operations_flow_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_flow_foreign FOREIGN KEY (flow) REFERENCES public.directus_flows(id) ON DELETE CASCADE;


--
-- Name: directus_operations directus_operations_reject_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_reject_foreign FOREIGN KEY (reject) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_resolve_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_resolve_foreign FOREIGN KEY (resolve) REFERENCES public.directus_operations(id);


--
-- Name: directus_operations directus_operations_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_operations
    ADD CONSTRAINT directus_operations_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_panels directus_panels_dashboard_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_dashboard_foreign FOREIGN KEY (dashboard) REFERENCES public.directus_dashboards(id) ON DELETE CASCADE;


--
-- Name: directus_panels directus_panels_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_panels
    ADD CONSTRAINT directus_panels_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_permissions directus_permissions_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_permissions
    ADD CONSTRAINT directus_permissions_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_presets directus_presets_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_presets
    ADD CONSTRAINT directus_presets_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_activity_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_activity_foreign FOREIGN KEY (activity) REFERENCES public.directus_activity(id) ON DELETE CASCADE;


--
-- Name: directus_revisions directus_revisions_parent_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_parent_foreign FOREIGN KEY (parent) REFERENCES public.directus_revisions(id);


--
-- Name: directus_revisions directus_revisions_version_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_revisions
    ADD CONSTRAINT directus_revisions_version_foreign FOREIGN KEY (version) REFERENCES public.directus_versions(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_share_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_share_foreign FOREIGN KEY (share) REFERENCES public.directus_shares(id) ON DELETE CASCADE;


--
-- Name: directus_sessions directus_sessions_user_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_sessions
    ADD CONSTRAINT directus_sessions_user_foreign FOREIGN KEY ("user") REFERENCES public.directus_users(id) ON DELETE CASCADE;


--
-- Name: directus_settings directus_settings_project_logo_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_project_logo_foreign FOREIGN KEY (project_logo) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_background_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_background_foreign FOREIGN KEY (public_background) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_favicon_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_favicon_foreign FOREIGN KEY (public_favicon) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_public_foreground_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_public_foreground_foreign FOREIGN KEY (public_foreground) REFERENCES public.directus_files(id);


--
-- Name: directus_settings directus_settings_storage_default_folder_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_settings
    ADD CONSTRAINT directus_settings_storage_default_folder_foreign FOREIGN KEY (storage_default_folder) REFERENCES public.directus_folders(id) ON DELETE SET NULL;


--
-- Name: directus_shares directus_shares_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE CASCADE;


--
-- Name: directus_shares directus_shares_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_shares
    ADD CONSTRAINT directus_shares_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_users directus_users_role_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_users
    ADD CONSTRAINT directus_users_role_foreign FOREIGN KEY (role) REFERENCES public.directus_roles(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_collection_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_collection_foreign FOREIGN KEY (collection) REFERENCES public.directus_collections(collection) ON DELETE CASCADE;


--
-- Name: directus_versions directus_versions_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id) ON DELETE SET NULL;


--
-- Name: directus_versions directus_versions_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.directus_versions
    ADD CONSTRAINT directus_versions_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: entrance entrance_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.entrance
    ADD CONSTRAINT entrance_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: entrance entrance_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.entrance
    ADD CONSTRAINT entrance_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: event_entrance event_entrance_entrance_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_entrance
    ADD CONSTRAINT event_entrance_entrance_id_foreign FOREIGN KEY (entrance_id) REFERENCES public.entrance(id) ON DELETE SET NULL;


--
-- Name: event_entrance event_entrance_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_entrance
    ADD CONSTRAINT event_entrance_event_id_foreign FOREIGN KEY (event_id) REFERENCES public.event(id) ON DELETE SET NULL;


--
-- Name: event_seller event_seller_event_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_seller
    ADD CONSTRAINT event_seller_event_id_foreign FOREIGN KEY (event_id) REFERENCES public.event(id) ON DELETE SET NULL;


--
-- Name: event_seller event_seller_seller_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event_seller
    ADD CONSTRAINT event_seller_seller_id_foreign FOREIGN KEY (seller_id) REFERENCES public.seller(id) ON DELETE SET NULL;


--
-- Name: event event_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: event event_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.event
    ADD CONSTRAINT event_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: faq faq_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: faq faq_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.faq
    ADD CONSTRAINT faq_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: marktOrdnung marktordnung_pdf_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."marktOrdnung"
    ADD CONSTRAINT marktordnung_pdf_foreign FOREIGN KEY (pdf) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: marktOrdnung marktordnung_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."marktOrdnung"
    ADD CONSTRAINT marktordnung_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: marktOrdnung marktordnung_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public."marktOrdnung"
    ADD CONSTRAINT marktordnung_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: pages pages_image_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_image_foreign FOREIGN KEY (image) REFERENCES public.directus_files(id) ON DELETE SET NULL;


--
-- Name: pages pages_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: pages pages_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.pages
    ADD CONSTRAINT pages_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: seat seat_entrance_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_entrance_foreign FOREIGN KEY (entrance) REFERENCES public.entrance(id) ON DELETE SET NULL;


--
-- Name: seat seat_event_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_event_foreign FOREIGN KEY (event) REFERENCES public.event(id) ON DELETE SET NULL;


--
-- Name: seat seat_seller_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_seller_foreign FOREIGN KEY (seller) REFERENCES public.seller(id) ON DELETE SET NULL;


--
-- Name: seat seat_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: seat seat_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seat
    ADD CONSTRAINT seat_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- Name: seller seller_user_created_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_user_created_foreign FOREIGN KEY (user_created) REFERENCES public.directus_users(id);


--
-- Name: seller seller_user_updated_foreign; Type: FK CONSTRAINT; Schema: public; Owner: directus
--

ALTER TABLE ONLY public.seller
    ADD CONSTRAINT seller_user_updated_foreign FOREIGN KEY (user_updated) REFERENCES public.directus_users(id);


--
-- PostgreSQL database dump complete
--

