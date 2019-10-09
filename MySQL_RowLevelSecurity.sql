/*
A similar concept as virtual private database or fine-grain access control in Oracle

I find no exactly similar powerful implementation in MySQL for security policies or data masking like the VPD/Fine-Grain access control in Oracle. But there is still use cases that MySQL could implement row level access control for various users.

In this repository, a simple example of MySQL implementing row level access control is presented.
*/

-- create table with extra column storing the record owner/viewer/role
create table books(book_id int auto_increment not null,
book_title  varchar(500),
owner       varchar(100));

-- create view for certain user to see the books belong to that user
create view user_books(title)
as select books.book_title as title
   from books
   where books.owner = substring_index(user(),'@',1);

-- grant permission to users to access the view
grant select on table user_books to 'john'@'%';
grant select on table user_books to 'mary'@'%';
       
