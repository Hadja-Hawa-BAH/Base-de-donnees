-- 1. Affichage de tous les employés et leur département (requête ci-dessus)
select * from employee e join department d on e.department_id = d.id; 

-- 2. Rechercher le numéro du département, le nom du département, le nom des
-- employés classés par numéro de département (utilisez des alias pour les
-- tables).
select e.department_id, d.name, e.last_name from employee e join department d on e.department_id = e.department_id;

-- 3. Rechercher le nom des employés du département « Distribution ».
select e.last_name from employee e join department d on e.department_id = d.id where d."name" = 'distribution';

-- 4. Rechercher le nom et le salaire des employés qui gagnent plus que leur
-- supérieur hiérarchique, et le nom et le salaire du supérieur.
select e1.last_name, e1.salary,
e2.last_name, e2.salary from employee e1 join employee e2 on e1.superior_id = e2.id
where e1.salary > e2.salary;


-- Rechercher les employés du département « finance » en utilisant une sousrequête.
select last_name from employee where department_id
in (select id from department where name like 'finance');

-- Rechercher le nom et le titre des employés qui ont le même titre que
-- « Amartakaldire »
select last_name, title from employee where title 
in (select title from employee where last_name like 'amartakaldire');


-- Rechercher le nom, le salaire et le numéro de département des employés qui
-- gagnent plus qu'un seul employé du département 31, classés par numéro de
-- département et salaire.
select last_name, salary, department_id 
from employee where salary > any (select salary from employee where department_id = 31)
and department_id != 31
order by department_id, salary;

-- Rechercher le nom, le salaire et le numéro de département des employés qui
-- gagnent plus que tous les employés du département 31, classés par numéro
-- de département et salaire.
select last_name, salary, department_id 
from employee where salary > all (select salary from employee where department_id = 31)
and department_id != 31
order by department_id, salary;

-- 9. Rechercher le nom et le titre des employés du service 31 qui ont un titre que
-- l'on trouve dans le département 32.
select last_name, title from employee where department_id = 31 and title in (select title from employee where department_id = 32);

-- 10.Rechercher le nom et le titre des employés du service 31 qui ont un titre que
-- l'on ne trouve pas dans le département 32.
select last_name, title from employee where department_id = 31 and title not in (select title from employee where department_id = 32);

-- 11.Rechercher le nom, le titre et le salaire des employés qui ont le même
-- titre et le même salaire que « Fairant ».
select last_name, title, salary from employee where title = all (select title from employee where last_name = 'fairant')
and salary = all (select salary from employee where last_name = 'fairent');

-- 12.Rechercher le numéro de département, le nom du département, le nom des
-- employés, en affichant aussi les départements dans lesquels il n'y a personne,
-- classés par numéro de département. le left join et le right join sont utilisés par rapport à la table à laquelle il manque d'info. 
SELECT d.id, d."name", e.last_name from department d left join employee e on d.id = e.department_id 
order by d.id;

-- 13.Calculer la moyenne des salaires des secrétaires (requête fournie ci-dessous)
SELECT AVG(salary) FROM employee WHERE title LIKE 'secrétaire';

--  rechercher le nom et le salaire des employés dont le salaire est le plus grand.
SELECT last_name, salary
FROM employee
WHERE salary = (SELECT MAX(salary) FROM employee);

-- rechercher la moyenne des salaires de chaque département 
SELECT department_id
FROM employee
GROUP BY department_id;

-- 14.Calculer le nombre d’employé de chaque titre.
SELECT count(title) 
FROM employee
GROUP by title;

-- 15.Calculer la moyenne des salaires et leur somme, par région.
select d.region_id, avg(salary), sum(salary) from employee e
join department d on d.region_id = e.id 
group by d.region_id;

-- rechercher les titres et le nombre d'employés pour les titres représentés plus de 2
-- fois
SELECT title, COUNT(*) FROM employee GROUP BY title HAVING count(*) > 2;

-- 16.Afficher les numéros des départements ayant au moins 3 employés
select department_id, count(*) from employee group by department_id having count(*) >=3;

-- 18.Rechercher le salaire maximum et le salaire minimum parmi tous les
-- salariés et l'écart entre les deux.
select max(salary), min(salary), (max(salary)- min(salary)) as "ecart de salaires"
from employee;

-- 19.Rechercher le nombre de titres différents.
select count(distinct title) from employee; 

-- 20.Pour chaque titre, compter le nombre d'employés possédant ce titre.
select title, count(*) from employee group by title;

-- 21.Pour chaque nom de département, afficher le nom du département et
-- le nombre d'employés.
select d.name, count(*) from employee e join department d on e.department_id = d.id  group by  d."name";

-- 22.Rechercher les titres et la moyenne des salaires par titre dont la
-- moyenne est supérieure à la moyenne des salaires des « Représentant »
select title, avg(salary) as "moyenne" from employee group by title
having avg(salary) > (select avg(salary) from employee where title =  'représentant');

-- 23. Rechercher le nombre de salaires renseignés et le nombre de taux de
-- commission renseignés.
select salary, commission_rate, count(*) from employee group by salary, commission_rate;

