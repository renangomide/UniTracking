--
-- PostgreSQL database dump
--

-- Dumped from database version 16.2
-- Dumped by pg_dump version 16.2

-- Started on 2024-09-29 22:51:16

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
-- TOC entry 224 (class 1259 OID 33320)
-- Name: aluno; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aluno (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    matricula character varying(20) NOT NULL,
    cpf character varying(15) NOT NULL,
    email character varying(60) NOT NULL,
    telefone character varying(15) NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(60) NOT NULL,
    curso_id integer,
    instituicao_id integer
);


ALTER TABLE public.aluno OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 33319)
-- Name: aluno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aluno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aluno_id_seq OWNER TO postgres;

--
-- TOC entry 4933 (class 0 OID 0)
-- Dependencies: 223
-- Name: aluno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aluno_id_seq OWNED BY public.aluno.id;


--
-- TOC entry 220 (class 1259 OID 33296)
-- Name: curso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.curso (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    instituicao_id integer
);


ALTER TABLE public.curso OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 33295)
-- Name: curso_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.curso_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.curso_id_seq OWNER TO postgres;

--
-- TOC entry 4934 (class 0 OID 0)
-- Dependencies: 219
-- Name: curso_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.curso_id_seq OWNED BY public.curso.id;


--
-- TOC entry 226 (class 1259 OID 33337)
-- Name: disciplina; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disciplina (
    id integer NOT NULL,
    codigo character varying(10) NOT NULL,
    nome character varying(60) NOT NULL,
    instituicao_id integer
);


ALTER TABLE public.disciplina OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 33336)
-- Name: disciplina_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disciplina_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disciplina_id_seq OWNER TO postgres;

--
-- TOC entry 4935 (class 0 OID 0)
-- Dependencies: 225
-- Name: disciplina_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disciplina_id_seq OWNED BY public.disciplina.id;


--
-- TOC entry 232 (class 1259 OID 33388)
-- Name: falta; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.falta (
    id integer NOT NULL,
    aluno_id integer,
    turma_id integer
);


ALTER TABLE public.falta OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 33387)
-- Name: falta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.falta_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.falta_id_seq OWNER TO postgres;

--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 231
-- Name: falta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.falta_id_seq OWNED BY public.falta.id;


--
-- TOC entry 216 (class 1259 OID 33282)
-- Name: instituicao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instituicao (
    id integer NOT NULL,
    sigla character varying(10) NOT NULL,
    nome character varying(100) NOT NULL
);


ALTER TABLE public.instituicao OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 33281)
-- Name: instituicao_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instituicao_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instituicao_id_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 215
-- Name: instituicao_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instituicao_id_seq OWNED BY public.instituicao.id;


--
-- TOC entry 230 (class 1259 OID 33371)
-- Name: matricula; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matricula (
    id integer NOT NULL,
    aluno_id integer,
    turma_id integer
);


ALTER TABLE public.matricula OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 33370)
-- Name: matricula_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matricula_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matricula_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 229
-- Name: matricula_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matricula_id_seq OWNED BY public.matricula.id;


--
-- TOC entry 222 (class 1259 OID 33308)
-- Name: professor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professor (
    id integer NOT NULL,
    nome character varying(50) NOT NULL,
    cpf character varying(15) NOT NULL,
    email character varying(60) NOT NULL,
    telefone character varying(15) NOT NULL,
    login character varying(255) NOT NULL,
    senha character varying(60) NOT NULL,
    instituicao_id integer
);


ALTER TABLE public.professor OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 33307)
-- Name: professor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professor_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 221
-- Name: professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professor_id_seq OWNED BY public.professor.id;


--
-- TOC entry 218 (class 1259 OID 33289)
-- Name: semestre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.semestre (
    id integer NOT NULL,
    ano integer NOT NULL,
    semestre integer NOT NULL
);


ALTER TABLE public.semestre OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 33288)
-- Name: semestre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.semestre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.semestre_id_seq OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 217
-- Name: semestre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.semestre_id_seq OWNED BY public.semestre.id;


--
-- TOC entry 228 (class 1259 OID 33354)
-- Name: turma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turma (
    id integer NOT NULL,
    letra character varying(3) NOT NULL,
    disciplina_id integer,
    semestre_id integer,
    professor_id integer NOT NULL
);


ALTER TABLE public.turma OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 33353)
-- Name: turma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turma_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turma_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 227
-- Name: turma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turma_id_seq OWNED BY public.turma.id;


--
-- TOC entry 4732 (class 2604 OID 33323)
-- Name: aluno id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno ALTER COLUMN id SET DEFAULT nextval('public.aluno_id_seq'::regclass);


--
-- TOC entry 4730 (class 2604 OID 33299)
-- Name: curso id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso ALTER COLUMN id SET DEFAULT nextval('public.curso_id_seq'::regclass);


--
-- TOC entry 4733 (class 2604 OID 33340)
-- Name: disciplina id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina ALTER COLUMN id SET DEFAULT nextval('public.disciplina_id_seq'::regclass);


--
-- TOC entry 4736 (class 2604 OID 33391)
-- Name: falta id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.falta ALTER COLUMN id SET DEFAULT nextval('public.falta_id_seq'::regclass);


--
-- TOC entry 4728 (class 2604 OID 33285)
-- Name: instituicao id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao ALTER COLUMN id SET DEFAULT nextval('public.instituicao_id_seq'::regclass);


--
-- TOC entry 4735 (class 2604 OID 33374)
-- Name: matricula id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula ALTER COLUMN id SET DEFAULT nextval('public.matricula_id_seq'::regclass);


--
-- TOC entry 4731 (class 2604 OID 33311)
-- Name: professor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor ALTER COLUMN id SET DEFAULT nextval('public.professor_id_seq'::regclass);


--
-- TOC entry 4729 (class 2604 OID 33292)
-- Name: semestre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre ALTER COLUMN id SET DEFAULT nextval('public.semestre_id_seq'::regclass);


--
-- TOC entry 4734 (class 2604 OID 33357)
-- Name: turma id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma ALTER COLUMN id SET DEFAULT nextval('public.turma_id_seq'::regclass);


--
-- TOC entry 4919 (class 0 OID 33320)
-- Dependencies: 224
-- Data for Name: aluno; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.aluno VALUES (1, 'Enzo', '123', '123.123.123-12', 'enzo@email.com', '12312312', '123', '123', 1, 1);
INSERT INTO public.aluno VALUES (2, 'Celso', '123', '123.123.123-12', 'celso@email.com', '12312312', '123', '123', 1, 1);
INSERT INTO public.aluno VALUES (3, 'Vitor', '123', '123.123.123-12', 'vitor@email.com', '12312312', '123', '123', 1, 1);
INSERT INTO public.aluno VALUES (4, 'Lukas', '123', '123.123.123-12', 'lukas@email.com', '12312312', '123', '123', 1, 1);
INSERT INTO public.aluno VALUES (5, 'Renan', '123', '123.123.123-12', 'renan@email.com', '12312312', '123', '123', 1, 1);
INSERT INTO public.aluno VALUES (6, 'Daniel', '123', '123.123.123-12', 'daniel@email.com', '12312312', 'enzo', '123', 1, 1);


--
-- TOC entry 4915 (class 0 OID 33296)
-- Dependencies: 220
-- Data for Name: curso; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.curso VALUES (1, 'Ciencia da Computacao', 1);


--
-- TOC entry 4921 (class 0 OID 33337)
-- Dependencies: 226
-- Data for Name: disciplina; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.disciplina VALUES (1, 'DCC117', 'Modelagem de Sistemas', 1);
INSERT INTO public.disciplina VALUES (2, 'DCC001', 'Analise e Projeto de Algoritmo', 1);
INSERT INTO public.disciplina VALUES (3, 'DCC014', 'Inteligencia Artificial', 1);
INSERT INTO public.disciplina VALUES (4, 'DCC062', 'Sistemas Operacionais', 1);
INSERT INTO public.disciplina VALUES (5, 'DCC042', 'Redes de Computadores', 1);


--
-- TOC entry 4927 (class 0 OID 33388)
-- Dependencies: 232
-- Data for Name: falta; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.falta VALUES (15, 1, 2);
INSERT INTO public.falta VALUES (16, 1, 2);
INSERT INTO public.falta VALUES (17, 1, 2);
INSERT INTO public.falta VALUES (18, 1, 3);
INSERT INTO public.falta VALUES (19, 1, 4);
INSERT INTO public.falta VALUES (20, 1, 5);
INSERT INTO public.falta VALUES (21, 1, 2);
INSERT INTO public.falta VALUES (22, 1, 5);
INSERT INTO public.falta VALUES (23, 1, 5);
INSERT INTO public.falta VALUES (24, 1, 4);
INSERT INTO public.falta VALUES (25, 1, 4);
INSERT INTO public.falta VALUES (26, 1, 3);
INSERT INTO public.falta VALUES (27, 1, 4);
INSERT INTO public.falta VALUES (28, 1, 5);


--
-- TOC entry 4911 (class 0 OID 33282)
-- Dependencies: 216
-- Data for Name: instituicao; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.instituicao VALUES (1, 'UFJF', 'Universidade Federal de Juiz de Fora');
INSERT INTO public.instituicao VALUES (2, 'UFV', 'Universidade Federal de Vicosa');
INSERT INTO public.instituicao VALUES (3, 'UFMG', 'Universidade Federal de Minas Gerais');
INSERT INTO public.instituicao VALUES (4, 'UFR', 'Universidade Federal de Rondonopolis');


--
-- TOC entry 4925 (class 0 OID 33371)
-- Dependencies: 230
-- Data for Name: matricula; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.matricula VALUES (7, 1, 2);
INSERT INTO public.matricula VALUES (8, 2, 2);
INSERT INTO public.matricula VALUES (9, 3, 2);
INSERT INTO public.matricula VALUES (10, 4, 2);
INSERT INTO public.matricula VALUES (11, 5, 2);
INSERT INTO public.matricula VALUES (12, 6, 2);
INSERT INTO public.matricula VALUES (23, 1, 2);
INSERT INTO public.matricula VALUES (24, 1, 3);
INSERT INTO public.matricula VALUES (25, 1, 4);
INSERT INTO public.matricula VALUES (26, 1, 5);
INSERT INTO public.matricula VALUES (27, 1, 6);
INSERT INTO public.matricula VALUES (28, 2, 2);
INSERT INTO public.matricula VALUES (29, 3, 2);
INSERT INTO public.matricula VALUES (30, 4, 2);
INSERT INTO public.matricula VALUES (31, 5, 2);
INSERT INTO public.matricula VALUES (32, 6, 2);


--
-- TOC entry 4917 (class 0 OID 33308)
-- Dependencies: 222
-- Data for Name: professor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.professor VALUES (1, 'Fabricio', '123.123.123-32', 'fabricio@email.com', '12312312', '123', '123', 1);
INSERT INTO public.professor VALUES (2, 'Raul', '123.123.123-12', 'raul@email.com', '12312312', 'login', 'senha', 1);
INSERT INTO public.professor VALUES (3, 'Saulo', '123.123.123-12', 'saulo@email.com', '12312312', 'login', 'senha', 1);
INSERT INTO public.professor VALUES (4, 'Alex', '123.123.123-12', 'alex@email.com', '12312312', 'login', 'senha', 1);
INSERT INTO public.professor VALUES (5, 'Pagani', '123.123.123-12', 'pagani@email.com', '12312312', 'login', 'senha', 1);


--
-- TOC entry 4913 (class 0 OID 33289)
-- Dependencies: 218
-- Data for Name: semestre; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.semestre VALUES (1, 2024, 1);


--
-- TOC entry 4923 (class 0 OID 33354)
-- Dependencies: 228
-- Data for Name: turma; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.turma VALUES (2, 'A', 1, 1, 1);
INSERT INTO public.turma VALUES (3, 'A', 2, 1, 2);
INSERT INTO public.turma VALUES (4, 'A', 3, 1, 3);
INSERT INTO public.turma VALUES (5, 'A', 4, 1, 5);
INSERT INTO public.turma VALUES (6, 'A', 5, 1, 4);


--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 223
-- Name: aluno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aluno_id_seq', 6, true);


--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 219
-- Name: curso_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.curso_id_seq', 1, true);


--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 225
-- Name: disciplina_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disciplina_id_seq', 5, true);


--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 231
-- Name: falta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.falta_id_seq', 28, true);


--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 215
-- Name: instituicao_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instituicao_id_seq', 4, true);


--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 229
-- Name: matricula_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matricula_id_seq', 32, true);


--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 221
-- Name: professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professor_id_seq', 5, true);


--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 217
-- Name: semestre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.semestre_id_seq', 1, true);


--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 227
-- Name: turma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turma_id_seq', 6, true);


--
-- TOC entry 4746 (class 2606 OID 33325)
-- Name: aluno aluno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_pkey PRIMARY KEY (id);


--
-- TOC entry 4742 (class 2606 OID 33301)
-- Name: curso curso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_pkey PRIMARY KEY (id);


--
-- TOC entry 4748 (class 2606 OID 33342)
-- Name: disciplina disciplina_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 33393)
-- Name: falta falta_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.falta
    ADD CONSTRAINT falta_pkey PRIMARY KEY (id);


--
-- TOC entry 4738 (class 2606 OID 33287)
-- Name: instituicao instituicao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instituicao
    ADD CONSTRAINT instituicao_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 33376)
-- Name: matricula matricula_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_pkey PRIMARY KEY (id);


--
-- TOC entry 4744 (class 2606 OID 33313)
-- Name: professor professor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_pkey PRIMARY KEY (id);


--
-- TOC entry 4740 (class 2606 OID 33294)
-- Name: semestre semestre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.semestre
    ADD CONSTRAINT semestre_pkey PRIMARY KEY (id);


--
-- TOC entry 4750 (class 2606 OID 33359)
-- Name: turma turma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_pkey PRIMARY KEY (id);


--
-- TOC entry 4757 (class 2606 OID 33326)
-- Name: aluno aluno_curso_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_curso_id_fkey FOREIGN KEY (curso_id) REFERENCES public.curso(id);


--
-- TOC entry 4758 (class 2606 OID 33331)
-- Name: aluno aluno_instituicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aluno
    ADD CONSTRAINT aluno_instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES public.instituicao(id);


--
-- TOC entry 4755 (class 2606 OID 33302)
-- Name: curso curso_instituicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.curso
    ADD CONSTRAINT curso_instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES public.instituicao(id);


--
-- TOC entry 4759 (class 2606 OID 33343)
-- Name: disciplina disciplina_instituicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disciplina
    ADD CONSTRAINT disciplina_instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES public.instituicao(id);


--
-- TOC entry 4760 (class 2606 OID 33409)
-- Name: turma docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT docente FOREIGN KEY (professor_id) REFERENCES public.professor(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4765 (class 2606 OID 33394)
-- Name: falta falta_aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.falta
    ADD CONSTRAINT falta_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.aluno(id);


--
-- TOC entry 4766 (class 2606 OID 33399)
-- Name: falta falta_turma_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.falta
    ADD CONSTRAINT falta_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES public.turma(id);


--
-- TOC entry 4763 (class 2606 OID 33377)
-- Name: matricula matricula_aluno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_aluno_id_fkey FOREIGN KEY (aluno_id) REFERENCES public.aluno(id);


--
-- TOC entry 4764 (class 2606 OID 33382)
-- Name: matricula matricula_turma_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matricula
    ADD CONSTRAINT matricula_turma_id_fkey FOREIGN KEY (turma_id) REFERENCES public.turma(id);


--
-- TOC entry 4756 (class 2606 OID 33314)
-- Name: professor professor_instituicao_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professor
    ADD CONSTRAINT professor_instituicao_id_fkey FOREIGN KEY (instituicao_id) REFERENCES public.instituicao(id);


--
-- TOC entry 4761 (class 2606 OID 33360)
-- Name: turma turma_disciplina_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_disciplina_id_fkey FOREIGN KEY (disciplina_id) REFERENCES public.disciplina(id);


--
-- TOC entry 4762 (class 2606 OID 33365)
-- Name: turma turma_semestre_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turma
    ADD CONSTRAINT turma_semestre_id_fkey FOREIGN KEY (semestre_id) REFERENCES public.semestre(id);


-- Completed on 2024-09-29 22:51:16

--
-- PostgreSQL database dump complete
--

