select now();
INSERT INTO `user_info`
(`id`,
`pwd`,
`name`,
`email`,
`birth`,
`sns`,
`reg_date`)
VALUES
('asdf',
'1234',
'홍길동',
'aaa@aaa.com',
'1992-12-31',
'fb',
now());

select * from user_info;

-- Auto Commit : 명령을 수행할 때마다 commit