insert into department values('CSE', 'A', 20000);
insert into department values('EEE', 'A-Ext', 35000);
insert into department values('PHY', 'A-Ext', 30000);
insert into department values('MAT', 'C', 25000);
insert into department values('STA', 'C', 30000);
insert into department values('FET', 'E', 18000);

insert into course values('STA203', 'Probability', 'STA', 4);
insert into course values('MAT103', 'Calculus', 'MAT', 4);
insert into course values('MAT204', 'Laplus', 'MAT', 4);
insert into course values('EEE203', 'Cicuits', 'EEE', 3);
insert into course values('PHY106', 'Physics', 'PHY', 3);
insert into course values('CSE333', 'DB Theory', 'CSE', 3);
insert into course values('CSE334', 'DB Lab', 'CSE', 3);
insert into course values('CSE425', 'Fiber', 'CSE', 3);

insert into instructor values('1111', 'MZI', 'CSE', 30000);
insert into instructor values('3112', 'MSN', 'MAT', 35000);
insert into instructor values('2111', 'MH', 'EEE', 25000);
insert into instructor values('2112', 'TD', 'EEE', 20000);
insert into instructor values('3125', 'MZH', 'STA', 35000);
insert into instructor values('1115', 'SNM', 'CSE', 15000);
insert into instructor values('2122', 'MSA', 'PHY', 35000);

insert into section values('CSE333', '1', 'Summer', 2013, 'A','309','A');
insert into section values('CSE333', '2', 'Spring', 2014, 'A','310','A');
insert into section values('CSE425', '1', 'Summer', 2013, 'A','309','B');
insert into section values('MAT103', '1', 'Summer', 2013, 'C','205','A');
insert into section values('MAT204', '1', 'Spring', 2014, 'C','206','C');
insert into section values('EEE203', '2', 'Summer', 2013, 'A-Ext','103','B');
insert into section values('PHY106', '2', 'Spring', 2014, 'A-Ext','104','B');
insert into section values('EEE203', '1', 'Summer', 2013, 'A-Ext','103','A');




insert into teaches values('1115', 'CSE333', '1', 'Summer', 2013);
insert into teaches values('1115', 'CSE333', '2', 'Spring', 2014);
insert into teaches values('1111', 'CSE425', '1', 'Summer', 2013);
insert into teaches values('2122', 'PHY106', '2', 'Spring', 2014);
insert into teaches values('2111', 'EEE203', '2', 'Summer', 2013);
insert into teaches values('2112', 'EEE203', '1', 'Summer', 2013);


select * from mydb.department;


