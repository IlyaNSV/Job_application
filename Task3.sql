/*1. Найти все уроки по физике (subject=phys).*/
select * from lessons where subject='phys';

/*2. В каждый день (начало и конец дня считается по московскому времени, то есть UTC+3:00) 
для каждого репетитора посчитать среднюю арифметическую оценку за его уроки (учитывать только уроки из п. 1).*/
create view average as
select day(scheduled_time) as 'day_num', users.id as 'tutor_id', avg(tech_quality) as 'average_mark'
from users join participants on users.id=participants.user_id
join lessons on participants.event_id=lessons.event_id
join quality on lessons.id = quality.lesson_id
where `role` = 'tutor' and subject = 'phys'
group by day_num,tutor_id 
order by day_num;

/*создадим процедуру, чтобы смотреть у кого минимальный балл в выбранный нами день*/
delimiter //
create procedure min_avg (d int) 
begin 
	select  * from average 
	where  day_num = d 
	order by average_mark asc 
	limit 1 ;
end // 
	
call min_avg(11) 
