--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-10-22 00:41:31 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2143 (class 1262 OID 73746)
-- Name: springmvc-product; Type: DATABASE; Schema: -; Owner: antunesleo
--

CREATE DATABASE "springmvc-product" WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'pt_BR.UTF-8' LC_CTYPE = 'pt_BR.UTF-8';


ALTER DATABASE "springmvc-product" OWNER TO antunesleo;

\connect -reuse-previous=on "dbname='springmvc-product'"

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2146 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 182 (class 1259 OID 73749)
-- Name: product; Type: TABLE; Schema: public; Owner: antunesleo
--

CREATE TABLE product (
    product_id integer NOT NULL,
    name character varying(50),
    description character varying(255),
    isactive boolean,
    category character varying(50),
    unt_per_pallet numeric,
    guarantee_days numeric(10,0),
    uom character varying(50),
    ismanufactured boolean,
    issold boolean,
    isdiscontinued boolean,
    price numeric(10,2)
);


ALTER TABLE product OWNER TO antunesleo;

--
-- TOC entry 181 (class 1259 OID 73747)
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: antunesleo
--

CREATE SEQUENCE product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_product_id_seq OWNER TO antunesleo;

--
-- TOC entry 2147 (class 0 OID 0)
-- Dependencies: 181
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: antunesleo
--

ALTER SEQUENCE product_product_id_seq OWNED BY product.product_id;


--
-- TOC entry 2022 (class 2604 OID 73752)
-- Name: product_id; Type: DEFAULT; Schema: public; Owner: antunesleo
--

ALTER TABLE ONLY product ALTER COLUMN product_id SET DEFAULT nextval('product_product_id_seq'::regclass);


--
-- TOC entry 2024 (class 2606 OID 73757)
-- Name: product_pkey; Type: CONSTRAINT; Schema: public; Owner: antunesleo
--

ALTER TABLE ONLY product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-10-22 00:41:31 BRST

--
-- PostgreSQL database dump complete
--

