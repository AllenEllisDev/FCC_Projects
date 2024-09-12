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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description character varying(30),
    number_of_stars integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_types character varying(30),
    age_in_billions_of_years numeric(8,2),
    number_of_stars_in_millions integer
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
    moon_type character varying(20),
    planet_id integer,
    is_tidal_locked boolean
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
    age_in_millions_of_years integer,
    number_of_moons integer,
    in_habitable_zone boolean NOT NULL,
    star_id integer,
    description text,
    distance_from_earth numeric(50,3),
    planet_type character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

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
    age_in_millions_of_years integer,
    galaxy_id integer,
    number_of_planets integer,
    distance_from_earth numeric(50,3),
    star_type character varying(20),
    has_habitable_planet boolean
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 'Princess of Ethiopia', 16);
INSERT INTO public.constellation VALUES (2, 'Antlia', 'Air pump', 9);
INSERT INTO public.constellation VALUES (3, 'Apus', 'Bird of Paradise', 12);
INSERT INTO public.constellation VALUES (4, 'Aquarius', 'Water bearer', 97);
INSERT INTO public.constellation VALUES (5, 'Aquila', 'Eagle', 65);
INSERT INTO public.constellation VALUES (6, 'Ara', 'Altar', 17);
INSERT INTO public.constellation VALUES (7, 'Aries', 'Ram', 61);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our Home', 'Spiral', 13.60, 400);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', NULL, 'Spiral', 10.01, 1000000);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', NULL, 'Dwarf', 1.10, 30000);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', NULL, 'Spiral', 0.07, 40000);
INSERT INTO public.galaxy VALUES (5, 'Ursa Major III', NULL, 'Dwarf', 11.00, 0);
INSERT INTO public.galaxy VALUES (6, 'Circinus', NULL, 'Seyfert', 0.80, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Luna', NULL, 3, NULL);
INSERT INTO public.moon VALUES (3, 'Phobos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (4, 'Deimos', NULL, 4, NULL);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, 5, NULL);
INSERT INTO public.moon VALUES (6, 'Ganymeade', NULL, 5, NULL);
INSERT INTO public.moon VALUES (7, 'Io', NULL, 5, NULL);
INSERT INTO public.moon VALUES (8, 'Callisto', NULL, 5, NULL);
INSERT INTO public.moon VALUES (9, 'Kallichore', NULL, 5, NULL);
INSERT INTO public.moon VALUES (10, 'Amalthea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (11, 'Himalia', NULL, 5, NULL);
INSERT INTO public.moon VALUES (12, 'Lysithea', NULL, 5, NULL);
INSERT INTO public.moon VALUES (13, 'Titan', NULL, 6, NULL);
INSERT INTO public.moon VALUES (14, 'Enceladus', NULL, 6, NULL);
INSERT INTO public.moon VALUES (15, 'Mimas', NULL, 6, NULL);
INSERT INTO public.moon VALUES (16, 'Dione', NULL, 6, NULL);
INSERT INTO public.moon VALUES (17, 'Hyperion', NULL, 6, NULL);
INSERT INTO public.moon VALUES (18, 'Phoebe', NULL, 6, NULL);
INSERT INTO public.moon VALUES (19, 'Rhea', NULL, 6, NULL);
INSERT INTO public.moon VALUES (20, 'Aegir', NULL, 6, NULL);
INSERT INTO public.moon VALUES (21, 'Aegaeon', NULL, 6, NULL);
INSERT INTO public.moon VALUES (22, 'Triton', NULL, 8, NULL);
INSERT INTO public.moon VALUES (23, 'Thalassa', NULL, 8, NULL);
INSERT INTO public.moon VALUES (24, 'Galatea', NULL, 8, NULL);
INSERT INTO public.moon VALUES (25, 'Proteus', NULL, 8, NULL);
INSERT INTO public.moon VALUES (26, 'Titania', NULL, 7, NULL);
INSERT INTO public.moon VALUES (27, 'Miranda', NULL, 7, NULL);
INSERT INTO public.moon VALUES (28, 'Umbriel', NULL, 7, NULL);
INSERT INTO public.moon VALUES (29, 'Ariel', NULL, 7, NULL);
INSERT INTO public.moon VALUES (30, 'Puck', NULL, 7, NULL);
INSERT INTO public.moon VALUES (31, 'Oberon', NULL, 7, NULL);
INSERT INTO public.moon VALUES (32, 'Sycorax', NULL, 7, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 4500, 0, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (2, 'Venus', 4503, 0, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (3, 'Earth', 4543, 1, true, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', 4603, 2, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', 4603, 95, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', 4503, 146, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', 4503, 28, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', 4503, 16, false, 2, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-90b', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-90c', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-90d', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-90e', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-90f', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Kepler-90g', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (15, 'Kepler-90h', 2000, 0, true, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (16, 'Kepler-90i', 2000, 0, false, 3, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (17, 'Trappist-1b', 5000, 0, false, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (18, 'Trappist-1c', 5000, 0, false, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (19, 'Trappist-1d', 5000, 0, false, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (20, 'Trappist-1e', 5000, 0, true, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (21, 'Trappist-1f', 5000, 0, true, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (22, 'Trappist-1g', 5000, 0, true, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (23, 'Trappist-1h', 5000, 0, false, 4, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (24, 'Proxima Centauri b', 4853, 0, true, 10, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (25, 'Proxima Centauri d', 4853, 0, false, 10, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (26, 'Gliese 667 Cb', 2100, 0, false, 9, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (27, 'Gliese 667 Cc', 2100, 0, true, 9, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (28, 'Kepler-22b', 4000, 0, true, 11, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (29, 'Hiisi', 10000, 0, true, 8, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (2, 'Sol', NULL, 1, 8, NULL, 'G', true);
INSERT INTO public.star VALUES (3, 'Kepler-90', NULL, 1, 8, NULL, 'F', true);
INSERT INTO public.star VALUES (4, 'TRAPPIST-1', NULL, 1, 7, NULL, 'M', true);
INSERT INTO public.star VALUES (8, 'Horna', NULL, 3, 1, NULL, 'G', true);
INSERT INTO public.star VALUES (9, 'Gliese 667 C', NULL, 1, 2, NULL, 'M', true);
INSERT INTO public.star VALUES (10, 'Alpha Centauri', NULL, 1, 2, NULL, 'M', true);
INSERT INTO public.star VALUES (11, 'Kepler-22', NULL, 1, 1, NULL, 'G', true);
INSERT INTO public.star VALUES (6, 'Alpha Trianguli', NULL, 3, 0, NULL, 'F', false);
INSERT INTO public.star VALUES (7, 'Beta Trianguli', NULL, 3, 0, NULL, 'F', false);
INSERT INTO public.star VALUES (5, 'Alpheratz', NULL, 2, 0, NULL, 'A', false);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 7, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 32, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 29, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: constellation constellation_constellation_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_constellation_id_key UNIQUE (constellation_id);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


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
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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

