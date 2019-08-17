create user root with password 'root';
create user crm with password 'crm';
create user reader with password 'reader';
create user dataroot with password 'dataroot';
create user locations with password 'locations';

create database crm template template0 owner root
  encoding 'utf8'
  lc_collate = 'en_US.UTF-8'
  lc_ctype = 'en_US.UTF-8';

\connect crm

grant connect on database crm to crm;
grant connect on database crm to reader;
grant connect on database crm to dataroot;
grant connect on database crm to locations;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO root;
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO crm;

