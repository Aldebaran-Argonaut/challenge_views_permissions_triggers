/* Remoção:  
Usuários podem excluir suas contas por algum motivo. Dessa forma, 
para não perder as informações sobre estes usuários, crie um gatilho before remove */

use ecommerce;

-- create table to backup od deletes
Create table backup_clients (
		backup_clients_id int primary KEY auto_increment,
        idClient int,
        Fname varchar(30),
        Minit varchar(3),
        Lname varchar(30),
        Address varchar (200),
        Birth datetime)
;        
delimiter //

-- Create a trigger that pass de deletes clients to table backup
create trigger before_delete_clients
before delete on Clients
for each row
begin
	insert into backup_clients(idclient,Fname,Minit,Lname,Address,Birth)
    values (old.idClient,old.Fname,old.Minit,old.Lname,old.Address,old.Birth);
end;
// 
delimiter ;


-- teste trigger
delete from clients where idClient = 1;

/* Atualização:  
-- Inserção de novos colaboradores e atualização do salário base. */

use company_constraints2;

-- create a trigger to increase de salary of new employees at dapartment 5 
delimiter //
create trigger depart_salary_increase_insert
before insert on employee
for each row
begin
	if new.Dno = 5 then
		SET new.salary = new.salary * 1.2;
	end if;
end;
//
delimiter ;
