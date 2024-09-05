-- 1. Afficher toutes les informations concernant les départements
select * from department;
-- Pour les id
select id from department;
-- pour les nom
select name from department;
-- Pour les region_id
select region_id from department;

-- 2. Afficher le nom, la date d'embauche, le numéro du supérieur, le numéro de
-- département et le salaire de tous les employés.

-- le nom
select last_name as "nom" from employee;

-- date d'embauche
select hiring_date as "date d'embauche" from employee;

-- numéro du supérieur
select superior_id as "numéro du supérieur" from employee;

-- numéro de département
select department_id as "numéro de département" from employee;

-- salaire
select salary as "salaire" from employee;

-- 3. Afficher le titre de tous les employé.e.s
select distinct title from employee;

-- 4. Afficher les différentes valeurs des titres des employés
select title from employee;

-- 5. Afficher toutes les informations des salariés ayant un salaire supérieur à
-- 25000.
select * from employee where salary > 25000;

-- 6. Afficher le nom, le numéro d'employé et le numéro du département des
-- employés dont le titre est « Secrétaire ».
select last_name, id, department_id from employee  where title = 'secrétaire';

-- 7. Afficher le nom et le numéro de département dont le numéro de
-- département est supérieur à 40.
select department_id from employee where department_id > 40;

select  name department_id from department where region_id > 40;

-- 8. Afficher le nom et le prénom des employés dont le nom est alphabétiquement
-- antérieur au prénom.
select last_name, first_name from employee where last_name < first_name;

-- 9. Afficher le nom, le salaire et le numéro du département des employés dont le
-- titre est « Représentant », le numéro de département est 35 et le salaire est
-- supérieur à 20000

select last_name, salary, department_id from employee where title = 'représentant' and department_id = 35 and salary > 20000;

-- 10.Afficher le nom, le titre et le salaire des employés dont le titre est «
-- Représentant » ou dont le titre est « Président ».
select last_name, title, salary from employee where title = 'représentant' or title = 'président';


-- 11. Afficher le nom, le titre, le numéro de département, le salaire des employés du
-- département 34, dont le titre est « Représentant » ou « Secrétaire ».
select last_name, title, department_id, salary from employee where department_id = 34 and (title = 'représentant' or title = 'secrétaire');

-- 12. Afficher le nom, le titre, le numéro de département, le salaire des employés
-- dont le titre est Représentant, ou dont le titre est « Secrétaire » dans le
-- département numéro 34.
select last_name, title, department_id, salary from employee where title

-- 13. Afficher le nom, et le salaire des employés dont le salaire est compris
-- entre 20000 et 30000.
select last_name, salary from employee where salary between 20000 and 30000;

-- 14.Afficher le nom des employés commençant par la lettre « H ».
select last_name from employee where last_name like 'h%';

-- 15.Afficher le nom des employés se terminant par la lettre « n »
select last_name from employee where last_name like '%n';

-- 16.Afficher le nom des employés contenant la lettre « u » en 3ème
-- position.
select last_name from employee where last_name like '__u%';

-- 17.Afficher le salaire et le nom des employés du service 41 classés par salaire
-- croissant.
select salary, last_name from employee where department_id = 41 order by salary asc;

-- 18.Afficher le salaire et le nom des employés du service 41 classés par salaire
-- décroissant.
select salary, last_name from employee where department_id = 41 order by salary desc;

-- 19.Afficher le titre, le salaire et le nom des employés classés par titre croissant et
-- par salaire décroissant.
select title, salary, last_name from employee order by title asc, salary desc;

-- 20.Afficher le taux de commission, le salaire et le nom des employés classés par
-- taux de commission croissante.
select commission_rate, salary, last_name from employee order by commission_rate asc;

-- 21.Afficher le nom, le salaire, le taux de commission et le titre des employés dont
-- le taux de commission n'est pas renseigné.
select commission_rate, salary, last_name, title from employee where commission_rate is null;

-- 22.Afficher le nom, le salaire, le taux de commission et le titre des employés dont
-- le taux de commission est renseigné.
select commission_rate, salary, last_name, title from employee where commission_rate is not null;

-- 23.Afficher le nom, le salaire, le taux de commission, le titre des employés dont le
-- taux de commission est inférieur à 15.
select last_name,salary, commission_rate, title from employee where commission_rate < 15;

-- 24.Afficher le nom, le salaire, le taux de commission, le titre des employés dont le
-- taux de commission est supérieur à 15.
select last_name,salary, commission_rate, title from employee where commission_rate > 15;

-- 25.Afficher le nom, le salaire, le taux de commission et la commission des
-- employés dont le taux de commission n'est pas nul. (la commission est
-- calculée en multipliant le salaire par le taux de commission).
select last_name,salary, commission_rate, salary*commission_rate/100 title from employee where commission_rate is not null;

-- 26.Afficher le nom, le salaire, le taux de commission, la commission des
-- employés dont le taux de commission n'est pas nul, classé par taux de
-- commission croissant.
select last_name,salary, commission_rate, salary*commission_rate/100 title from employee where commission_rate is not null order by commission_rate asc;

-- 27.Afficher le nom et le prénom (concaténés) des employés. Renommer les
-- colonnes.
select concat('nom', 'prenom') as NomPrénom;

-- 28.Afficher les 5 premières lettres du nom des employés
select substring(last_name, 1,5) from employee;

-- 29.Afficher le nom et le rang de la lettre « r » dans le nom des
-- employés.
select last_name, position('r' in last_name) from employee;


-- Afficher le nom, le nom en majuscule et le nom en minuscule de
-- l'employé dont le nom est « Vrante ».
select upper(last_name), lower(last_name) from employee where last_name like 'vrante';

-- 31.Afficher le nom et le nombre de caractères du nom des employés
select last_name, length(last_name) from employee;