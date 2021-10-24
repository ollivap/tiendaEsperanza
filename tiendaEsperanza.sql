--
-- PostgreSQL database dump
--

-- Dumped from database version 9.4.12
-- Dumped by pg_dump version 9.5.5

-- Started on 2021-10-24 15:46:10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 11855)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2072 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 174 (class 1259 OID 29942)
-- Name: categorias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE categorias (
    categoriaid integer NOT NULL,
    nombre character varying(80) NOT NULL,
    categoriapadreid integer
);


ALTER TABLE categorias OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 29934)
-- Name: clientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientes (
    clienteid integer NOT NULL,
    nombres character varying(80) NOT NULL,
    apellidopaterno character varying(80) NOT NULL,
    apellidomaterno character varying(80),
    fenacimiento date NOT NULL,
    correoelectronico character varying(100),
    calle character varying(80),
    numero character varying(10),
    localidad character varying(100),
    entidad character varying(30)
);


ALTER TABLE clientes OWNER TO postgres;

--
-- TOC entry 176 (class 1259 OID 29962)
-- Name: clientestelefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE clientestelefonos (
    clienteid integer NOT NULL,
    telefono character varying(10) NOT NULL
);


ALTER TABLE clientestelefonos OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 30022)
-- Name: compras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE compras (
    compraid integer NOT NULL,
    proveedorid integer,
    fecompra date
);


ALTER TABLE compras OWNER TO postgres;

--
-- TOC entry 181 (class 1259 OID 30002)
-- Name: detallecompras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detallecompras (
    compraid integer NOT NULL,
    productoid integer NOT NULL,
    cantidad integer,
    precio double precision,
    CONSTRAINT ck_preciomayorcompra0 CHECK ((precio >= (0)::double precision))
);


ALTER TABLE detallecompras OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 29992)
-- Name: detalleventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE detalleventas (
    ventaid integer NOT NULL,
    productoid integer NOT NULL,
    cantidad integer,
    precio double precision,
    CONSTRAINT ck_preciomayor0 CHECK ((precio > (0)::double precision))
);


ALTER TABLE detalleventas OWNER TO postgres;

--
-- TOC entry 175 (class 1259 OID 29952)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE productos (
    productoid integer NOT NULL,
    nombre character varying(100) NOT NULL,
    caracteristicas character varying(200),
    preciocompra double precision NOT NULL,
    precioventa double precision NOT NULL,
    cantidadstock integer,
    unidadmedida character varying(40),
    categoriaid integer NOT NULL
);


ALTER TABLE productos OWNER TO postgres;

--
-- TOC entry 178 (class 1259 OID 29972)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proveedores (
    proveedorid integer NOT NULL,
    nombre character varying(100) NOT NULL,
    correoelectronico character varying(100),
    calle character varying(80),
    numero character varying(10),
    localidad character varying(100),
    entidad character varying(30)
);


ALTER TABLE proveedores OWNER TO postgres;

--
-- TOC entry 177 (class 1259 OID 29967)
-- Name: proveedorestelefonos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE proveedorestelefonos (
    proveedorid integer NOT NULL,
    telefono character varying(10) NOT NULL
);


ALTER TABLE proveedorestelefonos OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 29987)
-- Name: ventas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE ventas (
    ventaid integer NOT NULL,
    clienteid integer,
    feventa date
);


ALTER TABLE ventas OWNER TO postgres;

--
-- TOC entry 2056 (class 0 OID 29942)
-- Dependencies: 174
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY categorias (categoriaid, nombre, categoriapadreid) FROM stdin;
1	Frutas y Verduras	\N
2	Abarrotes	\N
3	Higiene personal	\N
4	Limpieza del hogar	\N
6	Suavizantes de ropa	4
\.


--
-- TOC entry 2055 (class 0 OID 29934)
-- Dependencies: 173
-- Data for Name: clientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientes (clienteid, nombres, apellidopaterno, apellidomaterno, fenacimiento, correoelectronico, calle, numero, localidad, entidad) FROM stdin;
1	Nancy	Gonzalez	Lopez	1980-12-15	nan80@gmail.com	Loma Alta	mz 2 lt 6	Buenavista	CDMX
3	Maria del Carmen	Melendez	Perez	2000-10-10	marysme@gmail.com	Benito Juarez	25	Ampliacion	CDMX
4	Miguel Angel	Garcia	Garcia	1970-12-02	mickel70@gmail.com	Luciernagas	239	Parajes	CDMX
5	Dulce Belen	Vargas	Garcia	2002-04-16	belenvargas2002@hotmail.com	Villa Diezma	Mz27 Lt43	D.U. Quetzalcoatl	CDMX
2	Juana	Hernandez	Gomez	1990-10-20	juan2020@hotmail.com	Abedules	39	Renovacion	CDMX
\.


--
-- TOC entry 2058 (class 0 OID 29962)
-- Dependencies: 176
-- Data for Name: clientestelefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clientestelefonos (clienteid, telefono) FROM stdin;
\.


--
-- TOC entry 2064 (class 0 OID 30022)
-- Dependencies: 182
-- Data for Name: compras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY compras (compraid, proveedorid, fecompra) FROM stdin;
1	5	2021-09-10
2	3	2021-09-10
3	3	2021-10-10
4	2	2021-09-22
5	1	2021-09-15
6	5	2021-09-10
7	2	2021-09-18
8	3	2021-06-10
\.


--
-- TOC entry 2063 (class 0 OID 30002)
-- Dependencies: 181
-- Data for Name: detallecompras; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detallecompras (compraid, productoid, cantidad, precio) FROM stdin;
1	3	20	15
1	1	15	75.5
1	4	10	50
2	2	20	32
2	3	20	15
3	5	11	32
3	1	18	75.5
3	4	19	50
4	3	21	15
5	5	10	32
5	4	10	50
5	3	10	15
6	1	4	75.5
7	1	20	75.5
8	1	10	75.5
\.


--
-- TOC entry 2062 (class 0 OID 29992)
-- Dependencies: 180
-- Data for Name: detalleventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalleventas (ventaid, productoid, cantidad, precio) FROM stdin;
1	3	1	18
4	3	2	18
5	5	1	38
5	4	1	59
5	3	1	18
6	1	4	79
7	1	2	79
8	1	9	79
9	5	1	79
10	4	3	59
1	1	2	75.5
1	4	1	59
2	2	1	37
2	3	2	17
3	5	1	38
3	1	1	79
3	4	1	59
\.


--
-- TOC entry 2057 (class 0 OID 29952)
-- Dependencies: 175
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY productos (productoid, nombre, caracteristicas, preciocompra, precioventa, cantidadstock, unidadmedida, categoriaid) FROM stdin;
1	Suavitel Cuidado Superior Fresca Primavera 3L	Corta la espuma al instante. Adiós al planchado. Colores como nuevos. Todo en uno. Nueva tecnología, ahora protege contra las manchas. Beneficios Agua	75.5	80.974999999999994	50	ml	6
5	Aceite Vegetal 123 1L	El Aceite Vegetal 1-2-3 te ayuda a preparar tus alimentos de una manera más sana, \r\nya que por su origen vegetal no contiene colesterol.	32	38.949999999999996	88	ml	6
3	Tomate	Tomate verde sin cáscara de primera calidad	14.25	18.449999999999999	90	kg	1
2	Limón	Limón agrio con semilla premier	30.399999999999999	37.822499999999998	50	kg	1
4	Shampoo Palmolive Optims 2 en 1 700 ml	Shampoo Palmolive Optims 2 en 1 extra intensivo 700 ml	50	60.474999999999994	100	ml	3
\.


--
-- TOC entry 2060 (class 0 OID 29972)
-- Dependencies: 178
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedores (proveedorid, nombre, correoelectronico, calle, numero, localidad, entidad) FROM stdin;
1	Zorro Abarrotero	https://www.zorroabarrotero.com.mx/	Av Insurgentes	Mz 21-Lt 3	Reforma Política	CDMX
3	Puma Abarrotero	clientes@abarroretopuma.com	Ermita Iztapalapa	#3369	Citlalli, Iztapalapa	CDMX
4	Panda Fiesta	atencion@pandafiesta.com	Ermita Iztapalapa	#3385	Citlalli, Iztapalapa	CDMX
2	Tienda Scorpion	tiendascorpion@gmail.com	Ermita Iztapalapa	#3365-C	Iztapalapa	CDMX
\.


--
-- TOC entry 2059 (class 0 OID 29967)
-- Dependencies: 177
-- Data for Name: proveedorestelefonos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proveedorestelefonos (proveedorid, telefono) FROM stdin;
\.


--
-- TOC entry 2061 (class 0 OID 29987)
-- Dependencies: 179
-- Data for Name: ventas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY ventas (ventaid, clienteid, feventa) FROM stdin;
1	2	2021-10-23
2	3	2021-09-10
3	3	2021-10-10
4	2	2021-09-22
5	1	2021-09-15
6	5	2021-09-10
7	2	2021-09-18
8	3	2021-06-10
9	5	2021-07-10
10	2	2021-09-15
\.


--
-- TOC entry 1921 (class 2606 OID 29946)
-- Name: categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (categoriaid);


--
-- TOC entry 1919 (class 2606 OID 29941)
-- Name: clientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientes
    ADD CONSTRAINT clientes_pkey PRIMARY KEY (clienteid);


--
-- TOC entry 1925 (class 2606 OID 29966)
-- Name: clientestelefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientestelefonos
    ADD CONSTRAINT clientestelefonos_pkey PRIMARY KEY (clienteid, telefono);


--
-- TOC entry 1937 (class 2606 OID 30026)
-- Name: compras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY compras
    ADD CONSTRAINT compras_pkey PRIMARY KEY (compraid);


--
-- TOC entry 1935 (class 2606 OID 30006)
-- Name: detallecompras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detallecompras
    ADD CONSTRAINT detallecompras_pkey PRIMARY KEY (compraid, productoid);


--
-- TOC entry 1933 (class 2606 OID 29996)
-- Name: detalleventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalleventas
    ADD CONSTRAINT detalleventas_pkey PRIMARY KEY (ventaid, productoid);


--
-- TOC entry 1923 (class 2606 OID 29956)
-- Name: productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (productoid);


--
-- TOC entry 1929 (class 2606 OID 29976)
-- Name: proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (proveedorid);


--
-- TOC entry 1927 (class 2606 OID 29971)
-- Name: proveedorestelefonos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedorestelefonos
    ADD CONSTRAINT proveedorestelefonos_pkey PRIMARY KEY (proveedorid, telefono);


--
-- TOC entry 1931 (class 2606 OID 29991)
-- Name: ventas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT ventas_pkey PRIMARY KEY (ventaid);


--
-- TOC entry 1939 (class 2606 OID 29957)
-- Name: fk_categoria_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY productos
    ADD CONSTRAINT fk_categoria_producto FOREIGN KEY (categoriaid) REFERENCES categorias(categoriaid);


--
-- TOC entry 1938 (class 2606 OID 29947)
-- Name: fk_categoriapadre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT fk_categoriapadre FOREIGN KEY (categoriapadreid) REFERENCES categorias(categoriaid);


--
-- TOC entry 1940 (class 2606 OID 29977)
-- Name: fk_clientestelefonos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clientestelefonos
    ADD CONSTRAINT fk_clientestelefonos FOREIGN KEY (clienteid) REFERENCES clientes(clienteid);


--
-- TOC entry 1944 (class 2606 OID 30027)
-- Name: fk_detallecompras_compra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detallecompras
    ADD CONSTRAINT fk_detallecompras_compra FOREIGN KEY (compraid) REFERENCES compras(compraid);


--
-- TOC entry 1945 (class 2606 OID 30032)
-- Name: fk_detallecompras_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detallecompras
    ADD CONSTRAINT fk_detallecompras_producto FOREIGN KEY (productoid) REFERENCES productos(productoid);


--
-- TOC entry 1943 (class 2606 OID 30012)
-- Name: fk_detalleventas_producto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalleventas
    ADD CONSTRAINT fk_detalleventas_producto FOREIGN KEY (productoid) REFERENCES productos(productoid);


--
-- TOC entry 1941 (class 2606 OID 29982)
-- Name: fk_proveedorestelefonos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proveedorestelefonos
    ADD CONSTRAINT fk_proveedorestelefonos FOREIGN KEY (proveedorid) REFERENCES proveedores(proveedorid);


--
-- TOC entry 1942 (class 2606 OID 30007)
-- Name: fk_ventascliente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY ventas
    ADD CONSTRAINT fk_ventascliente FOREIGN KEY (clienteid) REFERENCES clientes(clienteid);


--
-- TOC entry 2071 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2021-10-24 15:46:10

--
-- PostgreSQL database dump complete
--

