--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2 (Debian 16.2-1.pgdg120+2)
-- Dumped by pg_dump version 16.2

-- Started on 2024-06-02 03:00:28

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
-- TOC entry 5 (class 2615 OID 98831)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- TOC entry 888 (class 1247 OID 99104)
-- Name: role; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.role AS ENUM (
    'resources_department',
    'student',
    'teacher'
);


ALTER TYPE public.role OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 227 (class 1259 OID 99140)
-- Name: UsersOrganization; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsersOrganization" (
    id text NOT NULL,
    "organizationId" text,
    "userId" text NOT NULL,
    status boolean NOT NULL
);


ALTER TABLE public."UsersOrganization" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 98832)
-- Name: _prisma_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE public._prisma_migrations OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 98997)
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id text NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 99025)
-- Name: credits; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credits (
    id text NOT NULL,
    "lessonId" text NOT NULL,
    "userId" text NOT NULL,
    "deadLine" timestamp(3) without time zone NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    office integer NOT NULL
);


ALTER TABLE public.credits OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 99046)
-- Name: future; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.future (
    id text NOT NULL,
    name text NOT NULL,
    place text NOT NULL,
    cost integer NOT NULL,
    description text NOT NULL,
    phone text NOT NULL,
    "specializationId" text NOT NULL,
    photo bytea NOT NULL,
    url text NOT NULL
);


ALTER TABLE public.future OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 99011)
-- Name: lessons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lessons (
    id text NOT NULL,
    "userId" text NOT NULL,
    "group" integer NOT NULL,
    name text NOT NULL,
    date_end timestamp(3) without time zone DEFAULT '2025-09-05 20:16:12.924'::timestamp without time zone NOT NULL,
    date_start timestamp(3) without time zone DEFAULT '2025-04-05 20:16:12.924'::timestamp without time zone NOT NULL
);


ALTER TABLE public.lessons OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 99032)
-- Name: marks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.marks (
    id text NOT NULL,
    "statementId" text NOT NULL,
    date timestamp(3) without time zone NOT NULL,
    mark integer NOT NULL
);


ALTER TABLE public.marks OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 98990)
-- Name: organizators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.organizators (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL,
    logo bytea NOT NULL
);


ALTER TABLE public.organizators OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 99004)
-- Name: portfolio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.portfolio (
    id text NOT NULL,
    "categoryId" text NOT NULL,
    "userId" text NOT NULL,
    name text NOT NULL,
    photo bytea NOT NULL,
    year integer NOT NULL
);


ALTER TABLE public.portfolio OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 99039)
-- Name: specializations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.specializations (
    id text NOT NULL,
    name text NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.specializations OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 99018)
-- Name: statement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.statement (
    id text NOT NULL,
    "userId" text NOT NULL,
    "lessonId" text NOT NULL,
    quater integer NOT NULL
);


ALTER TABLE public.statement OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 98855)
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    token text NOT NULL,
    exp timestamp(3) without time zone NOT NULL,
    "userId" text NOT NULL,
    user_agent text NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 98847)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    created_at timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    updated_at timestamp(3) without time zone NOT NULL,
    date_of_receipt timestamp(3) without time zone NOT NULL,
    "group" integer,
    name text NOT NULL,
    patronymic text,
    phone_number text NOT NULL,
    surname text NOT NULL,
    avatar bytea,
    "specializationId" text NOT NULL,
    roles public.role[] DEFAULT ARRAY['student'::public.role]
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3285 (class 2606 OID 99146)
-- Name: UsersOrganization UsersOrganization_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersOrganization"
    ADD CONSTRAINT "UsersOrganization_pkey" PRIMARY KEY (id);


--
-- TOC entry 3260 (class 2606 OID 98840)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3268 (class 2606 OID 99003)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- TOC entry 3277 (class 2606 OID 99031)
-- Name: credits credits_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credits
    ADD CONSTRAINT credits_pkey PRIMARY KEY (id);


--
-- TOC entry 3283 (class 2606 OID 99052)
-- Name: future future_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.future
    ADD CONSTRAINT future_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 99017)
-- Name: lessons lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- TOC entry 3279 (class 2606 OID 99038)
-- Name: marks marks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT marks_pkey PRIMARY KEY (id);


--
-- TOC entry 3266 (class 2606 OID 98996)
-- Name: organizators organizators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.organizators
    ADD CONSTRAINT organizators_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 99010)
-- Name: portfolio portfolio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio
    ADD CONSTRAINT portfolio_pkey PRIMARY KEY (id);


--
-- TOC entry 3281 (class 2606 OID 99045)
-- Name: specializations specializations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.specializations
    ADD CONSTRAINT specializations_pkey PRIMARY KEY (id);


--
-- TOC entry 3274 (class 2606 OID 99024)
-- Name: statement statement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statement
    ADD CONSTRAINT statement_pkey PRIMARY KEY (id);


--
-- TOC entry 3263 (class 2606 OID 98854)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3275 (class 1259 OID 99139)
-- Name: statement_userId_lessonId_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "statement_userId_lessonId_key" ON public.statement USING btree ("userId", "lessonId");


--
-- TOC entry 3264 (class 1259 OID 98861)
-- Name: tokens_token_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tokens_token_key ON public.tokens USING btree (token);


--
-- TOC entry 3261 (class 1259 OID 98860)
-- Name: users_email_key; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX users_email_key ON public.users USING btree (email);


--
-- TOC entry 3297 (class 2606 OID 99147)
-- Name: UsersOrganization UsersOrganization_organizationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersOrganization"
    ADD CONSTRAINT "UsersOrganization_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES public.organizators(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3298 (class 2606 OID 99152)
-- Name: UsersOrganization UsersOrganization_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsersOrganization"
    ADD CONSTRAINT "UsersOrganization_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3293 (class 2606 OID 99078)
-- Name: credits credits_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credits
    ADD CONSTRAINT "credits_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public.lessons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3294 (class 2606 OID 99083)
-- Name: credits credits_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credits
    ADD CONSTRAINT "credits_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3296 (class 2606 OID 99132)
-- Name: future future_specializationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.future
    ADD CONSTRAINT "future_specializationId_fkey" FOREIGN KEY ("specializationId") REFERENCES public.specializations(id) ON UPDATE CASCADE;


--
-- TOC entry 3290 (class 2606 OID 99127)
-- Name: lessons lessons_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lessons
    ADD CONSTRAINT "lessons_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE;


--
-- TOC entry 3295 (class 2606 OID 99088)
-- Name: marks marks_statementId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.marks
    ADD CONSTRAINT "marks_statementId_fkey" FOREIGN KEY ("statementId") REFERENCES public.statement(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3288 (class 2606 OID 99122)
-- Name: portfolio portfolio_categoryId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio
    ADD CONSTRAINT "portfolio_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3289 (class 2606 OID 99058)
-- Name: portfolio portfolio_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.portfolio
    ADD CONSTRAINT "portfolio_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3291 (class 2606 OID 99073)
-- Name: statement statement_lessonId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statement
    ADD CONSTRAINT "statement_lessonId_fkey" FOREIGN KEY ("lessonId") REFERENCES public.lessons(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3292 (class 2606 OID 99068)
-- Name: statement statement_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.statement
    ADD CONSTRAINT "statement_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3287 (class 2606 OID 98862)
-- Name: tokens tokens_userId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT "tokens_userId_fkey" FOREIGN KEY ("userId") REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 3286 (class 2606 OID 99117)
-- Name: users users_specializationId_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "users_specializationId_fkey" FOREIGN KEY ("specializationId") REFERENCES public.specializations(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


-- Completed on 2024-06-02 03:00:28

--
-- PostgreSQL database dump complete
--

