--liquibase formatted sql

--changeset anair:dev_values context:dev
insert into config_values values ('devkey1', 'devval1');
insert into config_values values ('devkey2', 'devval2');
-----------
--changeset anair:prod_values context:prod
insert into config_values values ('prodkey1', 'prodval1');
insert into config_values values ('prodkey2', 'prodval2');
-----------
--changeset anair:qa_values context:qa
insert into config_values values ('qakey1', 'qaval1');
insert into config_values values ('qakey2', 'qaval2');
-----------
