--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 15.4

-- Started on 2024-03-24 20:53:17

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
-- TOC entry 3382 (class 1262 OID 17213)
-- Name: canada_cities_metrics; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE canada_cities_metrics WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_India.1252';


ALTER DATABASE canada_cities_metrics OWNER TO postgres;

\connect canada_cities_metrics

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 214 (class 1259 OID 17214)
-- Name: cities; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cities (
    city_id integer NOT NULL,
    city character varying(100),
    province_id integer
);


ALTER TABLE public.cities OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17287)
-- Name: tim_horton_outlets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tim_horton_outlets (
    tim_hortons_id integer NOT NULL,
    city character varying(100) NOT NULL,
    address text,
    city_id integer
);


ALTER TABLE public.tim_horton_outlets OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 17286)
-- Name: city_details_city_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.city_details_city_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.city_details_city_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 221
-- Name: city_details_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.city_details_city_id_seq OWNED BY public.tim_horton_outlets.tim_hortons_id;


--
-- TOC entry 220 (class 1259 OID 17260)
-- Name: electricity_rate; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.electricity_rate (
    electricity_rate_id integer NOT NULL,
    city_id integer,
    year integer,
    electricity_rate numeric(10,2)
);


ALTER TABLE public.electricity_rate OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 17259)
-- Name: electricity_rate_electricity_rate_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.electricity_rate_electricity_rate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.electricity_rate_electricity_rate_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 219
-- Name: electricity_rate_electricity_rate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.electricity_rate_electricity_rate_id_seq OWNED BY public.electricity_rate.electricity_rate_id;


--
-- TOC entry 225 (class 1259 OID 17309)
-- Name: employmentbyprovince; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employmentbyprovince (
    date integer,
    city character varying(100),
    city_id integer,
    noc character varying(100),
    value numeric(10,2)
);


ALTER TABLE public.employmentbyprovince OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17234)
-- Name: gas_prices; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gas_prices (
    gas_price_id integer NOT NULL,
    city_id integer,
    date date,
    cost_of_gas numeric(10,2)
);


ALTER TABLE public.gas_prices OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 17233)
-- Name: gas_prices_gas_price_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gas_prices_gas_price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gas_prices_gas_price_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 215
-- Name: gas_prices_gas_price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gas_prices_gas_price_id_seq OWNED BY public.gas_prices.gas_price_id;


--
-- TOC entry 224 (class 1259 OID 17297)
-- Name: population; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.population (
    population_id integer NOT NULL,
    city_id integer,
    population integer,
    privatedwellings integer,
    landarea numeric(10,2)
);


ALTER TABLE public.population OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 17296)
-- Name: population_population_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.population_population_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.population_population_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 223
-- Name: population_population_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.population_population_id_seq OWNED BY public.population.population_id;


--
-- TOC entry 218 (class 1259 OID 17246)
-- Name: provinces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.provinces (
    id integer NOT NULL,
    name character varying(100) NOT NULL
);


ALTER TABLE public.provinces OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 17245)
-- Name: provinces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.provinces_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.provinces_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 217
-- Name: provinces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.provinces_id_seq OWNED BY public.provinces.id;


--
-- TOC entry 3203 (class 2604 OID 17263)
-- Name: electricity_rate electricity_rate_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electricity_rate ALTER COLUMN electricity_rate_id SET DEFAULT nextval('public.electricity_rate_electricity_rate_id_seq'::regclass);


--
-- TOC entry 3201 (class 2604 OID 17237)
-- Name: gas_prices gas_price_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_prices ALTER COLUMN gas_price_id SET DEFAULT nextval('public.gas_prices_gas_price_id_seq'::regclass);


--
-- TOC entry 3205 (class 2604 OID 17300)
-- Name: population population_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population ALTER COLUMN population_id SET DEFAULT nextval('public.population_population_id_seq'::regclass);


--
-- TOC entry 3202 (class 2604 OID 17249)
-- Name: provinces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces ALTER COLUMN id SET DEFAULT nextval('public.provinces_id_seq'::regclass);


--
-- TOC entry 3204 (class 2604 OID 17290)
-- Name: tim_horton_outlets tim_hortons_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tim_horton_outlets ALTER COLUMN tim_hortons_id SET DEFAULT nextval('public.city_details_city_id_seq'::regclass);


--
-- TOC entry 3365 (class 0 OID 17214)
-- Dependencies: 214
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cities (city_id, city, province_id) VALUES (1, 'Calgary', 1);
INSERT INTO public.cities (city_id, city, province_id) VALUES (2, 'Edmonton', 1);
INSERT INTO public.cities (city_id, city, province_id) VALUES (9, 'Vancouver', 9);
INSERT INTO public.cities (city_id, city, province_id) VALUES (3, 'Halifax', 6);
INSERT INTO public.cities (city_id, city, province_id) VALUES (10, 'Winnipeg', 3);
INSERT INTO public.cities (city_id, city, province_id) VALUES (11, 'Kitchener', 7);
INSERT INTO public.cities (city_id, city, province_id) VALUES (8, 'Toronto', 7);
INSERT INTO public.cities (city_id, city, province_id) VALUES (6, 'Ottawa', 7);
INSERT INTO public.cities (city_id, city, province_id) VALUES (5, 'Montreal', 9);
INSERT INTO public.cities (city_id, city, province_id) VALUES (7, 'Regina', 10);


--
-- TOC entry 3371 (class 0 OID 17260)
-- Dependencies: 220
-- Data for Name: electricity_rate; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (1, 5, 2021, 7.39);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (2, 5, 2022, 7.59);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (3, 5, 2023, 7.81);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (4, 1, 2021, 17.26);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (5, 1, 2022, 19.94);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (6, 1, 2023, 29.80);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (7, 8, 2021, 13.43);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (8, 8, 2022, 13.88);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (9, 8, 2023, 13.88);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (10, 6, 2021, 12.45);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (11, 6, 2022, 12.94);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (12, 6, 2023, 13.48);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (13, 2, 2021, 16.99);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (14, 2, 2022, 19.48);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (15, 2, 2023, 27.78);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (16, 3, 2021, 17.09);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (17, 3, 2022, 17.30);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (18, 3, 2023, 18.27);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (19, 9, 2021, 11.58);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (20, 9, 2022, 11.39);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (21, 9, 2023, 11.62);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (22, 11, 2021, 10.40);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (23, 11, 2022, 10.90);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (24, 11, 2023, 13.04);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (25, 10, 2021, 9.87);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (26, 10, 2022, 10.24);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (27, 10, 2023, 10.24);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (28, 7, 2021, 16.51);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (29, 7, 2022, 16.51);
INSERT INTO public.electricity_rate (electricity_rate_id, city_id, year, electricity_rate) VALUES (30, 7, 2023, 17.89);


--
-- TOC entry 3376 (class 0 OID 17309)
-- Dependencies: 225
-- Data for Name: employmentbyprovince; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Management occupations', 75.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Management occupations', 90.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Management occupations', 92.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Business, finance and administration occupations, except management', 159.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Business, finance and administration occupations, except management', 149.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Business, finance and administration occupations, except management', 167.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Natural and applied sciences and related occupations, except management', 86.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Natural and applied sciences and related occupations, except management', 112.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Natural and applied sciences and related occupations, except management', 108.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Health occupations, except management', 68.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Health occupations, except management', 71.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Health occupations, except management', 61.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Occupations in education, law and social, community and government services, except management', 89.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Occupations in education, law and social, community and government services, except management', 94.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Occupations in education, law and social, community and government services, except management', 91.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Occupations in art, culture, recreation and sport, except management', 18.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Occupations in art, culture, recreation and sport, except management', 22.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Occupations in art, culture, recreation and sport, except management', 28.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Sales and service occupations, except management', 169.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Sales and service occupations, except management', 186.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Sales and service occupations, except management', 188.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Trades, transport and equipment operators and related occupations, except management', 126.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Trades, transport and equipment operators and related occupations, except management', 122.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Trades, transport and equipment operators and related occupations, except management', 132.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Natural resources, agriculture and related production occupations, except management', 11.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Natural resources, agriculture and related production occupations, except management', 12.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Natural resources, agriculture and related production occupations, except management', 13.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Calgary', 1, 'Occupations in manufacturing and utilities, except management', 16.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Calgary', 1, 'Occupations in manufacturing and utilities, except management', 16.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Calgary', 1, 'Occupations in manufacturing and utilities, except management', 19.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Management occupations', 63.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Management occupations', 68.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Management occupations', 75.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Business, finance and administration occupations, except management', 129.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Business, finance and administration occupations, except management', 129.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Business, finance and administration occupations, except management', 142.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Natural and applied sciences and related occupations, except management', 66.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Natural and applied sciences and related occupations, except management', 67.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Natural and applied sciences and related occupations, except management', 75.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Health occupations, except management', 64.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Health occupations, except management', 70.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Health occupations, except management', 76.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Occupations in education, law and social, community and government services, except management', 98.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Occupations in education, law and social, community and government services, except management', 85.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Occupations in education, law and social, community and government services, except management', 90.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Occupations in art, culture, recreation and sport, except management', 18.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Occupations in art, culture, recreation and sport, except management', 21.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Occupations in art, culture, recreation and sport, except management', 19.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Sales and service occupations, except management', 173.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Sales and service occupations, except management', 182.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Sales and service occupations, except management', 190.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Trades, transport and equipment operators and related occupations, except management', 134.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Trades, transport and equipment operators and related occupations, except management', 142.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Trades, transport and equipment operators and related occupations, except management', 145.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Natural resources, agriculture and related production occupations, except management', 12.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Natural resources, agriculture and related production occupations, except management', 15.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Natural resources, agriculture and related production occupations, except management', 13.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Edmonton', 2, 'Occupations in manufacturing and utilities, except management', 16.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Edmonton', 2, 'Occupations in manufacturing and utilities, except management', 25.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Edmonton', 2, 'Occupations in manufacturing and utilities, except management', 20.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Management occupations', 15.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Management occupations', 20.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Management occupations', 24.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Business, finance and administration occupations, except management', 39.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Business, finance and administration occupations, except management', 43.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Business, finance and administration occupations, except management', 43.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Natural and applied sciences and related occupations, except management', 23.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Natural and applied sciences and related occupations, except management', 24.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Natural and applied sciences and related occupations, except management', 25.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Health occupations, except management', 22.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Health occupations, except management', 20.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Health occupations, except management', 23.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Occupations in education, law and social, community and government services, except management', 28.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Occupations in education, law and social, community and government services, except management', 29.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Occupations in education, law and social, community and government services, except management', 31.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Occupations in art, culture, recreation and sport, except management', 8.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Occupations in art, culture, recreation and sport, except management', 8.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Occupations in art, culture, recreation and sport, except management', 10.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Sales and service occupations, except management', 60.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Sales and service occupations, except management', 62.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Sales and service occupations, except management', 63.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Trades, transport and equipment operators and related occupations, except management', 36.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Trades, transport and equipment operators and related occupations, except management', 35.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Trades, transport and equipment operators and related occupations, except management', 34.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Natural resources, agriculture and related production occupations, except management', 2.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Natural resources, agriculture and related production occupations, except management', 1.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Natural resources, agriculture and related production occupations, except management', 2.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Halifax', 3, 'Occupations in manufacturing and utilities, except management', 4.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Halifax', 3, 'Occupations in manufacturing and utilities, except management', 5.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Halifax', 3, 'Occupations in manufacturing and utilities, except management', 5.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Management occupations', 179.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Management occupations', 200.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Management occupations', 227.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Business, finance and administration occupations, except management', 396.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Business, finance and administration occupations, except management', 416.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Business, finance and administration occupations, except management', 416.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Natural and applied sciences and related occupations, except management', 220.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Natural and applied sciences and related occupations, except management', 251.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Natural and applied sciences and related occupations, except management', 243.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Health occupations, except management', 177.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Health occupations, except management', 180.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Health occupations, except management', 162.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Occupations in education, law and social, community and government services, except management', 295.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Occupations in education, law and social, community and government services, except management', 293.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Occupations in education, law and social, community and government services, except management', 287.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Occupations in art, culture, recreation and sport, except management', 91.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Occupations in art, culture, recreation and sport, except management', 96.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Occupations in art, culture, recreation and sport, except management', 111.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Sales and service occupations, except management', 517.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Sales and service occupations, except management', 506.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Sales and service occupations, except management', 549.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Trades, transport and equipment operators and related occupations, except management', 282.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Trades, transport and equipment operators and related occupations, except management', 289.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Trades, transport and equipment operators and related occupations, except management', 310.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Natural resources, agriculture and related production occupations, except management', 9.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Natural resources, agriculture and related production occupations, except management', 15.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Natural resources, agriculture and related production occupations, except management', 12.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Montreal', 5, 'Occupations in manufacturing and utilities, except management', 98.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Montreal', 5, 'Occupations in manufacturing and utilities, except management', 97.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Montreal', 5, 'Occupations in manufacturing and utilities, except management', 99.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Management occupations', 85.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Management occupations', 83.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Management occupations', 90.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Business, finance and administration occupations, except management', 147.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Business, finance and administration occupations, except management', 146.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Business, finance and administration occupations, except management', 157.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Natural and applied sciences and related occupations, except management', 108.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Natural and applied sciences and related occupations, except management', 120.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Natural and applied sciences and related occupations, except management', 118.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Health occupations, except management', 53.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Health occupations, except management', 54.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Health occupations, except management', 54.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Occupations in education, law and social, community and government services, except management', 121.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Occupations in education, law and social, community and government services, except management', 126.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Occupations in education, law and social, community and government services, except management', 121.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Occupations in art, culture, recreation and sport, except management', 21.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Occupations in art, culture, recreation and sport, except management', 19.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Occupations in art, culture, recreation and sport, except management', 27.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Sales and service occupations, except management', 144.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Sales and service occupations, except management', 160.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Sales and service occupations, except management', 159.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Trades, transport and equipment operators and related occupations, except management', 71.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Trades, transport and equipment operators and related occupations, except management', 74.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Trades, transport and equipment operators and related occupations, except management', 88.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Natural resources, agriculture and related production occupations, except management', 6.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Natural resources, agriculture and related production occupations, except management', 4.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Natural resources, agriculture and related production occupations, except management', 5.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Ottawa', 6, 'Occupations in manufacturing and utilities, except management', 7.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Ottawa', 6, 'Occupations in manufacturing and utilities, except management', 9.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Ottawa', 6, 'Occupations in manufacturing and utilities, except management', 10.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Management occupations', 11.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Management occupations', 14.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Management occupations', 13.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Business, finance and administration occupations, except management', 23.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Business, finance and administration occupations, except management', 23.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Business, finance and administration occupations, except management', 26.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Natural and applied sciences and related occupations, except management', 11.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Natural and applied sciences and related occupations, except management', 10.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Natural and applied sciences and related occupations, except management', 10.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Health occupations, except management', 11.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Health occupations, except management', 11.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Health occupations, except management', 11.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Occupations in education, law and social, community and government services, except management', 19.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Occupations in education, law and social, community and government services, except management', 19.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Occupations in education, law and social, community and government services, except management', 20.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Occupations in art, culture, recreation and sport, except management', 2.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Occupations in art, culture, recreation and sport, except management', 2.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Occupations in art, culture, recreation and sport, except management', 3.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Sales and service occupations, except management', 31.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Sales and service occupations, except management', 33.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Sales and service occupations, except management', 33.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Trades, transport and equipment operators and related occupations, except management', 21.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Trades, transport and equipment operators and related occupations, except management', 20.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Trades, transport and equipment operators and related occupations, except management', 23.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Natural resources, agriculture and related production occupations, except management', 1.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Natural resources, agriculture and related production occupations, except management', 1.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Natural resources, agriculture and related production occupations, except management', 1.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Regina', 7, 'Occupations in manufacturing and utilities, except management', 3.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Regina', 7, 'Occupations in manufacturing and utilities, except management', 4.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Regina', 7, 'Occupations in manufacturing and utilities, except management', 3.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Management occupations', 341.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Management occupations', 378.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Management occupations', 416.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Business, finance and administration occupations, except management', 667.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Business, finance and administration occupations, except management', 703.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Business, finance and administration occupations, except management', 721.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Natural and applied sciences and related occupations, except management', 402.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Natural and applied sciences and related occupations, except management', 391.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Natural and applied sciences and related occupations, except management', 398.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Health occupations, except management', 227.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Health occupations, except management', 235.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Health occupations, except management', 240.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Occupations in education, law and social, community and government services, except management', 345.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Occupations in education, law and social, community and government services, except management', 369.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Occupations in education, law and social, community and government services, except management', 387.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Occupations in art, culture, recreation and sport, except management', 129.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Occupations in art, culture, recreation and sport, except management', 116.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Occupations in art, culture, recreation and sport, except management', 135.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Sales and service occupations, except management', 737.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Sales and service occupations, except management', 771.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Sales and service occupations, except management', 769.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Trades, transport and equipment operators and related occupations, except management', 406.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Trades, transport and equipment operators and related occupations, except management', 422.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Trades, transport and equipment operators and related occupations, except management', 443.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Natural resources, agriculture and related production occupations, except management', 11.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Natural resources, agriculture and related production occupations, except management', 22.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Natural resources, agriculture and related production occupations, except management', 18.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Toronto', 8, 'Occupations in manufacturing and utilities, except management', 139.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Toronto', 8, 'Occupations in manufacturing and utilities, except management', 159.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Toronto', 8, 'Occupations in manufacturing and utilities, except management', 142.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Management occupations', 133.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Management occupations', 146.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Management occupations', 178.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Business, finance and administration occupations, except management', 261.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Business, finance and administration occupations, except management', 262.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Business, finance and administration occupations, except management', 264.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Natural and applied sciences and related occupations, except management', 165.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Natural and applied sciences and related occupations, except management', 160.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Natural and applied sciences and related occupations, except management', 146.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Health occupations, except management', 117.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Health occupations, except management', 113.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Health occupations, except management', 114.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Occupations in education, law and social, community and government services, except management', 160.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Occupations in education, law and social, community and government services, except management', 165.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Occupations in education, law and social, community and government services, except management', 179.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Occupations in art, culture, recreation and sport, except management', 58.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Occupations in art, culture, recreation and sport, except management', 72.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Occupations in art, culture, recreation and sport, except management', 86.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Sales and service occupations, except management', 354.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Sales and service occupations, except management', 357.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Sales and service occupations, except management', 369.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Trades, transport and equipment operators and related occupations, except management', 195.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Trades, transport and equipment operators and related occupations, except management', 210.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Trades, transport and equipment operators and related occupations, except management', 191.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Natural resources, agriculture and related production occupations, except management', 15.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Natural resources, agriculture and related production occupations, except management', 13.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Natural resources, agriculture and related production occupations, except management', 15.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Vancouver', 9, 'Occupations in manufacturing and utilities, except management', 43.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Vancouver', 9, 'Occupations in manufacturing and utilities, except management', 44.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Vancouver', 9, 'Occupations in manufacturing and utilities, except management', 37.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Management occupations', 29.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Management occupations', 32.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Management occupations', 34.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Business, finance and administration occupations, except management', 71.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Business, finance and administration occupations, except management', 79.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Business, finance and administration occupations, except management', 77.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Natural and applied sciences and related occupations, except management', 34.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Natural and applied sciences and related occupations, except management', 34.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Natural and applied sciences and related occupations, except management', 35.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Health occupations, except management', 43.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Health occupations, except management', 44.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Health occupations, except management', 43.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Occupations in education, law and social, community and government services, except management', 59.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Occupations in education, law and social, community and government services, except management', 61.90);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Occupations in education, law and social, community and government services, except management', 67.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Occupations in art, culture, recreation and sport, except management', 10.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Occupations in art, culture, recreation and sport, except management', 12.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Occupations in art, culture, recreation and sport, except management', 12.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Sales and service occupations, except management', 102.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Sales and service occupations, except management', 104.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Sales and service occupations, except management', 101.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Trades, transport and equipment operators and related occupations, except management', 71.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Trades, transport and equipment operators and related occupations, except management', 67.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Trades, transport and equipment operators and related occupations, except management', 76.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Natural resources, agriculture and related production occupations, except management', 3.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Natural resources, agriculture and related production occupations, except management', 3.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Natural resources, agriculture and related production occupations, except management', 3.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Winnipeg', 10, 'Occupations in manufacturing and utilities, except management', 20.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Winnipeg', 10, 'Occupations in manufacturing and utilities, except management', 23.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Winnipeg', 10, 'Occupations in manufacturing and utilities, except management', 21.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Management occupations', 26.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Management occupations', 31.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Management occupations', 33.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Business, finance and administration occupations, except management', 49.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Business, finance and administration occupations, except management', 50.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Business, finance and administration occupations, except management', 53.40);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Natural and applied sciences and related occupations, except management', 35.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Natural and applied sciences and related occupations, except management', 39.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Natural and applied sciences and related occupations, except management', 39.80);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Health occupations, except management', 20.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Health occupations, except management', 20.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Health occupations, except management', 21.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Occupations in education, law and social, community and government services, except management', 39.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Occupations in education, law and social, community and government services, except management', 39.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Occupations in education, law and social, community and government services, except management', 36.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Occupations in art, culture, recreation and sport, except management', 7.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Occupations in art, culture, recreation and sport, except management', 8.00);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Occupations in art, culture, recreation and sport, except management', 9.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Sales and service occupations, except management', 67.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Sales and service occupations, except management', 65.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Sales and service occupations, except management', 64.70);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Trades, transport and equipment operators and related occupations, except management', 46.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Trades, transport and equipment operators and related occupations, except management', 46.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Trades, transport and equipment operators and related occupations, except management', 52.20);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Natural resources, agriculture and related production occupations, except management', 3.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Natural resources, agriculture and related production occupations, except management', 2.10);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Natural resources, agriculture and related production occupations, except management', 3.30);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2021, 'Kitchener-Waterloo', 11, 'Occupations in manufacturing and utilities, except management', 27.50);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2022, 'Kitchener-Waterloo', 11, 'Occupations in manufacturing and utilities, except management', 30.60);
INSERT INTO public.employmentbyprovince (date, city, city_id, noc, value) VALUES (2023, 'Kitchener-Waterloo', 11, 'Occupations in manufacturing and utilities, except management', 29.30);


--
-- TOC entry 3367 (class 0 OID 17234)
-- Dependencies: 216
-- Data for Name: gas_prices; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (1, 3, '2021-01-01', 107.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (2, 3, '2021-02-01', 115.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (3, 3, '2021-03-01', 125.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (4, 3, '2021-04-01', 125.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (5, 3, '2021-05-01', 127.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (6, 3, '2021-06-01', 129.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (7, 3, '2021-07-01', 135.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (8, 3, '2021-08-01', 134.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (9, 3, '2021-09-01', 135.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (10, 3, '2021-10-01', 142.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (11, 3, '2021-11-01', 140.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (12, 3, '2021-12-01', 130.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (13, 3, '2022-01-01', 141.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (14, 3, '2022-02-01', 153.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (15, 3, '2022-03-01', 171.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (16, 3, '2022-04-01', 169.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (17, 3, '2022-05-01', 195.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (18, 3, '2022-06-01', 208.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (19, 3, '2022-07-01', 187.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (20, 3, '2022-08-01', 170.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (21, 3, '2022-09-01', 153.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (22, 3, '2022-10-01', 167.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (23, 3, '2022-11-01', 170.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (24, 3, '2022-12-01', 144.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (25, 3, '2023-01-01', 151.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (26, 3, '2023-02-01', 151.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (27, 3, '2023-03-01', 150.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (28, 3, '2023-04-01', 163.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (29, 3, '2023-05-01', 151.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (30, 3, '2023-06-01', 153.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (31, 3, '2023-07-01', 174.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (32, 3, '2023-08-01', 185.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (33, 3, '2023-09-01', 182.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (34, 3, '2023-10-01', 166.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (35, 3, '2023-11-01', 161.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (36, 3, '2023-12-01', 154.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (37, 5, '2021-01-01', 115.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (38, 5, '2021-02-01', 122.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (39, 5, '2021-03-01', 129.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (40, 5, '2021-04-01', 128.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (41, 5, '2021-05-01', 133.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (42, 5, '2021-06-01', 136.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (43, 5, '2021-07-01', 139.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (44, 5, '2021-08-01', 141.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (45, 5, '2021-09-01', 143.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (46, 5, '2021-10-01', 151.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (47, 5, '2021-11-01', 152.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (48, 5, '2021-12-01', 148.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (49, 5, '2022-01-01', 155.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (50, 5, '2022-02-01', 166.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (51, 5, '2022-03-01', 183.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (52, 5, '2022-04-01', 181.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (53, 5, '2022-05-01', 205.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (54, 5, '2022-06-01', 216.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (55, 5, '2022-07-01', 196.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (56, 5, '2022-08-01', 183.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (57, 5, '2022-09-01', 160.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (58, 5, '2022-10-01', 173.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (59, 5, '2022-11-01', 173.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (60, 5, '2022-12-01', 151.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (61, 5, '2023-01-01', 160.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (62, 5, '2023-02-01', 157.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (63, 5, '2023-03-01', 160.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (64, 5, '2023-04-01', 167.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (65, 5, '2023-05-01', 166.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (66, 5, '2023-06-01', 169.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (67, 5, '2023-07-01', 172.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (68, 5, '2023-08-01', 179.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (69, 5, '2023-09-01', 178.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (70, 5, '2023-10-01', 166.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (71, 5, '2023-11-01', 162.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (72, 5, '2023-12-01', 158.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (73, 6, '2021-01-01', 110.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (74, 6, '2021-02-01', 117.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (75, 6, '2021-03-01', 123.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (76, 6, '2021-04-01', 125.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (77, 6, '2021-05-01', 129.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (78, 6, '2021-06-01', 131.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (79, 6, '2021-07-01', 134.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (80, 6, '2021-08-01', 135.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (81, 6, '2021-09-01', 136.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (82, 6, '2021-10-01', 143.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (83, 6, '2021-11-01', 142.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (84, 6, '2021-12-01', 136.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (85, 6, '2022-01-01', 144.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (86, 6, '2022-02-01', 156.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (87, 6, '2022-03-01', 172.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (88, 6, '2022-04-01', 174.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (89, 6, '2022-05-01', 198.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (90, 6, '2022-06-01', 205.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (91, 6, '2022-07-01', 180.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (92, 6, '2022-08-01', 165.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (93, 6, '2022-09-01', 148.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (94, 6, '2022-10-01', 164.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (95, 6, '2022-11-01', 161.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (96, 6, '2022-12-01', 140.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (97, 6, '2023-01-01', 148.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (98, 6, '2023-02-01', 146.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (99, 6, '2023-03-01', 147.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (100, 6, '2023-04-01', 157.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (101, 6, '2023-05-01', 156.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (102, 6, '2023-06-01', 158.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (103, 6, '2023-07-01', 162.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (104, 6, '2023-08-01', 168.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (105, 6, '2023-09-01', 164.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (106, 6, '2023-10-01', 152.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (107, 6, '2023-11-01', 148.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (108, 6, '2023-12-01', 143.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (109, 8, '2021-01-01', 110.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (110, 8, '2021-02-01', 118.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (111, 8, '2021-03-01', 123.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (112, 8, '2021-04-01', 125.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (113, 8, '2021-05-01', 130.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (114, 8, '2021-06-01', 132.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (115, 8, '2021-07-01', 136.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (116, 8, '2021-08-01', 137.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (117, 8, '2021-09-01', 137.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (118, 8, '2021-10-01', 145.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (119, 8, '2021-11-01', 144.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (120, 8, '2021-12-01', 137.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (121, 8, '2022-01-01', 146.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (122, 8, '2022-02-01', 157.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (123, 8, '2022-03-01', 173.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (124, 8, '2022-04-01', 174.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (125, 8, '2022-05-01', 198.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (126, 8, '2022-06-01', 205.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (127, 8, '2022-07-01', 180.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (128, 8, '2022-08-01', 165.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (129, 8, '2022-09-01', 148.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (130, 8, '2022-10-01', 164.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (131, 8, '2022-11-01', 161.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (132, 8, '2022-12-01', 140.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (133, 8, '2023-01-01', 148.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (134, 8, '2023-02-01', 144.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (135, 8, '2023-03-01', 145.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (136, 8, '2023-04-01', 156.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (137, 8, '2023-05-01', 156.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (138, 8, '2023-06-01', 159.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (139, 8, '2023-07-01', 162.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (140, 8, '2023-08-01', 169.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (141, 8, '2023-09-01', 165.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (142, 8, '2023-10-01', 152.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (143, 8, '2023-11-01', 148.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (144, 8, '2023-12-01', 143.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (145, 10, '2021-01-01', 102.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (146, 10, '2021-02-01', 109.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (147, 10, '2021-03-01', 115.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (148, 10, '2021-04-01', 122.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (149, 10, '2021-05-01', 127.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (150, 10, '2021-06-01', 127.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (151, 10, '2021-07-01', 131.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (152, 10, '2021-08-01', 131.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (153, 10, '2021-09-01', 131.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (154, 10, '2021-10-01', 141.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (155, 10, '2021-11-01', 138.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (156, 10, '2021-12-01', 130.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (157, 10, '2022-01-01', 138.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (158, 10, '2022-02-01', 147.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (159, 10, '2022-03-01', 169.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (160, 10, '2022-04-01', 170.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (161, 10, '2022-05-01', 183.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (162, 10, '2022-06-01', 205.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (163, 10, '2022-07-01', 190.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (164, 10, '2022-08-01', 169.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (165, 10, '2022-09-01', 169.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (166, 10, '2022-10-01', 184.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (167, 10, '2022-11-01', 171.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (168, 10, '2022-12-01', 150.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (169, 10, '2023-01-01', 147.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (170, 10, '2023-02-01', 153.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (171, 10, '2023-03-01', 151.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (172, 10, '2023-04-01', 162.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (173, 10, '2023-05-01', 163.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (174, 10, '2023-06-01', 157.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (175, 10, '2023-07-01', 157.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (176, 10, '2023-08-01', 163.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (177, 10, '2023-09-01', 163.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (178, 10, '2023-10-01', 155.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (179, 10, '2023-11-01', 151.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (180, 10, '2023-12-01', 136.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (181, 7, '2021-01-01', 104.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (182, 7, '2021-02-01', 110.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (183, 7, '2021-03-01', 120.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (184, 7, '2021-04-01', 127.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (185, 7, '2021-05-01', 127.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (186, 7, '2021-06-01', 127.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (187, 7, '2021-07-01', 131.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (188, 7, '2021-08-01', 131.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (189, 7, '2021-09-01', 131.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (190, 7, '2021-10-01', 141.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (191, 7, '2021-11-01', 143.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (192, 7, '2021-12-01', 130.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (193, 7, '2022-01-01', 137.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (194, 7, '2022-02-01', 145.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (195, 7, '2022-03-01', 168.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (196, 7, '2022-04-01', 167.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (197, 7, '2022-05-01', 181.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (198, 7, '2022-06-01', 203.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (199, 7, '2022-07-01', 191.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (200, 7, '2022-08-01', 158.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (201, 7, '2022-09-01', 158.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (202, 7, '2022-10-01', 177.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (203, 7, '2022-11-01', 162.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (204, 7, '2022-12-01', 142.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (205, 7, '2023-01-01', 147.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (206, 7, '2023-02-01', 147.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (207, 7, '2023-03-01', 155.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (208, 7, '2023-04-01', 160.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (209, 7, '2023-05-01', 160.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (210, 7, '2023-06-01', 159.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (211, 7, '2023-07-01', 156.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (212, 7, '2023-08-01', 163.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (213, 7, '2023-09-01', 163.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (214, 7, '2023-10-01', 157.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (215, 7, '2023-11-01', 149.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (216, 7, '2023-12-01', 137.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (217, 2, '2021-01-01', 100.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (218, 2, '2021-02-01', 109.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (219, 2, '2021-03-01', 114.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (220, 2, '2021-04-01', 119.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (221, 2, '2021-05-01', 123.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (222, 2, '2021-06-01', 125.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (223, 2, '2021-07-01', 133.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (224, 2, '2021-08-01', 132.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (225, 2, '2021-09-01', 129.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (226, 2, '2021-10-01', 138.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (227, 2, '2021-11-01', 136.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (228, 2, '2021-12-01', 130.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (229, 2, '2022-01-01', 133.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (230, 2, '2022-02-01', 142.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (231, 2, '2022-03-01', 161.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (232, 2, '2022-04-01', 150.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (233, 2, '2022-05-01', 163.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (234, 2, '2022-06-01', 186.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (235, 2, '2022-07-01', 179.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (236, 2, '2022-08-01', 147.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (237, 2, '2022-09-01', 136.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (238, 2, '2022-10-01', 163.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (239, 2, '2022-11-01', 148.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (240, 2, '2022-12-01', 126.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (241, 2, '2023-01-01', 127.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (242, 2, '2023-02-01', 123.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (243, 2, '2023-03-01', 129.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (244, 2, '2023-04-01', 140.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (245, 2, '2023-05-01', 138.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (246, 2, '2023-06-01', 139.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (247, 2, '2023-07-01', 136.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (248, 2, '2023-08-01', 142.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (249, 2, '2023-09-01', 141.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (250, 2, '2023-10-01', 138.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (251, 2, '2023-11-01', 132.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (252, 2, '2023-12-01', 122.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (253, 1, '2021-01-01', 102.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (254, 1, '2021-02-01', 111.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (255, 1, '2021-03-01', 117.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (256, 1, '2021-04-01', 123.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (257, 1, '2021-05-01', 127.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (258, 1, '2021-06-01', 130.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (259, 1, '2021-07-01', 135.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (260, 1, '2021-08-01', 135.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (261, 1, '2021-09-01', 133.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (262, 1, '2021-10-01', 140.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (263, 1, '2021-11-01', 141.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (264, 1, '2021-12-01', 139.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (265, 1, '2022-01-01', 138.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (266, 1, '2022-02-01', 145.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (267, 1, '2022-03-01', 164.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (268, 1, '2022-04-01', 155.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (269, 1, '2022-05-01', 167.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (270, 1, '2022-06-01', 189.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (271, 1, '2022-07-01', 183.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (272, 1, '2022-08-01', 153.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (273, 1, '2022-09-01', 144.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (274, 1, '2022-10-01', 167.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (275, 1, '2022-11-01', 149.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (276, 1, '2022-12-01', 124.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (277, 1, '2023-01-01', 128.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (278, 1, '2023-02-01', 125.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (279, 1, '2023-03-01', 132.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (280, 1, '2023-04-01', 145.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (281, 1, '2023-05-01', 146.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (282, 1, '2023-06-01', 144.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (283, 1, '2023-07-01', 141.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (284, 1, '2023-08-01', 146.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (285, 1, '2023-09-01', 143.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (286, 1, '2023-10-01', 137.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (287, 1, '2023-11-01', 130.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (288, 1, '2023-12-01', 120.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (289, 9, '2021-01-01', 134.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (290, 9, '2021-02-01', 141.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (291, 9, '2021-03-01', 149.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (292, 9, '2021-04-01', 152.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (293, 9, '2021-05-01', 155.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (294, 9, '2021-06-01', 161.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (295, 9, '2021-07-01', 169.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (296, 9, '2021-08-01', 165.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (297, 9, '2021-09-01', 156.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (298, 9, '2021-10-01', 162.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (299, 9, '2021-11-01', 159.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (300, 9, '2021-12-01', 157.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (301, 9, '2022-01-01', 170.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (302, 9, '2022-02-01', 177.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (303, 9, '2022-03-01', 198.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (304, 9, '2022-04-01', 198.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (305, 9, '2022-05-01', 220.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (306, 9, '2022-06-01', 225.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (307, 9, '2022-07-01', 202.40);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (308, 9, '2022-08-01', 193.20);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (309, 9, '2022-09-01', 205.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (310, 9, '2022-10-01', 206.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (311, 9, '2022-11-01', 183.50);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (312, 9, '2022-12-01', 164.10);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (313, 9, '2023-01-01', 179.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (314, 9, '2023-02-01', 183.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (315, 9, '2023-03-01', 183.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (316, 9, '2023-04-01', 188.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (317, 9, '2023-05-01', 187.80);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (318, 9, '2023-06-01', 202.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (319, 9, '2023-07-01', 197.00);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (320, 9, '2023-08-01', 206.90);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (321, 9, '2023-09-01', 203.60);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (322, 9, '2023-10-01', 182.30);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (323, 9, '2023-11-01', 178.70);
INSERT INTO public.gas_prices (gas_price_id, city_id, date, cost_of_gas) VALUES (324, 9, '2023-12-01', 171.70);


--
-- TOC entry 3375 (class 0 OID 17297)
-- Dependencies: 224
-- Data for Name: population; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (1, 1, 1306784, 531062, 820.62);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (2, 2, 1010899, 428857, 765.61);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (3, 3, 439819, 200473, 5475.57);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (4, 11, 378321, 155437, 200.87);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (5, 5, 1762949, 878542, 364.74);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (6, 6, 1017449, 427113, 2788.20);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (7, 7, 226404, 99134, 178.81);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (8, 8, 2794356, 1253238, 631.10);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (9, 9, 662248, 328347, 115.18);
INSERT INTO public.population (population_id, city_id, population, privatedwellings, landarea) VALUES (10, 10, 749607, 315465, 461.78);


--
-- TOC entry 3369 (class 0 OID 17246)
-- Dependencies: 218
-- Data for Name: provinces; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.provinces (id, name) VALUES (1, 'Alberta');
INSERT INTO public.provinces (id, name) VALUES (2, 'British Columbia');
INSERT INTO public.provinces (id, name) VALUES (3, 'Manitoba');
INSERT INTO public.provinces (id, name) VALUES (4, 'New Brunswick');
INSERT INTO public.provinces (id, name) VALUES (5, 'Newfoundland and Labrador');
INSERT INTO public.provinces (id, name) VALUES (6, 'Nova Scotia');
INSERT INTO public.provinces (id, name) VALUES (7, 'Ontario');
INSERT INTO public.provinces (id, name) VALUES (8, 'Prince Edward Island');
INSERT INTO public.provinces (id, name) VALUES (9, 'Quebec');
INSERT INTO public.provinces (id, name) VALUES (10, 'Saskatchewan');


--
-- TOC entry 3373 (class 0 OID 17287)
-- Dependencies: 222
-- Data for Name: tim_horton_outlets; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (1, 'Winnipeg', '3890 Grant Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (2, 'Winnipeg', '350 North Town Road #200, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (3, 'Winnipeg', '3649 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (4, 'Winnipeg', '1060 Henderson Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (5, 'Winnipeg', '2360 McPhillips St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (6, 'Winnipeg', '393 Portage Ave Unit 159, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (7, 'Winnipeg', '614 Lagimodiere Blvd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (8, 'Winnipeg', '1848 Main St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (9, 'Winnipeg', '570 Pembina Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (10, 'Winnipeg', '188 Isabel St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (11, 'Winnipeg', '1609a Kenaston Blvd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (12, 'Winnipeg', '363 Broadway St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (13, 'Winnipeg', '1590 Notre Dame Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (14, 'Winnipeg', '949 Corydon Ave #2, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (15, 'Winnipeg', '935 Headmaster Row, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (16, 'Winnipeg', '1485 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (17, 'Winnipeg', '1572 Regent Ave W, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (18, 'Winnipeg', '434 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (19, 'Winnipeg', '2401 Pembina Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (20, 'Winnipeg', '1146 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (21, 'Winnipeg', '1510 Pembina Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (22, 'Winnipeg', '1385 McPhillips St #1, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (23, 'Winnipeg', '2305 McPhillips St Unit 314, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (24, 'Winnipeg', '107 Pandora Ave W, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (25, 'Winnipeg', '3296 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (26, 'Winnipeg', '670 Sterling Lyon Pkwy Unit 1, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (27, 'Winnipeg', '1 Lombard Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (28, 'Winnipeg', '65 Chancellors Cir, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (29, 'Winnipeg', '860 Waverley St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (30, 'Winnipeg', '1750 Plessis Rd Unit 305, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (31, 'Winnipeg', '1877 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (32, 'Winnipeg', '854 Nairn Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (33, 'Winnipeg', '727 McDermot Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (34, 'Winnipeg', '1059 Pembina Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (35, 'Winnipeg', '777 Keewatin St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (36, 'Winnipeg', '700 William Ave 2nd Floor, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (37, 'Winnipeg', '306 Donald St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (38, 'Winnipeg', '835 St Mary''s Rd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (39, 'Winnipeg', '2019 Pembina Hwy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (40, 'Winnipeg', '9 Killarney Ave #1, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (41, 'Winnipeg', '255 Maryland St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (42, 'Winnipeg', '2500 Main St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (43, 'Winnipeg', '240 Graham Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (44, 'Winnipeg', '1795 Brookside Blvd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (45, 'Winnipeg', '1330 Taylor Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (46, 'Winnipeg', '1225 St Mary''s Rd Unit 725k, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (47, 'Winnipeg', '1040 Beaverhill Blvd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (48, 'Winnipeg', '2147 St Mary''s Rd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (49, 'Winnipeg', '11 Davis Way, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (50, 'Winnipeg', '1221 St James St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (51, 'Winnipeg', '50 Sage Creek Blvd Unit 300, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (52, 'Winnipeg', '1495 Regent Ave W, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (53, 'Winnipeg', '646 Archibald St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (54, 'Winnipeg', '1555 Regent Ave W, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (55, 'Winnipeg', '1858 King Edward St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (56, 'Winnipeg', '1025 King Edward St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (57, 'Winnipeg', '1521 Dugald Rd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (58, 'Winnipeg', '2000 Wellington Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (59, 'Winnipeg', '20 Birkett Wy, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (60, 'Winnipeg', 'Pembina Hall, 201, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (61, 'Winnipeg', '333 St Mary Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (62, 'Winnipeg', '25 Donwood Dr, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (63, 'Winnipeg', '300 Booth Dr, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (64, 'Winnipeg', '3965 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (65, 'Winnipeg', '15 Commerce Dr, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (66, 'Winnipeg', '619 Sheppard St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (67, 'Winnipeg', '1041 Manitoba Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (68, 'Winnipeg', '263 Main St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (69, 'Winnipeg', '241 2 Ave N, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (70, 'Winnipeg', '141 Provincial Trunk Hwy 12, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (71, 'Winnipeg', '160 Princess St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (72, 'Winnipeg', '1015 Notre Dame Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (73, 'Winnipeg', '118 Brandt St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (74, 'Winnipeg', '150 4 Ave SE, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (75, 'Winnipeg', '34 MB-3, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (76, 'Winnipeg', '20 Drovers Run, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (77, 'Winnipeg', '19 Marion St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (78, 'Winnipeg', '980 St James St, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (79, 'Winnipeg', '2117 Ness Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (80, 'Winnipeg', 'Fletcher Argue, 123, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (81, 'Winnipeg', '1139 Gateway Rd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (82, 'Winnipeg', '27007 Springfield Rd, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (83, 'Winnipeg', '300 Portage Ave, Winnipeg MB', 10);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (84, 'Kitchener-Waterloo', '75 University Avenue, Waterloo ON N2L 2C5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (85, 'Kitchener-Waterloo', '550 King St North, Waterloo ON N2L 5W6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (86, 'Kitchener-Waterloo', '55 Northfield Dr E, Waterloo ON N2K 3T6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (87, 'Kitchener-Waterloo', '415 King St North, Waterloo ON N2J 2Z4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (88, 'Kitchener-Waterloo', '565 King Street North, Waterloo ON N2L 5Z7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (89, 'Kitchener-Waterloo', '227 King Street South - Employee Access Onlyy, 2nd Floor, Waterloo ON N2J 4C5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (90, 'Kitchener-Waterloo', '585 Weber St N, Waterloo ON N2V 1V8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (91, 'Kitchener-Waterloo', '384 King St N, Waterloo ON N2J 2Z3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (92, 'Kitchener-Waterloo', '5 Westhill Drive, Waterloo ON N2T 0C4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (93, 'Kitchener-Waterloo', '65 University Ave East, Waterloo ON N2J 2V9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (94, 'Kitchener-Waterloo', '425 University Ave East, Waterloo ON N2K 4C9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (95, 'Kitchener-Waterloo', '200 University Ave W, Davis Hall - University Of Waterloo, Waterloo ON N2L 3G1', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (96, 'Kitchener-Waterloo', '94 Bridgeport Rd East, Waterloo ON N2J 2J9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (97, 'Kitchener-Waterloo', '305 Phillip Street,, Waterloo ON N2L 5Z5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (98, 'Kitchener-Waterloo', '465 Phillip St, Waterloo ON N2L 6C7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (99, 'Kitchener-Waterloo', '109 King St North, Waterloo ON N2J 2X5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (100, 'Kitchener-Waterloo', '108 University Ave East, Waterloo ON N2J 2W2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (101, 'Kitchener-Waterloo', '151 Columbia St, Waterloo ON N2L 3L2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (102, 'Vancouver', '555 Hastings St West, Unit 6, Vancouver BC V6B 5K3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (103, 'Vancouver', '1130 West Pender St, Vancouver BC V6E 4A4', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (104, 'Vancouver', '2424 Main Mall - Forestry, Vancouver BC V6T 1Z2', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (105, 'Vancouver', '3451 Kingsway, Vancouver BC V5R 5L3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (106, 'Vancouver', '463 Robson St, Vancouver BC V6B 6L9', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (107, 'Vancouver', '108 West Pender, Vancouver BC V6B 0K4', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (108, 'Vancouver', '200 Burrard St, Vancouver BC V6C 3L6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (109, 'Vancouver', '2698 Rupert Street, Vancouver BC V5M 4X2', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (110, 'Vancouver', '750 West Pender St, Unit 104, Vancouver BC V6C 2T7', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (111, 'Vancouver', '5896 Fraser St, Vancouver BC V5W 2Z5', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (112, 'Vancouver', '800 Griffiths Way, Vancouver BC V6B 6G1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (113, 'Vancouver', '3102 West Broadway St, Vancouver BC V6K 2H3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (114, 'Vancouver', '487 Interurban Way, Vancouver BC V5X 0C5', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (115, 'Vancouver', '1635 Commercial Dr, Vancouver BC V5L 3Y3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (116, 'Vancouver', '6501 Main Street, Vancouver BC V5X 3H1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (117, 'Vancouver', '306 Terminal Ave, Vancouver BC V6A 3W9', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (118, 'Vancouver', '607 Dunsmuir St, Vancouver BC V6B 1Y7', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (119, 'Vancouver', '889 Great Northern Way, Vancouver BC V5T 1E1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (120, 'Vancouver', '195 Terminal Ave, Vancouver BC V6A 4C4', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (121, 'Vancouver', '947 Hornby St, Vancouver BC V6Z 1V3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (122, 'Vancouver', '3463 Dunbar St, Vancouver BC V6S 2C3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (123, 'Vancouver', '2015 Main Mall - David Lam, Vancouver BC V6T 1Z1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (124, 'Vancouver', '206 Keefer Street, Vancouver BC V6A 1X6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (125, 'Vancouver', '650 Georgia St W, Vancouver BC V6B 4N7', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (126, 'Vancouver', 'Skytrain Level - 1055 West Georgia St, 3rd Concourse Level - Unit 2468, Vancouver BC V6E 3P1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (127, 'Vancouver', '2225 41st Ave W, Vancouver BC V6M 2A3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (128, 'Vancouver', '865 West Broadway, Vancouver BC V5Z 1J9', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (129, 'Vancouver', '1595 West Broadway, Unit 101, Vancouver BC V6J 1W6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (130, 'Vancouver', '4065 Cambie Street, Vancouver BC V5Z 0G9', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (131, 'Vancouver', '6525 Oak St, Vancouver BC V6P 3Z3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (132, 'Vancouver', '2889 East 12th Avenue, Vancouver BC V5M 4T5', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (133, 'Vancouver', '1299 Robson St, Vancouver BC V6E 1C2', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (134, 'Vancouver', '3502 East Hastings St, Vancouver BC V5K 2A7', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (135, 'Vancouver', '5698 Victoria Drive, Vancouver BC V5P 3W4', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (136, 'Vancouver', '2801 East Hastings, Unit #1, Vancouver BC V5K 2A1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (137, 'Vancouver', 'Ground Level - 1055 Georgia St W, Unit 118, Vancouver BC V6E 3P3', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (138, 'Vancouver', '100 West 49th Ave, 1st Floor, Vancouver BC V5Y 2Z6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (139, 'Vancouver', '1205 Burrard St, Vancouver BC V6Z 1Z5', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (140, 'Vancouver', '818 West 6th St, Vancouver BC V5Z 1A6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (141, 'Vancouver', '1001 Denman St, Vancouver BC V6G 2M4', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (142, 'Vancouver', '490 Hornby St, Unit 101, Vancouver BC V6C 3J1', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (143, 'Vancouver', '756 Davie St, Vancouver BC V6G 1B6', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (144, 'Vancouver', '107-505 Burrard St, Vancouver BC V6C 3A8', 9);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (145, 'Toronto', '77 King Street West, Unit 0052c, Toronto ON M5K 2A1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (146, 'Toronto', '969 Eastern Ave, Toronto ON M4L 1A5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (147, 'Toronto', '150 Wynford Dr, Toronto ON M3C 1K6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (148, 'Toronto', '150 John St, Unit 102, Toronto ON M5V 3C3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (149, 'Toronto', 'Main Store - 595 Bay Street Atrium On Bay, Toronto ON M5G 2C2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (150, 'Toronto', '590 Keele St, Toronto ON M6N 3E7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (151, 'Toronto', '426 Danforth Avenue, Toronto ON M4K 1P3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (152, 'Toronto', '952 King St West, Toronto ON M6K 1E4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (153, 'Toronto', '18 King St East, Suite 105, Toronto ON M5C 1C4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (154, 'Toronto', '900 St Clair Ave W, Toronto ON M6C 1C5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (155, 'Toronto', '825 - Coxwell Ave, Toronto ON M4C 3E7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (156, 'Toronto', '1567 Steeles Ave E, Toronto ON M2M 3Y7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (157, 'Toronto', '170 Princes Blvd, Toronto ON M6K 3C3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (158, 'Toronto', '2388 Dundas St W, Toronto ON M6P 1X2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (159, 'Toronto', '1251 Bloor St W, Toronto ON M6H 1N6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (160, 'Toronto', '555 University Ave - No Public Access, Toronto ON M5G 1X8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (161, 'Toronto', '200 King St East, Toronto ON M5A 3W8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (162, 'Toronto', '751 Don Mills Rd, Toronto ON M3C 1S3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (163, 'Toronto', '874 Bloor St. W, Toronto ON M6G 1M5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (164, 'Toronto', '256 Jarvis St, Toronto ON M5B 2J4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (165, 'Toronto', '2150 Bloor St West, Toronto ON M6S 1M8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (166, 'Toronto', '745 College St, Toronto ON M6G 1C5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (167, 'Toronto', 'St. Mike&#39;s Hospital Main Cafeteria - 30 Bond St, 30 Bond St, Toronto ON M5B 1W8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (168, 'Toronto', '55 Front St East, Toronto ON M5E 1B5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (169, 'Toronto', 'Waterpark Place, Unit Fc-10, Toronto ON M5J 2V7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (170, 'Toronto', '3321 Dufferin St, Toronto ON M6A 2T8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (171, 'Toronto', '2575 Danforth Ave, Toronto ON M4C 1L5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (172, 'Toronto', 'Food Court - 130 King St West, Toronto ON M5X 1A9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (173, 'Toronto', '70 Gerrard St West, Toronto ON M5G 1J5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (174, 'Toronto', '1890 Jane St, Toronto ON M9N 2T5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (175, 'Toronto', '82 Adelaide St E, Toronto ON M5C 1K9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (176, 'Toronto', '743 Pape Ave, Toronto ON M4K 3T1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (177, 'Toronto', '175 Bloor St E, Toronto ON M4W 3R8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (178, 'Toronto', '26 Dundas St, Toronto ON M5B 2L6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (179, 'Toronto', '815 Caledonia Rd, Toronto ON M6B 3X8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (180, 'Toronto', '175 Roncesvalles Ave, Toronto ON M6R 2L3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (181, 'Toronto', '2152 Danforth Avenue, Toronto, Toronto ON M4C 1K3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (182, 'Toronto', '2275 Bayview Ave, Toronto ON M4N 3M6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (183, 'Toronto', '1033 Queen St West, Toronto ON M6J 0A6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (184, 'Toronto', '200 Front Street (simcoe Place), Toronto ON M5V 1J2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (185, 'Toronto', 'Cibc Building, No Public Access, Toronto ON M6A 1B8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (186, 'Toronto', '1034 King St W, Toronto ON M6K 3M9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (187, 'Toronto', '381 Mount Pleasant Rd, Toronto ON M4S 2L5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (188, 'Toronto', '3080 Yonge Street, Unit A, Toronto ON M4N 3N1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (189, 'Toronto', '500 Commissioners St, Toronto ON M4M 1B4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (190, 'Toronto', '1728 Bloor St West, Toronto ON M6P 1A8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (191, 'Toronto', '40 Bay Street, Toronto ON M5J 2X2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (192, 'Toronto', '16 Queens Quay West, Toronto ON M5J 2V3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (193, 'Toronto', '1970 St. Clair Ave W, F104, Toronto ON M6N 4X9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (194, 'Toronto', '10 Nova Scotia Avenue, Toronto ON M6K 3C3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (195, 'Toronto', '1094 Bloor St West, Toronto ON M6H 1M5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (196, 'Toronto', '17 - Lower Jarvis St, Unit 9, Toronto ON M5E 1Z2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (197, 'Toronto', '1970 St. Clair Ave W, F104, Toronto ON M6N 4X9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (198, 'Toronto', '419 Bloor St East, Toronto ON M4W 1H7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (199, 'Toronto', '33 Yonge St, Unit 109, Toronto ON M5E 1G4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (200, 'Toronto', '50 Bloor St West, Unit C23a, Toronto ON M4W 3L8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (201, 'Toronto', '2619 Yonge St, Toronto ON M4P 2J1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (202, 'Toronto', '150 King Steet West, Unit C110, Toronto ON M5J 1J9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (203, 'Toronto', '323 Richmond Street East, Toronto ON M5A 4R3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (204, 'Toronto', '610 University Ave, Toronto ON M5J 1A7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (205, 'Toronto', '750 Dundas St West, Toronto ON M6J 3S3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (206, 'Toronto', '69 Regent Park Blvd, Toronto ON M5A 0K7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (207, 'Toronto', '181 Bay St, Toronto ON M5J 2V1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (208, 'Toronto', '1265 Military Trail, Toronto ON M1C 1A4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (209, 'Toronto', '1480 Queen St West, Toronto ON M6K 1M4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (210, 'Toronto', '2825 Markham Rd &amp; Mcnicoll Ave, Toronto ON M1B 2W1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (211, 'Toronto', '829 Lakeshore Blvd East, Toronto ON M4M 1B2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (212, 'Toronto', '91 Danforth Ave, Toronto ON M4K 1N2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (213, 'Toronto', '1 Richmond St West, Toronto ON M5H 3W4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (214, 'Toronto', '553 Lakeshore Rd West, Toronto ON M5V 1A6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (215, 'Toronto', '207 Queens Quay, Toronto ON M5J 1A7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (216, 'Toronto', '45 Manitoba Dr, Toronto ON M6K 3C3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (217, 'Toronto', '1 Mount Pleasant Road - Employee Access Only, Rogers Omp Building (no Public Access), Toronto ON M4Y 2Y5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (218, 'Toronto', '380 Weston Rd, Toronto ON M6N 5H1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (219, 'Toronto', '700 Lawrence Ave West Lawrence Square Mall, Toronto ON M6A 3B4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (220, 'Toronto', '120 Fort York Blvd, Toronto ON M5V 0E3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (221, 'Toronto', '51 Dockside Dr, Toronto ON M5A 0B6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (222, 'Toronto', '145 King St West, Toronto ON M5H 1J8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (223, 'Toronto', '200 Bloor St East, Toronto ON M4W 1E5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (224, 'Toronto', '20 Eglinton Ave West, Toronto ON M4R 1K8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (225, 'Toronto', '171 East Liberty St, Toronto ON M6K 3P6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (226, 'Toronto', '755 Morningside, 4th Floor, Toronto ON M1C 5J9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (227, 'Toronto', '56 Wellesley St West, Unit 104, Toronto ON M5S 2S3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (228, 'Toronto', '205 Humber College Blvd, Toronto ON M9W 5L7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (229, 'Toronto', '100 King St West, Toronto ON M5X 2A1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (230, 'Toronto', '2 Bruyeres Mews, Toronto ON M5V 0G8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (231, 'Toronto', '55 York St, Toronto ON M5J 1R7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (232, 'Toronto', '2 Queen St East, Toronto ON M5C 3G7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (233, 'Toronto', '246 Bloor Street West, Toronto ON M5S 1V4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (234, 'Toronto', '444 Yonge Street College Park, Street Level, Street Level, Toronto ON M5B 2H4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (235, 'Toronto', '444 Yonge Street College Park, Food Court, Food Court, Toronto ON M5B 2H4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (236, 'Toronto', '700 University Ave, Toronto ON M5G 1Z5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (237, 'Toronto', '800 Bay St, Toronto ON M5S 3A9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (238, 'Toronto', '2377 Yonge St, Toronto ON M4P 2C8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (239, 'Toronto', '563 Sherbourne Street, Toronto ON M4X 1W7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (240, 'Toronto', '657 University Ave, Toronto ON M5G 2C4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (241, 'Toronto', '60 Bloor St West, Toronto ON M4W 3B8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (242, 'Toronto', '1269 College St, Toronto ON M6H 1C5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (243, 'Toronto', '160 Kendal Ave, Toronto ON M5R 1M3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (244, 'Toronto', '2700 Dufferin St, Toronto ON M6B 4J3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (245, 'Toronto', '603 Davenport Rd, Toronto ON M5R 1L1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (246, 'Toronto', '3075 Danforth Ave, Toronto ON M1L 1A8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (247, 'Toronto', '555 Yonge St, Toronto ON M4Y 3A6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (248, 'Toronto', '1256 dundas st w, Toronto ON M4M 2V8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (249, 'Toronto', '547 Gerrard St East, Toronto ON M4M 1X7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (250, 'Toronto', 'St. Mike&#39;s Hospital Ptg Building - 36 Queen Street, Toronto ON M5B 1W8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (251, 'Toronto', '1000 Gerrard St. East, Toronto ON M4M 3G6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (252, 'Toronto', '340 Front St West, Toronto ON M5V 3W7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (253, 'Toronto', '637 Kingston Rd, Toronto ON M4E 1R3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (254, 'Toronto', '455 Spadina Ave, Toronto ON M5S 1A1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (255, 'Toronto', '333 Eglinton Ave West, Toronto ON M5P 2L3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (256, 'Toronto', '3487 Dundas St West, Toronto ON M6S 2S5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (257, 'Toronto', '1167 Queen St W, Toronto ON M6J 1J4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (258, 'Toronto', '70 The Pond Rd, Toronto ON M3J 3M6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (259, 'Toronto', '120 Bremner Blvd, Toronto ON M5J 0A8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (260, 'Toronto', '3030 Lawrence Avenue East, Toronto ON M1P 2T7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (261, 'Toronto', '333 Bay Street (path), Toronto ON M5H 2R2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (262, 'Toronto', '40 University Ave,, Unit #3, Toronto ON M5J 1T1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (263, 'Toronto', '2485 Bloor St West, Toronto ON M6S 1P7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (264, 'Toronto', '77 Lower Jarvis, Toronto ON M5E 1N1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (265, 'Toronto', '477 Dundas St West, Toronto ON M5T 1H1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (266, 'Toronto', '1195 Danforth Ave, Toronto ON M4J 1M7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (267, 'Toronto', '1176 St Clair Ave West, Toronto ON M6E 1B4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (268, 'Toronto', '607 Eglinton Ave East, Toronto ON M4P 1P8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (269, 'Toronto', '75 Ashtonbee Rd, F Block- 2nd Floor, Toronto ON M1L 4N4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (270, 'Toronto', '200 Bay St, Unit F6 F7, Toronto ON M5J 2J1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (271, 'Toronto', 'Bell Mobility Building - No Public Access, Toronto ON M3C 4B4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (272, 'Toronto', '720 King St West, Toronto ON M5V 2T3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (273, 'Toronto', '2871 Eglinton Ave East, Toronto ON M1J 2E3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (274, 'Toronto', '1910 Yonge St, Toronto ON M4S 1Z3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (275, 'Toronto', '50 Eglinton Ave, Toronto ON M4P 1A6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (276, 'Toronto', '2002 Queen St East, Toronto ON M4L 1J3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (277, 'Toronto', '250 Bloor St East., Toronto ON M4W 1E5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (278, 'Toronto', '40 King St W, Toronto ON M5H 3Y2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (279, 'Toronto', '731 Eastern Ave, Toronto ON M4M 3H6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (280, 'Toronto', '1 Bridgepoint Dr., M4m 2b5, Toronto ON M4M 2B5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (281, 'Toronto', '3288 Keele Street, Toronto ON M3K 2C5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (282, 'Toronto', '218 Yonge St, Toronto ON M5B 2H1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (283, 'Toronto', '550 St Clair Ave West, Toronto ON M6C 1A5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (284, 'Toronto', '399 Bathurst St, Toronto ON M5T 2S8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (285, 'Toronto', '335 Parliament St, Toronto ON M5A 2Z3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (286, 'Toronto', '150 Dupont St, Toronto ON M5R 2E6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (287, 'Toronto', '3157 Dundas St W, Toronto ON M6P 2A2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (288, 'Toronto', '334 Bloor St West, Toronto ON M5S 1W9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (289, 'Toronto', '561 O&#39; Connor Dr, Toronto ON M4C 2Z7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (290, 'Toronto', '55 St Clair Ave W, Toronto ON M4V 1N5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (291, 'Toronto', '866 Ave Rd, Toronto ON M5P 2K3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (292, 'Toronto', '111 Carlton St, Toronto ON M5B 2G3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (293, 'Toronto', '148 Simcoe St, Toronto ON M5H 3G4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (294, 'Toronto', '361a Old Finch Ave, Toronto ON M1B 5K7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (295, 'Toronto', '663 Yonge St, Toronto ON M4Y 1Z9', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (296, 'Toronto', '1170 Bay St, Toronto ON M5S 2B4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (297, 'Toronto', '185 Sheppard Ave East, Toronto ON M2N 3A8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (298, 'Toronto', '438 University Ave, Toronto ON M5G 2K8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (299, 'Toronto', '120 Adelaide St W Unit Fc-09, Toronto ON M5H 1T1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (300, 'Toronto', '2 Bloor St E, Toronto ON M4W 1A8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (301, 'Toronto', '2075 Bayview Ave, Toronto ON M4N 3M5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (302, 'Toronto', '1733 Eglinton Ave East, Toronto ON M4A 1J8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (303, 'Toronto', '1630 Danforth Ave, Toronto ON M4C 1H6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (304, 'Toronto', '900 Dufferin St., Unit 0565, Toronto ON M6H 4B1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (305, 'Toronto', '45 Overlea Blvd, Toronto ON M4H 1C3', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (306, 'Toronto', '175 Dundas St. E, Toronto ON M5A 1Z4', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (307, 'Toronto', '2245 Yonge St, Toronto ON M4S 2B1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (308, 'Toronto', '101 College St, Unit 14, Toronto ON M5T 1P5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (309, 'Toronto', '4001 Leslie St, Toronto ON M2K 1E1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (310, 'Toronto', '249 Queens Quay West, Toronto ON M5V 1A2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (311, 'Toronto', '100 Wellington St West, Toronto ON M5K 1A2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (312, 'Toronto', '10 Dundas St E  Suite 104, Toronto ON M5B 2G8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (313, 'Toronto', '101 Humber College Blvd, Toronto ON M9V 1R8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (314, 'Toronto', '119 Spadina Ave, Toronto ON M5V 2L1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (315, 'Toronto', '375 King Street West, Toronto ON M5V 1K1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (316, 'Toronto', '2571 St Clair Ave West, Unit # E1, Toronto ON M6N 4Z5', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (317, 'Toronto', '65 Front Str W, Union Station Food Court, Toronto ON M5J 1E6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (318, 'Toronto', '589 King St East, Toronto ON M5V 1M1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (319, 'Toronto', '659 Queen St W, Toronto ON M6G 1L1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (320, 'Toronto', '1521 Yonge St, Toronto ON M4T 1Z2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (321, 'Toronto', '726 Bloor St West, Toronto ON M6G 4A1', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (322, 'Toronto', '581 Parliament St, Toronto ON M4X 1P7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (323, 'Toronto', '200 Wellington St. W. (metro Centre), Unit 360, Toronto ON M5V 3C7', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (324, 'Toronto', '2075 Sheppard Ave E, Toronto ON M2J 1W6', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (325, 'Toronto', '1110 Bathurst St, Toronto ON M5R 3H2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (326, 'Toronto', '1801 Eglinton Ave West, Toronto ON M6E 2H8', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (327, 'Toronto', '130 Harbour Street, Toronto ON M5J 2Y2', 8);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (328, 'Regina', '3737 Wascana Parkway, Regina SK S4S 0A2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (329, 'Regina', '2121 Saskatchewan Dr, 12th Floor, Regina SK S4P 3Y2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (330, 'Regina', '1600 Pinkie Road, Regina SK S4T 1E6', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (331, 'Regina', '2105 East Victoria Ave, Regina SK S4N 6P3', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (332, 'Regina', '1800 11th Ave, Regina SK S4P 0H8', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (333, 'Regina', '275 Albert St N, Regina SK S4R 3C3', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (334, 'Regina', '4533 Parliament Ave, Regina SK S4S 2M3', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (335, 'Regina', '5201 Regina Ave, Regina SK S4W 1B3', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (336, 'Regina', '5855 Rochdale Blvd, Regina SK S4X 2P9', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (337, 'Regina', '4400 4th Ave, Regina SK S4T 0H8', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (338, 'Regina', '1246 Albert St, Regina SK S4R 2R3', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (339, 'Regina', '4500 Gordon Rd, Regina SK S4S 6H7', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (340, 'Regina', '1960 Prince Of Wales Dr, Regina SK S4Z 1A4', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (341, 'Regina', '3737 Wascana Parkway, Regina SK S4S 0A2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (342, 'Regina', '1490 Park St, Regina SK S4N 2G2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (343, 'Regina', '3737 Wascana Parkway, Regina SK S4S 0A2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (344, 'Regina', '3711 Rochdale Blvd., Regina SK S4X 0P9', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (345, 'Regina', '103 Albert St, Regina SK S4R 3B8', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (346, 'Regina', '4225 Albert St, Regina SK S4S 3R6', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (347, 'Regina', '4455 Rochdale Blvd, Regina SK S4X 4P7', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (348, 'Regina', '4845 Harbour Landing Dr, Regina SK S4W 0B7', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (349, 'Regina', '860 Winnipeg St, Regina SK S4R 8G2', 7);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (350, 'Ottawa', '3224 Hawthorne Rd, Ottawa ON K1G 3V9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (351, 'Ottawa', '2636 Innes Rd, Ottawa ON K1B 4Z5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (352, 'Ottawa', '1583 Alta Vista, Ottawa ON K1G 0E9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (353, 'Ottawa', '1000 Airport Parkway Private, Unit 2500, Ottawa ON K1V 9B4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (354, 'Ottawa', '200 Sparks St, Ottawa ON K1P 5C1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (355, 'Ottawa', '1778 Carling Ave, Ottawa ON K2A 1E1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (356, 'Ottawa', '1000 Palladium Drive, Ottawa ON K2V 1A4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (357, 'Ottawa', '631 Industrial Ave, Ottawa ON K1G 0Z1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (358, 'Ottawa', '1406 Prince Of Wales Dr, Ottawa ON K2C 1N6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (359, 'Ottawa', '1000 Airport Parkway Private, Ottawa International Airport, Ottawa ON K1V 9B4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (360, 'Ottawa', '1384 Baseline Rd, Ottawa ON K2C 0A9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (361, 'Ottawa', '1802 St Laurent Blvd, Ottawa ON K1G 1A2', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (362, 'Ottawa', '263 Bank Street, Ottawa ON K2P 1X5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (363, 'Ottawa', '1260 Merivale Rd, Ottawa ON K2C 3Z5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (364, 'Ottawa', '100 Constellation Crescent, Ottawa ON K1P 1J1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (365, 'Ottawa', '1600 Bank St, Ottawa ON K1V 7Y6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (366, 'Ottawa', '40 Ruskin Ave, Ottawa ON K1Y 4W7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (367, 'Ottawa', '1950 Walkley Rd, Ottawa ON K1H 1W1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (368, 'Ottawa', '801 Aviation Parkway, Ottawa ON K1K 4R3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (369, 'Ottawa', '1610 Walkley Rd, Ottawa ON K1V 6P5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (370, 'Ottawa', '1125 Colonel By Dr-carleton Univ Phy Ctr, Ottawa ON K1S 5B6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (371, 'Ottawa', '800 King Edward Ave, Ottawa ON K1N 6N5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (372, 'Ottawa', 'Ottawa Civic Hospital, Ottawa ON K1Y 4E9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (373, 'Ottawa', '2951 Bank St, Ottawa ON K1T 1N9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (374, 'Ottawa', '4764 Bank St, Ottawa ON K1T 3W7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (375, 'Ottawa', '2701 Riverside Dr, Ottawa ON K1A 0B1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (376, 'Ottawa', '145 Jean-jacques Lussier, Ottawa ON K1N 6N5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (377, 'Ottawa', '2545 Baseline Rd, Ottawa ON K2H 7B3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (378, 'Ottawa', '655 Bronson Avenue, Ottawa ON K1S 4E7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (379, 'Ottawa', '145 Jean-jacques Lussier, Ottawa ON K1N 6N5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (380, 'Ottawa', '2277 Riverside Dr, Unit 214, Ottawa ON K1H 7X6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (381, 'Ottawa', '1859 Carling Ave, Ottawa ON K2A 1E4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (382, 'Ottawa', '90 Elgin St, Unit 2, Ottawa ON K1P 0C6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (383, 'Ottawa', '2301 Navaho Dr, Ottawa ON K2G 6Z1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (384, 'Ottawa', '401 Hazeldean Rd, Ottawa ON K2T 1T8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (385, 'Ottawa', '525 Somerset St West, Ottawa ON K1R 5W6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (386, 'Ottawa', '1967 Riverside Drive, Ottawa ON K1H 7W9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (387, 'Ottawa', '2162 Prince Of Wales Dr, Ottawa ON K2E 0A1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (388, 'Ottawa', '372 Hunt Club Rd, Ottawa ON K1V 1C1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (389, 'Ottawa', '2020 Trim Rd, Ottawa ON K4A 0G4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (390, 'Ottawa', '171 Slater St, Ottawa ON K1P 5H7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (391, 'Ottawa', '423 Cumberland St, Ottawa ON K1N 0B5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (392, 'Ottawa', '1270 Trim Rd, Ottawa ON K4A 3P7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (393, 'Ottawa', '1200 St Laurent Blvd, Unit #629, Ottawa ON K1K 3B8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (394, 'Ottawa', '1385 Woodroffe, Ottawa ON K2G 1V8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (395, 'Ottawa', '50 Rideau St, Ottawa ON K1N 9J7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (396, 'Ottawa', '2970 Carling Ave, Ottawa ON K2B 7J7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (397, 'Ottawa', '3705 Riverside Dr, Ottawa ON K1V 1G8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (398, 'Ottawa', '161 Laurier Ave, Ottawa ON K1P 5J2', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (399, 'Ottawa', '187 Bank St, Ottawa ON K2P 1W7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (400, 'Ottawa', '1239 Donald St, Ottawa ON K1J 8W3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (401, 'Ottawa', '99-99 Rideau St, Ottawa ON K1N 9L8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (402, 'Ottawa', '85 Rue University, Ottawa ON K1N 6N5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (403, 'Ottawa', '2121 Carling Ave Unit 57, Ottawa ON K2A 1S3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (404, 'Ottawa', '1665 Hunt Club Rd, Ottawa ON K1T 3Z3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (405, 'Ottawa', '1980 Baseline Rd, Ottawa ON K2C 0C6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (406, 'Ottawa', '1611 Bank St, Ottawa ON K1V 7Y8', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (407, 'Ottawa', '2016 Ogilvie Rd, Ottawa ON K1J 7N9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (408, 'Ottawa', '1125 Colonel By Dr, Ottawa ON K1S 5B6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (409, 'Ottawa', '450 Bank St, Ottawa ON K2K 1X7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (410, 'Ottawa', '3580 Strandherd Dr, Ottawa ON K2J 5L4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (411, 'Ottawa', '330 Queen St, Ottawa ON K1R 7Y5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (412, 'Ottawa', '535 Terminal Ave, Ottawa ON K1G 0Z2', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (413, 'Ottawa', '100 Metcalfe St, Ottawa ON K1P 0A7', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (414, 'Ottawa', '275 Slater St, Ottawa ON K1P 5H9', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (415, 'Ottawa', 'Ottawa General Hospital - 501 Smyth Road, Ottawa ON K1H 8L6', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (416, 'Ottawa', '2495 Bank St, Unit 19, Ottawa ON K1V 0Y5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (417, 'Ottawa', '993 Richmond Rd, Ottawa ON K2B 6R1', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (418, 'Ottawa', '2100 Hunt Club Rd, Ottawa ON K1T 3S4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (419, 'Ottawa', '800 King Edward Ave, Ottawa ON K1N 6N5', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (420, 'Ottawa', '3045 Baseline Rd, 2nd Floor, Ottawa ON K2H 8P4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (421, 'Ottawa', '2800 Lancaster Road, Ottawa ON K1B 4S4', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (422, 'Ottawa', '585 Montreal Rd, Ottawa ON K1K 4K3', 6);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (423, 'Kitchener-Waterloo', '1475 Victoria St N, Kitchener ON N2B 3E4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (424, 'Kitchener-Waterloo', '385 Frederick St. #41, Kitchener ON N2H 2P2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (425, 'Kitchener-Waterloo', '795 Ottawa St South, Kitchener ON N2E 3H5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (426, 'Kitchener-Waterloo', '3570 King St E, Kitchener ON N2A 2W6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (427, 'Kitchener-Waterloo', '1426 Weber St E, Kitchener ON N2A 3A7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (428, 'Kitchener-Waterloo', '123 Pioneer Rd, Kitchener ON N2P 2A3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (429, 'Kitchener-Waterloo', '4285 King St East, Kitchener ON N2P 2E9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (430, 'Kitchener-Waterloo', '1144 Courtland Ave East, Kitchener ON N2C 2H5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (431, 'Kitchener-Waterloo', 'Inside St. Mary&#39;s Hospital, Kitchener ON N2M 1B2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (432, 'Kitchener-Waterloo', '340 Westmount Rd West, Kitchener ON N2M 5C4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (433, 'Kitchener-Waterloo', '1000 Victoria St N, Kitchener ON N2B 3C4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (434, 'Kitchener-Waterloo', '260 Bleams Rd, Kitchener ON N2C 2K6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (435, 'Kitchener-Waterloo', '638 Belmont Ave West, Kitchener ON N2M 1N6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (436, 'Kitchener-Waterloo', '526 Lancaster St W, Kitchener ON N2K 1L9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (437, 'Kitchener-Waterloo', '1201 Fischer-hallman Rd, Kitchener ON N2N 4X8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (438, 'Kitchener-Waterloo', '299 Doon Valley Dr, Kitchener ON N2G 4M4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (439, 'Kitchener-Waterloo', '340 Fairway Rd S Kitchener, Kitchener ON N2C 1X3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (440, 'Kitchener-Waterloo', '835 King St West, Kitchener ON N2G 1G3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (441, 'Kitchener-Waterloo', '4 King St E, Kitchener ON N2G 2K6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (442, 'Kitchener-Waterloo', '2420 Homer Watson Blvd, Kitchener ON N2P 2R6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (443, 'Kitchener-Waterloo', '85 Frederick St, Kitchener ON N2H 0A7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (444, 'Kitchener-Waterloo', '1241 Weber St East, Kitchener ON N2A 1C2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (445, 'Kitchener-Waterloo', '2960 Kingsway Dr, Unit: F008a, Kitchener ON N2C 1X1', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (446, 'Kitchener-Waterloo', '730 King St West, Kitchener ON N2G 1E6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (447, 'Kitchener-Waterloo', '1020 Ottawa St, Kitchener ON N2A 3Z3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (448, 'Kitchener-Waterloo', '750 Ottawa St S, Kitchener ON N2E 1B6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (449, 'Kitchener-Waterloo', '925 King St E, Kitchener ON N2G 2M7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (450, 'Kitchener-Waterloo', '120 Ottawa Street N, Kitchener ON N2H 3K4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (451, 'Kitchener-Waterloo', '4396 King St E, Kitchener ON N2P 2G4', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (452, 'Kitchener-Waterloo', '301-1415 Huron Road, Kitchener ON N2R 0L3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (453, 'Kitchener-Waterloo', '851 Fischer Hallman Rd, Unit 7, Kitchener ON N2M 5N8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (454, 'Kitchener-Waterloo', '700 Westmount Rd E, Kitchener ON N2M 1R9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (455, 'Kitchener-Waterloo', '593 Victoria St N, Kitchener ON N2H 5E9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (456, 'Kitchener-Waterloo', '1450 Block Line Rd, Kitchener ON N2E 2K2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (457, 'Kitchener-Waterloo', '354 Highland Rd West, Kitchener ON N2M 3C7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (458, 'Kitchener-Waterloo', '685 Fischer-hallman Rd, Kitchener ON N2E 1L7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (459, 'Halifax', '7001 Mumford Rd, Halifax NS B3L 4R3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (460, 'Halifax', '217 Chain Lake Dr, Halifax NS B3S 1C1', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (461, 'Halifax', '6034 Lady Hammond Rd, Halifax NS B3K 2R6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (462, 'Halifax', '3600 Dutch Village Rd, Halifax NS B3N 2S3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (463, 'Halifax', '6570 Bayers Rd, Halifax NS B3L 2B3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (464, 'Halifax', '5685 Leeds St, Halifax NS B3K 4M2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (465, 'Halifax', '7010 Mumford Rd, Building B4, Halifax NS B3L 2H6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (466, 'Halifax', 'Stadacona Expressmart, 5470 Gangway St, Halifax NS B3K 5M5', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (467, 'Halifax', '5511 Spring Garden Rd, Halifax NS B3J 1G9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (468, 'Halifax', '166 Bedford Hwy, Halifax NS B3M 2J6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (469, 'Halifax', '1047 Barrington St, Halifax NS B3H 2P8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (470, 'Halifax', '1781 Upper Water St, Halifax NS B3J 3R6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (471, 'Halifax', '1199 Hammonds Plains Rd., Halifax NS B4B 1B3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (472, 'Halifax', '278 Lacewood Dr, Halifax NS B3M 3N8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (473, 'Halifax', '117 Kearney Lake Road Suite 1 Wedgewood Plaza, Halifax NS B3M 4N9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (474, 'Halifax', '6046 Young St, Halifax NS B3K 2A2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (475, 'Halifax', '6020 Young St, Halifax NS B3K 2A2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (476, 'Halifax', '200 Bedford Highway, Halifax NS B3M 2K2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (477, 'Halifax', '5201 Duke St, Halifax NS B3J 1N9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (478, 'Halifax', '5859 University Ave, Halifax NS B3H 4B7', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (479, 'Halifax', '6455 Quinpool Rd, Halifax NS B3L 1B1', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (480, 'Halifax', '6136 University Avenue, Halifax NS B3H 4J2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (481, 'Halifax', '40 Peakview Way, Halifax NS B3M 0G2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (482, 'Halifax', '923 Robie St Stmary&#39;s Univ, Halifax NS B3H 3C3', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (483, 'Halifax', '171 Herring Cove Rd, Halifax NS B3P 1K9', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (484, 'Halifax', '1 Pine Grove Dr, Halifax NS B3R 1S2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (485, 'Halifax', '5850/5980 University Ave, Iwk Health Center, Halifax NS B3K 6R8', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (486, 'Halifax', '390 Osborne Street, Halifax NS B3N 3J6', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (487, 'Halifax', '6230 Coburg Rd, Halifax NS B3H 2A2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (488, 'Halifax', '5 Lakelands Blvd, Halifax NS B3K 5L2', 3);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (489, 'Edmonton', '6512 170th Ave Nw, Edmonton AB T5X 3X6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (490, 'Edmonton', '9710 132nd Ave Nw, Edmonton AB T5E 6J4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (491, 'Edmonton', '13080 St Albert Trail Nw, Edmonton AB T5L 2L5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (492, 'Edmonton', '4819 184th St, Edmonton AB T6M 2W8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (493, 'Edmonton', '10310 31st Ave Nw, Edmonton AB T6J 6Y5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (494, 'Edmonton', '10220 104 Ave Nw, Edmonton AB T5H 2X6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (495, 'Edmonton', '5003 101 Ave Nw, Edmonton AB T6A 0G8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (496, 'Edmonton', 'Engineering - Teaching &amp; Learning Cntr, Edmonton AB T6G 2H6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (497, 'Edmonton', '12996 50th St, Edmonton AB T5A 4L2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (498, 'Edmonton', '16438 87th Ave, Edmonton AB T5R 4H2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (499, 'Edmonton', '361 Allard Blvd Sw, Edmonton AB T6W 0J2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (500, 'Edmonton', '890 Webber Greens Dr Nw, Edmonton AB T5T 4K5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (501, 'Edmonton', '15606 111th Ave Nw, Edmonton AB T5M 2R7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (502, 'Edmonton', '7441 76th Ave, Edmonton AB T6C 4M3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (503, 'Edmonton', '14111 28 Ave Sw, Edmonton AB T6W 3Y9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (504, 'Edmonton', '11240 Groat Rd North West, Edmonton AB T5M 4E7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (505, 'Edmonton', '87th Ave &amp; 116 Th Street, Edmonton AB T6G 2H6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (506, 'Edmonton', '7535 38 Ave Nw, Edmonton AB T6K 3X9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (507, 'Edmonton', '10519 82 Avenue Northwest, 83 St NW #174, Edmonton AB T6E 2A3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (508, 'Edmonton', '110 Watt Common Sw, Edmonton AB T6X 1X2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (509, 'Edmonton', '2331 66 Street Nw, Edmonton AB T6K 4B4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (510, 'Edmonton', '7220-119th Ave, Edmonton AB T5B 4M9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (511, 'Edmonton', '11084 51st Ave Nw, Edmonton AB T6H 0L4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (512, 'Edmonton', '7502 Gateway Blvd N.w., Edmonton AB T6E 6E8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (513, 'Edmonton', '1045 Katz Group - Rexall Centre Of Pharmacy And Health Research, 8613-114 St, Edmonton AB T6G 2L7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (514, 'Edmonton', '10221 170th St, Unit 1020, Edmonton AB T5P 4V4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (515, 'Edmonton', 'P209, 10200 102 Ave, Suite 209, Edmonton AB T5J 4V7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (516, 'Edmonton', '14204 23rd Ave, Edmonton AB T6R 3L6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (517, 'Edmonton', '4950 Calgary Trail Nw Esso Otr, Edmonton AB T6H 5H5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (518, 'Edmonton', '4310 66th St, Edmonton AB T6K 4A2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (519, 'Edmonton', '12820 82nd St Nw, Edmonton AB T5E 2T2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (520, 'Edmonton', '11763 106 St, Edmonton AB T5G 2R1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (521, 'Edmonton', '14865 137th Ave Nw, Edmonton AB T5L 4H5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (522, 'Edmonton', '12852 167 Ave, Edmonton AB T6V 1B1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (523, 'Edmonton', '1000 Airport Road, Edmonton Intl Airport (departures), Edmonton AB T9E 0V3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (524, 'Edmonton', '21458 115 Ave Nw, Edmonton AB T5S 0K5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (525, 'Edmonton', '9841 Winterburn Road, Edmonton AB T5T 7P6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (526, 'Edmonton', '2133 99th St Nw, Edmonton AB T6N 1J7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (527, 'Edmonton', '18403 111th Ave Nw, Edmonton AB T5S 2V5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (528, 'Edmonton', '13704 50th St Nw, Edmonton AB T5A 4Y3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (529, 'Edmonton', '2309 Rabbit Hill Rd Nw, Edmonton AB T6R 3L6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (530, 'Edmonton', '2943 137th Ave, Edmonton AB T5A 5G8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (531, 'Edmonton', '10665 Jasper Ave, Unit 108, Edmonton AB T5J 3S9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (532, 'Edmonton', '862 Parsons Rd Sw, Edmonton AB T6X 0B4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (533, 'Edmonton', '8030 167th Ave Nw, Edmonton AB T5Z 0E5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (534, 'Edmonton', '1a Sir Winston Churchill Square Nw, Edmonton AB T5J 0R2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (535, 'Edmonton', '9902 153rd Ave Nw, Edmonton AB T5X 6A4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (536, 'Edmonton', '3351 34th St Nw, Edmonton AB T6T 0B5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (537, 'Edmonton', '11312 109th St Nw, Edmonton AB T5G 2T7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (538, 'Edmonton', '5015 111th Southgate Centre, Edmonton AB T6H 4M6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (539, 'Edmonton', '420 Manning Crossing Nw, Edmonton AB T5A 5A1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (540, 'Edmonton', '13015 118th Ave Nw, Edmonton AB T5L 2L3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (541, 'Edmonton', '13831 127th St, Edmonton AB T6V 1A8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (542, 'Edmonton', '15710 Stony Plain Rd Nw, Edmonton AB T5P 3Z5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (543, 'Edmonton', 'Londonderry Mall, Edmonton AB T5C 3C8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (544, 'Edmonton', '16039 97th St, Edmonton AB T5X 6B1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (545, 'Edmonton', '9499 137 Ave Nw, Edmonton AB T5E 5R8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (546, 'Edmonton', 'Central Academic Building, Edmonton AB T6G 2H6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (547, 'Edmonton', '8427 112th St Nw, Edmonton AB T6G 1K5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (548, 'Edmonton', '1850 102 St Nw, Unit 1, Edmonton AB T6N 1N3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (549, 'Edmonton', '11104 184 St Nw, Edmonton AB T5S 2S6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (550, 'Edmonton', 'Macewan University, 10700 104th Ave, Edmonton AB T5J 4S2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (551, 'Edmonton', '5292 - Ellerslie Rd Sw, Edmonton AB T6X 1A4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (552, 'Edmonton', '7457 Roper Rd Nw, Edmonton AB T6B 3K9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (553, 'Edmonton', '#2171, 8770 170th St West Ed. Mall, Store Front, Edmonton AB T5T 4J2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (554, 'Edmonton', '11762 106 St Nw, Nait Ict Center, Edmonton AB T5G 2R1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (555, 'Edmonton', '11763 106 St, Edmonton AB T5G 2R1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (556, 'Edmonton', '10240 Kingsway Royal Alexandra Ho, Edmonton AB T5H 3V9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (557, 'Edmonton', '16955 109 Ave Nw, Edmonton AB T5P 4P6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (558, 'Edmonton', 'Nait - X Wing, Edmonton AB T5G 2R1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (559, 'Edmonton', 'Unit 138, 1 - Edmonton City Center, 10025 102a Ave Nw, Edmonton AB T5J 2Y8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (560, 'Edmonton', '10519 82nd Ave Nw, Edmonton AB T6E 2A3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (561, 'Edmonton', '11610 65 Ave Nw, Edmonton AB T6G 2E1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (562, 'Edmonton', '13604 137 Ave, Edmonton AB T5L 2B3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (563, 'Edmonton', '6120 50th St Nw, Edmonton AB T6B 2N7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (564, 'Edmonton', '18314 Lessard Rd, Edmonton AB T6M 2W8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (565, 'Edmonton', '13704 - 164 Street Nw, Edmonton AB T5V 1R6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (566, 'Edmonton', '3522 118th Ave Nw, Edmonton AB T5W 0Z4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (567, 'Edmonton', '3745 17 St Nw, Edmonton AB T6T 1H9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (568, 'Edmonton', '10365 111 St, Edmonton AB T5K 2V3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (569, 'Edmonton', '10110 Kingsway Ave, Edmonton AB T5H 3V8', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (570, 'Edmonton', '16012 100a Ave, Edmonton AB T5P 0M1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (571, 'Edmonton', '5105 167th Ave Nw, Edmonton AB T5Y 0L3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (572, 'Edmonton', '10215 108 St Nw, Edmonton AB T5J 1L6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (573, 'Edmonton', '5010 99th St Nw, Edmonton AB T6E 3N6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (574, 'Edmonton', '#101 - 9950 - 132 Avenue, Edmonton AB T5E 6W1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (575, 'Edmonton', '4403 50th St, Edmonton AB T6L 6X4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (576, 'Edmonton', '11940 111 Ave Nw, Edmonton AB T5G 0E5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (577, 'Edmonton', '3042 Granville Drive N.w., Edmonton AB T5T 4V3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (578, 'Edmonton', '1317 175th Street, Edmonton AB T6W 4H3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (579, 'Edmonton', '12621 Victoria Trail Nw, Edmonton AB T5A 4W4', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (580, 'Edmonton', '11103 Ellerslie Rd Sw, Edmonton AB T6W 0E9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (581, 'Edmonton', '17004 111th Ave, Edmonton AB T5S 2Y1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (582, 'Edmonton', 'Manning Dr Nw &amp; 153rd Ave Nw, Edmonton AB T5Y 6A1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (583, 'Edmonton', '18531 Stony Plain Rd Nw, Edmonton AB T5S 2X6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (584, 'Edmonton', '6234 Currents Dr Nw, Edmonton AB T6W 0J2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (585, 'Edmonton', '9655 63rd Ave, Edmonton AB T6E 0G2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (586, 'Edmonton', '125 Univ Campus Nw, Edmonton AB T6G 2H6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (587, 'Edmonton', '15224 127 St Nw, Edmonton AB T6V 0C5', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (588, 'Edmonton', '20108 Lessard Road Nw, Edmonton AB T6M 0T9', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (589, 'Edmonton', '10904 111 Avenue Nw- Esso Otr, Edmonton AB T5G 0C7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (590, 'Edmonton', '8555 Argyll Rd Nw, Edmonton AB T6C 4B2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (591, 'Edmonton', '9850 34th Ave Nw, Edmonton AB T6E 6L1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (592, 'Edmonton', '6833 177 St, Edmonton AB T5T 4K3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (593, 'Edmonton', '6470 28th Ave, Edmonton AB T6L 6N3', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (594, 'Edmonton', '15830 87 Ave, Edmonton AB T5R 5Z1', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (595, 'Edmonton', '5204 23rd Ave, Edmonton AB T6L 6Y7', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (596, 'Edmonton', '17761 100th Ave Nw, Edmonton AB T5S 1R6', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (597, 'Edmonton', '1524 23rd Ave Nw, Edmonton AB T6T 0Y2', 2);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (598, 'Calgary', '255 East Hills Blvd Se, Calgary AB T2A 4X7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (599, 'Calgary', '240 16th Ave Ne, Calgary AB T2E 1J8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (600, 'Calgary', '3134 Hospital Dr Nw, Calgary AB T2N 5A1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (601, 'Calgary', '5a Heritage Gate Se, Calgary AB T2H 3A7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (602, 'Calgary', '924 16th Ave Nw, Calgary AB T2M 0K3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (603, 'Calgary', '444 5th Ave Sw, Unit 101, Calgary AB T2P 2T8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (604, 'Calgary', 'Southcentre Mall, Calgary AB T2J 3V1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (605, 'Calgary', '8835 Macleod Trail Se, Calgary AB T2V 2X4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (606, 'Calgary', '1341 32nd Ave Ne, Calgary AB T2E 7Z5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (607, 'Calgary', '200-10233 Elbow Dr Sw, Unit 200, Calgary AB T2W 1E8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (608, 'Calgary', '1510-7 Mahogany Plaza Se, Calgary AB T2M 0T7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (609, 'Calgary', '4705 16th Ave Nw, Calgary AB T2A 0S5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (610, 'Calgary', '240 4 Ave Sw, 229, Calgary AB T2P 4H4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (611, 'Calgary', '2443 54th Avenue Sw, Calgary AB T3E 1M8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (612, 'Calgary', '1715 70 Street Se, Calgary AB T1X 0L4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (613, 'Calgary', '222 205 5th Ave Sw, Calgary AB T2P 2V7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (614, 'Calgary', 'Dome Tower, 324 7 Ave Sw, Calgary AB T2P 4K8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (615, 'Calgary', '8116-8650 112 Ave Nw (royal Oak), Unit 8116, Calgary AB T3R 0R5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (616, 'Calgary', '640 5th Ave Sw, Calgary AB T2P 3G4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (617, 'Calgary', '#510 19587 Seton Cr Se, Calgary AB T3M 2T5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (618, 'Calgary', '117 1323 Centre St North, Calgary AB T2E 2R5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (619, 'Calgary', '100-20 Heritage Meadows, Calgary AB T2H 0B5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (620, 'Calgary', '40 Midlake Blvd Se, Calgary AB T2X 1J1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (621, 'Calgary', '775 4th St, Calgary AB T2G 1T1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (622, 'Calgary', '177 Country Hills Blvd Nw, Unit 238, Calgary AB T3K 4W4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (623, 'Calgary', '1015 4th St Sw, Calgary AB T2R 1J4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (624, 'Calgary', '151 Copperpond Blvd Se, Unit 201, Calgary AB T2Z 0Z7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (625, 'Calgary', '225 7th Ave Sw, Unit 165, Calgary AB T2P 2W3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (626, 'Calgary', '1211 12th Ave Sw, Calgary AB T3C 3S7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (627, 'Calgary', '2045 Symons Valley Parkway, Calgary AB T3P 0Y2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (628, 'Calgary', '4015 Centre St N, Calgary AB T2E 2Y4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (629, 'Calgary', '1632 14th Ave Nw, Calgary AB T2N 1M7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (630, 'Calgary', '1185 49th Ave Ne, Calgary AB T2E 8V2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (631, 'Calgary', '816-100 Auburn Meadows Dr Se, Calgary AB T2G 3M5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (632, 'Calgary', '1301 16th Ave Nw - Cenovus Bldg, Calgary AB T2M 0L4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (633, 'Calgary', '10125 19th St Ne, Calgary AB T3J 3P9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (634, 'Calgary', '3580 20 Ave Ne, Calgary AB T1Y 6E8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (635, 'Calgary', '102-255 Sage Vally Common Nw, Calgary AB T3R 1T8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (636, 'Calgary', '303 Shawville Blvd Se, Unit 400, Calgary AB T2Y 2Z3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (637, 'Calgary', '855 8th Ave Sw, Calgary AB T2P 1H4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (638, 'Calgary', '3508 32nd Ave Ne, Unit 500, Calgary AB T1H 6J7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (639, 'Calgary', '11472 Braeside Dr Sw, Calgary AB T2W 4X8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (640, 'Calgary', '2335 162nd Ave Sw, Calgary AB T2Y 4S6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (641, 'Calgary', '5105 Falconridge Blvd Ne, Calgary AB T3J 3K9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (642, 'Calgary', '115-5029 Nosehill Dr Nw, Calgary AB T3L 0A2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (643, 'Calgary', '615 Macleod Trail Se, Calgary AB T2G 4T8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (644, 'Calgary', '35 Sage Hill Gate Nw, Calgary AB T3R 0S4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (645, 'Calgary', '500 Country Hills Blvd Ne, Unit 900, Calgary AB T3K 4Y7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (646, 'Calgary', '79 Crowfoot Way Nw, Calgary AB T3G 2R2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (647, 'Calgary', '400 Barlow Square Se, Calgary AB T2C 5S5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (648, 'Calgary', '2000 Airport Road Ne, Calgary AB T2E 6W5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (649, 'Calgary', '4750 17th Ave Se, Calgary AB T2A 0V1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (650, 'Calgary', '28 - Oki Dr Nw, Calgary AB T3B 6A8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (651, 'Calgary', '#110-15 Sage Hill Plaza, Calgary AB T3R 0S4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (652, 'Calgary', '6428 Bowness Rd Nw, Calgary AB T3B 0E7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (653, 'Calgary', '2550 Country Hills Blvd, Calgary AB T3N 1A6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (654, 'Calgary', '3955 17th Ave Sw, Calgary AB T3E 0C3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (655, 'Calgary', '8338 18th St Se, Unit 500, Calgary AB T2C 4E4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (656, 'Calgary', '1301 16th Ave Nw, Calgary AB T2M 0L4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (657, 'Calgary', '2000 Airport Rd. Ne, Calgary International Airport, Calgary AB T2E 6W5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (658, 'Calgary', '2000 Airport Rd Ne, Calgary International Airport, Calgary AB T2E 6W5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (659, 'Calgary', '2681 Sunridge Way Ne, Calgary AB T1Y 7K7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (660, 'Calgary', '25238 Twp Rd 254a, 254a, Calgary AB T3L 2P9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (661, 'Calgary', '3525 26th Ave Se, Calgary AB T2B 3M9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (662, 'Calgary', '2525 Woodview Dr Sw, Calgary AB T2W 4N4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (663, 'Calgary', '880 16th Ave Sw, Unit 110, Calgary AB T2R 1J9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (664, 'Calgary', '12580 Symons Valley Rd Nw, Calgary AB T3P 0A3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (665, 'Calgary', '332 6 Ave Se, Calgary AB T2G 4S6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (666, 'Calgary', '#100 202 6th Ave Sw  Bow Valley Bottom, Calgary AB T2P 2V7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (667, 'Calgary', '347 Southland Dr, Calgary AB T2J 3L4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (668, 'Calgary', '1440 52nd St Ne, Unit 550, Calgary AB T2A 4T8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (669, 'Calgary', '520 3 Avenue Sw, Unit#205, Calgary AB T2P 0R3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (670, 'Calgary', '6510 Country Hills Nw, Calgary AB T3G 4R8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (671, 'Calgary', '444 58th Ave Se, Calgary AB T2H 0P4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (672, 'Calgary', '3660 Westwinds Dr Ne, #101, Calgary AB T3J 5H3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (673, 'Calgary', '4307 130th Ave Se, Unit 5, Calgary AB T2Z 3V8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (674, 'Calgary', '7170 80th Avenue Ne, Unit 400, Calgary AB T3J 0P6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (675, 'Calgary', 'Mount Royal University Campus, Calgary AB T3E 6K6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (676, 'Calgary', 'Unit 200 -1625 210 Avenue S.e., Calgary AB T2X 4K8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (677, 'Calgary', '15150 Mount Mckenzie Dr Se, Calgary AB T2Z 2L4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (678, 'Calgary', '13615 Bonaventure Dr, Calgary AB T2J 6W5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (679, 'Calgary', '99 Shawville Blvd Se, Calgary AB T2Y 3W5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (680, 'Calgary', '100 Beddington Blvd Ne, Calgary AB T3K 2E2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (681, 'Calgary', '6 Richard Way Sw, Calgary AB T3E 7M9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (682, 'Calgary', '5927 Signal Hill Centre, Calgary AB T3H 3P8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (683, 'Calgary', '6455 Macleod Trail Sw, Calgary AB T3C 1S2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (684, 'Calgary', '15425 Bannister Rd, Unit 30, Calgary AB T2X 3E9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (685, 'Calgary', '45 Everridge Dr Sw, Calgary AB T2Y 4R5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (686, 'Calgary', '152 5303 68th Ave, Calgary AB T2P 3K4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (687, 'Calgary', '1204 Kensington Road Nw, Calgary AB T2N 3P5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (688, 'Calgary', '555 Saddledome Rise Se, Calgary AB T2G 2W1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (689, 'Calgary', '575 36th St Ne, Calgary AB T2A 4W3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (690, 'Calgary', '4448 Front St, Calgary AB T3M 1M4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (691, 'Calgary', '401 9th Ave Sw, Calgary AB T2P 3C5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (692, 'Calgary', '6825 Macleod Trail S, Calgary AB T2H 0L5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (693, 'Calgary', '9650 Harvest Hills Blvd Ne, Unit 200, Calgary AB T3K 6G4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (694, 'Calgary', '3550 52 St Ne, Calgary AB T1Y 6H1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (695, 'Calgary', '3840 Macleod Trail Se, Calgary AB T2G 2R2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (696, 'Calgary', '3508 37th St Sw, Calgary AB T3E 7B1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (697, 'Calgary', '3625 Shaganappi Trail Nw, Calgary AB T3A 0E2', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (698, 'Calgary', '6460 Centre St Ne, Calgary AB T2K 5C5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (699, 'Calgary', '2520 52 St Ne, Calgary AB T1Y 3R5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (700, 'Calgary', '1820b Uxbridge Rd Nw, Calgary AB T2N 3Z1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (701, 'Calgary', 'Unit 7, 28 Mckenzie Towne Avenue, Calgary AB T2Z 3S7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (702, 'Calgary', '2616 39th Ave Ne, Calgary AB T1Y 7J9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (703, 'Calgary', 'Apt 2314 - 1317 27 Street Se, Calgary AB T2N 1N4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (704, 'Calgary', '905 64th Ave Nw, Calgary AB T2K 0M5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (705, 'Calgary', '10810 50th St Se, Calgary AB T2C 3E6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (706, 'Calgary', '917 85th St Sw, Unit 402, Calgary AB T3H 5Z9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (707, 'Calgary', '10 Chaparral Dr Se, Unit #103, Calgary AB T2X 3R7', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (708, 'Calgary', '345 6th Ave Se, Calgary AB T2G 4V1', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (709, 'Calgary', '402 Collegiate Blvd Nw, Calgary AB T1Y 3R5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (710, 'Calgary', '#400, 12100 Macleod Trail Se Avenida Place Shopping Centre, Unit 400, Calgary AB T2J 7G9', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (711, 'Calgary', '500 Centre St Se, Calgary AB T2G 1A6', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (712, 'Calgary', '3619 61st Ave Se, Unit 4000, Calgary AB T2C 4T8', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (713, 'Calgary', '4949 Barlow Trail Se Unit 2, #2, Calgary AB T2B 3B5', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (714, 'Calgary', '5279 72nd Ave Se, Calgary AB T2C 3H3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (715, 'Calgary', '979 64th Ave Ne, Calgary AB T2E 7Z4', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (716, 'Calgary', '100 Walden Gate, Calgary AB T2X 0P3', 1);
INSERT INTO public.tim_horton_outlets (tim_hortons_id, city, address, city_id) VALUES (717, 'Calgary', '2021 Pegasus Rd Ne, Calgary AB T2E 8C3', 1);


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 221
-- Name: city_details_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.city_details_city_id_seq', 717, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 219
-- Name: electricity_rate_electricity_rate_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.electricity_rate_electricity_rate_id_seq', 30, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 215
-- Name: gas_prices_gas_price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gas_prices_gas_price_id_seq', 324, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 223
-- Name: population_population_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.population_population_id_seq', 10, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 217
-- Name: provinces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.provinces_id_seq', 10, true);


--
-- TOC entry 3207 (class 2606 OID 17218)
-- Name: cities cities_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT cities_pkey PRIMARY KEY (city_id);


--
-- TOC entry 3215 (class 2606 OID 17294)
-- Name: tim_horton_outlets city_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tim_horton_outlets
    ADD CONSTRAINT city_details_pkey PRIMARY KEY (tim_hortons_id);


--
-- TOC entry 3213 (class 2606 OID 17265)
-- Name: electricity_rate electricity_rate_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electricity_rate
    ADD CONSTRAINT electricity_rate_pkey PRIMARY KEY (electricity_rate_id);


--
-- TOC entry 3209 (class 2606 OID 17239)
-- Name: gas_prices gas_prices_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_prices
    ADD CONSTRAINT gas_prices_pkey PRIMARY KEY (gas_price_id);


--
-- TOC entry 3217 (class 2606 OID 17302)
-- Name: population population_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.population
    ADD CONSTRAINT population_pkey PRIMARY KEY (population_id);


--
-- TOC entry 3211 (class 2606 OID 17251)
-- Name: provinces provinces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.provinces
    ADD CONSTRAINT provinces_pkey PRIMARY KEY (id);


--
-- TOC entry 3221 (class 2606 OID 17266)
-- Name: electricity_rate electricity_rate_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electricity_rate
    ADD CONSTRAINT electricity_rate_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- TOC entry 3218 (class 2606 OID 17271)
-- Name: cities fk_city_province; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cities
    ADD CONSTRAINT fk_city_province FOREIGN KEY (province_id) REFERENCES public.provinces(id);


--
-- TOC entry 3222 (class 2606 OID 17276)
-- Name: electricity_rate fk_electricity_rate_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.electricity_rate
    ADD CONSTRAINT fk_electricity_rate_city FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- TOC entry 3219 (class 2606 OID 17281)
-- Name: gas_prices fk_gas_prices_city; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_prices
    ADD CONSTRAINT fk_gas_prices_city FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


--
-- TOC entry 3220 (class 2606 OID 17240)
-- Name: gas_prices gas_prices_city_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gas_prices
    ADD CONSTRAINT gas_prices_city_id_fkey FOREIGN KEY (city_id) REFERENCES public.cities(city_id);


-- Completed on 2024-03-24 20:53:17

--
-- PostgreSQL database dump complete
--

