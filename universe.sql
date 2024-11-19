--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_designation character varying(10),
    classification character varying(30),
    diameter_ly integer,
    distance_ly integer,
    stars_billion integer,
    galaxy_group character varying(30)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_km numeric,
    orbital_distance_km numeric,
    orbital_period_days numeric,
    liquid_water boolean,
    collisional_atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer,
    diameter_km numeric,
    orbital_distance_au numeric,
    mean_surface_temp_c numeric,
    liquid_water boolean,
    planet_category_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_category; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_category (
    planet_category_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_category OWNER TO freecodecamp;

--
-- Name: planet_category_category_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_category_category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_category_category_id_seq OWNER TO freecodecamp;

--
-- Name: planet_category_category_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_category_category_id_seq OWNED BY public.planet_category.planet_category_id;


--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    constellation character varying(30),
    star_designation character varying(45),
    spectral_classification character varying(10),
    age_myr integer,
    habitable_zone_planet boolean,
    evolutionary_stage character varying(45),
    solar_radius numeric,
    distance_ly numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_category planet_category_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_category ALTER COLUMN planet_category_id SET DEFAULT nextval('public.planet_category_category_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'M31', 'spiral', 152000, 2540000, 1000, 'Local Group');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', NULL, 'barred spiral', 180000, 27000, 400, 'Local Group');
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 'M87', 'elliptical', 120000, 53000000, 1000, 'Virgo Cluster');
INSERT INTO public.galaxy VALUES (4, 'Sombrero Galaxy', 'M104', 'barred spiral', 94900, 29000000, NULL, 'M104');
INSERT INTO public.galaxy VALUES (5, 'Backwards Galaxy', 'NGC 4622', 'spiral', 61366, 111000000, NULL, 'NGC 4709');
INSERT INTO public.galaxy VALUES (6, 'Pinwheel Galaxy', 'M101', 'spiral', 87400, 20900000, 1000, 'M101');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Deimos', 5, 12.4, 23460, 1.26, false, false);
INSERT INTO public.moon VALUES (3, 'Phobos', 5, 22.5, 9270, 0.32, false, false);
INSERT INTO public.moon VALUES (4, 'Callisto', 6, 4800, 188300, 16.7, false, true);
INSERT INTO public.moon VALUES (5, 'Europa', 6, 3126, 670900, 3.55, true, false);
INSERT INTO public.moon VALUES (6, 'Io', 6, 3629, 421600, 1.77, false, true);
INSERT INTO public.moon VALUES (7, 'Ganymede', 6, 5276, 1070000, 7.16, true, false);
INSERT INTO public.moon VALUES (8, 'Titan', 7, 5150, 1221850, 16.0, true, false);
INSERT INTO public.moon VALUES (9, 'Tethys', 7, 1060, 294660, 1.89, false, false);
INSERT INTO public.moon VALUES (10, 'Rhea', 7, 1528, 527040, 4.52, false, false);
INSERT INTO public.moon VALUES (11, 'Enceladus', 7, 498, 238020, 1.37, true, false);
INSERT INTO public.moon VALUES (12, 'Oberon', 8, 1526, 582600, 13.5, false, false);
INSERT INTO public.moon VALUES (13, 'Ariel', 8, 1160, 191240, 2.52, false, false);
INSERT INTO public.moon VALUES (14, 'Titania', 8, 1578, 435840, 8.71, false, false);
INSERT INTO public.moon VALUES (15, 'Ubriel', 8, 1190, 265970, 4.14, false, false);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 2705, 354800, 5.88, false, true);
INSERT INTO public.moon VALUES (17, 'Charon', 12, 1212, 19600, 6.4, false, false);
INSERT INTO public.moon VALUES (18, 'Thebe', 6, 100, 221900, 0.675, false, false);
INSERT INTO public.moon VALUES (19, 'Amalthea', 6, 262, 181300, 0.498, false, false);
INSERT INTO public.moon VALUES (20, 'Dione', 7, 1120, 377400, 2.74, false, false);
INSERT INTO public.moon VALUES (1, 'Luna', 4, 3475, 384400, 27.3, false, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima Centauri b', 4, 14900, 0.029, NULL, NULL, 3);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, 4880, 0.39, 167.0, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 1, 12100, 0.72, 464.0, false, 1);
INSERT INTO public.planet VALUES (4, 'Earth', 1, 12700, 1.00, 56.7, true, 1);
INSERT INTO public.planet VALUES (5, 'Mars', 1, 6780, 1.52, -60.0, false, 1);
INSERT INTO public.planet VALUES (6, 'Jupiter', 1, 140000, 5.20, -108, false, 2);
INSERT INTO public.planet VALUES (7, 'Saturn', 1, 116000, 9.58, -139, false, 2);
INSERT INTO public.planet VALUES (8, 'Uranus', 1, 50700, 19.2, -197, false, 4);
INSERT INTO public.planet VALUES (9, 'Neptune', 1, 49200, 30.1, -201, false, 4);
INSERT INTO public.planet VALUES (10, 'Vega b', 3, NULL, 0.25, 2980, false, 3);
INSERT INTO public.planet VALUES (11, 'Ceres', 1, 476, 2.8, -100, false, 5);
INSERT INTO public.planet VALUES (12, 'Pluto', 1, 2376, 39.5, -229, false, 5);
INSERT INTO public.planet VALUES (13, 'Makemake', 1, 1430, 45.4, -233, false, 5);


--
-- Data for Name: planet_category; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_category VALUES (1, 'terrestrial', 'Composed primarily of silicate rocks or metals');
INSERT INTO public.planet_category VALUES (2, 'gas giant', 'Composed primarily of hydrogen and helium');
INSERT INTO public.planet_category VALUES (3, 'neptunian', 'Hydrogen and helium dominated atmosphere, interior is rocky with heavier metals at the core');
INSERT INTO public.planet_category VALUES (4, 'ice giant', 'Composed primarily of gasses and liquids consisting of elements heavier than hydrogen and helium');
INSERT INTO public.planet_category VALUES (5, 'dwarf planet', 'Large enough to be gravitationally rounded but too small to achieve orbital dominance');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 2, NULL, NULL, 'G2V', 4600, true, 'main sequence', 1.0, 0);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 2, 'Orion', 'Alpha Orionis', 'M1', 14, false, 'red supergiant', 722, 702);
INSERT INTO public.star VALUES (3, 'Vega', 2, 'Lyra', 'Alpha Lyrae', 'A0V', 455, false, 'main sequence', 2.4, 25);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 2, 'Centaurus', 'Alpha Centauri C', 'M5.5', 4850, true, 'main sequence', 0.15, 4.25);
INSERT INTO public.star VALUES (5, 'Sirius', 2, 'Canis Major', 'Alpha Canis Majoris', 'A0', 242, false, 'main sequence', 1.713, 8.6);
INSERT INTO public.star VALUES (6, 'Polaris Aa', 2, 'Ursa Minor', 'Alpha Ursae Minoris', 'F7Ib', 55, false, 'yellow supergiant', 37.5, 375);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_category_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_category_category_id_seq', 5, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_designation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_designation_key UNIQUE (galaxy_designation);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet_category planet_category_category_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_category
    ADD CONSTRAINT planet_category_category_key UNIQUE (name);


--
-- Name: planet_category planet_category_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_category
    ADD CONSTRAINT planet_category_pkey PRIMARY KEY (planet_category_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_category_id_fkey FOREIGN KEY (planet_category_id) REFERENCES public.planet_category(planet_category_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

