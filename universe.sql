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
    name character varying(100) NOT NULL,
    galaxy_type text NOT NULL,
    is_spherical boolean NOT NULL,
    is_age_in_millions_of_years integer NOT NULL,
    has_life boolean,
    distance_from_earth integer
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
    name character varying(100) NOT NULL,
    planet_id integer,
    radius_in_km integer NOT NULL,
    has_craters boolean NOT NULL,
    is_spherical boolean,
    orbit_period_days integer
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
    name character varying(100) NOT NULL,
    star_id integer,
    mass_in_earth_masses numeric NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star integer,
    radius_in_km integer,
    hs_atmosphere boolean
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
-- Name: space_object; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.space_object (
    space_object_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    discovered_in_year integer NOT NULL,
    distance_from_earth integer,
    is_artificial boolean NOT NULL,
    is_in_habitable_zone boolean
);


ALTER TABLE public.space_object OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_object_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_object_object_id_seq OWNER TO freecodecamp;

--
-- Name: space_object_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_object_object_id_seq OWNED BY public.space_object.space_object_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    size_in_solar_radii numeric NOT NULL,
    is_burning boolean NOT NULL,
    distance_from_center integer,
    age_in_millions_of_years integer NOT NULL,
    has_planets boolean
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
-- Name: space_object space_object_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object ALTER COLUMN space_object_id SET DEFAULT nextval('public.space_object_object_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', true, 13500, true, 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', true, 10000, false, 2537000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', true, 10000, false, 3000000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'Irregular', false, 13000, false, 160000);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'Irregular', false, 12500, false, 200000);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'Elliptical', true, 13200, false, 29000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737, true, true, 27);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11, true, true, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6, true, true, 1);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821, true, true, 2);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560, true, true, 4);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634, true, true, 7);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410, true, true, 17);
INSERT INTO public.moon VALUES (8, 'Titan', 6, 2575, true, true, 16);
INSERT INTO public.moon VALUES (9, 'Enceladus', 6, 252, true, true, 1);
INSERT INTO public.moon VALUES (10, 'Mimas', 6, 198, true, true, 1);
INSERT INTO public.moon VALUES (11, 'Rhea', 6, 764, true, true, 5);
INSERT INTO public.moon VALUES (12, 'Iapetus', 6, 735, true, true, 79);
INSERT INTO public.moon VALUES (13, 'Oberon', 7, 761, true, true, 14);
INSERT INTO public.moon VALUES (14, 'Titania', 7, 789, true, true, 9);
INSERT INTO public.moon VALUES (15, 'Umbriel', 7, 584, true, true, 4);
INSERT INTO public.moon VALUES (16, 'Triton', 8, 1353, true, true, 6);
INSERT INTO public.moon VALUES (17, 'Charon', 9, 606, true, true, 6);
INSERT INTO public.moon VALUES (18, 'Miranda', 7, 235, true, true, 1);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 578, true, true, 3);
INSERT INTO public.moon VALUES (20, 'Nereid', 8, 170, true, true, 360);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0.055, false, 57, 2439, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0.815, false, 108, 6051, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 1.0, true, 150, 6371, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0.107, false, 228, 3389, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 317.8, false, 778, 69911, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 95.16, false, 1430, 58232, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 14.54, false, 2870, 25362, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 17.15, false, 4495, 24622, true);
INSERT INTO public.planet VALUES (9, 'Alpha Centauri Bb', 2, 1.27, false, 600, 6371, false);
INSERT INTO public.planet VALUES (10, 'Kepler-452b', 4, 5.5, false, 1400, 7500, true);
INSERT INTO public.planet VALUES (11, 'HD 189733 b', 6, 365.2, false, 700, 12227, true);
INSERT INTO public.planet VALUES (12, 'WASP-12b', 6, 455, false, 870, 12400, true);


--
-- Data for Name: space_object; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.space_object VALUES (1, 'Voyager 1', 'Spacecraft', 1977, 22812000, true, false);
INSERT INTO public.space_object VALUES (2, 'Hubble Telescope', 'Space Telescope', 1990, 570, true, false);
INSERT INTO public.space_object VALUES (3, 'Oumuamua', 'Interstellar Object', 2017, 250000, false, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 1.0, true, 27000, 4600, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 0.15, true, 4200, 4600, true);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 1.71, true, 8500, 240, false);
INSERT INTO public.star VALUES (4, 'Vega', 2, 2.36, true, 25000, 455, false);
INSERT INTO public.star VALUES (5, 'Betelgeuse', 3, 887, true, 18000, 8500, false);
INSERT INTO public.star VALUES (6, 'Rigel', 4, 78.9, true, 26000, 860, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_object_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_object_object_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: space_object space_object_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_name_key UNIQUE (name);


--
-- Name: space_object space_object_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.space_object
    ADD CONSTRAINT space_object_pkey PRIMARY KEY (space_object_id);


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

