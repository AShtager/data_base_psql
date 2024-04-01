-- Название и продолжительность самого длительного трека
SELECT name, duration_sec  FROM track 
WHERE duration_sec = (
	SELECT MAX(duration_sec) FROM track t  
);

-- Название треков, продолжительность которых не менее 3,5 минут
SELECT name FROM track
WHERE duration_sec >= 210;

-- Названия сборников, вышедших в период с 2018 по 2020 год включительно
SELECT name  FROM compilation  
WHERE year_of_issue BETWEEN  '2018-01-01' AND '2020-12-31';

-- Исполнители, чьё имя состоит из одного слова
SELECT name  FROM performer 
WHERE "name" NOT ILIKE '% %';

-- Название треков, которые содержат слово «мой» или «my»
SELECT name FROM track 
WHERE name ILIKE '%my%' OR name ILIKE '%мой%';