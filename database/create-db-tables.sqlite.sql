CREATE TABLE questions (
	question_id INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	question_text TEXT NOT NULL,
	question_subject TEXT CHECK( question_subject IN ('PHYSICS','CHEMISTRY','GEOGRAPHY','BIOLOGY','HISTORY','LITERATURE', 'POP_CULTURE','INFORMATION_TECHNOLOGY') ) NOT NULL,
	correct_option_id INTEGER NOT NULL UNIQUE
);

CREATE TABLE options (
    option_id INTEGER PRIMARY KEY,
    option_text TEXT NOT NULL,
    owning_question_id INTEGER NOT NULL
);

INSERT INTO options (option_id, option_text, owning_question_id)
VALUES
    (1, 'Marrakesh', 22),
    (2, 'Canada', 5),
    (3, 'Hard Times', 8),
    (4, 'mitosis', 9),
    (5, 'commensalism', 10),
    (6, 'sublimation', 20),
    (7, 'frictional', 21),
    (8, 'King Henry II', 11),
    (9, 'Boardwalk Empire', 15),
    (10, 'flying squirrel', 16),
    (11, 'contact', 21),
    (12, 'Oslo', 1),
    (13, 'potassium nitrate', 12),
    (14, 'HIStory', 17),
    (15, 'Antonio Banderas', 7),
    (16, 'Tanzania', 13),
    (17, 'inertial', 21),
    (18, 'Brazil', 5),
    (19, 'Under Western Eyes', 14),
    (20, 'King Henry III', 11),
    (21, 'Biot-Savart Law', 19),
    (22, 'shrew', 16),
    (23, 'mutualism', 10),
    (24, 'King Richard I', 11),
    (25, 'Casablanca', 22),
    (26, '1899', 4),
    (27, 'unauthorized (or forbidden)', 28),
    (28, 'vapourisation', 20),
    (29, 'Caligula', 26),
    (30, 'Invincible', 17),
    (31, 'China', 5),
    (32, 'Heart of Darkness', 14),
    (33, 'lemur', 16),
    (34, 'Kenya', 13),
    (35, 'Ohm''s Law', 19),
    (36, 'Bergen', 1),
    (37, 'Stuck With U', 23),
    (38, 'Save Your Tears', 23),
    (39, 'xenon', 3),
    (40, 'Mushu', 30),
    (41, 'condensation', 20),
    (42, 'trigonal pyramidal', 29),
    (43, 'Tommy Lee Jones', 7),
    (44, 'Zambia', 13),
    (45, 'parasitism', 10),
    (46, 'datadog', 18),
    (47, 'India', 5),
    (48, 'The Arrow of Gold', 14),
    (49, 'Peaches', 23),
    (50, 'feudalism', 10),
    (51, 'argon', 3),
    (52, 'Claudius', 26),
    (53, 'momentum', 24),
    (54, 'oxygen', 3),
    (55, '1912', 4),
    (56, 'Williams Syndrome', 6),
    (57, 'Love Me Like You Do', 23),
    (58, 'Denzel Washington', 7),
    (59, 'weakly typed', 25),
    (60, 'deposition', 20),
    (61, 'synapse', 27),
    (62, 'nitroglycerin', 12),
    (63, 'Tangier', 22),
    (64, 'trigonal planar', 29),
    (65, 'Ethiopia', 13),
    (66, 'Iago', 30),
    (67, 'The Sopranos', 15),
    (68, 'deployment', 2),
    (69, 'Lord Jim', 14),
    (70, 'King John', 11),
    (71, 'energy', 24),
    (72, 'kubernetes', 18),
    (73, '1961', 4),
    (74, 'charge', 24),
    (75, 'The Wire', 15),
    (76, 'force', 24),
    (77, 'Tom Hanks', 7),
    (78, 'Dangerous', 17),
    (79, 'action potential', 27),
    (80, 'David Copperfield', 8),
    (81, 'Zazu', 30),
    (82, 'Molde', 1),
    (83, 'bent', 29),
    (84, 'bad request', 28),
    (85, 'nitrous oxide', 12),
    (86, 'statefulset', 2),
    (87, 'axon', 27),
    (88, 'Krebs Cycle (or Citric Acid Cycle)', 9),
    (89, 'dynamically typed', 25),
    (90, 'Reye Syndrome', 6),
    (91, 'strongly typed', 25),
    (92, 'Bad', 17),
    (93, 'Little Dorrit', 8),
    (94, 'Nero', 26),
    (95, 'Rabat', 22),
    (96, 'not found', 28),
    (97, 'hadoop', 18),
    (98, 'The Americans', 15),
    (99, 'Tiberius', 26),
    (100, 'apoptosis', 9),
    (101, 'statically typed', 25),
    (102, 'Ampere''s Law', 19),
    (103, 'daemonset', 2),
    (104, 'Faraday''s Law', 19),
    (105, 'linear', 29),
    (106, 'neuron', 27),
    (107, 'sodium chloride', 12),
    (108, 'kafka', 18),
    (109, 'Crohn''s Disease', 6),
    (110, 'bat', 16),
    (111, 'Flounder', 30),
    (112, 'unauthenticated', 28),
    (113, 'conservative', 21),
    (114, '1910', 4),
    (115, 'krypton', 3),
    (116, 'Harstad', 1),
    (117, 'meiosis', 9),
    (118, 'The Old Curiosity Shop', 8),
    (119, 'Wilson Disease', 6),
    (120, 'replicaset', 2);    

INSERT INTO questions (question_id, question_text, question_subject, correct_option_id)
VALUES
    (1, 'What is the capital city of Norway?', 'GEOGRAPHY', 12),
    (2, 'Which Kubernetes resource allows for exactly a single instance of a pod to run on every node within the cluster?', 'INFORMATION_TECHNOLOGY', 103),
    (3, 'Which one of the following elements is NOT a noble gas?', 'CHEMISTRY', 54),
    (4, 'In which year did the Union of South Africa come into existence?', 'HISTORY', 114),
    (5, 'Which is the second largest country in the world (by area)?', 'GEOGRAPHY', 2),
    (6, 'Which rare disorder causes an unusually high amount of copper to accumulate in the human body, particularly inside the liver?', 'BIOLOGY', 119),
    (7, 'Which actor won the 1994 Academy Award for Best Actor for his role in the film "Philadelphia"?', 'POP_CULTURE', 77),
    (8, 'Which Charles Dickens novel contains the character, Thomas Gradgrind?', 'LITERATURE', 3),
    (9, 'What is the name of the process that describes the duplication of cells, where one parent cell divides into two daughter cells that are genetically identical?', 'BIOLOGY', 4),
    (10, 'What type of symbiotic relationship between two organisms involves one organism benefiting while the other is unaffected?', 'BIOLOGY', 5),
    (11, 'Who was the king of England when the Magna Carta was published in 1215?', 'HISTORY', 70),
    (12, 'What is the correct chemical name for the compound historically known as saltpeter?', 'CHEMISTRY', 13),
    (13, 'In which African country is Mount Kilimanjaro?', 'GEOGRAPHY', 16),
    (14, 'Which 1899 novella written by Joseph Conrad is based on events that took place in the Congo while it was under Belgian colonial rule?', 'LITERATURE', 32),
    (15, 'Which award-winning HBO series consists of a mafia boss named Tony, his wife Carmela, and their two children Meadow and AJ?', 'POP_CULTURE', 67),
    (16, 'Which is the only mammal that is capable of true flight?', 'BIOLOGY', 110),
    (17, 'What is the name of the Michael Jackson album that contains the hit single, ''You Rock My World''', 'POP_CULTURE', 30),
    (18, 'Which framework that allows for the distributed processing of large sets of data across clusters of computers was named after the inventor''s son''s toy elephant?', 'INFORMATION_TECHNOLOGY', 97),
    (19, 'What is the physical law which states that the voltage and current are directly proportional in an electric circuit where temperature is constant?', 'PHYSICS', 35),
    (20, 'What is the scientific term for the transition of a substance from a solid state to a gaseous state?', 'CHEMISTRY', 6),
    (21, 'What type of force has the property in which the total work done on a particle while moving it from point A to point B is independent of the path taken?', 'PHYSICS', 113),
    (22, 'What is the capital city of Morocco?', 'GEOGRAPHY', 95),
    (23, 'Which 2020 song, released during the Covid pandemic lockdown, features both Justin Bieber and Ariana Grande?', 'POP_CULTURE', 37),
    (24, 'According to Noether''s Theorem, which physical quantity is conserved in a system that remains invariant under a change in time?', 'PHYSICS', 71),
    (25, 'In computer programming, what phrase is used to describe when the type of a variable (string, int, float, etc.) is only determined at runtime', 'INFORMATION_TECHNOLOGY', 89),
    (26, 'What was the name of the Roman Emperor who reigned after Augustus Caesar? His reign lasted from AD 14 to AD 37.', 'HISTORY', 99),
    (27, 'In neurobiology, what is the term that describes a fast series of changes in potential difference (or voltage) across a membrane?', 'BIOLOGY', 79),
    (28, 'In web development, what does it mean when the server returns an error with status code 403?', 'INFORMATION_TECHNOLOGY', 27),
    (29, 'What is the molecular geometry of carbon dioxide?', 'CHEMISTRY', 105),
    (30, 'What is the name of the blue bird (a red-billed hornbill) who serves as Mufasa''s assistant in Disney''s ''The Lion King''', 'POP_CULTURE', 81);