drop database if exists projectv1 ;

create database projectv1;

use projectv1;

create table WORD_type(
type_ID int NOT NULL,
word_type VARCHAR(15) NOT NULL,
PRIMARY KEY (type_ID)
);

create table WORD(
word_ID int not null AUTO_INCREMENT,
word VARCHAR(15) NOT NULL,
defenition VARCHAR(255) NOT NULL,
word_type int NOT NULL,
PRIMARY KEY (word_ID),
FOREIGN KEY (word_type) REFERENCES word_type(type_ID)
);

create table phonesthetics(
W1_ID int not null,
W2_ID int not null,
FOREIGN KEY (W1_ID) REFERENCES word(word_ID),
FOREIGN KEY (W2_ID) REFERENCES word(word_ID),
CONSTRAINT PK_phonesthetics PRIMARY KEY (W1_ID,W2_ID)
);

create table synonyms(
W_ID int not null,
Syn_ID int not null,
FOREIGN KEY (W_ID) REFERENCES word(word_ID),
FOREIGN KEY (Syn_ID) REFERENCES word(word_ID),
CONSTRAINT PK_synonym PRIMARY KEY (Syn_ID,W_ID)
);

insert into WORD_type values
	(1,"Noun"),
	(2,"Verb"),
	(3,"adjective"),
	(4,"Preposition"),
    (5,"adverb")
;

insert into WORD values
	(1,"Except","not including; other than",4),
    (2,"Barring","except for; if not for",4),
    (3,"Accept","consent to receive (a thing offered)",2),
    (4,"Ratify","sign or give formal consent to (a treaty, contract, or agreement), making it officially valid",2),
    
    (5,"Effect","anything brought about by a cause or agent",1),
    (6,"Impact","the action of one object coming forcibly into contact with another",1),
    (7,"Affect","to act on and cause a change in (someone or something)",2),
    (8,"Influence","the capacity to have an effect on the character, development, or behavior of someone or something, or the effect itself",1),
    
    (9,"Loose","not firmly or tightly fixed in place; detached or able to be detached",3),
    (10,"Baggy","(of clothing) loose and hanging in folds",3),
    (11,"Lose","be deprived of or cease to have or retain (something)",2),
    (12,"Forfeit","lose or be deprived of (property or a right or privilege) as a penalty for wrongdoing",3),
    
    (13,"Complement","a thing that completes or brings to perfection",1),
    (14,"supplement","something that completes or enhances something else when added to it",1),
    (15,"Compliment","a polite expression of praise or admiration",1),
    (16,"Flattery","excessive and insincere praise, given especially to further one's own interests",1),
    
    (17,"Advise","offer suggestions about the best course of action to someone",2),
    (18,"Admonish","warn or reprimand someone firmly",2),
    (19,"Advice","guidance or recommendations offered with regard to prudent future action",2),
    (20,"Guidance","advice or information aimed at resolving a problem or difficulty, especially as given by someone in authority",1),
    
    (21,"Desert","arid land with usually sparse vegetation especially",1),
    (22,"Wilderness","an uncultivated, uninhabited, and inhospitable region",1),
    (23,"Dessert","the sweet course eaten at the end of a meal",1),
    (24,"Confection","a dish or delicacy made with sweet ingredients",1),
    
    (25,"Stationery","materials (such as paper, pens, and ink) for writing or typing",1),
    (26,"office supplies","consumables and equipment regularly used in offices",1),
    (27,"Stationary","not moving or not intended to be moved",3),
    (28,"Immobile","not moving; motionless",3),
    
    (29,"Isle","an island or peninsula, especially a small one",1),
    (30,"Islet","a small island",1),
    (31,"Aisle","Aisle",1),
    (32,"Passageway","a long, narrow way, typically having walls either side, that allows access between buildings or to different rooms within a building",1),
    
    (33,"Course","the path over which something moves or extends",1),
    (34,"Pathway","a way that constitutes or serves as a path",1),
    (35,"Coarse","rough or loose or rude, crude, or vulgar",3),
    (36,"Vulgar","lacking sophistication or good taste; unrefined",3),
    
    (37,"Piece","a separate or limited portion or quantity of something",1),
    (38,"Bit","a small piece, part, or quantity of something",1),
    (39,"Peace","freedom from disturbance; tranquility",1),
    (40,"Serenity","the state of being calm, peaceful, and untroubled",1),
    
    (41,"Pore","minute opening in a surface, especially the skin or integument of an organism",1),
    (42,"Orifice ","an opening, as of a pipe or tube, or one in the body, such as a",1),
    (43,"Pour","flow rapidly in a steady stream",2),
    (44,"Flow","move along or out steadily and continuously in a current or stream",2),
    
    (45,"Fair","in accordance with the rules or standards; legitimate",3),
    (46,"Impartial","treating all rivals or disputants equally; fair and just",3),
    (47,"Fare","the money a passenger on public transportation has to pay",1),
    (48,"Wage","a fixed regular payment, typically paid on a daily or weekly basis, made by an employer to an employee, especially to a manual or unskilled worker",1),
    
    (49,"Two","a cardinal number, 1 plus 1",1),
    (50,"double","composed of two like parts or members",3),
    (51,"Too","in addition; also; furthermore; moreover",5),
    (52,"also","in addition; too; besides; as well",5),
    (53,"To","used for expressing motion or direction toward a point, person, place, or thing",4),
    (54,"toward","in the direction of",4)
;

insert into synonyms values
	(1,2),--
    (2,1),
    (3,4),
    (4,3),
    (5,6),--
    (6,5),
    (7,8),
    (8,7),
    (9,10),--
    (10,9),
    (11,12),
    (12,11),
    (13,14),--
    (14,13),
    (15,16),
    (16,15),
    (17,18),--
    (18,17),
    (19,20),
    (20,19),
    (21,22),--
    (22,21),
    (23,24),
    (24,23),
    (25,26),--
    (26,25),
    (27,28),
    (28,27),
	(29,30),--
    (30,29),
    (31,32),
    (32,31),
    (33,34),--
    (34,33),
    (35,36),
    (36,35),
    (37,38),--
    (38,37),
    (39,40),
    (40,39),
    (41,42),--
    (42,41),
    (43,44),
    (44,43),
    (45,46),--
    (46,45),
    (47,48),
    (48,47),
    (49,50),--
    (50,49),
    (51,52),
    (52,51),
    (53,54),
    (54,53)
;

insert into phonesthetics values
	(1,3),--
    (3,1),
    (5,7),--
    (7,5),
    (9,11),--
    (11,9),
    (13,15),--
    (15,13),
    (17,19),--
    (19,17),
    (21,23),--
    (23,21),
    (25,27),--
    (27,25),
    (29,31),--
    (31,29),
    (33,35),--
    (35,33),
    (37,39),--
    (39,37),
    (41,43),--
    (43,41),
    (45,47),--
    (47,45),
    (49,51),--
    (49,53),
    (51,49),
    (51,53),
    (53,49),
    (53,51)
;

-- here we connect all the words in the databaes with their synonyms with their word types
select word.word, word.defenition, WORD_type.word_type as "word type",
w.word as "synonym", w.defenition as "synonym defenition",t.word_type "as word type" from word
join WORD_type on word.word_type = WORD_type.type_ID
join synonyms s on word.word_ID = s.W_ID
join word w on s.Syn_ID = w.word_ID
join WORD_type t on w.word_type = t.type_ID;

-- here we connect all the words in the databaes with their homophones with their word types
select word.word, word.defenition, WORD_type.word_type as "word type",
w.word as "homophone", w.defenition as "homophone defenition", t.word_type as "word type" from word
join WORD_type on word.word_type = WORD_type.type_ID
join phonesthetics p on word.word_ID = p.W1_ID
join word w on p.W2_ID = w.word_ID
join WORD_type t on w.word_type = t.type_ID
order by word.word_ID asc;

-- we get all the word that stored in the database
select count(word_ID) as "number of words" from WORD;

-- to get the the number count of the homophones for a specific word
select word.word as Word, count(w.word_ID) as "number of homohones" from word
join phonesthetics p on word.word_ID = p.W1_ID
join word w on p.W2_ID = w.word_ID
where word.word = "To";

-- to get the the number count of the synonym for a specific word
select word.word as Word, count(w.word_ID) as "number of synonym" from word
join synonyms s on word.word_ID = s.W_ID
join word w on s.Syn_ID = w.word_ID
where word.word = "Fare";



