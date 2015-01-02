--liquibase formatted sql

--changeset anair:create_config_values_table
create table config_values (
    config_key varchar(255) not null primary key,
    string_value varchar(4000) not null
)
TABLESPACE ${TABLESPACE}
LOGGING;

GRANT SELECT,UPDATE,INSERT,DELETE ON config_values to ${APP_USER};
GRANT SELECT ON config_values to ${RO_USER};
