drop database if exists school;
create database school;
use school;

#
# TABLE STRUCTURE FOR: users
#

DROP TABLE IF EXISTS users;
CREATE TABLE users (
  id varchar(255) NOT NULL,
  `role` varchar(20) NOT null,
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: lessons
#

DROP TABLE IF EXISTS lessons;

CREATE TABLE lessons (
  id varchar(255) NOT NULL,
  event_id int(5) unsigned NOT NULL,
  subject varchar(255) NOT NULL,
  scheduled_time datetime NOT null,
  primary key (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: participants
#

DROP TABLE IF EXISTS participants;

CREATE TABLE participants (
  event_id int(5) NOT NULL,
  user_id varchar(255) NOT null,
  foreign key (user_id) references users(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# TABLE STRUCTURE FOR: quality
#

DROP TABLE IF EXISTS quality;

CREATE table quality (
  lesson_id varchar(255) NOT NULL,
  tech_quality varchar(255) NOT null,
  foreign key (lesson_id) references lessons(id) 
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


