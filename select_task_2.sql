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

-- Количество исполнителей в каждом жанре
SELECT name, count(genre_id) FROM genre 
JOIN artist_genre ON artist_genre.genre_id = genre.id 
GROUP BY genre."name" 

-- Количество треков, вошедших в альбомы 2019–2020 годов
SELECT count(t.id), a.name, a.year_of_issue  FROM track t
JOIN album a ON a.id = t.album_id 
WHERE a.year_of_issue BETWEEN '2019-01-01' AND '2020-12-31'
GROUP BY a.year_of_issue, a.name  

--Средняя продолжительность треков по каждому альбому
SELECT avg(duration_sec), a."name"  FROM track t 
JOIN album a ON a.id = t.album_id 
GROUP BY a."name" 

--Все исполнители, которые не выпустили альбомы в 2020 году
SELECT p.name, a.year_of_issue  FROM performer p 
JOIN album_artist aa ON aa.performer_id = p.id
	JOIN album a ON aa.album_id = a.id 
WHERE a.year_of_issue NOT BETWEEN '2020-01-01' AND '2020-12-31'

--Названия сборников, в которых присутствует конкретный исполнитель (выберите его сами)
SELECT DISTINCT  c.name  FROM compilation c
JOIN compilation_tracks ct ON c.id = ct.compilation_id
	JOIN track t ON ct.track_id = t.id 
		JOIN album a ON t.album_id = a.id 
			JOIN album_artist aa ON aa.album_id = a.id 
				JOIN performer p ON aa.performer_id = p.id 
WHERE p.name ILIKE '2Pac'