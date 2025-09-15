select * from autism_children_dataset;
select count(*) from autism_children_dataset; 
DELETE FROM autism_children_dataset WHERE ethnicity = '?' OR relation = '?'; 
select count(*) from autism_children_dataset; 
alter table autism_children_dataset change column jundice jaundice varchar(100);
alter table autism_children_dataset change column austim autism varchar(10);
select * from autism_children_dataset;

select result,autism, case when `class/asd`='yes' then 'predicted as autism'
else 'not autism' end as prediction from autism_children_dataset order by result desc;

select autism,contry_of_res,count(contry_of_res) as total_count from autism_children_dataset
 group by contry_of_res,autism order by contry_of_res,count(contry_of_res) asc; 
 
SELECT CASE WHEN `class/asd` = autism THEN 'correct' ELSE 'wrong' END AS prediction_status,COUNT(*) AS count 
FROM autism_children_dataset
GROUP BY prediction_status;
 
select result,`class/asd`,count(*) as countall from autism_children_dataset where result>=5 and `class/asd` ='no'
 group by result,`class/asd`;

select autism,gender,count(*) as count_gender from autism_children_dataset group by gender,autism;

select jaundice, autism,count(*) as comparison_between from autism_children_dataset group by jaundice,autism;

select age,autism,count(*) from autism_children_dataset group by age,autism order by age;

SHOW COLUMNS FROM autism_children_dataset;

SELECT jaundice,autism,COUNT(*) AS count_combination,(SELECT COUNT(*) FROM autism_children_dataset 
AS sub WHERE sub.autism = main.autism) AS total_per_autism
FROM autism_children_dataset AS main
GROUP BY jaundice, autism;