use ig_clone;
show tables;
-- Q1.Create an ER diagram or draw a schema for the given database.(ill done just shown diagram)
-- Q2.We want to reward the user who has been around the longest, Find the 5 oldest users.
select id , username from users
order by created_at
limit 5 ;
-- Q3.To target inactive users in an email ad campaign, find the users who have never posted a photo.
select * from photos;
select * from photo_tags;
select * from tags;
select * from follows;
select * from likes;
select * from comments;
select id,username from users
where id not in ( select user_id from photos);

-- Q4.Suppose you are running a contest to find out who got the most likes on a photo. 
-- Find out who won?
select likes.user_id , count(*) from users inner join likes on users.id = likes.user_id 
group by likes.user_id 
order by count(*) desc;

-- Q5.The investors want to know how many times does the average user post.

select users.id, avg(photos.image_url) AVGE from users inner join photos on users.id = photos.user_id 
group by photos.user_id 
order by count(*) 
limit 1;

--
select avg(a) average_user_post from (select count(*) a from photos group by user_id )a1;

-- Q6.. A brand wants to know which hashtag to use on a post, and find the top 5 most used hashtags.
select comment_text , count(*) from comments
group by comment_text
order by count(*) desc
limit 5;

select * from tags;
-- 
-- Q7.. To find out if there are bots, find users who have liked every single photo on the site.
select distinct  photos;
select distinct  photo_id from likes;
select * from users 
where id in (select distinct  user_id from photos 
where  id in (select distinct  photo_id from likes));

 -- Q8..Find the users who have created instagramid in may and select top 5 newest joinees from it?
select * from users
where created_at like '____-05%'
order by created_at desc
limit 5 ;
-- 
-- Q9.. Can you help me find the users whose name starts with c and ends 
-- with any number and have posted the photos as well as liked the photos?

select * from users 
where id in (select distinct  user_id from photos 
where  id in (select distinct  photo_id from likes))
and username like 'c%';

-- Q10 . Demonstrate the top 30 usernames to the company who have posted photos in the range of 3 to 5.
select * from users;
select * from photos ;
select username , count(user_id ) Images from users join photos on users.id = photos.user_id
group by user_id having Images in (3,4,5 ) order by Images Desc limit 30;