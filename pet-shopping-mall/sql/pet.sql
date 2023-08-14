--==============================
-- pet계정 생성 @관리자
--==============================
--alter session set "_oracle_script" = true;
--
--create user pet
--identified by pet
--default tablespace users;
--
--grant connect, resource to pet;
--
--alter user pet quota unlimited on users;

--==============================
-- 초기화 블럭
--==============================
--drop table member;
--drop table question;
--drop table answer;
--drop table image_attachment;
--drop table point;
--drop table product;

--drop sequence seq_member_id;
--drop sequence seq_answer_answer_id;
--drop sequence seq_question_question_id;
--drop sequence seq_image_attachment_image_id;
--drop sequence seq_point_point_id;

--==============================
-- 테이블 생성
--==============================
-- 멤버 테이블
create table member (
    id number,
    member_id varchar2(20),
    password varchar2(300) not null,
    name varchar2(50) not null,
    phone varchar2(11) not null,
    email varchar2(200),
    enroll_date timestamp default sysdate,
    address varchar2(500),
    birthday timestamp,
    member_role varchar(20) default 'ROLE_USER' not null,
    point number default 0,
    subscribe char(1) default 'N' not null,
    constraints pk_member_id primary key(id),
    constraints uq_member_member_id unique (member_id)
);

-- qna 질문 테이블
create table question(
    question_id number,
    question_member_id varchar2(20),
    question_category varchar2(50),
    question_email varchar2(200),
    question_title varchar2(500),
    question_content varchar2(4000),
    question_created_at timestamp default sysdate,
    constraints pk_question_id primary key(question_id),
    constraints fk_question_member_id foreign key(question_member_id) references member(member_id) on delete cascade
);

-- qna 답변 테이블
create table answer(
   answer_id number,
   answer_admin_name varchar2(20) default '관리자',
   answer_question_id number,
   answer_content varchar2(4000),
   answer_created_at timestamp default sysdate,
   constraints pk_answer_id primary key(answer_id),
   constraints fk_answer_question_id foreign key (answer_question_id) references question(question_id) on delete cascade
);

-- 파일 테이블
create table image_attachment (
    image_id number,
    image_type number,
    image_category char(1),
    image_original_filename varchar2(500),
    image_renamed_filename varchar2(500),
    image_file_size number,
    image_created_at timestamp default systimestamp,
    constraint pk_image_attachment_id primary key(image_id)
);

-- 포인트 테이블
create table point (
    point_id number,
    point_member_id varchar2(20),
    point_type varchar2(100),
    point_amount number not null,
    point_current number,
    point_date timestamp default sysdate,
    constraint pk_point_id primary key (point_id),
    constraint fk_point_member_id foreign key (point_member_id) references member(member_id)
);

-- 상품 테이블
create table product (
    id number,
    product_code number,
    product_category varchar2(50),
    product_name varchar2(100),
    product_price number,
    product_stock number,
    product_date date default current_timestamp,
    expire_date date,
    like_cnt number default 0,
    views number default 0,
    constraints pk_product_id primary key(id),
    constraints uq_product_product_code unique(product_code)
);

-- 주문테이블
-- order 가 오라클 예약어여서 테이블명 이렇게 했습니다.
-- 할인코드는 미추가 상태입니다.
create table orderTbl (
    id number,
    order_no varchar2(20),
    member_id varchar2(20),
    order_date timestamp default sysdate,
    order_state number default 0,
    payment_state number default 0,
    total_price number,
    delivery_fee number,
    discount number,
    amount number
);

create sequence seq_orderTbl_id;
create sequence seq_member_id;
create sequence seq_answer_answer_id;
create sequence seq_question_question_id;
create sequence seq_image_attachment_image_id;
create sequence seq_point_point_id;

select * from member;
select * from question;
select * from answer;
select * from point order by point_id desc;
select * from product;
select * from image_attachment;


--==============================
--sample data 생성
--==============================
-- member insert
insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'admin', '1234', '관리자', '01011112222', 'admin@naver.com', '서울시 강남구 역삼동', to_date('1990-01-01', 'YYYY-MM-DD'), 'ROLE_ADMIN', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member1', '1234', '김상훈', '01012345678', 'kim@naver.com', '서울시 송파구 애냐동', to_date('1977-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member2', '1234', '대한훈', '01028283939', 'ghjwf@naver.com', '서울시 송파구 마니동', to_date('1995-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member3', '1234', '건곤훈', '01011223344', 'qwerrt@naver.com', '서울시 송파구 베내동', to_date('1998-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member4', '1234', '덩셍훈', '010133663344', 'dfhdfg@naver.com', '서울시 송파구 메메동', to_date('1987-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member5', '1234', '누나훈', '01012347755', 'kim@naver.com', '서울시 송파구 차차동', to_date('1993-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member6', '1234', '삼촌훈', '01099007766', 'fghew@naver.com', '서울시 송파구 재재동', to_date('1992-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member7', '1234', '할멈훈', '01088776655', 'rtyhm@naver.com', '서울시 송파구 어어동', to_date('1991-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member8', '1234', '할아버지훈', '01012123232', 'kdfhim@naver.com', '서울시 송파구 하하동', to_date('1994-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member9', '1234', '딸훈', '01011556633', 'kinjmm@naver.com', '서울시 송파구 매매동', to_date('1997-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member10', '1234', '아들훈', '01012322678', 'kixvm@naver.com', '서울시 송파구 내내동', to_date('1999-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member11', '1234', '아빠훈', '01012552278', 'kewim@naver.com', '서울시 송파구 배배동', to_date('1993-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member12', '1234', '엄마훈', '01012342238', 'ghjkim@naver.com', '서울시 송파구 마자동', to_date('1994-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member13', '1234', '이모훈', '01012123418', 'svxkim@naver.com', '서울시 송파구 우동', to_date('1996-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'N');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'member14', '1234', '고모훈', '01012244238', 'qwewkim@naver.com', '서울시 송파구 석비촌동', to_date('1999-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

insert into member (id, member_id, password, name, phone, email, address, birthday, member_role, point, subscribe)
values (seq_member_id.nextval, 'honggd', '1234', '홍지디', '01015314328', 'honggd@naver.com', '서울시 송파구 석나니촌동', to_date('1991-01-01', 'YYYY-MM-DD'), 'ROLE_USER', 10000, 'Y');

-- qna insert
insert into question (question_id, question_title, question_category, question_member_id, question_email, question_content, question_created_at)
values (seq_question_question_id.nextval, '우동친이 머에요?', '상품' ,'member1', 'kh@naver.com', '우동친이 먼가요???? 우동친이 먼가요???? 우동친이 먼가요???? 우동친이 먼가요????', to_date('18/02/14', 'rr/mm/dd'));
insert into question (question_id, question_title, question_category, question_member_id, question_email, question_content, question_created_at)
values (seq_question_question_id.nextval, '배가 고파요', '배송', 'member1', 'kh@daum.net', '배가 고프다', to_date('18/02/14', 'rr/mm/dd'));

-- answer insert 
insert into answer (answer_id, answer_admin_name, answer_question_id, answer_content, answer_created_at)
values (seq_answer_answer_id.nextval, '관리자', 1, '우동친은 우리집동물친구의 줄임말입니다~', sysdate);

insert into answer (answer_id, answer_admin_name, answer_question_id, answer_content, answer_created_at)
values (seq_answer_answer_id.nextval, '관리자', 2, '배고프면 밥을 드세요', sysdate);

-- product insert 
insert into product (id, product_code, product_category, product_name, product_price, product_stock, expire_date)
values (seq_member_id.nextval, 101, '사료', '오리젠 퍼피', 32000, 100, to_date('2023-12-31', 'yyyy-mm-DD'));

insert into product (id, product_code, product_category, product_name, product_price, product_stock, expire_date)
values (seq_member_id.nextval, 102, '하네스', '말랑 하네스', 15000, 100, to_date('2023-12-31', 'yyyy-mm-DD'));

-- point insert 
insert into point (point_id, point_member_id, point_type, point_amount, point_current, point_date)
values (seq_point_point_id.nextval, 'member1', '회원가입', 3000, 3000, to_date('2023-08-09', 'yyyy-mm-dd'));

insert into point (point_id, point_member_id, point_type, point_amount, point_current, point_date)
values (seq_point_point_id.nextval, 'member1', '구매', -1000, 2000, to_date('2023-08-09', 'yyyy-mm-dd'));


commit;


--delete from question where id = '19';
--SELECT * FROM product WHERE id = 3;
--select * from question where id = '4';
--select * from member;
--select q.*, (select count(*) from answer where answer_question_id = q.question_id) awnser_count from question q order by question_id desc;


