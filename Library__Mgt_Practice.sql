create database Library_Mgt_DB;
use Library_Mgt_DB;
select database();


#CREATE TABLE - Publisher
create table Publisher
		      (name varchar (40),
               address varchar(30),
               phone int);
show tables;
desc Publisher;

#ADD PRIMARY KEY CONSTRAINT
alter table Publisher
add primary key(name);
desc Publisher;

#CHANGE DATATYPE OF ATTRIBUTE
alter table Publisher
change phone phone bigint;
desc Publisher;

#ADD NOT NULL CONSTRAINT (ADDRESS) 
alter table Publisher
change address address varchar(30) not null;

#ADD NOT NULL CONSTRAINT (PHONE) 
alter table Publisher
change phone phone bigint not null;
desc Publisher;


#CREATE TABLE - Book
create table Book
             ( book_id int primary key,
              title varchar(40),
              pub_year varchar(20),
              publisher_name varchar(40));
              
show tables;
desc Book;

#ADD FOREIGN KEY CONSTRAINT
alter table book add foreign key (publisher_name) references Publisher(name) on delete cascade;
desc Book;


#CREATE TABLE - Book_Authors
create table Book_Authors
             (book_id int,
             author_name varchar(30),
             primary key(book_id,author_name),
             foreign key(book_id) references Book(book_id) on delete cascade);
             
show tables;
select * from book_authors;
desc Book_Authors;


#CREATE TABLE - Library_Branch
create table Library_Branch
                (branch_id int primary key,
                branch_name varchar (40),
                address varchar(30));

show tables;
desc Library_Branch;

#ADD UNIQUE CONSTRAINT AND NOT NULL CONSTRAINT SIMULTANEOUSLY ON branch_name
alter table Library_Branch
change branch_name branch_name varchar(40) not null unique;


#CREATE TABLE - Book_Copies
create table Book_Copies
			( book_id int,
             branch_id int,
             no_of_copies int,
             primary key(book_id, branch_id),
             foreign key(book_id) references Book(book_id) on delete cascade,
             foreign key(branch_id) references Library_Branch(branch_id) on delete cascade);
             
show tables;
desc Book_Copies;
 
 
 #ADD CHECK CONSTRAINT
 alter table Book_Copies add check (no_of_copies>0);
 
 
 #CREATE TABLE - Card
 create table Card
               (card_no int primary key);
               
show tables;
desc Card;


 #CREATE TABLE - Book_Lending
 create table Book_Lending
				  (book_id int,
                  branch_id int,
                  card_no int not null,
                  date_out date,
                  due_date date,
                  primary key(book_id, branch_id, card_no),
                  foreign key(book_id) references Book(book_id) on delete cascade,
                  foreign key(branch_id) references Library_Branch(branch_id) on delete cascade);
                  
show tables;
desc Book_Lending;


#TO INSERT RECORDS INTO PUBLISHER TABLE
insert into Publisher values ('Mcgraw-Hill', 'Bangalore', 9989076587);
insert into Publisher values ('Pearson', 'NewDelhi', 9889076565);
insert into Publisher values ('Random House', 'Hyderabad', 7455679345);
insert into Publisher values ('Hachette Livre', 'Chennai', 8970862340);
insert into Publisher values ('Grupo Planeta', 'Bangalore', 7756120238);
insert into Publisher values ('Wiley India', 'New Delhi', 01143630000);
insert into Publisher values ('S Chand', 'Noida', 7291975264);
insert into Publisher values ('Technical Publications', 'Pune', 9763719464);
insert into Publisher values ('Nirali Prakashan', 'Pune', 02025512336);
insert into Publisher values ('Prakash Publication', 'Jalgaon', 9272514482);
insert into Publisher values ('Galgotia Publications', 'New Delhi', 01123263334);
select * from Publisher;


#TO INSERT RECORDS INTO BOOK TABLE
insert into book values (1,'DBMS','2017', 'Mcgraw-Hill');
insert into book values (2,'ADBMS','2016', 'Mcgraw-Hill');
insert into book values (3,'CN','2016', 'Pearson');
insert into book values (4,'CG','2015', 'Grupo Planeta');
insert into book values (5,'OS','2016', 'Pearson');
insert into book values (6,'CO','2008', 'Nirali Prakashan');
insert into book values (7,'CO','2005', 'Galgotia Publications');
insert into book values (8,'DBMS','2022', 'Technical Publications');
insert into book values (9,'DBMS for Distributed System','2022', 'Pearson');
select * from Book;

insert into book values (10,'Recent Trends in DBMS','2022', 'Vasant'); #ERROR 
select * from Book;


#TO INSERT RECORDS INTO BOOK_AUTHORS TABLE
insert into book_authors values (1, 'Navathe');
insert into book_authors values (2, 'Navathe');
insert into book_authors values (3, 'Tanenbaum');
insert into book_authors values (4, 'Edward Angel');
insert into book_authors values (5, 'Galvin');
insert into book_authors values (6, 'K. P. Adhiya');
insert into book_authors values (7, 'Navin Kumar');
insert into book_authors values (8, 'A. A. Puntambekar');
select * from Book_Authors;


#TO INSERT RECORDS INTO LIBRARY_BRANCH TABLE
insert into library_branch values (10,'RR Nagar','Bangalore');
insert into library_branch values (11,'RNSIT','Bangalore');
insert into library_branch values (12,'Rajaji Nagar', 'Bangalore');
insert into library_branch values (13,'NITTE','Mangalore');
insert into library_branch values (14,'Manipal','Udupi');
insert into library_branch values (15,'SSBT','Jalgaon');
insert into library_branch values (16,'SPIT','Mumbai');
select * from Library_Branch;


#TO INSERT RECORDS INTO BOOK_COPIES TABLE
insert into book_copies values (1, 10, 10);
insert into book_copies values (1, 11, 5);
insert into book_copies values (2, 12, 2);
insert into book_copies values (2, 13, 5);
insert into book_copies values (3, 14, 7);
insert into book_copies values (5, 10, 1);
insert into book_copies values (4, 11, 3);
insert into book_copies values (6, 15, 13);
insert into book_copies values (6, 16, 10);
select * from Book_Copies;


#TO INSERT RECORDS INTO CARD TABLE
insert into card values (100);
insert into card values (101);
insert into card values (102);
insert into card values (103);
insert into card values (104);
insert into card values (105);
select * from Card;


#TO INSERT RECORDS INTO BOOK_LENDING TABLE
insert into book_lending values (1, 10, 101, '2017-01-10', '2017-06-17'); 
insert into book_lending values (3, 14, 101, '2017-03-18', '2017-07-17'); 
insert into book_lending values (2, 13, 101, '2017-02-11', '2017-04-21'); 
insert into book_lending values (4, 11, 101, '2017-03-15', '2017-07-15'); 
insert into book_lending values (1, 11, 104, '2017-04-12', '2017-05-12');
select * from Book_Lending;


#QUERIES
#1.LIST THE NAMES OF ALL PUBLISHERS.
select name from Publisher;

#2.LIST THE NAMES OF ALL PUBLISHERS WITH CONTACT NUMBER.
select name,phone from Publisher;

#3.LIST THE NAMES OF ALL PUBLISHERS FROM NEW DELHI.
select name from Publisher
where address='New Delhi';

#4.NEWDELHI--> NEW DELHI
select * from Publisher;
update Publisher
set address='New Delhi'
where address='NewDelhi';
select * from Publisher;

#5.LIST THE UNIQUE TITLES OF BOOKS PUBLISHED BY PUBLISHERS.
select title from book;
select distinct title from book;

#6.USE ORDER BY CLAUSE
select * from publisher
order by name desc;
select * from book
order by title asc;
select * from Book_Copies
order by book_id desc;

#7.FIND THE LATEST PUBLICATION YEAR FOR DBMS BOOK.
select pub_year from book
where title='DBMS'
order by pub_year desc
limit 1;

#8.
select title, pub_year from book
where pub_year>=2015 and pub_year<=2022
order by pub_year desc;

#9.DISPLAY THE TITLE, PUBLICATION YEAR AND PUBLISHER NAME FOR ALL TILTLES WHICH INCLUDES 'DBMS'
select title, pub_year,publisher_name from book
where title like '%DBMS%';

#10. LIST THE DETAILS OF PUBLISHER BELONGING TO PUNE OR JALGAON.
select * from publisher;
select * from publisher
where address in ('Pune','Jalgaon');
select * from publisher
where address='Pune' or address='Jalgaon';

#11. LIST THE DETAILS OF PUBLISHER WHO DON'T BELONG TO PUNE OR JALGAON.
select * from publisher;
select * from publisher
where address not in ('Pune','Jalgaon');
select * from publisher
where address<>'Pune' and address<>'Jalgaon';

#12. USE OF IS NULL.
select * from publisher
where phone is null;
select * from publisher
where phone is not null;

#13. TO DELETE THE RECORDS.
select * from book_copies;
delete from book_copies
where(book_id=1 and branch_id=10)
or (book_id=1 and branch_id=11)
or (book_id=2 and branch_id=12);
select * from book_copies;

insert into book_copies values(1,10,10);
insert into book_copies values(1,11,5);
insert into book_copies values(2,12,2);
select * from book_copies;

#14. DISPLAY THE TOTAL NUMBER OF COPIES OF ALL BOOKS.
select no_of_copies from Book_copies;
select sum(no_of_copies) as Total_Number_of_Copies_of_All_Books from Book_copies;

#15. DISPLAY AVERAGE NUMBER OF COPIES OF EACH BOOK WITH IT'S ID.
select book_id, avg(no_of_copies)
from book_copies
group by book_id;

#16. DISPLAY - AVERAGE NUMBER OF COPIES OF EACH BOOK, IT'S ID, NAME OF AUTHOR AND TITLE OF BOOK.
select book_copies.book_id, title, author_name, avg(no_of_copies) as Average_no_of_Copies
from book_copies,book_authors,book
where book_copies.book_id=book_authors.book_id and book.book_id=book_authors.book_id
group by book_copies.book_id, book.title, book_authors.author_name;
select * from book_copies;
select * from book_authors;
select * from book;

#17. FIND OUT AUTHORS WHOSE AVERAGE NUMBER OF BOOKS IN LIBRARY ARE MORE THAN 3 AND DISPLAY THE NAME OF AUTHOR ON TOP HAVING MAXIMUM AVERAGE NUMBER OF BOOK COPIES.
select book_copies.book_id, title, author_name, avg(no_of_copies) as Average_no_of_Copies
from book_copies,book_authors,book
where book_copies.book_id=book_authors.book_id and book.book_id=book_authors.book_id
group by book_copies.book_id, book.title, book_authors.author_name
having avg(no_of_copies) > 3
order by avg(no_of_copies) desc;

#1.FIND OUT TOTAL NO. OF PUBLISHERS
select count(name) as Total_No_of_Publisher
from Publisher;

#2.FIND OUT AUTHORS NAME WHO WROTE MAXIMUM BOOKS
select author_name, count(author_name) as Number_of_books_written
from book_authors
group by author_name
order by count(author_name) desc
limit 1;

#3.DISPLAY PUBLISHERS NAME FROM NEW DELHI AND PUNE CITY USING UNION OPERATOR 
select name from publisher
where address='New Delhi'
union 
select name from publisher
where address='Pune';
select name from publisher
where address='New Delhi'
union all 
select name from publisher
where address='Pune';

#4.RETREIVE DEATAILS OF ALL BOOKS IN THE LIBRARY-ID,TITLE,NAME OF PUBLISHER,AUTHOR,NO. OF COPIES AT EACH BRANCH,BRANCH ID, BRANCH NAME, ETC
select book.book_id,title,pub_year, publisher_name,book_authors.author_name,book_copies.no_of_copies,library_branch.branch_id,branch_name
from book_copies,book_authors,book,library_branch
where book_copies.book_id=book_authors.book_id and book.book_id=book_authors.book_id
and library_branch.branch_id=book_copies.branch_id
group by book_copies.book_id, book.title, book_authors.author_name,library_branch.branch_id
order by book_id asc;


#5.GET THE PARTICULARS OF BORROWERS WHO HAVE BORROWED MORE THAN 3 BOOKS FROM JAN 2017 TO JUNE 2017
select card_no from book_lending
where date_out between '2017-01-01' and '2017-07-01'
group by card_no
having count(card_no)>3;


#6.GET ALL THE PARTICULARS (BOOK_ID,TITLE OF BOOKS) OF BORROWERS WHO HAVE BORROWED BOOK FROM 12TH APRIL TO 12TH MAY 2017
select book.book_id,title,card_no
from book,book_lending
where (date_out between '2017-04-12' and '2017-05-12')
and (book.book_id=book_lending.book_id);
#group by book_lending.card_no
#having count(card_no)>0;


#7.LIST ALL LIBRARY BRANCH NAMES FROM BANGLORE AND JALGAON
select branch_name,address from library_branch
where address in ('Bangalore','Jalgaon');
select branch_name,address from library_branch
where address='Bangalore' or address='Jalgaon';

#8.LIST ALL LIBRARY NAMES EXCEPT FROM BANGLORE AND JALGAON 
select branch_name,address from library_branch
where address not in ('Bangalore','Jalgaon');

#9.LIST THE TITLE OF THOSE BOOKS WHO DONT HAVE ANY AUTHOR
select title, author_name
from book left join book_authors
on book.book_id=book_authors.book_id
where book_authors.author_name is null;

select title, author_name
from  book_authors right join book
on book_authors.book_id=book.book_id
where book_authors.author_name is null;


#10.HOW MANY COPIES OF THE BOOK TITLED AS CO ARE OWNED BY SSBT LIBRARY BRANCH
select no_of_copies as No_of_Copies_of_CO_at_SSBT
from book, library_branch, book_copies
where book.book_id = book_copies.book_id and  library_branch.branch_id = book_copies.branch_id
and branch_name ='SSBT' and title = 'CO';

# Trigger 
# If number of copies of any book purchased for any branch is more than 10,
# then as a discount, branch receives one more additional copy. For more than 20,
# additional 2 copies and son on. (i.e. one more additional copy per 10 books)
delimiter $$
create trigger trigger_befor_insert_Lib_Mgt before insert 
on book_copies for each row
begin
	if new.no_of_copies>10
            then
	       set new.no_of_copies = new.no_of_copies+ floor(new.no_of_copies * 0.10);
            end if;
end $$
delimiter ;

show triggers;
select * from book_copies;
insert into book_copies values(3, 15, 11);
select * from book_copies;   
insert into book_copies values(3, 16, 17);
select * from book_copies;  
insert into book_copies values(3, 13, 21);
select * from book_copies;

delete from book_copies    
where (book_id=3 and branch_id=15)
or (book_id=3 and branch_id=16)
or (book_id=3 and branch_id=13);
select * from book_copies;

drop trigger trigger_befor_insert_Lib_Mgt;
show triggers;


# View
# To create a view for students - To display his/her card number, book id & book title 
# against his/her name, branch id & branch name from where book is issued and due 
# date.

create view View_for_Student_Lib_Mgt as
select card_no, book_lending.book_id, title, book_lending.branch_id, branch_name, due_date
from book_lending, book, library_branch
where book_lending.branch_id = library_branch.branch_id and
book_lending.book_id = book.book_id;

show full tables;
select * from View_for_Student_Lib_Mgt;

select * 
from View_for_Student_Lib_Mgt
where card_no=104;

select * from book_lending;

# Update a View
update View_for_Student_Lib_Mgt
set due_date = '2017-07-12'
where card_no = 104;

select * 
from View_for_Student_Lib_Mgt
where card_no=104;

select * from book_lending
where card_no=104;

update View_for_Student_Lib_Mgt
set due_date = '2017-05-12'
where card_no = 104;

select * 
from View_for_Student_Lib_Mgt
where card_no=104;

select * from book_lending
where card_no=104;

# delete a View
drop view View_for_Student_Lib_Mgt;
show full tables;


# Function
# The functions is used to display number of publishers from a particular city

delimiter $$              
create function publisher_count(publisher_address varchar(30))
	returns integer
    deterministic
    begin 
	    declare p_count integer;
		select count(*) into p_count
		from publisher
		where publisher.address = publisher_address;
	return p_count;
    end 
$$    
delimiter ;   

show function status; 
select publisher_count('New Delhi') as Publisher_Count;  
select publisher_count('NewDelhi') as Publisher_Count;
select publisher_count('Bangalore') as Publisher_Count;

drop function publisher_count;
show function status;


# Procedure
# To define the procedure that returns the count of publishers

delimiter $$
create procedure publisher_count_procedure(in publisher_address varchar(30), out p_count int)
	begin 
		select count(*) into p_count
		from publisher
        where publisher.address = publisher_address;
	end $$
delimiter ;

show procedure status;

# now call the procedure
call publisher_count_procedure('New Delhi', @p_count);
select @p_count as Publisher_Count;
call publisher_count_procedure('NewDelhi', @p_count);
select @p_count as Publisher_Count;
call publisher_count_procedure('Bangalore', @pub_count);
select @pub_count as Publisher_Count;

drop procedure publisher_count_procedure;
show procedure status;




