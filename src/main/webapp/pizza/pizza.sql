drop table pizza_user;

create table pizza_user(
	num number(8) primary key,
	name varchar2(30),
	phone varchar2(15) not null,
	addr varchar2(100) not null
);

drop sequence pizza_seq;

create sequence pizza_seq
start with 1
increment by 1
nocache;

insert into pizza_user(num,name,phone,addr)
values(pizza_seq.nextval, '�̿�ö', '1111-1111', '���� ������ ������ 1����');

insert into pizza_user(num,name,phone,addr)
values(pizza_seq.nextval, '�����', '2222-2222', '���� ������ ������ 2����');

commit;