--liquibase formatted sql

--changeset anair:movie_insert
insert into movie (id, title, description, duration, release_date, genre_id, director_id) values(1, 'Bourne Identity', 'Bourne Series 1', 300, sysdate-100, 3, 2);
insert into movie (id, title, description, duration, release_date, genre_id, director_id) values(2, 'Saving Private Ryan', 'Oscar winner', 300, sysdate-300, 3, 1);

--changeset anair:movie_actor_insert
insert into movie_actor values(1, 1, 1);
insert into movie_actor values(2, 1, 3);
