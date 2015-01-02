--liquibase formatted sql

--changeset anair:create_genre_table
create table genre (
    id number not null,
    name varchar(100) not null,
    CONSTRAINT "genre_pk" PRIMARY KEY (ID)
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON genre to ${APP_USER};
GRANT SELECT ON genre to ${RO_USER};

--rollback drop table genre cascade constraints purge;

--changeset anair:genre_uk1
CREATE UNIQUE INDEX genre_uk1 ON genre (name) 
TABLESPACE ${TABLESPACE}

--rollback drop index genre_uk1;
-------------------------------------------------

--changeset anair:create_director_table
create table director (
    id number not null,
    name varchar(100) not null,
    CONSTRAINT "director_pk" PRIMARY KEY (ID)
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON director to ${APP_USER};
GRANT SELECT ON director to ${RO_USER};

--rollback drop table director cascade constraints purge;

--changeset anair:director_uk1
CREATE UNIQUE INDEX director_uk1 ON director (name) 
TABLESPACE ${TABLESPACE}

--rollback drop index director_uk1;
-------------------------------------------------

--changeset anair:create_actor_table
create table actor (
    id number not null,
    name varchar(100) not null,
    CONSTRAINT "actor_pk" PRIMARY KEY (ID)
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON actor to ${APP_USER};
GRANT SELECT ON actor to ${RO_USER};

--rollback drop table actor cascade constraints purge;

--changeset anair:actor_uk1
CREATE UNIQUE INDEX actor_uk1 ON actor (name) 
TABLESPACE ${TABLESPACE}

--rollback drop index actor_uk1;
-------------------------------------------------

--changeset anair:create_movie_table
create table movie (
    id number not null,
    title varchar(250) not null,
    description varchar(4000) null,
    duration integer null,
    release_date date null,
    genre_id number not null,
    director_id number not null,
    actor_id number not null,
    created_ts timestamp default systimestamp not null,
    CONSTRAINT "movie_pk" PRIMARY KEY (ID),
    CONSTRAINT "genre_fk" FOREIGN KEY (genre_id)  REFERENCES genre (id),
    CONSTRAINT "director_fk" FOREIGN KEY (director_id)  REFERENCES director (id),
    CONSTRAINT "actor_fk" FOREIGN KEY (actor_id)  REFERENCES actor (id)
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON movie to ${APP_USER};
GRANT SELECT ON movie to ${RO_USER};

--rollback drop table movie cascade constraints purge;

--changeset anair:movie_uk1
CREATE UNIQUE INDEX MOVIE_UK1 ON MOVIE (title, created_ts) 
TABLESPACE ${TABLESPACE}

--rollback drop index MOVIE_UK1;