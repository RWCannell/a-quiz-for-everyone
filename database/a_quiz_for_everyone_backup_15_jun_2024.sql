--
-- PostgreSQL database dump
--

-- Dumped from database version 15.7 (Homebrew)
-- Dumped by pg_dump version 15.4

-- Started on 2024-06-15 19:39:08 SAST

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
-- TOC entry 216 (class 1259 OID 16512)
-- Name: options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.options (
    option_id uuid DEFAULT gen_random_uuid() NOT NULL,
    option_text character varying NOT NULL,
    owning_question_id uuid
);


ALTER TABLE public.options OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16520)
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
-- TOC entry 3678 (class 0 OID 16512)
-- Dependencies: 216
-- Data for Name: options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.options (option_id, option_text, owning_question_id) FROM stdin;
67283504-28a2-46de-8d4b-47d4574cb545	Marrakesh	d315cd95-3e49-4ada-98f4-44aecfc7430b
63eca958-1f2c-4ebe-9ef0-eb7bc0fb2e11	Canada	014c78a1-d72a-47aa-9653-f2b62153cc3e
c22119b7-209a-4361-983a-de2f03fa0c89	Hard Times	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
2a069945-5eff-485a-b2a0-1cfe01f21011	mitosis	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
222ba7fa-d249-4b05-baf3-3a24ec711dcf	commensalism	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
8ad7aad8-90f2-4b30-9bdd-419d169403eb	sublimation	17aba436-0288-41ec-bfb7-edac090c0ae7
e44dd690-36d9-4a13-86a6-bc531d8539fc	frictional	a309767a-5834-447f-bdec-88a40fb6544e
faf6d316-60bd-46fa-a9c5-c856caeaa308	King Henry II	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
fb6bff71-0088-4d00-a9df-b2a7308e7c0d	Boardwalk Empire	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
14329139-96a6-4a8f-bcc2-aff5b9bba45d	flying squirrel	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
014e2c24-58ed-4306-874c-bce4b62b1a23	contact	a309767a-5834-447f-bdec-88a40fb6544e
ed0668de-9e1d-47a3-a43b-577a7f630a55	Oslo	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
378fc4ef-2808-47ae-9a8d-863841fe5e70	potassium nitrate	9e507792-fe0a-4221-ac5a-eeb064b42824
70a21bdd-263d-444b-871b-b1c30c356ebc	HIStory	cec12a45-0f85-4d06-b656-6b242e0daf35
475b6a5f-012f-44e1-a243-a017d7fd131d	Antonio Banderas	5354065d-e6e6-4b5d-aedd-f6478962f866
de753616-7eca-47f5-ae2f-438a6fac541c	Tanzania	10163da4-11bf-4a67-bea9-4c913d390698
41a7a18f-f4ba-4b44-992a-e3e339b949d9	inertial	a309767a-5834-447f-bdec-88a40fb6544e
e43d6cab-4bdd-4660-95fe-0c63b3415394	Brazil	014c78a1-d72a-47aa-9653-f2b62153cc3e
e19e65f4-783c-4902-afb6-4c45fd68834f	Under Western Eyes	b56c303f-61ae-4dc7-a308-8566bfe2c50d
634ba11a-889e-4fad-ad3f-6df34436fba3	King Henry III	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
33bcba81-f60a-4ccd-8ca8-06f3e8c332db	Biot-Savart Law	d890b4c3-7882-4600-b0b0-60a34618fa7f
bc0f7901-a811-459e-9898-658106d80f61	shrew	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
714730dc-a5bf-4208-9915-b06aec8e0308	mutualism	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
b83b298d-ab9d-4735-b6b3-766e82075d45	King Richard I	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
ea6ac6b4-d19d-4f4a-ab89-38558768a53d	Casablanca	d315cd95-3e49-4ada-98f4-44aecfc7430b
93f6e0a0-6aa3-4901-b471-ed207231db83	1899	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
e8ec9f4b-b593-4ba3-8106-53d6c9632627	unauthorized (or forbidden)	df62b1e3-cf80-469a-b692-62943103755f
21d3d225-cd37-4e3f-8a1e-ac9b246daaf3	vaporisation	17aba436-0288-41ec-bfb7-edac090c0ae7
62a76127-f37b-4e89-9d10-be7edd24ae9e	Caligula	e4f700d9-aabf-4f51-8766-ea0161790954
f2c9e0f8-7a4c-4620-b9a4-52ee3c84cfde	Invincible	cec12a45-0f85-4d06-b656-6b242e0daf35
5796977e-4ef4-489c-96eb-03ecf9d211f2	China	014c78a1-d72a-47aa-9653-f2b62153cc3e
dbcfde1d-d403-426e-8629-f643021dddbb	Heart of Darkness	b56c303f-61ae-4dc7-a308-8566bfe2c50d
1a0fa959-d888-4863-a52c-9c2fa33abad4	lemur	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
1db6b67f-ca03-4129-9deb-a8e1f1b5a988	Kenya	10163da4-11bf-4a67-bea9-4c913d390698
16f3cf93-3a01-4976-8571-68a77a18b89b	Ohm''s Law	d890b4c3-7882-4600-b0b0-60a34618fa7f
25b0d0e8-a5ee-4966-bab8-01db139b98e9	Bergen	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
8dd8ae13-f3d4-4400-8e48-55fbdb0eb98f	Stuck With U	f7db4e58-ea4e-44b4-a845-0429fdc23e86
712072a1-7bac-49f4-a1a5-cd1e0ba34fc7	Save Your Tears	f7db4e58-ea4e-44b4-a845-0429fdc23e86
5ff9c190-176f-4cff-883a-739f62bfe3fb	xenon	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
bb911e57-8752-401c-a508-22c38c8a01c5	Mushu	1ab38843-d57a-4071-b82b-e3e73383df32
34da1df6-ba6e-4b9e-be42-339f3b37f092	condensation	17aba436-0288-41ec-bfb7-edac090c0ae7
edd51cd9-1265-4f51-bb43-0db3886aaa9c	trigonal pyramidal	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
d38ec24c-7fdd-4398-9263-d4325a708b6c	Tommy Lee Jones	5354065d-e6e6-4b5d-aedd-f6478962f866
bb3be650-5f87-4b89-8932-a462bafa0e0c	Zambia	10163da4-11bf-4a67-bea9-4c913d390698
e8220c74-9099-467f-a9af-8cada1a68e21	parasitism	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
df83a9e5-9010-4695-a2e4-b5b77bdf17c6	datadog	229da990-eee7-4257-bcf8-3d9e4469467f
8247403f-bf77-47f1-b497-d743b19037bd	India	014c78a1-d72a-47aa-9653-f2b62153cc3e
43874c9f-fe3d-46c8-8d49-4cfe727bd087	The Arrow of Gold	b56c303f-61ae-4dc7-a308-8566bfe2c50d
db6f6dee-3c9b-45c3-84a6-775d4aa3b70c	Peaches	f7db4e58-ea4e-44b4-a845-0429fdc23e86
f958efc8-36f5-4764-b2bb-4da88df0b01b	feudalism	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8
a5f1ce28-5098-41ed-b9a2-6653ae8d223b	argon	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
385fcc12-c911-4d0c-bc92-e6122c6a475e	Claudius	e4f700d9-aabf-4f51-8766-ea0161790954
5f768ba1-d447-492d-9834-adeabeb86d9e	momentum	ecff1bbb-161c-41ac-ba3d-998258281e3a
d817dfbb-601a-49cc-8e11-5e408fbcb77f	oxygen	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
3b495fa4-368a-49e0-a5ba-4480fe96fb2d	1912	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
cda46da0-6573-4fa5-9c2a-3bfe04042386	Williams Syndrome	88eab287-890e-4a97-989d-28c87548e75f
a142485f-ba95-4669-92a0-af813387eeda	Love Me Like You Do	f7db4e58-ea4e-44b4-a845-0429fdc23e86
16af3bdd-de71-47cf-acc2-418374c31df4	Denzel Washington	5354065d-e6e6-4b5d-aedd-f6478962f866
c8961213-d22c-4379-aec3-959e53ea6c50	weakly typed	1ad6180e-7932-423f-bf54-164f5ed0b39f
91d37b11-7e6a-4546-9c95-c85d9de3ae47	deposition	17aba436-0288-41ec-bfb7-edac090c0ae7
cfe95542-ce6b-4343-a387-103cf0086f82	synapse	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
83e83598-6357-48ca-bfe3-0a1c11973573	nitroglycerin	9e507792-fe0a-4221-ac5a-eeb064b42824
b92d8a6f-abeb-410c-b29c-3e00dccd146f	Tangier	d315cd95-3e49-4ada-98f4-44aecfc7430b
ed8aa03e-630b-46d5-aea9-0bf3f39a1936	trigonal planar	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
11707239-62d3-4fce-8487-488f73d3dc90	Ethiopia	10163da4-11bf-4a67-bea9-4c913d390698
372092a9-f4ba-4f6f-a749-a91eeb1abdc8	Iago	1ab38843-d57a-4071-b82b-e3e73383df32
451cd986-8fa9-4e86-94b3-edb827f078aa	The Sopranos	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
05c3e77f-8216-4cd7-a123-3f01c24ba3b3	deployment	f8f27413-a4c7-46ad-bd44-90cc5a286b41
109199b3-6e59-48cc-b1e2-18f0cf29b7f1	Lord Jim	b56c303f-61ae-4dc7-a308-8566bfe2c50d
e80e319d-5f01-42e5-8ddf-6ec01f370153	King John	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef
a19d8b14-8af2-4189-a995-037f7775e15d	energy	ecff1bbb-161c-41ac-ba3d-998258281e3a
79bda23e-cf5d-43fb-83dc-1219a31a59cd	kubernetes	229da990-eee7-4257-bcf8-3d9e4469467f
c2c36c3f-2176-412a-baee-ccbad13cff6a	1961	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
78503380-335e-4b29-b442-671f1542ba6d	charge	ecff1bbb-161c-41ac-ba3d-998258281e3a
fd2aaf89-5b4c-4a55-9e49-38bab5be97bb	The Wire	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
571d6ff4-07bf-44a9-8ace-995ac3b77e59	force	ecff1bbb-161c-41ac-ba3d-998258281e3a
e0bf9121-e97c-4e6a-8414-2308740307fe	Tom Hanks	5354065d-e6e6-4b5d-aedd-f6478962f866
a265f67d-2c34-41ec-a49d-6093965edc3c	Dangerous	cec12a45-0f85-4d06-b656-6b242e0daf35
1ec0beab-47cd-4ca6-b03b-2b1f43244498	action potential	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
ba65875a-f06b-4b35-a861-607432d9c42f	David Copperfield	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
386bfe77-2ae2-41af-acc4-075bf384a8df	Zazu	1ab38843-d57a-4071-b82b-e3e73383df32
4509fce0-4530-44f3-87f0-306ca54096b8	Molde	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
3ce5b49a-6c53-4bc9-a044-ad9de721d70e	bent	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
3578456a-72a0-46fb-b8d7-0eff0d6ca8cb	bad request	df62b1e3-cf80-469a-b692-62943103755f
bbae778e-39ad-4f42-9e95-05159ba9aff2	nitrous oxide	9e507792-fe0a-4221-ac5a-eeb064b42824
e6140b8e-145e-4ba1-814b-d704b8de6bf2	statefulset	f8f27413-a4c7-46ad-bd44-90cc5a286b41
7b917ec8-9fa3-4e93-88d8-6ba7403f3159	axon	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
33a62aa0-9221-4082-ae07-6a416efaf8a3	Krebs Cycle (or Citric Acid Cycle)	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
893217c5-dc17-4003-bcbe-ecc8e2986af4	dynamically typed	1ad6180e-7932-423f-bf54-164f5ed0b39f
984f6605-8cd6-4f3a-9327-f586425050a6	Reye Syndrome	88eab287-890e-4a97-989d-28c87548e75f
ed196bfe-d536-4d7f-a7b5-86d73a70cb14	strongly typed	1ad6180e-7932-423f-bf54-164f5ed0b39f
6cb5e61a-988f-400c-a4cf-025e35579c95	Bad	cec12a45-0f85-4d06-b656-6b242e0daf35
295ae708-3f12-4da6-ba8d-5645a899f148	Little Dorrit	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
464c7a7f-62de-45ec-91b2-b0742b6e0ad9	Nero	e4f700d9-aabf-4f51-8766-ea0161790954
17466f35-38f2-4203-8354-b9c3f47e1218	Rabat	d315cd95-3e49-4ada-98f4-44aecfc7430b
9513c64c-0a7a-49d9-a52b-ef41fdb3a027	not found	df62b1e3-cf80-469a-b692-62943103755f
5b81dd80-18cd-4c1b-87f1-fd62a1e82226	hadoop	229da990-eee7-4257-bcf8-3d9e4469467f
e5c055d9-d010-4e33-9937-5de84c36c408	The Americans	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27
e3359378-b361-453f-8f28-0073d895ca31	Tiberius	e4f700d9-aabf-4f51-8766-ea0161790954
436128a9-36ab-4b79-8c7f-c273ea5781fe	apoptosis	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
152ae08a-9190-4b9b-a35a-cc216b805b33	statically typed	1ad6180e-7932-423f-bf54-164f5ed0b39f
368702a7-c2f9-46fa-86a5-40b2eefcf087	Ampere''s Law	d890b4c3-7882-4600-b0b0-60a34618fa7f
a2e56679-b2b7-41a2-a30c-c5e70a12bbbe	daemonset	f8f27413-a4c7-46ad-bd44-90cc5a286b41
a2cd4084-d6a3-4790-b69e-811c62ef3e98	Faraday''s Law	d890b4c3-7882-4600-b0b0-60a34618fa7f
54079649-579e-4a85-b5f2-0469dc9dd647	linear	adcfa2bf-0d3f-4eb1-b456-b124878ebd46
c5b9b8a4-764d-4820-be56-ccbf83cedb32	neuron	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8
9c48a1f4-0e35-4642-8779-acc8f17982f9	sodium chloride	9e507792-fe0a-4221-ac5a-eeb064b42824
e0bf6689-0afb-40bf-b78e-646f0c8a1410	kafka	229da990-eee7-4257-bcf8-3d9e4469467f
f341d5a0-91b2-480d-b9c8-5eb68c31e185	Crohn''s Disease	88eab287-890e-4a97-989d-28c87548e75f
42470c6d-380a-459c-96af-de39801e1980	bat	4a12c5a6-8a1b-493e-9913-de1e0d7b653a
0499595e-1578-49e3-9548-2b0a253da934	Flounder	1ab38843-d57a-4071-b82b-e3e73383df32
0f2c26ee-2a8b-4c75-b0bd-3287e7c07042	unauthenticated	df62b1e3-cf80-469a-b692-62943103755f
659e8167-5ecc-43e9-8369-5156fd15c477	conservative	a309767a-5834-447f-bdec-88a40fb6544e
85c4683b-ece6-4ba6-b641-ff333347ade2	1910	279f35d1-dc5a-40ca-9146-1b40e3c9ad68
15ecc4c7-7c0b-452a-a231-65ea1a64b245	krypton	051984ff-b3f9-4cb5-b1e5-c1be5d001b63
de27f26f-f7b9-4121-a968-0235968bba82	Harstad	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2
9e511b66-4b9f-405c-8a0d-12fb7e34b08b	meiosis	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4
63ecb338-3bf3-4c01-8bc2-28a263b2c9e9	The Old Curiosity Shop	bf5d6e5c-07b1-4847-a3cf-20ed114388e0
93f8c153-74f4-4d3d-8587-99fdb7b22752	Wilson Disease	88eab287-890e-4a97-989d-28c87548e75f
050a9f48-e254-47b8-994e-aebd1f905ff5	replicaset	f8f27413-a4c7-46ad-bd44-90cc5a286b41
\.


--
-- TOC entry 3679 (class 0 OID 16520)
-- Dependencies: 217
-- Data for Name: question_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.question_options (id, question_id, option_id) FROM stdin;
481a4343-1177-4dc3-95de-4bbb077d7f89	014c78a1-d72a-47aa-9653-f2b62153cc3e	63eca958-1f2c-4ebe-9ef0-eb7bc0fb2e11
9fcc8f2d-cddb-4ba1-b829-ccdfa2bf4696	051984ff-b3f9-4cb5-b1e5-c1be5d001b63	d817dfbb-601a-49cc-8e11-5e408fbcb77f
948ed42b-f501-4377-934e-7991cd61422c	0e2a6745-4f77-42a6-9b8c-f2cfc17030f8	1ec0beab-47cd-4ca6-b03b-2b1f43244498
3479bd31-17dc-471e-adf1-7cb8c6327b82	10163da4-11bf-4a67-bea9-4c913d390698	de753616-7eca-47f5-ae2f-438a6fac541c
21abaaca-0eea-4a6a-b119-1b3b939b736e	17aba436-0288-41ec-bfb7-edac090c0ae7	8ad7aad8-90f2-4b30-9bdd-419d169403eb
f3c0aab4-49f1-4417-9085-75787c01e9c2	1ab38843-d57a-4071-b82b-e3e73383df32	386bfe77-2ae2-41af-acc4-075bf384a8df
3ce20c05-9c98-4673-ab65-3074f6f71246	1ad6180e-7932-423f-bf54-164f5ed0b39f	893217c5-dc17-4003-bcbe-ecc8e2986af4
52880bfb-1436-49f9-9362-12f3da8332e2	229da990-eee7-4257-bcf8-3d9e4469467f	5b81dd80-18cd-4c1b-87f1-fd62a1e82226
39b70bf4-b0d1-4206-93cc-78e4f7fe7ed5	279f35d1-dc5a-40ca-9146-1b40e3c9ad68	85c4683b-ece6-4ba6-b641-ff333347ade2
a4829e97-fcad-418b-80cb-1e46a57c0859	4a12c5a6-8a1b-493e-9913-de1e0d7b653a	42470c6d-380a-459c-96af-de39801e1980
ab52acdd-75b2-4b2c-89e2-3e7081244c51	5354065d-e6e6-4b5d-aedd-f6478962f866	e0bf9121-e97c-4e6a-8414-2308740307fe
bf7bbed6-1a94-446b-919f-11844a59e89e	5498e9dc-8ce9-4a9f-8bc3-413b97e1fdef	e80e319d-5f01-42e5-8ddf-6ec01f370153
441ea923-bbab-41f7-9204-7e9656771a1b	5d6c43ec-83ae-4b91-8cbf-ffae0d371cd8	222ba7fa-d249-4b05-baf3-3a24ec711dcf
67a834cc-129b-40a4-9e96-ec9c5c545603	7e46b6fd-a232-4e2e-9ec2-f78f762c2e27	451cd986-8fa9-4e86-94b3-edb827f078aa
d634281a-1208-4ba2-8a5a-9549cf53480f	88eab287-890e-4a97-989d-28c87548e75f	93f8c153-74f4-4d3d-8587-99fdb7b22752
39be1a76-d3a7-4a82-8999-c51a1607ccff	9e507792-fe0a-4221-ac5a-eeb064b42824	378fc4ef-2808-47ae-9a8d-863841fe5e70
8292e82f-481a-4564-8abe-006d9b2924ce	a309767a-5834-447f-bdec-88a40fb6544e	659e8167-5ecc-43e9-8369-5156fd15c477
f9fd2e9b-4c84-4758-8560-6696726db70d	adcfa2bf-0d3f-4eb1-b456-b124878ebd46	54079649-579e-4a85-b5f2-0469dc9dd647
f89cc728-dd33-42b7-8aad-18c9019de8da	afb423a4-b26c-43e1-9c53-e5a9cb29c3f4	2a069945-5eff-485a-b2a0-1cfe01f21011
d3781665-531f-44a8-9913-02c0cb70afb6	b56c303f-61ae-4dc7-a308-8566bfe2c50d	dbcfde1d-d403-426e-8629-f643021dddbb
48cb93a1-e36b-433e-b4ff-1f11e5a2e2bc	bf5d6e5c-07b1-4847-a3cf-20ed114388e0	c22119b7-209a-4361-983a-de2f03fa0c89
815d124a-036d-434b-ac8e-8653b810a07f	cec12a45-0f85-4d06-b656-6b242e0daf35	f2c9e0f8-7a4c-4620-b9a4-52ee3c84cfde
7bc16880-a63e-43e0-9b35-2f6b79b1d8b7	d315cd95-3e49-4ada-98f4-44aecfc7430b	17466f35-38f2-4203-8354-b9c3f47e1218
feb44f2b-3704-41f5-99be-3fe49fb16384	d781ba80-2b5f-46ed-b4f6-9f389f9d4fd2	ed0668de-9e1d-47a3-a43b-577a7f630a55
baa6a5e8-6de4-4693-b338-b0fd7cf3155d	d890b4c3-7882-4600-b0b0-60a34618fa7f	16f3cf93-3a01-4976-8571-68a77a18b89b
cf47211b-30a4-4413-9017-5264ff9dc725	df62b1e3-cf80-469a-b692-62943103755f	e8ec9f4b-b593-4ba3-8106-53d6c9632627
05a66694-0f6c-4159-ba2e-53f9df4e0848	e4f700d9-aabf-4f51-8766-ea0161790954	e3359378-b361-453f-8f28-0073d895ca31
257d075f-6270-4e61-8c61-b66d13e44051	ecff1bbb-161c-41ac-ba3d-998258281e3a	a19d8b14-8af2-4189-a995-037f7775e15d
3b14f0ab-d470-41a1-9b8b-2eff92e26c16	f7db4e58-ea4e-44b4-a845-0429fdc23e86	8dd8ae13-f3d4-4400-8e48-55fbdb0eb98f
7a06efe8-4c73-457a-80be-cf89a24fb997	f8f27413-a4c7-46ad-bd44-90cc5a286b41	a2e56679-b2b7-41a2-a30c-c5e70a12bbbe
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
cec12a45-0f85-4d06-b656-6b242e0daf35	What is the name of the Michael Jackson album that contains the hit single, 'You Rock My World'	POP_CULTURE
229da990-eee7-4257-bcf8-3d9e4469467f	Which framework that allows for the distributed processing of large sets of data across clusters of computers was named after the inventor's son's toy elephant?	INFORMATION_TECHNOLOGY
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
1ab38843-d57a-4071-b82b-e3e73383df32	What is the name of the blue bird (a red-billed hornbill) who serves as Mufasa's assistant in Disney''s "The Lion King"	POP_CULTURE
\.


--
-- TOC entry 3534 (class 2606 OID 16519)
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


-- Completed on 2024-06-15 19:39:08 SAST

--
-- PostgreSQL database dump complete
--

