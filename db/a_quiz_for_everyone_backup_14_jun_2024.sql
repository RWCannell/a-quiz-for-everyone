--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Homebrew)
-- Dumped by pg_dump version 15.4

-- Started on 2024-06-14 15:49:04 SAST

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
-- TOC entry 2 (class 3079 OID 16481)
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- TOC entry 3685 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


--
-- TOC entry 850 (class 1247 OID 16391)
-- Name: question_subject; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.question_subject AS ENUM (
    'PHYSICS',
    'CHEMISTRY',
    'GEOGRAPHY',
    'BIOLOGY',
    'HISTORY',
    'LITERATURE',
    'POP_CULTURE',
    'INFORMATION_TECHNOLOGY'
);


ALTER TYPE public.question_subject OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 216 (class 1259 OID 16500)
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    option_id uuid DEFAULT gen_random_uuid() NOT NULL,
    option_text character varying NOT NULL,
    question_id uuid
);


ALTER TABLE public.options OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16508)
-- Name: question_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.question_options (
    id uuid DEFAULT gen_random_uuid(),
    question_id uuid,
    option_id uuid
);


ALTER TABLE public.question_options OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16492)
-- Name: questions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questions (
    question_id uuid DEFAULT gen_random_uuid() NOT NULL,
    question_text character varying NOT NULL,
    question_subject public.question_subject
);


ALTER TABLE public.questions OWNER TO postgres;

--
-- TOC entry 3678 (class 0 OID 16500)
-- Dependencies: 216
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (option_id, option_text, question_id) FROM stdin;
aea47471-9b4c-4576-b6d9-b41533cc6479	Marrakesh	cec12a45-0f85-4d06-b656-6b242e0daf35
a720933d-de74-46f6-8fd0-ff7b517a4cd7	Canada	17aba436-0288-41ec-bfb7-edac090c0ae7
bf300080-a277-4447-93fd-df78c747355d	Hard Times	229da990-eee7-4257-bcf8-3d9e4469467f
00928ccc-7be6-4b5b-a3cd-8faf1d4b2c1c	mitosis	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
c4e3d9e1-be52-4d20-a35b-2777fd34a4a9	commensalism	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
cf1ed10d-00a2-48e9-b2b9-b7bd9f592e96	sublimation	b56c303f-61ae-4dc7-a308-8566bfe2c50d
19232139-bed8-49f0-a9ce-ef5a89dd2e79	frictional	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
addfaf8e-5eb4-4a0a-b62c-871aa852cd72	King Henry II	5354065d-e6e6-4b5d-aedd-f6478962f866
04396ba1-a3c3-4de0-bd9b-7d37fbc1df55	Boardwalk Empire	88eab287-890e-4a97-989d-28c87548e75f
ef43398a-5e6f-4875-bb80-d2d3e2c2ac75	flying squirrel	9e507792-fe0a-4221-ac5a-eeb064b42824
ffa81367-c579-4007-adbc-585a0b971eaf	contact	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
a78e0169-d484-4a35-948e-45e6b388182a	Oslo	014c78a1-d72a-47aa-9653-f2b62153cc3e
249e8726-6fed-4241-a01e-87c26eb6fc32	potassium nitrate	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
19d33594-f78e-4520-93ed-94739cc419c9	HIStory	a309767a-5834-447f-bdec-88a40fb6544e
c6476c5e-eabb-40bd-b36d-bb3680765b20	Antonio Banderas	1ad6180e-7932-423f-bf54-164f5ed0b39f
3c754d27-2f06-41a9-8594-40738f86a119	Tanzania	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
00e3614d-5a19-48de-aeb2-ced732c51934	inertial	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
a4f52397-200e-43c7-a803-96ca97018235	Brazil	17aba436-0288-41ec-bfb7-edac090c0ae7
582c2a9d-26a7-4f3b-b876-adac83337e96	Under Western Eyes	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
14b08b76-2228-4602-be7f-7a3f0594beab	King Henry III	5354065d-e6e6-4b5d-aedd-f6478962f866
533ce537-7a7d-4dd0-ab46-d42ebc03162e	Biot-Savart Law	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
e1349c6c-20ac-4e81-b2b2-1933028f9ca2	shrew	9e507792-fe0a-4221-ac5a-eeb064b42824
8073ecee-34db-48a2-85e6-797691430e69	mutualism	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
11fabafc-944b-4611-887d-6b5f878d37f1	King Richard I	5354065d-e6e6-4b5d-aedd-f6478962f866
672cc5d6-594c-471d-9013-8142fbb28d81	Casablanca	cec12a45-0f85-4d06-b656-6b242e0daf35
95591436-8dc2-4318-8191-6ff2f37f12c8	1899	10163da4-11bf-4a67-bea9-4c913d390698
f6874504-ed72-4cb2-8947-d8a194ad62aa	unauthorized (or forbidden)	ecff1bbb-161c-41ac-ba3d-998258281e3a
da94b20b-a8a3-47cc-b14b-07c2275df16e	vapourisation	b56c303f-61ae-4dc7-a308-8566bfe2c50d
f333ca42-5637-4f4e-8346-bd1dd34809ca	Caligula	df62b1e3-cf80-469a-b692-62943103755f
1ff1ed71-6c92-4ff8-a471-91997047a7ab	Invincible	a309767a-5834-447f-bdec-88a40fb6544e
45fc5795-b9c7-4c2c-a6b5-ac2cec401035	China	17aba436-0288-41ec-bfb7-edac090c0ae7
56da27ec-f237-4bd0-b7ff-3c2ad304ede5	Heart of Darkness	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
cf4df3e4-ed69-4b28-8517-c3604e3f23e0	lemur	9e507792-fe0a-4221-ac5a-eeb064b42824
7beefb16-4303-480d-937f-2c67d4eca845	Kenya	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
74855bcb-371e-41d0-babe-f8ffd3af20cd	Ohm''s Law	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
b98c88ab-4c88-4952-8f38-85f6329d886e	Bergen	014c78a1-d72a-47aa-9653-f2b62153cc3e
bcfdcfbc-3835-4a5b-88c7-4e143e63f08a	Stuck With U	d315cd95-3e49-4ada-98f4-44aecfc7430b
0dbd1ff0-febb-4d56-8ea0-8281dc0cd97c	Save Your Tears	d315cd95-3e49-4ada-98f4-44aecfc7430b
fe8c1b61-14e9-4709-8be2-f5afbc179d1c	xenon	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
d62b1de6-086e-484b-b6f7-c8e4cd49c414	Mushu	f8f27413-a4c7-46ad-bd44-90cc5a286b41
a4f58714-0c03-4bba-bdd2-7b7dd734d526	condensation	b56c303f-61ae-4dc7-a308-8566bfe2c50d
6d718d3b-3799-4406-963c-a3a0bb656150	trigonal pyramidal	f7db4e58-ea4e-44b4-a845-0429fdc23e86
9dd73ef6-05ac-40b5-9bd9-f6ccae11fab9	Tommy Lee Jones	1ad6180e-7932-423f-bf54-164f5ed0b39f
f1c119ef-f54d-47af-b77a-786ad8924fc6	Zambia	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
63cde387-73a1-45b9-ba82-08265e421d25	parasitism	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
2b67ae6e-dc88-4b50-9dfb-a80ab2b98539	datadog	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
652f1d16-c423-47b3-8052-edf377425052	India	17aba436-0288-41ec-bfb7-edac090c0ae7
afd983f0-dc74-4f67-ac5d-1c7881482eb8	The Arrow of Gold	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
265baa65-f633-41ad-9e55-a14a6ba6c740	Peaches	d315cd95-3e49-4ada-98f4-44aecfc7430b
4e6ad7c7-cc9f-469a-9255-cb39f98fe027	feudalism	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
1ced9d5d-233b-43b6-9902-e34f06b12fb0	argon	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
580012f6-e9ce-4078-a26c-1a97ef6348cc	Claudius	df62b1e3-cf80-469a-b692-62943103755f
bc282e3c-0762-4643-87c1-173eddba3ed6	momentum	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
5bf6e808-3de7-4cfc-a4d3-2942aa0adee3	oxygen	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
c00ef8ad-0b3c-45e4-ba05-593c79243124	1912	10163da4-11bf-4a67-bea9-4c913d390698
513b4443-3cd1-4670-8537-07af014777ff	Williams Syndrome	1ab38843-d57a-4071-b82b-e3e73383df32
b00ce563-fa63-4310-9cdb-a7a9b69bc83a	Love Me Like You Do	d315cd95-3e49-4ada-98f4-44aecfc7430b
904cb1f8-a30c-4ec7-9774-c8a74425c471	Denzel Washington	1ad6180e-7932-423f-bf54-164f5ed0b39f
791ecb72-27d9-48dc-99dc-df5ef49e48e5	weakly typed	d890b4c3-7882-4600-b0b0-60a34618fa7f
cc115915-a2e3-474a-8327-6f8264b366ff	deposition	b56c303f-61ae-4dc7-a308-8566bfe2c50d
2ad09f44-e4d7-4b7c-9543-d404fd9518b0	synapse	e4f700d9-aabf-4f51-8766-ea0161790954
10c06b49-db61-47fe-9b51-edb1fbaacce9	nitroglycerin	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
b458c273-63af-4fad-a384-e66877b3fe6e	Tangier	cec12a45-0f85-4d06-b656-6b242e0daf35
b842f647-deee-4ba6-8405-6de81f1d3fcd	trigonal planar	f7db4e58-ea4e-44b4-a845-0429fdc23e86
19953972-a9f0-4b13-b7eb-b7feb89c11e4	Ethiopia	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
9922a3cb-fbe4-412b-b930-f03210a3e28c	Iago	f8f27413-a4c7-46ad-bd44-90cc5a286b41
0d98ddcc-7e95-44ea-b0e1-505869c48b1b	The Sopranos	88eab287-890e-4a97-989d-28c87548e75f
93ac9d21-99ea-4420-927e-29bfa1ddf215	deployment	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
55bbdc90-ddad-4fb8-a5ac-4aad6978d842	Lord Jim	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
6e79e085-11d7-40ef-9876-0cc3d9b7388a	King John	5354065d-e6e6-4b5d-aedd-f6478962f866
b303d065-beb2-4be9-bcd5-dc12f51bf75a	energy	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
15d27909-6ae0-4f1c-963c-3ba4db5dcc39	kubernetes	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
47de2e33-9515-4ef6-9507-e29dd68c4931	1961	10163da4-11bf-4a67-bea9-4c913d390698
eb3ee71a-44cd-4fe1-9625-6af04de6cf8c	charge	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
7d5509b8-b9a7-4bd4-a4d8-754a6020a2e9	The Wire	88eab287-890e-4a97-989d-28c87548e75f
52a94def-0661-446e-b60b-b32f52ab9042	force	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
bc72610a-2b58-4f40-8028-09836d59f071	Tom Hanks	1ad6180e-7932-423f-bf54-164f5ed0b39f
5d8c3c62-f786-43a5-9d50-283c2632a8d9	Dangerous	a309767a-5834-447f-bdec-88a40fb6544e
91ee2611-bf25-402a-abb0-ce7887a92695	action potential	e4f700d9-aabf-4f51-8766-ea0161790954
a9fbab14-9586-4e19-bfac-0ae0f3396c3a	David Copperfield	229da990-eee7-4257-bcf8-3d9e4469467f
f95533e2-2158-4ffb-995a-c910fecde58f	Zazu	f8f27413-a4c7-46ad-bd44-90cc5a286b41
9686cdda-fe97-4b6f-81cf-cd6dd7481df8	Molde	014c78a1-d72a-47aa-9653-f2b62153cc3e
886b0f89-9818-4533-98e3-3ff229c83be7	bent	f7db4e58-ea4e-44b4-a845-0429fdc23e86
9a4f1401-8a3e-4d06-96e2-91cc4bf160ab	bad request	ecff1bbb-161c-41ac-ba3d-998258281e3a
dd35a3a2-0b0d-468f-89f5-3d29c9aed328	nitrous oxide	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
86e51cca-6b7d-4492-b729-489e685b710b	statefulset	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
6acf7733-f228-496f-b4a6-5a4567fddcd6	axon	e4f700d9-aabf-4f51-8766-ea0161790954
2951369e-28fe-4259-8ff5-f71e8c5249b7	Krebs Cycle (or Citric Acid Cycle)	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
28ad8aa8-ac49-4b53-aae5-defeeef87794	dynamically typed	d890b4c3-7882-4600-b0b0-60a34618fa7f
06569e7c-d0de-4754-bb6b-1d977cef3d13	Reye Syndrome	1ab38843-d57a-4071-b82b-e3e73383df32
6e360a1a-ac7d-4db5-95e7-d1324e574ffc	strongly typed	d890b4c3-7882-4600-b0b0-60a34618fa7f
c048c1b2-5965-46cb-afe0-02ce6ffa04ce	Bad	a309767a-5834-447f-bdec-88a40fb6544e
3308fb00-c124-45a2-a969-24b723a32ca5	Little Dorrit	229da990-eee7-4257-bcf8-3d9e4469467f
521ed1e9-230c-49f7-9b5b-4a878f5f7141	Nero	df62b1e3-cf80-469a-b692-62943103755f
dadb6e10-7cd5-48ea-ac54-fd839c4bf45a	Rabat	cec12a45-0f85-4d06-b656-6b242e0daf35
b30c2c62-8e2c-4b2d-91d3-0ffa5b729a57	not found	ecff1bbb-161c-41ac-ba3d-998258281e3a
e32c6e06-5c14-4a5c-8d52-8c9bddb03888	hadoop	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
ea1fd1aa-22aa-42b4-a5be-d2cb4e7aa356	The Americans	88eab287-890e-4a97-989d-28c87548e75f
eef306dd-a2d2-42d0-9b26-9b2b1a9bf7e0	Tiberius	df62b1e3-cf80-469a-b692-62943103755f
7b66d20e-106b-407d-bb44-e509fa61ff0b	apoptosis	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
a8f9983b-6470-48f5-9f66-1b1347dcc565	statically typed	d890b4c3-7882-4600-b0b0-60a34618fa7f
0d0a01cf-908c-4ea1-9035-2dc94d66d591	Ampere''s Law	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
9e4e69ff-affe-47ca-971e-78543c3a0b47	daemonset	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
63d8df08-6702-40dc-9daf-3f3faf9b0ce6	Faraday''s Law	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
75d17065-dabd-40d6-ae3b-4b3467cda19f	linear	f7db4e58-ea4e-44b4-a845-0429fdc23e86
efd41070-efd0-4a69-9d63-e5673a35667c	neuron	e4f700d9-aabf-4f51-8766-ea0161790954
640baa0b-0d14-4343-a88a-7a228e80cc49	sodium chloride	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
8b439d99-e958-486e-94d7-2ebdc6057cf4	kafka	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
6e516850-ce0d-45f1-aa69-3f35a9e7d5fa	Crohn''s Disease	1ab38843-d57a-4071-b82b-e3e73383df32
464002b8-3e1f-43fd-8f92-7c8d2ebac2b1	bat	9e507792-fe0a-4221-ac5a-eeb064b42824
ef91ec3a-bd14-48e3-b77f-af16df90ec79	Flounder	f8f27413-a4c7-46ad-bd44-90cc5a286b41
14a2613d-7b4c-42a4-9acd-701e2c6b510d	unauthenticated	ecff1bbb-161c-41ac-ba3d-998258281e3a
1d4bc430-6912-41e2-a867-264cd439dc89	conservative	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
56a0ded5-6143-4b61-9aed-69c9ac92730a	1910	10163da4-11bf-4a67-bea9-4c913d390698
449b7e0a-91b3-4a32-b7d8-8b6638d5e463	krypton	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
3339aa6d-d375-47cf-ba3c-02206ccacc7a	Harstad	014c78a1-d72a-47aa-9653-f2b62153cc3e
85fd931e-6802-4153-a8c2-14a41adb6455	meiosis	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
cb652f4a-9319-487a-b57c-d7e5f4d99c0c	The Old Curiosity Shop	229da990-eee7-4257-bcf8-3d9e4469467f
9854ff3e-546d-4b95-8cfa-673f0c113c7d	Wilson Disease	1ab38843-d57a-4071-b82b-e3e73383df32
698ab2df-9448-47b2-b799-764eb370bc13	replicaset	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
\.


--
-- TOC entry 3679 (class 0 OID 16508)
-- Dependencies: 217
-- Data for Name: question_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_options (id, question_id, option_id) FROM stdin;
555bdbf6-941c-4199-a167-d0fa6086375e	014c78a1-d72a-47aa-9653-f2b62153cc3e	15d27909-6ae0-4f1c-963c-3ba4db5dcc39
d84abd22-9fd1-45ee-ae4d-ddd746bb49af	051984ff-b3f9-4cb5-b1e5-c1be5d001b63	d62b1de6-086e-484b-b6f7-c8e4cd49c414
05f9ea7f-70a6-4636-9925-ff14006926aa	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8	6e79e085-11d7-40ef-9876-0cc3d9b7388a
5fbf3f0f-1780-4efc-a53d-8c5fe49ebe0a	10163da4-11bf-4a67-bea9-4c913d390698	efd41070-efd0-4a69-9d63-e5673a35667c
c005d5fd-5540-404a-973f-94289b97d2b5	17aba436-0288-41ec-bfb7-edac090c0ae7	00e3614d-5a19-48de-aeb2-ced732c51934
be08d62f-f4e9-4e16-b431-d87b9c71937a	1ab38843-d57a-4071-b82b-e3e73383df32	fe8c1b61-14e9-4709-8be2-f5afbc179d1c
9bbcc2d2-e210-46a3-9c37-b899fd8651cf	1ad6180e-7932-423f-bf54-164f5ed0b39f	a4f58714-0c03-4bba-bdd2-7b7dd734d526
3cea8730-f0af-425e-ac4e-464c65cef51b	229da990-eee7-4257-bcf8-3d9e4469467f	04396ba1-a3c3-4de0-bd9b-7d37fbc1df55
d611755c-173d-4b50-8562-737abcc3993a	279f35d1-dc5a-40ca-9146-1b40e3c9ad68	06569e7c-d0de-4754-bb6b-1d977cef3d13
70b956db-f246-4c8f-b3ae-99763fb53810	4a12c5a6-8a1b-493e-9913-de1e0d7b653a	0d0a01cf-908c-4ea1-9035-2dc94d66d591
816594d5-f3c3-43e6-9b98-3ff7fbfe3414	5354065d-e6e6-4b5d-aedd-f6478962f866	9686cdda-fe97-4b6f-81cf-cd6dd7481df8
dbebfc1a-cfd5-4cd3-8673-ab1f3afdc49f	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef	19232139-bed8-49f0-a9ce-ef5a89dd2e79
c6a3a5c1-7411-445c-a225-48b9ff349dc4	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8	1ced9d5d-233b-43b6-9902-e34f06b12fb0
64f37ba4-b347-4add-b023-c252f81e8f6a	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27	4e6ad7c7-cc9f-469a-9255-cb39f98fe027
ae4fa1a7-e0a4-4114-be25-2d4887699265	88eab287-890e-4a97-989d-28c87548e75f	91ee2611-bf25-402a-abb0-ce7887a92695
de052999-277a-4cb6-a0a0-a4d34243bbcc	9e507792-fe0a-4221-ac5a-eeb064b42824	eb3ee71a-44cd-4fe1-9625-6af04de6cf8c
3b4e5a10-3ac6-44bb-8f0b-087e80410467	a309767a-5834-447f-bdec-88a40fb6544e	464002b8-3e1f-43fd-8f92-7c8d2ebac2b1
37a8caa6-1197-49e3-9ca2-95ade5ce5463	adcfa2bf-0d3f-4eb1-b456-b124878ebd46	c4e3d9e1-be52-4d20-a35b-2777fd34a4a9
682987ac-02e0-44c5-98ad-b01db394229f	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4	52a94def-0661-446e-b60b-b32f52ab9042
e1300fe1-8b3d-442b-b20e-8a9f2fcc4a51	b56c303f-61ae-4dc7-a308-8566bfe2c50d	0d98ddcc-7e95-44ea-b0e1-505869c48b1b
0e6fecba-005a-405d-8a5d-9cfd1377ec03	bf5d6e5c-07b1-4847-a3cf-20ed114388e0	ef91ec3a-bd14-48e3-b77f-af16df90ec79
8c4c1908-dda7-4cc7-ad41-ab6942731c12	cec12a45-0f85-4d06-b656-6b242e0daf35	c00ef8ad-0b3c-45e4-ba05-593c79243124
8f8fb73b-5c39-458f-a62b-99c7e48f859b	d315cd95-3e49-4ada-98f4-44aecfc7430b	55bbdc90-ddad-4fb8-a5ac-4aad6978d842
65696301-1f50-4fd1-9215-11a08ab8feb2	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2	9854ff3e-546d-4b95-8cfa-673f0c113c7d
380c64ed-a98b-4a82-b0a0-f7e9ffc2b4e7	d890b4c3-7882-4600-b0b0-60a34618fa7f	b842f647-deee-4ba6-8405-6de81f1d3fcd
5c0680d9-e6bd-4db6-aea8-ae6c472caaf7	df62b1e3-cf80-469a-b692-62943103755f	cb652f4a-9319-487a-b57c-d7e5f4d99c0c
1734f4ad-0635-43cc-9815-9bb39df04ff7	e4f700d9-aabf-4f51-8766-ea0161790954	a78e0169-d484-4a35-948e-45e6b388182a
be422f78-10c4-4582-9871-7f0b6efe2a5a	ecff1bbb-161c-41ac-ba3d-998258281e3a	3c754d27-2f06-41a9-8594-40738f86a119
4b0af072-456e-43d2-9864-d8b18489dc51	f7db4e58-ea4e-44b4-a845-0429fdc23e86	dadb6e10-7cd5-48ea-ac54-fd839c4bf45a
2fbf1a9d-6975-40a0-a382-badcffb0eea5	f8f27413-a4c7-46ad-bd44-90cc5a286b41	a9fbab14-9586-4e19-bfac-0ae0f3396c3a
\.


--
-- TOC entry 3677 (class 0 OID 16492)
-- Dependencies: 215
-- Data for Name: questions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questions (question_id, question_text, question_subject) FROM stdin;
d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2	What is the capital city of Norway?	GEOGRAPHY
f8f27413-a4c7-46ad-bd44-90cc5a286b41	Which Kubernetes resource allows for exactly a single instance of a pod to run on every node within the cluster?	INFORMATION_TECHNOLOGY
051984ff-b3f9-4cb5-b1e5-c1be5d001b63	Which one of the following elements is NOT a noble gas?	CHEMISTRY
279f35d1-dc5a-40ca-9146-1b40e3c9ad68	In which year did the Union of South Africa come into existence?	HISTORY
014c78a1-d72a-47aa-9653-f2b62153cc3e	Which is the second largest country in the world (by area)?	GEOGRAPHY
88eab287-890e-4a97-989d-28c87548e75f	Which rare disorder causes an unusually high amount of copper to accumulate in the human body, particularly inside the liver?	BIOLOGY
5354065d-e6e6-4b5d-aedd-f6478962f866	Which actor won the 1994 Academy Award for Best Actor for his role in the film "Philadelphia"?	POP_CULTURE
bf5d6e5c-07b1-4847-a3cf-20ed114388e0	Which Charles Dickens novel contains the character, Thomas Gradgrind?	LITERATURE
afb423a4-b26c-43e1-9c53-e5a9cb29c3f4	What is the name of the process that describes the duplication of cells, where one parent cell divides into two daughter cells that are genetically identical?	BIOLOGY
5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8	What type of symbiotic relationship between two organisms involves one organism benefiting while the other is unaffected?	BIOLOGY
5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef	Who was the king of England when the Magna Carta was published in 1215?	HISTORY
9e507792-fe0a-4221-ac5a-eeb064b42824	What is the correct chemical name for the compound historically known as saltpeter?	CHEMISTRY
10163da4-11bf-4a67-bea9-4c913d390698	In which African country is Mount Kilimanjaro?	GEOGRAPHY
b56c303f-61ae-4dc7-a308-8566bfe2c50d	Which 1899 novella written by Joseph Conrad is based on events that took place in the Congo while it was under Belgian colonial rule?	LITERATURE
7e46b6fd-a232-4e2e-9ec2-f78f762c2e27	Which award-winning HBO series consists of a mafia boss named Tony, his wife Carmela, and their two children Meadow and AJ?	POP_CULTURE
4a12c5a6-8a1b-493e-9913-de1e0d7b653a	Which is the only mammal that is capable of true flight?	BIOLOGY
cec12a45-0f85-4d06-b656-6b242e0daf35	What is the name of the Michael Jackson album that contains the hit single, "You Rock My World"	POP_CULTURE
229da990-eee7-4257-bcf8-3d9e4469467f	Which framework that allows for the distributed processing of large sets of data across clusters of computers was named after the inventor''s son''s toy elephant?	INFORMATION_TECHNOLOGY
d890b4c3-7882-4600-b0b0-60a34618fa7f	What is the physical law which states that the voltage and current are directly proportional in an electric circuit where temperature is constant?	PHYSICS
17aba436-0288-41ec-bfb7-edac090c0ae7	What is the scientific term for the transition of a substance from a solid state to a gaseous state?	CHEMISTRY
a309767a-5834-447f-bdec-88a40fb6544e	What type of force has the property in which the total work done on a particle while moving it from point A to point B is independent of the path taken?	PHYSICS
d315cd95-3e49-4ada-98f4-44aecfc7430b	What is the capital city of Morocco?	GEOGRAPHY
f7db4e58-ea4e-44b4-a845-0429fdc23e86	Which 2020 song, released during the Covid pandemic lockdown, features both Justin Bieber and Ariana Grande?	POP_CULTURE
ecff1bbb-161c-41ac-ba3d-998258281e3a	According to Noether''s Theorem, which physical quantity is conserved in a system that remains invariant under a change in time?	PHYSICS
1ad6180e-7932-423f-bf54-164f5ed0b39f	In computer programming, what phrase is used to describe when the type of a variable (string, int, float, etc.) is only determined at runtime	INFORMATION_TECHNOLOGY
e4f700d9-aabf-4f51-8766-ea0161790954	What was the name of the Roman Emperor who reigned after Augustus Caesar? His reign lasted from AD 14 to AD 37.	HISTORY
0e2a6745-4f77-42a6-9b8c-f2cfc17030f8	In neurobiology, what is the term that describes a fast series of changes in potential difference (or voltage) across a membrane?	BIOLOGY
df62b1e3-cf80-469a-b692-62943103755f	In web development, what does it mean when the server returns an error with status code 403?	INFORMATION_TECHNOLOGY
adcfa2bf-0d3f-4eb1-b456-b124878ebd46	What is the molecular geometry of carbon dioxide?	CHEMISTRY
1ab38843-d57a-4071-b82b-e3e73383df32	What is the name of the blue bird (a red-billed hornbill) who serves as Mufasa''s assistant in Disney''s "The Lion King"	POP_CULTURE
\.


--
-- TOC entry 3534 (class 2606 OID 16507)
-- Name: options options_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.options
    ADD CONSTRAINT options_pkey PRIMARY KEY (option_id);


--
-- TOC entry 3532 (class 2606 OID 16499)
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (question_id);


-- Completed on 2024-06-14 15:49:04 SAST

--
-- PostgreSQL database dump complete
--

