--liquibase formatted sql

--changeset anair:alter_movie_table
--alter table movie drop CONSTRAINT actor_fk; 
alter table movie drop column actor_id;
------------------------------

--changeset anair:create_movie_actor_rlship_table
create table movie_actor (
    id number not null,
    movie_id number not null,
    actor_id number not null,
    CONSTRAINT "movie_actor_pk" PRIMARY KEY (ID),
    CONSTRAINT "movie_fk" FOREIGN KEY (movie_id)  REFERENCES movie (id),
    CONSTRAINT "actor_fk" FOREIGN KEY (actor_id)  REFERENCES actor (id)
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON movie_actor to ${APP_USER};
GRANT SELECT ON movie_actor to ${RO_USER};

--rollback drop table movie_actor cascade constraints purge;

--changeset anair:movie_actor_uk1
CREATE UNIQUE INDEX movie_actor_uk1 ON movie_actor (movie_id, actor_id) 
TABLESPACE ${TABLESPACE};

--rollback drop index movie_actor_uk1;
-------------------------------------------------

----changeset anair:actor_insert
insert into actor values(1, 'Matt Damon');
insert into actor values(2, 'Meryl Streep');
insert into actor values(3, 'Tom Hanks');

----changeset anair:genre_insert
insert into genre values(1, 'Comedy');
insert into genre values(2, 'Sci-Fi');
insert into genre values(3, 'Action');

----changeset anair:director_insert
insert into director values(1, 'Steven Spielberg');
insert into director values(2, 'Doug Liman');
insert into director values(3, 'Martin Scorsese');
