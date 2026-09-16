--
-- PostgreSQL database dump
--

\restrict 1AIfmOa0MrCG7d03Uym94AwR7EhP6OtbpwPwGEW4CkJF9eJ9KAFJ27HVolGbAIR

-- Dumped from database version 18.6
-- Dumped by pg_dump version 18.6

-- Started on 2026-09-16 08:36:17

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 230 (class 1259 OID 16712)
-- Name: cita; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cita (
    id_cita integer NOT NULL,
    fecha date NOT NULL,
    hora time without time zone NOT NULL,
    estado_cita character varying(20) DEFAULT 'PENDIENTE'::character varying,
    id_usuario integer NOT NULL,
    id_moto integer NOT NULL,
    id_taller integer NOT NULL,
    id_servicio integer NOT NULL
);


ALTER TABLE public.cita OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16711)
-- Name: cita_id_cita_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cita_id_cita_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cita_id_cita_seq OWNER TO postgres;

--
-- TOC entry 5119 (class 0 OID 0)
-- Dependencies: 229
-- Name: cita_id_cita_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cita_id_cita_seq OWNED BY public.cita.id_cita;


--
-- TOC entry 234 (class 1259 OID 16772)
-- Name: cotizacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cotizacion (
    id_cotizacion integer NOT NULL,
    fecha_cotizacion date,
    total numeric(10,2),
    estado_cotizacion character varying(20) DEFAULT 'PENDIENTE'::character varying,
    id_orden integer NOT NULL
);


ALTER TABLE public.cotizacion OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 16771)
-- Name: cotizacion_id_cotizacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cotizacion_id_cotizacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cotizacion_id_cotizacion_seq OWNER TO postgres;

--
-- TOC entry 5120 (class 0 OID 0)
-- Dependencies: 233
-- Name: cotizacion_id_cotizacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cotizacion_id_cotizacion_seq OWNED BY public.cotizacion.id_cotizacion;


--
-- TOC entry 224 (class 1259 OID 16661)
-- Name: moto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moto (
    id_moto integer NOT NULL,
    placa character varying(10) NOT NULL,
    marca character varying(50) NOT NULL,
    modelo character varying(50) NOT NULL,
    cilindraje integer,
    color character varying(30),
    anio integer,
    kilometraje integer,
    id_usuario integer NOT NULL
);


ALTER TABLE public.moto OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16660)
-- Name: moto_id_moto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moto_id_moto_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.moto_id_moto_seq OWNER TO postgres;

--
-- TOC entry 5121 (class 0 OID 0)
-- Dependencies: 223
-- Name: moto_id_moto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moto_id_moto_seq OWNED BY public.moto.id_moto;


--
-- TOC entry 232 (class 1259 OID 16747)
-- Name: orden_trabajo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orden_trabajo (
    id_orden integer NOT NULL,
    fecha_ingreso date,
    descripcion_falla text,
    diagnostico text,
    estado_orden character varying(20) DEFAULT 'ABIERTA'::character varying,
    id_cita integer NOT NULL,
    id_tecnico integer NOT NULL
);


ALTER TABLE public.orden_trabajo OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 16746)
-- Name: orden_trabajo_id_orden_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orden_trabajo_id_orden_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orden_trabajo_id_orden_seq OWNER TO postgres;

--
-- TOC entry 5122 (class 0 OID 0)
-- Dependencies: 231
-- Name: orden_trabajo_id_orden_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orden_trabajo_id_orden_seq OWNED BY public.orden_trabajo.id_orden;


--
-- TOC entry 236 (class 1259 OID 16787)
-- Name: pago; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pago (
    id_pago integer NOT NULL,
    monto numeric(10,2) NOT NULL,
    metodo_pago character varying(20),
    fecha_pago timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado_pago character varying(20) DEFAULT 'PENDIENTE'::character varying,
    id_cotizacion integer NOT NULL
);


ALTER TABLE public.pago OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 16786)
-- Name: pago_id_pago_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pago_id_pago_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pago_id_pago_seq OWNER TO postgres;

--
-- TOC entry 5123 (class 0 OID 0)
-- Dependencies: 235
-- Name: pago_id_pago_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pago_id_pago_seq OWNED BY public.pago.id_pago;


--
-- TOC entry 228 (class 1259 OID 16695)
-- Name: servicio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.servicio (
    id_servicio integer NOT NULL,
    nombre_servicio character varying(100) NOT NULL,
    descripcion text,
    costo numeric(10,2),
    duracion_estimada character varying(50),
    id_taller integer NOT NULL
);


ALTER TABLE public.servicio OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16694)
-- Name: servicio_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.servicio_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.servicio_id_servicio_seq OWNER TO postgres;

--
-- TOC entry 5124 (class 0 OID 0)
-- Dependencies: 227
-- Name: servicio_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.servicio_id_servicio_seq OWNED BY public.servicio.id_servicio;


--
-- TOC entry 222 (class 1259 OID 16651)
-- Name: taller; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.taller (
    id_taller integer NOT NULL,
    nombre_taller character varying(100) NOT NULL,
    direccion character varying(100),
    telefono character varying(20),
    correo character varying(100),
    horario_atencion character varying(100),
    capacidad_diaria integer,
    estado_taller character varying(20) DEFAULT 'ACTIVO'::character varying
);


ALTER TABLE public.taller OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16650)
-- Name: taller_id_taller_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.taller_id_taller_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.taller_id_taller_seq OWNER TO postgres;

--
-- TOC entry 5125 (class 0 OID 0)
-- Dependencies: 221
-- Name: taller_id_taller_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.taller_id_taller_seq OWNED BY public.taller.id_taller;


--
-- TOC entry 226 (class 1259 OID 16680)
-- Name: tecnico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tecnico (
    id_tecnico integer NOT NULL,
    nombre_tecnico character varying(100) NOT NULL,
    especialidad character varying(100),
    telefono character varying(20),
    id_taller integer NOT NULL
);


ALTER TABLE public.tecnico OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16679)
-- Name: tecnico_id_tecnico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tecnico_id_tecnico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tecnico_id_tecnico_seq OWNER TO postgres;

--
-- TOC entry 5126 (class 0 OID 0)
-- Dependencies: 225
-- Name: tecnico_id_tecnico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tecnico_id_tecnico_seq OWNED BY public.tecnico.id_tecnico;


--
-- TOC entry 220 (class 1259 OID 16632)
-- Name: usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuario (
    id_usuario integer NOT NULL,
    nombre character varying(50) NOT NULL,
    apellido character varying(50) NOT NULL,
    correo character varying(100) NOT NULL,
    contrasena character varying(255) NOT NULL,
    telefono character varying(20),
    direccion character varying(100),
    rol character varying(20) DEFAULT 'CLIENTE'::character varying,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    estado_usuario character varying(20) DEFAULT 'ACTIVO'::character varying
);


ALTER TABLE public.usuario OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16631)
-- Name: usuario_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuario_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuario_id_usuario_seq OWNER TO postgres;

--
-- TOC entry 5127 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuario_id_usuario_seq OWNED BY public.usuario.id_usuario;


--
-- TOC entry 4905 (class 2604 OID 16715)
-- Name: cita id_cita; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita ALTER COLUMN id_cita SET DEFAULT nextval('public.cita_id_cita_seq'::regclass);


--
-- TOC entry 4909 (class 2604 OID 16775)
-- Name: cotizacion id_cotizacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion ALTER COLUMN id_cotizacion SET DEFAULT nextval('public.cotizacion_id_cotizacion_seq'::regclass);


--
-- TOC entry 4902 (class 2604 OID 16664)
-- Name: moto id_moto; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moto ALTER COLUMN id_moto SET DEFAULT nextval('public.moto_id_moto_seq'::regclass);


--
-- TOC entry 4907 (class 2604 OID 16750)
-- Name: orden_trabajo id_orden; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_trabajo ALTER COLUMN id_orden SET DEFAULT nextval('public.orden_trabajo_id_orden_seq'::regclass);


--
-- TOC entry 4911 (class 2604 OID 16790)
-- Name: pago id_pago; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago ALTER COLUMN id_pago SET DEFAULT nextval('public.pago_id_pago_seq'::regclass);


--
-- TOC entry 4904 (class 2604 OID 16698)
-- Name: servicio id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio ALTER COLUMN id_servicio SET DEFAULT nextval('public.servicio_id_servicio_seq'::regclass);


--
-- TOC entry 4900 (class 2604 OID 16654)
-- Name: taller id_taller; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taller ALTER COLUMN id_taller SET DEFAULT nextval('public.taller_id_taller_seq'::regclass);


--
-- TOC entry 4903 (class 2604 OID 16683)
-- Name: tecnico id_tecnico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnico ALTER COLUMN id_tecnico SET DEFAULT nextval('public.tecnico_id_tecnico_seq'::regclass);


--
-- TOC entry 4896 (class 2604 OID 16635)
-- Name: usuario id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuario_id_usuario_seq'::regclass);


--
-- TOC entry 5107 (class 0 OID 16712)
-- Dependencies: 230
-- Data for Name: cita; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cita (id_cita, fecha, hora, estado_cita, id_usuario, id_moto, id_taller, id_servicio) FROM stdin;
1	2026-06-10	08:00:00	PENDIENTE	1	1	1	1
2	2026-06-11	09:30:00	CONFIRMADA	2	2	2	2
3	2026-06-12	11:00:00	PENDIENTE	3	3	3	3
4	2026-06-13	14:00:00	CANCELADA	4	4	4	4
5	2026-06-14	15:30:00	CONFIRMADA	5	5	5	5
\.


--
-- TOC entry 5111 (class 0 OID 16772)
-- Dependencies: 234
-- Data for Name: cotizacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cotizacion (id_cotizacion, fecha_cotizacion, total, estado_cotizacion, id_orden) FROM stdin;
1	2026-06-10	75000.00	PENDIENTE	1
2	2026-06-11	90000.00	APROBADA	2
3	2026-06-12	120000.00	PENDIENTE	3
4	2026-06-13	110000.00	RECHAZADA	4
5	2026-06-14	180000.00	APROBADA	5
\.


--
-- TOC entry 5101 (class 0 OID 16661)
-- Dependencies: 224
-- Data for Name: moto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.moto (id_moto, placa, marca, modelo, cilindraje, color, anio, kilometraje, id_usuario) FROM stdin;
1	ABC123	Yamaha	FZ 2.0	150	Negro	2021	12000	1
2	DEF456	Bajaj	Pulsar NS	200	Rojo	2020	18500	2
3	GHI789	Suzuki	GN 125	125	Azul	2019	24000	3
4	JKL321	Honda	CB160F	160	Blanco	2022	8000	4
5	MNO654	AKT	TT 200	200	Gris	2023	5000	5
\.


--
-- TOC entry 5109 (class 0 OID 16747)
-- Dependencies: 232
-- Data for Name: orden_trabajo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orden_trabajo (id_orden, fecha_ingreso, descripcion_falla, diagnostico, estado_orden, id_cita, id_tecnico) FROM stdin;
1	2026-06-10	Ruido en el motor	Se detecta desgaste leve en cadena y tensionador	ABIERTA	1	1
2	2026-06-11	Freno delantero duro	Pastillas con desgaste y necesidad de purga	EN PROCESO	2	2
3	2026-06-12	Apagones intermitentes	Fallo en conexion electrica principal	ABIERTA	3	3
4	2026-06-13	Vibracion al frenar	Disco delantero ligeramente deformado	CERRADA	4	4
5	2026-06-14	Llantas desgastadas	Se recomienda reemplazo por desgaste avanzado	EN PROCESO	5	5
\.


--
-- TOC entry 5113 (class 0 OID 16787)
-- Dependencies: 236
-- Data for Name: pago; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pago (id_pago, monto, metodo_pago, fecha_pago, estado_pago, id_cotizacion) FROM stdin;
1	75000.00	Efectivo	2026-06-10 09:00:00	PENDIENTE	1
2	90000.00	Tarjeta	2026-06-11 10:15:00	PAGADO	2
3	120000.00	Transferencia	2026-06-12 11:45:00	PENDIENTE	3
4	110000.00	Tarjeta	2026-06-13 14:30:00	ANULADO	4
5	180000.00	Efectivo	2026-06-14 16:00:00	PAGADO	5
\.


--
-- TOC entry 5105 (class 0 OID 16695)
-- Dependencies: 228
-- Data for Name: servicio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.servicio (id_servicio, nombre_servicio, descripcion, costo, duracion_estimada, id_taller) FROM stdin;
1	Cambio de aceite	Cambio de aceite y revision basica	75000.00	30 minutos	1
2	Revision de frenos	Inspeccion y ajuste del sistema de frenos	90000.00	45 minutos	2
3	Afinacion completa	Limpieza, ajuste y calibracion general	120000.00	1 hora	3
4	Diagnostico electrico	Revision del sistema electrico y bateria	110000.00	40 minutos	4
5	Cambio de llantas	Retiro e instalacion de llantas nuevas	180000.00	1 hora	5
\.


--
-- TOC entry 5099 (class 0 OID 16651)
-- Dependencies: 222
-- Data for Name: taller; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.taller (id_taller, nombre_taller, direccion, telefono, correo, horario_atencion, capacidad_diaria, estado_taller) FROM stdin;
1	Taller Motolab Norte	Cra 7 # 120-45	6014001001	norte@motolab.com	Lunes a Sábado 8:00 - 18:00	12	ACTIVO
2	Taller Motolab Sur	Calle 45 # 78-10	6014001002	sur@motolab.com	Lunes a Sábado 8:00 - 18:00	10	ACTIVO
3	Taller Motolab Centro	Av 19 # 32-55	6014001003	centro@motolab.com	Lunes a Viernes 8:00 - 17:00	8	ACTIVO
4	Taller Motolab Occidente	Cra 50 # 22-14	6014001004	occidente@motolab.com	Lunes a Sábado 9:00 - 18:00	14	ACTIVO
5	Taller Motolab Oriente	Calle 100 # 15-20	6014001005	oriente@motolab.com	Lunes a Viernes 8:00 - 16:00	9	ACTIVO
\.


--
-- TOC entry 5103 (class 0 OID 16680)
-- Dependencies: 226
-- Data for Name: tecnico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tecnico (id_tecnico, nombre_tecnico, especialidad, telefono, id_taller) FROM stdin;
1	Javier Morales	Mecanica general	3107001001	1
2	Luis Herrera	Electricidad	3107001002	2
3	Pedro Salazar	Inyeccion electronica	3107001003	3
4	Santiago Rojas	Suspension y frenos	3107001004	4
5	Diego Navarro	Diagnostico completo	3107001005	5
\.


--
-- TOC entry 5097 (class 0 OID 16632)
-- Dependencies: 220
-- Data for Name: usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuario (id_usuario, nombre, apellido, correo, contrasena, telefono, direccion, rol, fecha_registro, estado_usuario) FROM stdin;
1	Kevin	Ruiz	kevin.ruiz@correo.com	Clave123*	3001112233	Calle 10 # 20-30	CLIENTE	2026-09-16 08:24:41.39575	ACTIVO
2	Laura	Gomez	laura.gomez@correo.com	Clave123*	3002223344	Cra 15 # 45-12	CLIENTE	2026-09-16 08:24:41.39575	ACTIVO
3	Andres	Perez	andres.perez@correo.com	Clave123*	3003334455	Av 68 # 12-90	CLIENTE	2026-09-16 08:24:41.39575	ACTIVO
4	Maria	Torres	maria.torres@correo.com	Clave123*	3004445566	Cl 80 # 8-15	ADMIN	2026-09-16 08:24:41.39575	ACTIVO
5	Carlos	Diaz	carlos.diaz@correo.com	Clave123*	3005556677	Diag 45 # 9-22	CLIENTE	2026-09-16 08:24:41.39575	ACTIVO
\.


--
-- TOC entry 5128 (class 0 OID 0)
-- Dependencies: 229
-- Name: cita_id_cita_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cita_id_cita_seq', 5, true);


--
-- TOC entry 5129 (class 0 OID 0)
-- Dependencies: 233
-- Name: cotizacion_id_cotizacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cotizacion_id_cotizacion_seq', 5, true);


--
-- TOC entry 5130 (class 0 OID 0)
-- Dependencies: 223
-- Name: moto_id_moto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moto_id_moto_seq', 5, true);


--
-- TOC entry 5131 (class 0 OID 0)
-- Dependencies: 231
-- Name: orden_trabajo_id_orden_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orden_trabajo_id_orden_seq', 5, true);


--
-- TOC entry 5132 (class 0 OID 0)
-- Dependencies: 235
-- Name: pago_id_pago_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pago_id_pago_seq', 5, true);


--
-- TOC entry 5133 (class 0 OID 0)
-- Dependencies: 227
-- Name: servicio_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.servicio_id_servicio_seq', 5, true);


--
-- TOC entry 5134 (class 0 OID 0)
-- Dependencies: 221
-- Name: taller_id_taller_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.taller_id_taller_seq', 5, true);


--
-- TOC entry 5135 (class 0 OID 0)
-- Dependencies: 225
-- Name: tecnico_id_tecnico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tecnico_id_tecnico_seq', 5, true);


--
-- TOC entry 5136 (class 0 OID 0)
-- Dependencies: 219
-- Name: usuario_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuario_id_usuario_seq', 5, true);


--
-- TOC entry 4929 (class 2606 OID 16725)
-- Name: cita cita_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT cita_pkey PRIMARY KEY (id_cita);


--
-- TOC entry 4935 (class 2606 OID 16780)
-- Name: cotizacion cotizacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion
    ADD CONSTRAINT cotizacion_pkey PRIMARY KEY (id_cotizacion);


--
-- TOC entry 4921 (class 2606 OID 16671)
-- Name: moto moto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moto
    ADD CONSTRAINT moto_pkey PRIMARY KEY (id_moto);


--
-- TOC entry 4923 (class 2606 OID 16673)
-- Name: moto moto_placa_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moto
    ADD CONSTRAINT moto_placa_key UNIQUE (placa);


--
-- TOC entry 4931 (class 2606 OID 16760)
-- Name: orden_trabajo orden_trabajo_id_cita_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_trabajo
    ADD CONSTRAINT orden_trabajo_id_cita_key UNIQUE (id_cita);


--
-- TOC entry 4933 (class 2606 OID 16758)
-- Name: orden_trabajo orden_trabajo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_trabajo
    ADD CONSTRAINT orden_trabajo_pkey PRIMARY KEY (id_orden);


--
-- TOC entry 4937 (class 2606 OID 16797)
-- Name: pago pago_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT pago_pkey PRIMARY KEY (id_pago);


--
-- TOC entry 4927 (class 2606 OID 16705)
-- Name: servicio servicio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT servicio_pkey PRIMARY KEY (id_servicio);


--
-- TOC entry 4919 (class 2606 OID 16659)
-- Name: taller taller_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.taller
    ADD CONSTRAINT taller_pkey PRIMARY KEY (id_taller);


--
-- TOC entry 4925 (class 2606 OID 16688)
-- Name: tecnico tecnico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnico
    ADD CONSTRAINT tecnico_pkey PRIMARY KEY (id_tecnico);


--
-- TOC entry 4915 (class 2606 OID 16649)
-- Name: usuario usuario_correo_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_correo_key UNIQUE (correo);


--
-- TOC entry 4917 (class 2606 OID 16647)
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id_usuario);


--
-- TOC entry 4941 (class 2606 OID 16731)
-- Name: cita fk_cita_moto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_moto FOREIGN KEY (id_moto) REFERENCES public.moto(id_moto) ON DELETE RESTRICT;


--
-- TOC entry 4942 (class 2606 OID 16741)
-- Name: cita fk_cita_servicio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_servicio FOREIGN KEY (id_servicio) REFERENCES public.servicio(id_servicio) ON DELETE RESTRICT;


--
-- TOC entry 4943 (class 2606 OID 16736)
-- Name: cita fk_cita_taller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_taller FOREIGN KEY (id_taller) REFERENCES public.taller(id_taller) ON DELETE RESTRICT;


--
-- TOC entry 4944 (class 2606 OID 16726)
-- Name: cita fk_cita_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cita
    ADD CONSTRAINT fk_cita_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;


--
-- TOC entry 4947 (class 2606 OID 16781)
-- Name: cotizacion fk_cotizacion_orden; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cotizacion
    ADD CONSTRAINT fk_cotizacion_orden FOREIGN KEY (id_orden) REFERENCES public.orden_trabajo(id_orden) ON DELETE CASCADE;


--
-- TOC entry 4938 (class 2606 OID 16674)
-- Name: moto fk_moto_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moto
    ADD CONSTRAINT fk_moto_usuario FOREIGN KEY (id_usuario) REFERENCES public.usuario(id_usuario) ON DELETE RESTRICT;


--
-- TOC entry 4945 (class 2606 OID 16761)
-- Name: orden_trabajo fk_orden_cita; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_trabajo
    ADD CONSTRAINT fk_orden_cita FOREIGN KEY (id_cita) REFERENCES public.cita(id_cita) ON DELETE CASCADE;


--
-- TOC entry 4946 (class 2606 OID 16766)
-- Name: orden_trabajo fk_orden_tecnico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orden_trabajo
    ADD CONSTRAINT fk_orden_tecnico FOREIGN KEY (id_tecnico) REFERENCES public.tecnico(id_tecnico) ON DELETE RESTRICT;


--
-- TOC entry 4948 (class 2606 OID 16798)
-- Name: pago fk_pago_cotizacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pago
    ADD CONSTRAINT fk_pago_cotizacion FOREIGN KEY (id_cotizacion) REFERENCES public.cotizacion(id_cotizacion) ON DELETE RESTRICT;


--
-- TOC entry 4940 (class 2606 OID 16706)
-- Name: servicio fk_servicio_taller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.servicio
    ADD CONSTRAINT fk_servicio_taller FOREIGN KEY (id_taller) REFERENCES public.taller(id_taller) ON DELETE CASCADE;


--
-- TOC entry 4939 (class 2606 OID 16689)
-- Name: tecnico fk_tecnico_taller; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tecnico
    ADD CONSTRAINT fk_tecnico_taller FOREIGN KEY (id_taller) REFERENCES public.taller(id_taller) ON DELETE CASCADE;


-- Completed on 2026-09-16 08:36:17

--
-- PostgreSQL database dump complete
--

\unrestrict 1AIfmOa0MrCG7d03Uym94AwR7EhP6OtbpwPwGEW4CkJF9eJ9KAFJ27HVolGbAIR

