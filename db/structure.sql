--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: zoho; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA zoho;


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: tablefunc; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS tablefunc WITH SCHEMA public;


--
-- Name: EXTENSION tablefunc; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION tablefunc IS 'functions that manipulate whole tables, including crosstab';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_contacts (
    id integer NOT NULL,
    account_id integer,
    contact_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: account_contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_contacts_id_seq OWNED BY account_contacts.id;


--
-- Name: account_opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE account_opportunities (
    id integer NOT NULL,
    account_id integer,
    opportunity_id integer,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: account_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE account_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: account_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE account_opportunities_id_seq OWNED BY account_opportunities.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Public'::character varying,
    website character varying(64),
    toll_free_phone character varying(32),
    phone character varying(32),
    fax character varying(32),
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying(64),
    background_info character varying(255),
    rating integer DEFAULT 0 NOT NULL,
    category character varying(32),
    subscribed_users text
);


--
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE accounts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE accounts_id_seq OWNED BY accounts.id;


--
-- Name: activities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE activities (
    id integer NOT NULL,
    user_id integer,
    subject_id integer,
    subject_type character varying(255),
    action character varying(32) DEFAULT 'created'::character varying,
    info character varying(255) DEFAULT ''::character varying,
    private boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: activities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE activities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: activities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE activities_id_seq OWNED BY activities.id;


--
-- Name: addresses; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE addresses (
    id integer NOT NULL,
    street1 character varying(255),
    street2 character varying(255),
    city character varying(64),
    state character varying(64),
    zipcode character varying(16),
    country character varying(64),
    full_address character varying(255),
    address_type character varying(16),
    addressable_id integer,
    addressable_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    deleted_at timestamp without time zone
);


--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: avatars; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE avatars (
    id integer NOT NULL,
    user_id integer,
    entity_id integer,
    entity_type character varying(255),
    image_file_size integer,
    image_file_name character varying(255),
    image_content_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: avatars_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE avatars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: avatars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE avatars_id_seq OWNED BY avatars.id;


--
-- Name: campaigns; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE campaigns (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Public'::character varying,
    status character varying(64),
    budget numeric(12,2),
    target_leads integer,
    target_conversion double precision,
    target_revenue numeric(12,2),
    leads_count integer,
    opportunities_count integer,
    revenue numeric(12,2),
    starts_on date,
    ends_on date,
    objectives text,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_info character varying(255),
    subscribed_users text
);


--
-- Name: campaigns_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE campaigns_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: campaigns_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE campaigns_id_seq OWNED BY campaigns.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    user_id integer,
    commentable_id integer,
    commentable_type character varying(255),
    private boolean,
    title character varying(255) DEFAULT ''::character varying,
    comment text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying(16) DEFAULT 'Expanded'::character varying NOT NULL
);


--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: contact_opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contact_opportunities (
    id integer NOT NULL,
    contact_id integer,
    opportunity_id integer,
    role character varying(32),
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: contact_opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contact_opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contact_opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contact_opportunities_id_seq OWNED BY contact_opportunities.id;


--
-- Name: contacts; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    id integer NOT NULL,
    user_id integer,
    lead_id integer,
    assigned_to integer,
    reports_to integer,
    first_name character varying(64) DEFAULT ''::character varying NOT NULL,
    last_name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Public'::character varying,
    title character varying(64),
    department character varying(64),
    source character varying(32),
    email character varying(64),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    fax character varying(32),
    blog character varying(128),
    linkedin character varying(128),
    facebook character varying(128),
    twitter character varying(128),
    born_on date,
    do_not_call boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_info character varying(255),
    skype character varying(128),
    subscribed_users text
);


--
-- Name: contacts_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE contacts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: contacts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE contacts_id_seq OWNED BY contacts.id;


--
-- Name: emails; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE emails (
    id integer NOT NULL,
    imap_message_id character varying(255) NOT NULL,
    user_id integer,
    mediator_id integer,
    mediator_type character varying(255),
    sent_from character varying(255) NOT NULL,
    sent_to character varying(255) NOT NULL,
    cc character varying(255),
    bcc character varying(255),
    subject character varying(255),
    body text,
    header text,
    sent_at timestamp without time zone,
    received_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    state character varying(16) DEFAULT 'Expanded'::character varying NOT NULL
);


--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE emails_id_seq OWNED BY emails.id;


--
-- Name: field_groups; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE field_groups (
    id integer NOT NULL,
    name character varying(64),
    label character varying(128),
    "position" integer,
    hint character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    tag_id integer,
    klass_name character varying(32)
);


--
-- Name: field_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE field_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: field_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE field_groups_id_seq OWNED BY field_groups.id;


--
-- Name: fields; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE fields (
    id integer NOT NULL,
    type character varying(255),
    field_group_id integer,
    "position" integer,
    name character varying(64),
    label character varying(128),
    hint character varying(255),
    placeholder character varying(255),
    "as" character varying(32),
    collection text,
    disabled boolean,
    required boolean,
    maxlength integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: fields_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE fields_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: fields_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE fields_id_seq OWNED BY fields.id;


--
-- Name: lead_status_changes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lead_status_changes (
    id integer NOT NULL,
    lead_id integer NOT NULL,
    assigned_to integer,
    status character varying NOT NULL,
    created_at timestamp without time zone NOT NULL
);


--
-- Name: lead_status_changes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lead_status_changes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lead_status_changes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lead_status_changes_id_seq OWNED BY lead_status_changes.id;


--
-- Name: leads; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE leads (
    id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    assigned_to integer,
    first_name character varying(128) DEFAULT ''::character varying NOT NULL,
    last_name character varying(128) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Public'::character varying,
    title character varying(64),
    company character varying(128),
    source character varying(32),
    status character varying(32),
    referred_by character varying(64),
    email character varying(128),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    blog character varying(128),
    linkedin character varying(128),
    facebook character varying(128),
    twitter character varying(128),
    rating integer DEFAULT 0 NOT NULL,
    do_not_call boolean DEFAULT false NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_info character varying(255),
    skype character varying(128),
    subscribed_users text
);


--
-- Name: leads_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE leads_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: leads_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE leads_id_seq OWNED BY leads.id;


--
-- Name: lists; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE lists (
    id integer NOT NULL,
    name character varying(255),
    url text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: lists_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE lists_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: lists_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE lists_id_seq OWNED BY lists.id;


--
-- Name: opportunities; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE opportunities (
    id integer NOT NULL,
    user_id integer,
    campaign_id integer,
    assigned_to integer,
    name character varying(64) DEFAULT ''::character varying NOT NULL,
    access character varying(8) DEFAULT 'Public'::character varying,
    source character varying(32),
    stage character varying(32),
    probability integer,
    amount numeric(12,2),
    discount numeric(12,2),
    closes_on date,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_info character varying(255),
    subscribed_users text
);


--
-- Name: opportunities_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE opportunities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: opportunities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE opportunities_id_seq OWNED BY opportunities.id;


--
-- Name: permissions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE permissions (
    id integer NOT NULL,
    user_id integer,
    asset_id integer,
    asset_type character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE permissions_id_seq OWNED BY permissions.id;


--
-- Name: preferences; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE preferences (
    id integer NOT NULL,
    user_id integer,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: preferences_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE preferences_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: preferences_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE preferences_id_seq OWNED BY preferences.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id character varying(255) NOT NULL,
    data text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE sessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: settings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE settings (
    id integer NOT NULL,
    name character varying(32) DEFAULT ''::character varying NOT NULL,
    value text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: settings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE settings_id_seq OWNED BY settings.id;


--
-- Name: taggings; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE taggings (
    id integer NOT NULL,
    tag_id integer,
    taggable_id integer,
    tagger_id integer,
    tagger_type character varying(255),
    taggable_type character varying(255),
    context character varying(255),
    created_at timestamp without time zone
);


--
-- Name: taggings_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE taggings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: taggings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE taggings_id_seq OWNED BY taggings.id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(255)
);


--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tags_id_seq OWNED BY tags.id;


--
-- Name: tasks; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE tasks (
    id integer NOT NULL,
    user_id integer,
    assigned_to integer,
    completed_by integer,
    name character varying(255) DEFAULT ''::character varying NOT NULL,
    asset_id integer,
    asset_type character varying(255),
    priority character varying(32),
    category character varying(32),
    bucket character varying(32),
    due_at timestamp without time zone,
    completed_at timestamp without time zone,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    background_info character varying(255),
    subscribed_users text
);


--
-- Name: tasks_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE tasks_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tasks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE tasks_id_seq OWNED BY tasks.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(32) DEFAULT ''::character varying NOT NULL,
    email character varying(64) DEFAULT ''::character varying NOT NULL,
    first_name character varying(32),
    last_name character varying(32),
    title character varying(64),
    company character varying(64),
    alt_email character varying(64),
    phone character varying(32),
    mobile character varying(32),
    aim character varying(32),
    yahoo character varying(32),
    google character varying(32),
    skype character varying(32),
    password_hash character varying(255) DEFAULT ''::character varying NOT NULL,
    password_salt character varying(255) DEFAULT ''::character varying NOT NULL,
    persistence_token character varying(255) DEFAULT ''::character varying NOT NULL,
    perishable_token character varying(255) DEFAULT ''::character varying NOT NULL,
    last_request_at timestamp without time zone,
    last_login_at timestamp without time zone,
    current_login_at timestamp without time zone,
    last_login_ip character varying(255),
    current_login_ip character varying(255),
    login_count integer DEFAULT 0 NOT NULL,
    deleted_at timestamp without time zone,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    admin boolean DEFAULT false NOT NULL,
    suspended_at timestamp without time zone,
    single_access_token character varying(255)
);


--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: versions; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE versions (
    id integer NOT NULL,
    item_type character varying(255) NOT NULL,
    item_id integer NOT NULL,
    event character varying(512) NOT NULL,
    whodunnit character varying(255),
    object text,
    created_at timestamp without time zone,
    object_changes text,
    related_id integer,
    related_type character varying(255)
);


--
-- Name: versions_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE versions_id_seq OWNED BY versions.id;


SET search_path = zoho, pg_catalog;

--
-- Name: accounts; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE accounts (
    account_id character varying NOT NULL,
    account_owner_id character varying,
    rating character varying,
    account_name character varying,
    phone character varying,
    account_site character varying,
    fax character varying,
    parent_account character varying,
    website character varying,
    account_number character varying,
    ticker_symbol character varying,
    account_type character varying,
    ownership character varying,
    industry character varying,
    employees character varying,
    annual_revenue character varying,
    sic_code character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    status character varying,
    employee_size character varying,
    currency character varying,
    exchange_rate character varying,
    contact_priority character varying,
    linkedin_url character varying,
    last_activity_time timestamp without time zone,
    billing_street character varying,
    shipping_street character varying,
    billing_city character varying,
    shipping_city character varying,
    billing_state character varying,
    shipping_state character varying,
    billing_code character varying,
    shipping_code character varying,
    billing_country character varying,
    shipping_country character varying,
    description character varying,
    import_id integer
);


--
-- Name: calls; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE calls (
    call_id character varying NOT NULL,
    call_owner_id character varying,
    subject character varying,
    call_type character varying,
    call_purpose character varying,
    contact_name character varying,
    related_to character varying,
    call_start_time character varying,
    call_duration time without time zone,
    call_duration_in_seconds integer,
    description character varying,
    billable character varying,
    call_result character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    import_id integer
);


--
-- Name: campaigns; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE campaigns (
    campaign_id character varying NOT NULL,
    campaign_owner_id character varying,
    type character varying,
    campaign_name character varying,
    status character varying,
    start_date character varying,
    end_date character varying,
    expected_revenue character varying,
    budgeted_cost character varying,
    actual_cost character varying,
    expected_response character varying,
    num_sent character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    currency character varying,
    exchange_rate character varying,
    description character varying,
    import_id integer
);


--
-- Name: contact_roles; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE contact_roles (
    contact_id character varying NOT NULL,
    potential_id character varying,
    role_name character varying,
    import_id integer
);


--
-- Name: contacts; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE contacts (
    contact_id character varying NOT NULL,
    contact_owner_id character varying,
    lead_source character varying,
    first_name character varying,
    last_name character varying,
    account_id character varying,
    vendor_id character varying,
    email character varying,
    title character varying,
    department character varying,
    phone character varying,
    home_phone character varying,
    other_phone character varying,
    fax character varying,
    mobile character varying,
    date_of_birth character varying,
    assistant character varying,
    asst_phone character varying,
    reports_to character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    full_name character varying,
    email_opt_out character varying,
    skype_id character varying,
    campaign_source character varying,
    salutation character varying,
    add_to_quickbooks character varying,
    secondary_email character varying,
    currency character varying,
    exchange_rate character varying,
    social_type character varying,
    linkedin_url character varying,
    last_activity_time timestamp without time zone,
    mailing_street character varying,
    other_street character varying,
    mailing_city character varying,
    other_city character varying,
    mailing_state character varying,
    other_state character varying,
    mailing_zip character varying,
    other_zip character varying,
    mailing_country character varying,
    other_country character varying,
    description character varying,
    import_id integer
);


--
-- Name: emails; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE emails (
    email_id character varying NOT NULL,
    email_owner_id character varying,
    subject character varying,
    entity_id character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    import_id integer
);


--
-- Name: events; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE events (
    event_id character varying NOT NULL,
    event_owner_id character varying,
    subject character varying,
    start_datetime timestamp without time zone,
    venue character varying,
    contact_name character varying,
    related_to character varying,
    created_by character varying,
    modified_by character varying,
    created_time character varying,
    modified_time character varying,
    send_notification_email character varying,
    end_datetime timestamp without time zone,
    recurring_activity character varying,
    remind_at character varying,
    currency character varying,
    exchange_rate character varying,
    description character varying,
    import_id integer
);


--
-- Name: leads; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE leads (
    lead_id character varying NOT NULL,
    lead_owner_id character varying,
    company character varying,
    first_name character varying,
    last_name character varying,
    title character varying,
    email character varying,
    phone character varying,
    lead_source character varying,
    no_of_employees character varying,
    campaign_source character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    full_name character varying,
    skype_id character varying,
    salutation character varying,
    sic_description character varying,
    gender character varying,
    currency character varying,
    exchange_rate character varying,
    linkedin_url character varying,
    last_activity_time timestamp without time zone,
    street character varying,
    city character varying,
    zip_code character varying,
    description character varying,
    lead_status character varying,
    amount character varying,
    follow_up_date date,
    mobile character varying,
    created_by character varying,
    modified_by character varying,
    email_opt_out character varying,
    secondary_email character varying,
    age character varying,
    marital_status character varying,
    home_ownership character varying,
    length_of_residence character varying,
    home_value character varying,
    birth_month character varying,
    birth_year character varying,
    fax character varying,
    website character varying,
    industry character varying,
    annual_revenue character varying,
    rating character varying,
    state character varying,
    country character varying,
    sic_code character varying,
    secondary_phone character varying,
    lead_source_id character varying,
    year_established character varying,
    credit_description character varying,
    sales_volume character varying,
    current_cc_user character varying,
    employee_size character varying,
    import_id integer
);


--
-- Name: notes; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE notes (
    note_id character varying NOT NULL,
    note_owner_id character varying,
    note_title character varying,
    note_content character varying,
    parent_id character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    import_id integer
);


--
-- Name: potential_stage_history; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE potential_stage_history (
    potential_id character varying,
    stage character varying,
    amount character varying,
    probability_percent character varying,
    expected_revenue character varying,
    closing_date date,
    modified_time date,
    import_id integer
);


--
-- Name: potentials; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE potentials (
    potential_id character varying NOT NULL,
    potential_owner_id character varying,
    amount character varying,
    potential_name character varying,
    closing_date character varying,
    account_id character varying,
    stage character varying,
    type character varying,
    probability_percent character varying,
    next_step character varying,
    lead_source character varying,
    campaign_source character varying,
    created_by character varying,
    modified_by character varying,
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    contact_id character varying,
    expected_revenue character varying,
    employee_size character varying,
    currency character varying,
    exchange_rate character varying,
    linkedin_url character varying,
    last_activity_time timestamp without time zone,
    description character varying,
    import_id integer
);


--
-- Name: tasks; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE tasks (
    task_id character varying NOT NULL,
    task_owner_id character varying,
    subject character varying,
    due_date character varying,
    contact_name character varying,
    related_to character varying,
    status character varying,
    priority character varying,
    created_by character varying,
    modified_by character varying,
    created_time character varying,
    modified_time character varying,
    send_notification_email character varying,
    remind_at character varying,
    recurring_activity character varying,
    currency character varying,
    exchange_rate character varying,
    description character varying,
    import_id integer
);


--
-- Name: users; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE users (
    user_id character varying NOT NULL,
    email character varying,
    first_name character varying,
    last_name character varying,
    user_status character varying,
    confirmation_status character varying,
    alias character varying,
    phone character varying,
    mobile character varying,
    fax character varying,
    website character varying,
    street character varying,
    city character varying,
    state character varying,
    country character varying,
    zip_code character varying,
    language_locale character varying,
    country_locale character varying,
    time_zone character varying,
    import_id integer
);


--
-- Name: vendors; Type: TABLE; Schema: zoho; Owner: -; Tablespace: 
--

CREATE TABLE vendors (
    vendor_id character varying NOT NULL,
    vendor_name character varying,
    phone character varying,
    email character varying,
    website character varying,
    gl_account character varying,
    category character varying,
    vendor_owner_id character varying,
    created_by character varying,
    modified_by character varying,
    created_time character varying,
    modified_time character varying,
    currency character varying,
    exchange_rate character varying,
    street character varying,
    city character varying,
    state character varying,
    zip_code character varying,
    country character varying,
    description character varying,
    import_id integer
);


SET search_path = public, pg_catalog;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_contacts ALTER COLUMN id SET DEFAULT nextval('account_contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY account_opportunities ALTER COLUMN id SET DEFAULT nextval('account_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY accounts ALTER COLUMN id SET DEFAULT nextval('accounts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY activities ALTER COLUMN id SET DEFAULT nextval('activities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY avatars ALTER COLUMN id SET DEFAULT nextval('avatars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY campaigns ALTER COLUMN id SET DEFAULT nextval('campaigns_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contact_opportunities ALTER COLUMN id SET DEFAULT nextval('contact_opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY contacts ALTER COLUMN id SET DEFAULT nextval('contacts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY emails ALTER COLUMN id SET DEFAULT nextval('emails_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY field_groups ALTER COLUMN id SET DEFAULT nextval('field_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY fields ALTER COLUMN id SET DEFAULT nextval('fields_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lead_status_changes ALTER COLUMN id SET DEFAULT nextval('lead_status_changes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY leads ALTER COLUMN id SET DEFAULT nextval('leads_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY lists ALTER COLUMN id SET DEFAULT nextval('lists_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY opportunities ALTER COLUMN id SET DEFAULT nextval('opportunities_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY permissions ALTER COLUMN id SET DEFAULT nextval('permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY preferences ALTER COLUMN id SET DEFAULT nextval('preferences_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY settings ALTER COLUMN id SET DEFAULT nextval('settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY taggings ALTER COLUMN id SET DEFAULT nextval('taggings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tags ALTER COLUMN id SET DEFAULT nextval('tags_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY tasks ALTER COLUMN id SET DEFAULT nextval('tasks_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY versions ALTER COLUMN id SET DEFAULT nextval('versions_id_seq'::regclass);


--
-- Name: account_contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_contacts
    ADD CONSTRAINT account_contacts_pkey PRIMARY KEY (id);


--
-- Name: account_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY account_opportunities
    ADD CONSTRAINT account_opportunities_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- Name: activities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY activities
    ADD CONSTRAINT activities_pkey PRIMARY KEY (id);


--
-- Name: addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: avatars_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY avatars
    ADD CONSTRAINT avatars_pkey PRIMARY KEY (id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: contact_opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact_opportunities
    ADD CONSTRAINT contact_opportunities_pkey PRIMARY KEY (id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: field_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY field_groups
    ADD CONSTRAINT field_groups_pkey PRIMARY KEY (id);


--
-- Name: fields_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY fields
    ADD CONSTRAINT fields_pkey PRIMARY KEY (id);


--
-- Name: lead_status_changes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lead_status_changes
    ADD CONSTRAINT lead_status_changes_pkey PRIMARY KEY (id);


--
-- Name: leads_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (id);


--
-- Name: lists_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);


--
-- Name: opportunities_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY opportunities
    ADD CONSTRAINT opportunities_pkey PRIMARY KEY (id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: preferences_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY preferences
    ADD CONSTRAINT preferences_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: settings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY settings
    ADD CONSTRAINT settings_pkey PRIMARY KEY (id);


--
-- Name: taggings_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY taggings
    ADD CONSTRAINT taggings_pkey PRIMARY KEY (id);


--
-- Name: tags_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: versions_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY versions
    ADD CONSTRAINT versions_pkey PRIMARY KEY (id);


SET search_path = zoho, pg_catalog;

--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (account_id);


--
-- Name: calls_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY calls
    ADD CONSTRAINT calls_pkey PRIMARY KEY (call_id);


--
-- Name: campaigns_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY campaigns
    ADD CONSTRAINT campaigns_pkey PRIMARY KEY (campaign_id);


--
-- Name: contact_roles_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contact_roles
    ADD CONSTRAINT contact_roles_pkey PRIMARY KEY (contact_id);


--
-- Name: contacts_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY contacts
    ADD CONSTRAINT contacts_pkey PRIMARY KEY (contact_id);


--
-- Name: emails_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (email_id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: leads_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY leads
    ADD CONSTRAINT leads_pkey PRIMARY KEY (lead_id);


--
-- Name: notes_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY notes
    ADD CONSTRAINT notes_pkey PRIMARY KEY (note_id);


--
-- Name: potentials_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY potentials
    ADD CONSTRAINT potentials_pkey PRIMARY KEY (potential_id);


--
-- Name: tasks_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY tasks
    ADD CONSTRAINT tasks_pkey PRIMARY KEY (task_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: vendors_pkey; Type: CONSTRAINT; Schema: zoho; Owner: -; Tablespace: 
--

ALTER TABLE ONLY vendors
    ADD CONSTRAINT vendors_pkey PRIMARY KEY (vendor_id);


SET search_path = public, pg_catalog;

--
-- Name: id_last_name_deleted; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX id_last_name_deleted ON contacts USING btree (user_id, last_name, deleted_at);


--
-- Name: id_name_deleted; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX id_name_deleted ON opportunities USING btree (user_id, name, deleted_at);


--
-- Name: index_accounts_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_accounts_on_assigned_to ON accounts USING btree (assigned_to);


--
-- Name: index_accounts_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_accounts_on_user_id_and_name_and_deleted_at ON accounts USING btree (user_id, name, deleted_at);


--
-- Name: index_activities_on_created_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_created_at ON activities USING btree (created_at);


--
-- Name: index_activities_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_activities_on_user_id ON activities USING btree (user_id);


--
-- Name: index_addresses_on_addressable_id_and_addressable_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_addresses_on_addressable_id_and_addressable_type ON addresses USING btree (addressable_id, addressable_type);


--
-- Name: index_campaigns_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_campaigns_on_assigned_to ON campaigns USING btree (assigned_to);


--
-- Name: index_campaigns_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_campaigns_on_user_id_and_name_and_deleted_at ON campaigns USING btree (user_id, name, deleted_at);


--
-- Name: index_contacts_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_contacts_on_assigned_to ON contacts USING btree (assigned_to);


--
-- Name: index_emails_on_mediator_id_and_mediator_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_emails_on_mediator_id_and_mediator_type ON emails USING btree (mediator_id, mediator_type);


--
-- Name: index_fields_on_field_group_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_fields_on_field_group_id ON fields USING btree (field_group_id);


--
-- Name: index_fields_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_fields_on_name ON fields USING btree (name);


--
-- Name: index_leads_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_leads_on_assigned_to ON leads USING btree (assigned_to);


--
-- Name: index_leads_on_user_id_and_last_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_leads_on_user_id_and_last_name_and_deleted_at ON leads USING btree (user_id, last_name, deleted_at);


--
-- Name: index_opportunities_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_opportunities_on_assigned_to ON opportunities USING btree (assigned_to);


--
-- Name: index_permissions_on_asset_id_and_asset_type; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_permissions_on_asset_id_and_asset_type ON permissions USING btree (asset_id, asset_type);


--
-- Name: index_permissions_on_user_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_permissions_on_user_id ON permissions USING btree (user_id);


--
-- Name: index_preferences_on_user_id_and_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_preferences_on_user_id_and_name ON preferences USING btree (user_id, name);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_settings_on_name; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_settings_on_name ON settings USING btree (name);


--
-- Name: index_taggings_on_tag_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taggings_on_tag_id ON taggings USING btree (tag_id);


--
-- Name: index_taggings_on_taggable_id_and_taggable_type_and_context; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_taggings_on_taggable_id_and_taggable_type_and_context ON taggings USING btree (taggable_id, taggable_type, context);


--
-- Name: index_tasks_on_assigned_to; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_tasks_on_assigned_to ON tasks USING btree (assigned_to);


--
-- Name: index_tasks_on_user_id_and_name_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_tasks_on_user_id_and_name_and_deleted_at ON tasks USING btree (user_id, name, deleted_at);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_last_request_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_last_request_at ON users USING btree (last_request_at);


--
-- Name: index_users_on_perishable_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_perishable_token ON users USING btree (perishable_token);


--
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (persistence_token);


--
-- Name: index_users_on_username_and_deleted_at; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_username_and_deleted_at ON users USING btree (username, deleted_at);


--
-- Name: index_versions_on_item_type_and_item_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_item_type_and_item_id ON versions USING btree (item_type, item_id);


--
-- Name: index_versions_on_whodunnit; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE INDEX index_versions_on_whodunnit ON versions USING btree (whodunnit);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: lead_status_changes_assigned_to_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lead_status_changes
    ADD CONSTRAINT lead_status_changes_assigned_to_fkey FOREIGN KEY (assigned_to) REFERENCES users(id);


--
-- Name: lead_status_changes_lead_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY lead_status_changes
    ADD CONSTRAINT lead_status_changes_lead_id_fkey FOREIGN KEY (lead_id) REFERENCES leads(id);


--
-- PostgreSQL database dump complete
--

INSERT INTO schema_migrations (version) VALUES ('20100928030598');

INSERT INTO schema_migrations (version) VALUES ('20100928030599');

INSERT INTO schema_migrations (version) VALUES ('20100928030600');

INSERT INTO schema_migrations (version) VALUES ('20100928030601');

INSERT INTO schema_migrations (version) VALUES ('20100928030602');

INSERT INTO schema_migrations (version) VALUES ('20100928030603');

INSERT INTO schema_migrations (version) VALUES ('20100928030604');

INSERT INTO schema_migrations (version) VALUES ('20100928030605');

INSERT INTO schema_migrations (version) VALUES ('20100928030606');

INSERT INTO schema_migrations (version) VALUES ('20100928030607');

INSERT INTO schema_migrations (version) VALUES ('20100928030608');

INSERT INTO schema_migrations (version) VALUES ('20100928030609');

INSERT INTO schema_migrations (version) VALUES ('20100928030610');

INSERT INTO schema_migrations (version) VALUES ('20100928030611');

INSERT INTO schema_migrations (version) VALUES ('20100928030612');

INSERT INTO schema_migrations (version) VALUES ('20100928030613');

INSERT INTO schema_migrations (version) VALUES ('20100928030614');

INSERT INTO schema_migrations (version) VALUES ('20100928030615');

INSERT INTO schema_migrations (version) VALUES ('20100928030616');

INSERT INTO schema_migrations (version) VALUES ('20100928030617');

INSERT INTO schema_migrations (version) VALUES ('20100928030618');

INSERT INTO schema_migrations (version) VALUES ('20100928030619');

INSERT INTO schema_migrations (version) VALUES ('20100928030620');

INSERT INTO schema_migrations (version) VALUES ('20100928030621');

INSERT INTO schema_migrations (version) VALUES ('20100928030622');

INSERT INTO schema_migrations (version) VALUES ('20100928030623');

INSERT INTO schema_migrations (version) VALUES ('20100928030624');

INSERT INTO schema_migrations (version) VALUES ('20100928030625');

INSERT INTO schema_migrations (version) VALUES ('20100928030626');

INSERT INTO schema_migrations (version) VALUES ('20100928030627');

INSERT INTO schema_migrations (version) VALUES ('20101221123456');

INSERT INTO schema_migrations (version) VALUES ('20101221345678');

INSERT INTO schema_migrations (version) VALUES ('20110719082054');

INSERT INTO schema_migrations (version) VALUES ('20111101083437');

INSERT INTO schema_migrations (version) VALUES ('20111101090312');

INSERT INTO schema_migrations (version) VALUES ('20111116091952');

INSERT INTO schema_migrations (version) VALUES ('20111117041311');

INSERT INTO schema_migrations (version) VALUES ('20111201030535');

INSERT INTO schema_migrations (version) VALUES ('20120121054235');

INSERT INTO schema_migrations (version) VALUES ('20120216031616');

INSERT INTO schema_migrations (version) VALUES ('20120216042541');

INSERT INTO schema_migrations (version) VALUES ('20120220233724');

INSERT INTO schema_migrations (version) VALUES ('20120224073107');

INSERT INTO schema_migrations (version) VALUES ('20120309070209');

INSERT INTO schema_migrations (version) VALUES ('20120314080441');

INSERT INTO schema_migrations (version) VALUES ('20120316045804');

INSERT INTO schema_migrations (version) VALUES ('20120405080727');

INSERT INTO schema_migrations (version) VALUES ('20120405080742');

INSERT INTO schema_migrations (version) VALUES ('20120413034923');

INSERT INTO schema_migrations (version) VALUES ('20120510025219');

INSERT INTO schema_migrations (version) VALUES ('20120528102124');

INSERT INTO schema_migrations (version) VALUES ('20120702232538');

INSERT INTO schema_migrations (version) VALUES ('20120702233528');

INSERT INTO schema_migrations (version) VALUES ('20120702234116');

INSERT INTO schema_migrations (version) VALUES ('20120707222054');