--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

-- Started on 2016-10-22 00:43:43 BRST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- TOC entry 2140 (class 0 OID 73749)
-- Dependencies: 182
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: antunesleo
--

INSERT INTO product VALUES (1, 'Exemplo de produto', 'Este é um exemplo de produto, gerado para que você possa testar a funcionalidades do sistema', true, 'Exemplo', 100, 50, 'KG', true, true, false, 178.75);


--
-- TOC entry 2145 (class 0 OID 0)
-- Dependencies: 181
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: antunesleo
--

SELECT pg_catalog.setval('product_product_id_seq', 1, true);


-- Completed on 2016-10-22 00:43:43 BRST

--
-- PostgreSQL database dump complete
--

