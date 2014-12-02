-- query to find a users permissions.
select * 
from information_schema.role_table_grants 
where grantee='your user';
