-- добавим название жанров
INSERT INTO genre (name)
VALUES 
	('Rock'),
	('Rap'),
	('Pop');

-- добавим исполнителей
INSERT INTO performer (name)
VALUES
	('Linkin park'),
	('2Pac'),
	('50 Cent'),
	('Michael Jackson');

-- добавим связь жанр\исполнитель
INSERT INTO artist_genre (genre_id, performer_id)
VALUES
	(1, 1),
	(2, 2),
	(2, 3),
	(3, 4);

-- добавим альбомы
INSERT INTO album (name, year_of_issue) 
VALUES 
	('Meteora', '2003-03-25'),
	('Strictly 4 My N.I.G.G.A.Z.', '1993-02-16'),
	('Get Rich or Die Tryin', '2003-02-6');

-- добавим связь альбом\исполнитель
INSERT INTO album_artist (album_id, performer_id)
VALUES
	(1, 1),
	(2, 2), 
	(3, 3);

-- добавим треки, связь альбом\название трека, длительность в секундах 
INSERT INTO track (album_id, name, duration_sec)
VALUES
	(1, 'Somewhere I Belong', 188),
	(1, 'Lying from You', 175), 
	(1, 'Faint', 162),
	(1, 'Figure.09', 198),
	(2, 'Holler If Ya Hear Me', 278),
	(2, 'Point the Finga', 265),
	(2, 'Something 2 Die 4', 163),
	(2, 'Last Wordz', 216),
	(3, 'What Up Gangsta', 179),
	(3, 'Patiently Waiting', 288),
	(3, 'Many Men', 256),
	(3, 'In da Club', 193),
	(3, 'High All the Time', 269),
	(3, 'Heat', 254)
	(3, 'Like My Style', 193);

--	добавим сборники
INSERT INTO compilation (name, year_of_issue)
VALUES
	('Бездна 1', '2017-07-18'),
	('Бездна 2', '2018-06-12'),
	('Бездна 3', '2019-03-15'),
	('Бездна 4', '2021-10-02');

-- добавим связь сборник\ трек
INSERT INTO compilation_tracks (compilation_id, track_id)
VALUES
	(1, 1),
	(1, 3),
	(1, 9),
	(1, 11),
	(1, 2),
	(2, 2),
	(2, 7),
	(2, 12),
	(2, 14),
	(3, 1),
	(3, 4),
	(3, 13),
	(3, 10),
	(4, 5),
	(4, 6),
	(4, 8),
	(4, 9);
	