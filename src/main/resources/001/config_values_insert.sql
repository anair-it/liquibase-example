--liquibase formatted sql

--changeset anair:adding_config_values_1
insert into config_values values ('key1', 'val1');
insert into config_values values ('key2', 'val2');
-----------
