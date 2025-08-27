show tables;

create table board (
  idx	 int not null auto_increment,	/* 게시글의 고유번호 */
  mid  varchar(20) not null,				/* 게시판 올린이 아이디 */
  nickName varchar(20) not null,		/* 게시판 올린이 닉네임 */
  title varchar(100) not null,			/* 게시글 제목 */
  content text not null,						/* 게시글 내용 */
  hostIp  varchar(30) not null,			/* 게시글 올린 PC IP */
  openSw	char(2) default 'OK',			/* 게시글 공개여부(OK:공개, NO:비공개) */
  readNum int default 0,						/* 글 조회수 */
  wDate datetime default now(),			/* 글 올린 날짜 */
  good  int default 0,							/* 좋아요 클릭수 */
  complaint char(2) default 'NO',	/* 신고글(정상글:NO, 신고당한글:OK) */
  primary key(idx),
  foreign key(mid) references friend(mid)
);
desc board;
drop table board;

insert into board values (default,'admin','관리맨','게시판 서비스를 시작합니다.','즐거운 게시판 생활 되세요','192.168.50.20',default,default,default,default,default);

select * from board;

select *,timestampdiff(hour, wDate, now()) from board order by idx desc limit 0,10;
select now(), datediff(now(), wDate) from board order by idx desc;

select *,
  timestampdiff(hour, wDate, now()) as hour_diff,
  datediff(now(), wDate) as date_diff
  from board order by idx desc limit 0,10;


select * from board order by idx desc;


-- 이전글 / 다음글 철리(예: 현재글은 idx 12이라고 가정한다)
select * from board where idx < 12 order by idx desc limit 1; /* 이전글 */
select * from board where idx > 12 order by idx limit 1; /* 다음글글 */

/* 댓 글 처 리*/
create table boardReply (
  idx  int not null auto_increment,/* 댓글 고유번호 */
  boardIdx int not null,					/* 부모글(원본글)의 고유번호 */
  mid varchar(20) not null,				/* 댓글 올린이의 아이디 */
  nickName varchar(20) not null,	/* 댓글 올린이의 닉네임 */
  wDate    datetime default now(),/* 댓글 올린 날짜 */
  hostIp   varchar(30) not null,	/* 댓글 올린 PC의 고유IP */
  content  text not null,					/* 댓글 내용 */
  primary key(idx),
  foreign key(boardIdx) references board(idx)
  on update cascade
  on delete restrict
);
desc boardReply;	

insert into boardReply values (default, 14, 'hkd1234', '홍장군',default,'192.168.50.55','댓글연습');
insert into boardReply values (default, 14, 'snm1234', '홍장군',default,'192.168.50.55','댓글연습');
insert into boardReply values (default, 15, 'snm1234', '홍장군',default,'192.168.50.55','댓글연습');
insert into boardReply values (default, 15, 'hkd1234', '홍장군',default,'192.168.50.55','댓글연습');

select * from boardReply order by idx desc;
delete from board where idx = 14;








