create database project;

use project;

create table user(
    id int,
    name varchar(40),
    primary key(id));

create table project(
    id int,
    name varchar(45),
    primary key(id));

 create table project_has_user(
    project_id int,
    user_id int,
    manager tinyint(1),
    foreign key(project_id) references project(id),
    foreign key(user_id) references user(id));

create table bug(
    id int,
    project_id int,
    name varchar(45),
    primary key(id),
    foreign key(project_id) references project(id));

 create table media(
    id int,
    user_id int,
    path varchar(70),
    filetype varchar(20),
    filesize decimal(65,2),
    primary key(id),
    foreign key(user_id) references user(id));

 create table comment(
    id int,
    bug_project_id int,
    bug_id int,
    text text,
    primary key(id),
    foreign key(bug_project_id) references bug(project_id),
    foreign key(bug_id) references bug(id));

create table bug_has_media(
    bug_id int,
    bug_project_id int,
    media_id int,
    foreign key(bug_id) references bug(id),
    foreign key(bug_project_id) references bug(project_id),
    foreign key(media_id) references media(id));

create table comment_has_media(
    comment_id int,
    comment_bug_project_id int,
    comment_bug_id int,
    media_id int,
    foreign key(comment_id) references comment(id),
    foreign key(comment_bug_project_id) references comment(bug_project_id),
    foreign key(comment_bug_id) references comment(bug_id),
    foreign key(media_id) references media(id));

alter table user
    add
    media_id int;

 alter table user
    add foreign key(media_id) references media(id);

insert into user(id,name) values (1,"Shady");

insert into media(id,path,filetype,filesize) values (1,"path","filetype",65.65);

insert into media(id,user_id,path,filetype,filesize) values (2,1,"path","filetype",65.65);

insert into user(id,name,media_id) values (2,"Shady",2);

 insert into project(id,name) values
    (1, "P1"),
    (2, "P2");

insert into project_has_user(project_id,user_id,manager) values
    (2,1,1),
    (1,2,2);

insert into bug(id,project_id,name) values
    (1,2,"B1"),
    (2,1,"B2");

insert into bug_has_media(bug_id,bug_project_id,media_id) values
    (1,2,1),
    (2,1,2);

insert into comment(id,bug_project_id,bug_id,text) values
    (1,2,1,"Text"),
    (2,1,2,"Text1");

insert into comment_has_media(comment_id,comment_bug_project_id,comment_bug_id,media_id) values
    (1,2,1,2),
    (2,1,2,1);