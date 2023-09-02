/* 
Número de empregados por departamento e localidade 
Lista de departamentos e seus gerentes 
Projetos com maior número de empregados (ex: por ordenação desc) 
Lista de projetos, departamentos e gerentes 
Quais empregados possuem dependentes e se são gerentes */

use company_constraints2;

select count(Ssn) as Qtt_de_funcionarios, Dname as Departamento, Dlocation as Cidade 
from employee
inner join department as d on 
Dno = d.Dnumber 
inner join dept_locations as dl on dl.Dnumber = d.Dnumber
group by Dname,Dlocation;

-- query apresenta um erro de multiplicação cartesiana, pelo fato da localidadde nãi tem uma chave unica, que se liga a employee
-- solução, modificar endereços no employee, criar uma foreign key na tabela employee com a tabela dept_loclidade


SELECT
    COUNT(DISTINCT e.Ssn) as Qtt_de_funcionarios,
    d.Dname as Departamento,
    Dlocation as Cidade
FROM project p
INNER JOIN dept_locations dl ON p.Plocation = dl.Dlocation
INNER JOIN (
    SELECT DISTINCT Dnumber, Dname
    FROM department
) d ON dl.Dnumber = d.Dnumber
INNER JOIN employee e ON d.Dnumber = e.Dno
GROUP BY d.Dname, plocation;


-- -----------------------------------------------------------------
select Fname,Minit,Lname,Dname from employee 
inner join department on Dno = Dnumber
where Super_ssn is null;

-- ---------------------------------------------------------;
select * from project;

select * from employee;
select * from department;
select * from dept_locations;


INSERT INTO employee (dp_localidade) VALUES ('5 Houston'),('1 Houston'),('5 Sugarland'),('5 Bellaire'),('1 Houston'),('4 Stafford'),('4 Stafford'),('1 Houston');
    




