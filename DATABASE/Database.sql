create database OnlineExaminationSystem;
use OnlineExaminationSystem;


--Student Login Section

create table studentLogin
(
	studentId bigint primary key identity(1,1),
	studentUsername varchar(100),
	studentPassword varchar(100)
);

select * from studentLogin;

create procedure sp_studentLoginInsert 
@studentUsername varchar(100),
@studentPassword varchar(100)
as 
begin
insert into studentLogin(studentUsername,studentPassword) values (@studentUsername,@studentPassword);
end



--Student HomePage Section

 drop table studentInfo;
create table studentInfo
(
	
	studentCourse varchar(50),
	studentClass varchar(50),
	studentRollno bigint
);
 
select * from studentInfo;

create procedure sp_studentInfoInsert
@studentCourse varchar(50),
@studentClass varchar(50),
@studentRollno bigint
as 
begin 
insert into studentInfo (studentCourse,studentClass,studentRollno) values (@studentCourse,@studentClass,@studentRollno);
end

insert into studentInfo values('Bsc-IT','Class-A','12');



//Finalyy

--Class Table.


create table class_Tbl
(
class_Id int not null,
course_Id int not null,
class_Name varchar(20) not null
);


create procedure sp_getClass
as
begin
select class_Tbl.class_Id,class_Tbl.course_Id,class_Tbl.class_Name from class_Tbl,course_Tbl where course_Tbl.course_Id=class_Tbl.course_Id and class_Tbl.course_Id=@Id;
end

delete from class_Tbl;


insert into class_Tbl (class_Id,course_Id,class_Name) values
(1, 1, 'BCA-1(A)'),
(2, 1, 'BCA-1(B)'),
(3, 1, 'BCA-1(C)'),
(4, 1, 'BCA-1(D)'),
(5, 2, 'BSCIT-1(B1)'),
(6, 2, 'BSCIT-2(B1)'),
(7, 2, 'BSCIT-3(B2)');


select * from course_Tbl;
select * from class_Tbl;


drop procedure sp_getClass;


--Class RollNumber Table.

create table classRollNumber_Tbl
(
roll_Id int not null,
course_Id int not null,
class_Id int not null,
roll_Number int not null,
attendance_Date date default null, status char(1) default 'A'
);

select * from classRollNumber_Tbl;

--when user have logged that time status is set 'P' means present.
create procedure sp_LoggedStatusUpdate
@roll_Id bigint
as
begin
update classRollNumber_Tbl set status='P' where roll_Id=@roll_Id;
end

drop Procedure sp_LoggedStatusUpdate;

select * from classRollNumber_Tbl;

insert into classRollNumber_Tbl(roll_Id,course_Id,class_Id,roll_Number,attendance_Date,status) values
(1, 2, 6, 1, NULL, 'A'),
(2, 2, 6, 2, NULL, 'A'),
(3, 2, 6, 3, NULL, 'A'),
(4, 2, 6, 4, NULL, 'A'),
(5, 2, 6, 5, NULL, 'A'),
(6, 2, 6, 6, NULL, 'A'),
(7, 2, 6, 7, NULL, 'A'),
(8, 2, 6, 8, NULL, 'A'),
(9, 2, 6, 9, NULL, 'A'),
(10, 2, 6, 10, NULL, 'A'),
(11, 2, 6, 11, NULL, 'A'),
(12, 2, 6, 12, NULL, 'A'),
(13, 2, 6, 13, NULL, 'A'),
(14, 2, 6, 14, NULL, 'A'),
(15, 2, 6, 15, NULL, 'A'),
(16, 2, 6, 16, NULL, 'A'),
(17, 2, 6, 17, NULL, 'A'),
(18, 2, 6, 18, NULL, 'A'),
(19, 2, 6, 19, NULL, 'A'),
(20, 2, 6, 20, NULL, 'A'),
(21, 2, 6, 21, NULL, 'A'),
(22, 2, 6, 22, NULL, 'A'),
(23, 2, 6, 23, NULL, 'A'),
(24, 2, 6, 24, NULL, 'A'),
(25, 2, 6, 25, NULL, 'A'),
(26, 2, 6, 26, NULL, 'A'),
(27, 2, 6, 27, NULL, 'A'),
(28, 2, 6, 28, NULL, 'A'),
(29, 2, 6, 29, NULL, 'A'),
(30, 2, 6, 30, NULL, 'A'),
(31, 2, 6, 31, NULL, 'A'),
(32, 2, 6, 32, NULL, 'A'),
(33, 2, 6, 33, NULL, 'A'),
(34, 2, 6, 34, NULL, 'A'),
(35, 2, 6, 35, NULL, 'A'),
(36, 2, 6, 36, NULL, 'A'),
(37, 2, 6, 37, NULL, 'A'),
(38, 2, 6, 38, NULL, 'A'),
(39, 2, 6, 39, NULL, 'A'),
(40, 2, 6, 40, NULL, 'A'),
(41, 2, 6, 41, NULL, 'A'),
(42, 2, 6, 42, NULL, 'A'),
(43, 2, 6, 43, NULL, 'A'),
(44, 2, 6, 44, NULL, 'A'),
(45, 2, 6, 45, NULL, 'A'),
(46, 2, 6, 46, NULL, 'A'),
(47, 2, 6, 47, NULL, 'A'),
(48, 2, 6, 48, NULL, 'A'),
(49, 2, 6, 49, NULL, 'A'),
(50, 2, 6, 50, NULL, 'A'),
(51, 2, 6, 51, NULL, 'A'),
(52, 2, 6, 52, NULL, 'A'),
(53, 2, 6, 53, NULL, 'A'),
(54, 2, 6, 54, NULL, 'A'),
(55, 2, 6, 55, NULL, 'A'),
(56, 2, 6, 56, NULL, 'A'),
(57, 2, 6, 57, NULL, 'A'),
(58, 2, 6, 58, NULL, 'A'),
(59, 2, 6, 59, NULL, 'A'),
(60, 2, 6, 60, NULL, 'A'),
(61, 2, 7, 1, NULL, 'A'),
(62, 2, 7, 2, NULL, 'A'),
(63, 2, 7, 3, NULL, 'A'),
(64, 2, 7, 4, NULL, 'A'),
(65, 2, 7, 5, NULL, 'A'),
(66, 2, 7, 6, NULL, 'A'),
(67, 2, 7, 7, NULL, 'A'),
(68, 2, 7, 8, NULL, 'A'),
(69, 2, 7, 9, NULL, 'A'),
(70, 2, 7, 10, NULL, 'A'),
(71, 2, 7, 11, NULL, 'A'),
(72, 2, 7, 12, NULL, 'A'),
(73, 2, 7, 13, NULL, 'A'),
(74, 2, 7, 14, NULL, 'A'),
(75, 2, 7, 15, NULL, 'A'),
(76, 2, 7, 16, NULL, 'A'),
(77, 2, 7, 17, NULL, 'A'),
(78, 2, 7, 18, NULL, 'A'),
(79, 2, 7, 19, NULL, 'A'),
(80, 2, 7, 20, NULL, 'A'),
(81, 2, 7, 21, NULL, 'A'),
(82, 2, 7, 22, NULL, 'A'),
(83, 2, 7, 23, NULL, 'A'),
(84, 2, 7, 24, NULL, 'A'),
(85, 2, 7, 25, NULL, 'A'),
(86, 2, 7, 26, NULL, 'A'),
(87, 2, 7, 27, NULL, 'A'),
(88, 2, 7, 28, NULL, 'A'),
(89, 2, 7, 29, NULL, 'A'),
(90, 2, 7, 30, NULL, 'A'),
(91, 2, 7, 31, NULL, 'A'),
(92, 2, 7, 32, NULL, 'A'),
(93, 2, 7, 33, NULL, 'A'),
(94, 2, 7, 34, NULL, 'A'),
(95, 2, 7, 35, NULL, 'A'),
(96, 2, 7, 36, NULL, 'A'),
(97, 2, 7, 37, NULL, 'A'),
(98, 2, 7, 38, NULL, 'A'),
(99, 2, 7, 39, NULL, 'A'),
(100, 2, 7, 40, NULL, 'A'),
(101, 2, 7, 41, NULL, 'A'),
(102, 2, 7, 42, NULL, 'A'),
(103, 2, 7, 43, NULL, 'A'),
(104, 2, 7, 44, NULL, 'A'),
(105, 2, 7, 45, NULL, 'A'),
(106, 2, 7, 46, NULL, 'A'),
(107, 2, 7, 47, NULL, 'A'),
(108, 2, 7, 48, NULL, 'A'),
(109, 2, 7, 49, NULL, 'A'),
(110, 2, 7, 50, NULL, 'A'),
(111, 2, 7, 51, NULL, 'A'),
(112, 2, 7, 52, NULL, 'A'),
(113, 2, 7, 53, NULL, 'A'),
(114, 2, 7, 54, NULL, 'A'),
(115, 2, 7, 55, NULL, 'A'),
(116, 2, 7, 56, NULL, 'A'),
(117, 2, 7, 57, NULL, 'A'),
(118, 2, 7, 58, NULL, 'A'),
(119, 2, 7, 59, NULL, 'A'),
(120, 1, 1, 1, '2024-09-25', 'P'),
(121, 1, 1, 2, '2024-09-25', 'A'),
(122, 1, 1, 3, '2024-09-25', 'A'),
(123, 1, 1, 4, '2024-09-25', 'A'),
(124, 1, 1, 5, '2024-09-25', 'A'),
(125, 1, 1, 6, '2024-09-25', 'A'),
(126, 1, 1, 7, '2024-09-25', 'A'),
(127, 1, 1, 8, '2024-09-25', 'A'),
(128, 1, 1, 9, '2024-09-25', 'A'),
(129, 1, 1, 10, '2024-09-25', 'A'),
(130, 1, 1, 11, '2024-09-25', 'A'),
(131, 1, 1, 12, '2024-09-25', 'A'),
(132, 1, 1, 13, '2024-09-25', 'A'),
(133, 1, 1, 14, '2024-09-25', 'A'),
(134, 1, 1, 15, '2024-09-25', 'A'),
(135, 1, 1, 16, '2024-09-25', 'A'),
(136, 1, 1, 17, '2024-09-25', 'A'),
(137, 1, 1, 18, '2024-09-25', 'A'),
(138, 1, 1, 19, '2024-09-25', 'A'),
(139, 1, 1, 20, '2024-09-25', 'A'),
(140, 1, 1, 21, '2024-09-25', 'A'),
(141, 1, 1, 22, '2024-09-25', 'A'),
(142, 1, 1, 23, '2024-09-25', 'A'),
(143, 1, 1, 24, '2024-09-25', 'A'),
(144, 1, 1, 25, '2024-09-25', 'A'),
(145, 1, 1, 26, '2024-09-25', 'A'),
(146, 1, 1, 27, '2024-09-25', 'A'),
(147, 1, 1, 28, '2024-09-25', 'A'),
(148, 1, 1, 29, '2024-09-25', 'A'),
(149, 1, 1, 30, '2024-09-25', 'A'),
(150, 1, 1, 31, '2024-09-25', 'A'),
(151, 1, 1, 32, '2024-09-25', 'A'),
(152, 1, 1, 33, '2024-09-25', 'A'),
(153, 1, 1, 34, '2024-09-25', 'A'),
(154, 1, 1, 35, '2024-09-25', 'A'),
(155, 1, 1, 36, '2024-09-25', 'A'),
(156, 1, 1, 37, '2024-09-25', 'A'),
(157, 1, 1, 38, '2024-09-25', 'A'),
(158, 1, 1, 39, '2024-09-25', 'A'),
(159, 1, 1, 40, '2024-09-25', 'A'),
(160, 1, 1, 41, '2024-09-25', 'A'),
(161, 1, 1, 42, '2024-09-25', 'A'),
(162, 1, 1, 43, '2024-09-25', 'A'),
(163, 1, 1, 44, '2024-09-25', 'A'),
(164, 1, 1, 45, '2024-09-25', 'A'),
(165, 1, 1, 46, '2024-09-25', 'A'),
(166, 1, 1, 47, '2024-09-25', 'A'),
(167, 1, 1, 48, '2024-09-25', 'A'),
(168, 1, 1, 49, '2024-09-25', 'A'),
(169, 1, 1, 50, '2024-09-25', 'A'),
(170, 1, 1, 51, '2024-09-25', 'A'),
(171, 1, 1, 52, '2024-09-25', 'A'),
(172, 1, 1, 53, '2024-09-25', 'A'),
(173, 1, 1, 54, '2024-09-25', 'A'),
(174, 1, 1, 55, '2024-09-25', 'A'),
(175, 1, 1, 56, '2024-09-25', 'A'),
(176, 1, 1, 57, '2024-09-25', 'A'),
(177, 1, 1, 58, '2024-09-25', 'A'),
(178, 1, 1, 59, '2024-09-25', 'A'),
(179, 1, 1, 60, '2024-09-25', 'A'),
(180, 1, 1, 61, '2024-09-25', 'A'),
(181, 1, 2, 1, '2024-09-25', 'A'),
(182, 1, 2, 2, '2024-09-25', 'A'),
(183, 1, 2, 3, '2024-09-25', 'A'),
(184, 1, 2, 4, '2024-09-25', 'A'),
(185, 1, 2, 5, '2024-09-25', 'A'),
(186, 1, 2, 6, '2024-09-25', 'A'),
(187, 1, 2, 7, '2024-09-25', 'A'),
(188, 1, 2, 8, '2024-09-25', 'A'),
(189, 1, 2, 9, '2024-09-25', 'A'),
(190, 1, 2, 10, '2024-09-25', 'A'),
(191, 1, 2, 11, '2024-09-25', 'A'),
(192, 1, 2, 12, '2024-09-25', 'A'),
(193, 1, 2, 13, '2024-09-25', 'A'),
(194, 1, 2, 14, '2024-09-25', 'A'),
(195, 1, 2, 15, '2024-09-25', 'A'),
(196, 1, 2, 16, '2024-09-25', 'A'),
(197, 1, 2, 17, '2024-09-25', 'A'),
(198, 1, 2, 18, '2024-09-25', 'A'),
(199, 1, 2, 19, '2024-09-25', 'A'),
(200, 1, 2, 20, '2024-09-25', 'A'),
(201, 1, 2, 21, '2024-09-25', 'A'),
(202, 1, 2, 22, '2024-09-25', 'A'),
(203, 1, 2, 23, '2024-09-25', 'A'),
(204, 1, 2, 24, '2024-09-25', 'A'),
(205, 1, 2, 25, '2024-09-25', 'A'),
(206, 1, 2, 26, '2024-09-25', 'A'),
(207, 1, 2, 27, '2024-09-25', 'A'),
(208, 1, 2, 28, '2024-09-25', 'A'),
(209, 1, 2, 29, '2024-09-25', 'A'),
(210, 1, 2, 30, '2024-09-25', 'A'),
(211, 1, 2, 31, '2024-09-25', 'A'),
(212, 1, 2, 32, '2024-09-25', 'A'),
(213, 1, 2, 33, '2024-09-25', 'A'),
(214, 1, 2, 34, '2024-09-25', 'A'),
(215, 1, 2, 35, '2024-09-25', 'A'),
(216, 1, 2, 36, '2024-09-25', 'A'),
(217, 1, 2, 37, '2024-09-25', 'A'),
(218, 1, 2, 38, '2024-09-25', 'A'),
(219, 1, 2, 39, '2024-09-25', 'A'),
(220, 1, 2, 40, '2024-09-25', 'A'),
(221, 1, 2, 41, '2024-09-25', 'A'),
(222, 1, 2, 42, '2024-09-25', 'A'),
(223, 1, 2, 43, '2024-09-25', 'A'),
(224, 1, 2, 44, '2024-09-25', 'A'),
(225, 1, 2, 45, '2024-09-25', 'A'),
(226, 1, 2, 46, '2024-09-25', 'A'),
(227, 1, 2, 47, '2024-09-25', 'A'),
(228, 1, 2, 48, '2024-09-25', 'A'),
(229, 1, 2, 49, '2024-09-25', 'A'),
(230, 1, 2, 50, '2024-09-25', 'A'),
(231, 1, 2, 51, '2024-09-25', 'A'),
(232, 1, 2, 52, '2024-09-25', 'A'),
(233, 1, 2, 53, '2024-09-25', 'A'),
(234, 1, 2, 54, '2024-09-25', 'A'),
(235, 1, 2, 55, '2024-09-25', 'A'),
(236, 1, 2, 56, '2024-09-25', 'A'),
(237, 1, 2, 57, '2024-09-25', 'A'),
(238, 1, 2, 58, '2024-09-25', 'A'),
(239, 1, 2, 59, '2024-09-25', 'A'),
(240, 1, 2, 60, '2024-09-25', 'A'),
(241, 1, 2, 61, '2024-09-25', 'A'),
(242, 1, 2, 62, '2024-09-25', 'A'),
(243, 1, 3, 1, '2024-09-25', 'A'),
(244, 1, 3, 2, '2024-09-25', 'A'),
(245, 1, 3, 3, '2024-09-25', 'A'),
(246, 1, 3, 4, '2024-09-25', 'A'),
(247, 1, 3, 5, '2024-09-25', 'A'),
(248, 1, 3, 6, '2024-09-25', 'A'),
(249, 1, 3, 7, '2024-09-25', 'A'),
(250, 1, 3, 8, '2024-09-25', 'A'),
(251, 1, 3, 9, '2024-09-25', 'A'),
(252, 1, 3, 10, '2024-09-25', 'A'),
(253, 1, 3, 11, '2024-09-25', 'A'),
(254, 1, 3, 12, '2024-09-25', 'A'),
(255, 1, 3, 13, '2024-09-25', 'A'),
(256, 1, 3, 14, '2024-09-25', 'A'),
(257, 1, 3, 15, '2024-09-25', 'A'),
(258, 1, 3, 16, '2024-09-25', 'A'),
(259, 1, 3, 17, '2024-09-25', 'A'),
(260, 1, 3, 18, '2024-09-25', 'A'),
(261, 1, 3, 19, '2024-09-25', 'A'),
(262, 1, 3, 20, '2024-09-25', 'A'),
(263, 1, 3, 21, '2024-09-25', 'A'),
(264, 1, 3, 22, '2024-09-25', 'A'),
(265, 1, 3, 23, '2024-09-25', 'A'),
(266, 1, 3, 24, '2024-09-25', 'A'),
(267, 1, 3, 25, '2024-09-25', 'A'),
(268, 1, 3, 26, '2024-09-25', 'A'),
(269, 1, 3, 27, '2024-09-25', 'A'),
(270, 1, 3, 28, '2024-09-25', 'A'),
(271, 1, 3, 29, '2024-09-25', 'A'),
(272, 1, 3, 30, '2024-09-25', 'A'),
(273, 1, 3, 31, '2024-09-25', 'A'),
(274, 1, 3, 32, '2024-09-25', 'A'),
(275, 1, 3, 33, '2024-09-25', 'A'),
(276, 1, 3, 34, '2024-09-25', 'A'),
(277, 1, 3, 35, '2024-09-25', 'A'),
(278, 1, 3, 36, '2024-09-25', 'A'),
(279, 1, 3, 37, '2024-09-25', 'A'),
(280, 1, 3, 38, '2024-09-25', 'A'),
(281, 1, 3, 39, '2024-09-25', 'A'),
(282, 1, 3, 40, '2024-09-25', 'A'),
(283, 1, 3, 41, '2024-09-25', 'A'),
(284, 1, 3, 42, '2024-09-25', 'A'),
(285, 1, 3, 43, '2024-09-25', 'A'),
(286, 1, 3, 44, '2024-09-25', 'A'),
(287, 1, 3, 45, '2024-09-25', 'A'),
(288, 1, 3, 46, '2024-09-25', 'A'),
(289, 1, 3, 47, '2024-09-25', 'A'),
(290, 1, 3, 48, '2024-09-25', 'A'),
(291, 1, 3, 49, '2024-09-25', 'A'),
(292, 1, 3, 50, '2024-09-25', 'A'),
(293, 1, 3, 51, '2024-09-25', 'A'),
(294, 1, 3, 52, '2024-09-25', 'A'),
(295, 1, 3, 53, '2024-09-25', 'A'),
(296, 1, 3, 54, '2024-09-25', 'A'),
(297, 1, 3, 55, '2024-09-25', 'A'),
(298, 1, 3, 56, '2024-09-25', 'A'),
(299, 1, 3, 57, '2024-09-25', 'A'),
(300, 1, 3, 58, '2024-09-25', 'A'),
(301, 1, 3, 59, '2024-09-25', 'A'),
(302, 1, 3, 60, '2024-09-25', 'A'),
(303, 1, 3, 61, '2024-09-25', 'A'),
(304, 1, 4, 1, '2024-09-25', 'A'),
(305, 1, 4, 2, '2024-09-25', 'A'),
(306, 1, 4, 3, '2024-09-25', 'A'),
(307, 1, 4, 4, '2024-09-25', 'A'),
(308, 1, 4, 5, '2024-09-25', 'A'),
(309, 1, 4, 6, '2024-09-25', 'A'),
(310, 1, 4, 7, '2024-09-25', 'A'),
(311, 1, 4, 8, '2024-09-25', 'A'),
(312, 1, 4, 9, '2024-09-25', 'A'),
(313, 1, 4, 10, '2024-09-25', 'A'),
(314, 1, 4, 11, '2024-09-25', 'A'),
(315, 1, 4, 12, '2024-09-25', 'A'),
(316, 1, 4, 13, '2024-09-25', 'A'),
(317, 1, 4, 14, '2024-09-25', 'A'),
(318, 1, 4, 15, '2024-09-25', 'A'),
(319, 1, 4, 16, '2024-09-25', 'A'),
(320, 1, 4, 17, '2024-09-25', 'A'),
(321, 1, 4, 18, '2024-09-25', 'A'),
(322, 1, 4, 19, '2024-09-25', 'A'),
(323, 1, 4, 20, '2024-09-25', 'A'),
(324, 1, 4, 21, '2024-09-25', 'A'),
(325, 1, 4, 22, '2024-09-25', 'A'),
(326, 1, 4, 23, '2024-09-25', 'A'),
(327, 1, 4, 24, '2024-09-25', 'A'),
(328, 1, 4, 25, '2024-09-25', 'A'),
(329, 1, 4, 26, '2024-09-25', 'A'),
(330, 1, 4, 27, '2024-09-25', 'A'),
(331, 1, 4, 28, '2024-09-25', 'A'),
(332, 1, 4, 29, '2024-09-25', 'A'),
(333, 1, 4, 30, '2024-09-25', 'A'),
(334, 1, 4, 31, '2024-09-25', 'A'),
(335, 1, 4, 32, '2024-09-25', 'A'),
(336, 1, 4, 33, '2024-09-25', 'A'),
(337, 1, 4, 34, '2024-09-25', 'A'),
(338, 1, 4, 35, '2024-09-25', 'A'),
(339, 1, 4, 36, '2024-09-25', 'A'),
(340, 1, 4, 37, '2024-09-25', 'A'),
(341, 1, 4, 38, '2024-09-25', 'A'),
(342, 1, 4, 39, '2024-09-25', 'A'),
(343, 1, 4, 40, '2024-09-25', 'A'),
(344, 1, 4, 41, '2024-09-25', 'A'),
(345, 1, 4, 42, '2024-09-25', 'A'),
(346, 1, 4, 43, '2024-09-25', 'A'),
(347, 1, 4, 44, '2024-09-25', 'A'),
(348, 1, 4, 45, '2024-09-25', 'A'),
(349, 1, 4, 46, '2024-09-25', 'A'),
(350, 1, 4, 47, '2024-09-25', 'A'),
(351, 1, 4, 48, '2024-09-25', 'A'),
(352, 1, 4, 49, '2024-09-25', 'A'),
(353, 1, 4, 50, '2024-09-25', 'A'),
(354, 1, 4, 51, '2024-09-25', 'A'),
(355, 1, 4, 52, '2024-09-25', 'A'),
(356, 1, 4, 53, '2024-09-25', 'A'),
(357, 1, 4, 54, '2024-09-25', 'A'),
(358, 1, 4, 55, '2024-09-25', 'A'),
(359, 1, 4, 56, '2024-09-25', 'A'),
(360, 1, 4, 57, '2024-09-25', 'A'),
(361, 1, 4, 58, '2024-09-25', 'A'),
(362, 1, 4, 59, '2024-09-25', 'A'),
(363, 2, 5, 1, '2024-09-25', 'A'),
(364, 2, 5, 2, '2024-09-25', 'A'),
(365, 2, 5, 3, '2024-09-25', 'A'),
(366, 2, 5, 4, '2024-09-25', 'A'),
(367, 2, 5, 5, '2024-09-25', 'A'),
(368, 2, 5, 6, '2024-09-25', 'A'),
(369, 2, 5, 7, '2024-09-25', 'A'),
(370, 2, 5, 8, '2024-09-25', 'A'),
(371, 2, 5, 9, '2024-09-25', 'A'),
(372, 2, 5, 10, '2024-09-25', 'A'),
(373, 2, 5, 11, '2024-09-25', 'A'),
(374, 2, 5, 12, '2024-09-25', 'A'),
(375, 2, 5, 13, '2024-09-25', 'A'),
(376, 2, 5, 14, '2024-09-25', 'A'),
(377, 2, 5, 15, '2024-09-25', 'A'),
(378, 2, 5, 16, '2024-09-25', 'A'),
(379, 2, 5, 17, '2024-09-25', 'A'),
(380, 2, 5, 18, '2024-09-25', 'A'),
(381, 2, 5, 19, '2024-09-25', 'A'),
(382, 2, 5, 20, '2024-09-25', 'A'),
(383, 2, 5, 21, '2024-09-25', 'A'),
(384, 2, 5, 22, '2024-09-25', 'A'),
(385, 2, 5, 23, '2024-09-25', 'A'),
(386, 2, 5, 24, '2024-09-25', 'A'),
(387, 2, 5, 25, '2024-09-25', 'A'),
(388, 2, 5, 26, '2024-09-25', 'A'),
(389, 2, 5, 27, '2024-09-25', 'A'),
(390, 2, 5, 28, '2024-09-25', 'A'),
(391, 2, 5, 29, '2024-09-25', 'A'),
(392, 2, 5, 30, '2024-09-25', 'A'),
(393, 2, 5, 31, '2024-09-25', 'A'),
(394, 2, 5, 32, '2024-09-25', 'A'),
(395, 2, 5, 33, '2024-09-25', 'A'),
(396, 2, 5, 34, '2024-09-25', 'A'),
(397, 2, 5, 35, '2024-09-25', 'A'),
(398, 2, 5, 36, '2024-09-25', 'A'),
(399, 2, 5, 37, '2024-09-25', 'A'),
(400, 2, 5, 38, '2024-09-25', 'A'),
(401, 2, 5, 39, '2024-09-25', 'A'),
(402, 2, 5, 40, '2024-09-25', 'A'),
(403, 2, 5, 41, '2024-09-25', 'A'),
(404, 2, 5, 42, '2024-09-25', 'A'),
(405, 2, 5, 43, '2024-09-25', 'A'),
(406, 2, 5, 44, '2024-09-25', 'A'),
(407, 2, 5, 45, '2024-09-25', 'A'),
(408, 2, 5, 46, '2024-09-25', 'A'),
(409, 2, 5, 47, '2024-09-25', 'A'),
(410, 2, 5, 48, '2024-09-25', 'A'),
(411, 2, 5, 49, '2024-09-25', 'A'),
(412, 2, 5, 50, '2024-09-25', 'A'),
(413, 2, 5, 51, '2024-09-25', 'A'),
(414, 2, 5, 52, '2024-09-25', 'A'),
(415, 2, 5, 53, '2024-09-25', 'A'),
(416, 2, 5, 54, '2024-09-25', 'A'),
(417, 2, 5, 55, '2024-09-25', 'A'),
(418, 2, 5, 56, '2024-09-25', 'A'),
(419, 2, 5, 57, '2024-09-25', 'A'),
(420, 2, 5, 58, '2024-09-25', 'A'),
(421, 2, 5, 59, '2024-09-25', 'A'),
(422, 2, 5, 60, '2024-09-25', 'A'),
(423, 2, 5, 61, '2024-09-25', 'A'),
(424, 2, 5, 62, '2024-09-25', 'A'),
(425, 2, 5, 63, '2024-09-25', 'A'),
(426, 2, 5, 64, '2024-09-25', 'A'),
(427, 2, 5, 65, '2024-09-25', 'A'),
(428, 2, 5, 66, '2024-09-25', 'A'),
(429, 2, 5, 67, '2024-09-25', 'A');


--Course Table *table change-->in -->use->datetime->course created*

create table course_Tbl
(
course_Id int not null,
course_Name varchar(500) not null,
course_Created datetime not null DEFAULT GETDATE()
);

select * from course_Tbl;


insert into course_Tbl(course_Id,course_Name,course_Created) values
(1, 'BCA', '2024-09-09 12:27:18'),
(2, 'BSCIT', '2024-09-09 12:27:29');

create procedure sp_getCourse
as
begin
select course_Tbl.course_Id,course_Tbl.course_Name from course_Tbl;
end

 sp_getCourse;

 ---get Year
  drop table student_Yearlevel;
 create table student_Yearlevel
 (
 year_Id bigint ,
 year_Name varchar(50)
 );

 insert into student_Yearlevel values(4,'Fourth-Year');
 select * from student_Yearlevel;

 create procedure sp_getStudentYearlevel
 as
 begin
 select student_Yearlevel.year_Id,student_Yearlevel.year_Name from student_Yearlevel;
 end

  --get gender

 create table student_Gender
 (
 gender_Id bigint ,
 gender_Name varchar(50)
 );

 insert into student_Gender values(1,'Male');
 insert into student_Gender values(2,'Female');

 select * from student_Gender;

  create procedure sp_getStudentGender
 as
 begin
 select student_Gender.gender_Id,student_Gender.gender_Name from student_Gender;
 end
--Class Table

create table class_Tbl
(
class_Id int not null,
course_Id int not null,
class_Name varchar(20) not null
);


--Examinee Table

create table examinee_Tbl
(
exmne_Id int not null,
exmne_Fullname varchar(1000) not null,
exmne_Course varchar(1000) not null,
exmne_Class int not null,
exmne_Gender varchar(1000) not null default 'Male',
exmne_Birthdate varchar(1000 not null,
exmne_Yearlevel varchar(1000) default null,
exmne_Email varchar(1000) not null,
exmne_Password varchar(1000) not null,
exmne_Status varchar(1000) not null default 'active',
session_Token varchar(255) default null
);

drop table examinee_Tbl;
drop procedure sp_InsertStudent;
 select * from examinee_Tbl;

 create procedure sp_SelectStudents
 as
 begin
 select exmne_Id, exmne_Fullname, exmne_Course, exmne_Class, exmne_Gender, exmne_Birthdate, exmne_Yearlevel, exmne_Email, exmne_Password, exmne_Status, session_Token
 from examinee_Tbl;
 end

 create procedure sp_InsertStudent
@Id int,
@Fullname varchar(1000),
@Course varchar(1000),
@Class int,
@Gender varchar(1000),
@Birthdate varchar(1000),
@Yearlevel varchar(1000),
@Email varchar(1000),
@Password varchar(1000)
 as
 begin
 insert into examinee_Tbl (exmne_Id, exmne_Fullname, exmne_Course, exmne_Class, exmne_Gender, exmne_Birthdate, exmne_Yearlevel, exmne_Email, exmne_Password) 
 values
 (@Id,@Fullname,@Course,@Class,@Gender,@Birthdate,@Yearlevel,@Email,@Password);
 end


create procedure sp_EditStudent
@Id int,
@Fullname varchar(1000),
@Course varchar(1000),
@Class int,
@Gender varchar(1000),
@Birthdate varchar(1000),
@Yearlevel varchar(1000),
@Email varchar(1000),
@Password varchar(1000),
@Status varchar(1000)
 as
 begin
 update examinee_Tbl set  exmne_Fullname=@Fullname, exmne_Course=@Course, exmne_Class=@Class, exmne_Gender=@Gender, exmne_Birthdate=@Birthdate, exmne_Yearlevel=@Yearlevel, exmne_Email=@Email, exmne_Password=@Password, exmne_Status=@Status where exmne_Id=@Id;
 end

 --get Student Class for distributed data form dropdownList.

 create table Adminclass_Tbl
(
class_Id int not null,
course_Id int not null,
class_Name varchar(20) not null
);


create procedure sp_getStudentClass
as
begin
select Adminclass_Tbl.class_Id,Adminclass_Tbl.course_Id,Adminclass_Tbl.class_Name from Adminclass_Tbl;
end


insert into class_Tb

l (class_Id,course_Id,class_Name) values
(1, 1, 'BCA-1(A)'),
(2, 1, 'BCA-1(B)'),
(3, 1, 'BCA-1(C)'),
(4, 1, 'BCA-1(D)'),
(5, 2, 'BSCIT-1(B1)'),
(6, 2, 'BSCIT-3(B1)'),
(7, 2, 'BSCIT-3(B2)');

 create procedure sp_getStudentClass
 @Id bigint
 as
 begin 

 create procedure sp_getSpecificStudent
 @Id int
 as
 begin
 select 
 select exmne_Id, exmne_Fullname, exmne_Course, exmne_Class, exmne_Gender, exmne_Birthdate, exmne_Yearlevel, exmne_Email, exmne_Password, exmne_Status from examinee_Tbl where exmne_Id=@Id;
 end

 create procedure sp_deleteStudent
 @Id bigint
 as
 begin
 update examinee_Tbl set exmne_Status='deactive' where exmne_Id=@Id;
 end

 create procedure sp_GetStudentData
@courseid bigint,
@classid bigint,
@rollid bigint
as
begin
select exmne_Fullname from examinee_Tbl where exmne_Class =@classid and roll_Id=@rollid  and exmne_Course =@courseid;
end

 
 insert into examinee_Tbl (exmne_Id, exmne_Fullname, exmne_Course, exmne_Class, exmne_Gender, exmne_Birthdate, exmne_Yearlevel, exmne_Email, exmne_Password, exmne_Status, session_Token) values
(1, 'Ambaliya Hit M', '2', 6, 'male', '2005-12-19', 'second year', 'BSCIT-3(B1)_1', '19122005', 'active', NULL),
(2, 'Babriya Krish M', '2', 6, 'male', '2005-05-13', 'second year', 'BSCIT-3(B1)_2', '13052005', 'active', NULL),
(3, 'Bhardiya Henil M', '2', 6, 'male', '2005-08-05', 'second year', 'BSCIT-3(B1)_6', '05082005', 'active', NULL),
(4, 'Bhuva Kenil P', '2', 6, 'male', '2005-10-23', 'second year', 'BSCIT-3(B1)_7', '23102005', 'active', NULL),
(5, 'Bhuva Vasu M', '2', 6, 'male', '2006-01-11', 'second year', 'BSCIT-3(B1)_8', '11012006', 'active', NULL),
(6, 'Borkhtariya Denish B', '2', 6, 'male', '2006-01-16', 'second year', 'BSCIT-3(B1)_9', '16012006', 'active', NULL),
(7, 'Chauhan Shubham K', '2', 6, 'male', '2006-02-27', 'second year', 'BSCIT-3(B1)_10', '27022006', 'active', NULL),
(8, 'Chudasama Bhavendrasinh N', '2', 6, 'male', '2006-04-19', 'second year', 'BSCIT-3(B1)_11', '19042006', 'active', NULL),
(9, 'Dave Kaushal N', '2', 6, 'male', '2005-04-14', 'second year', 'BSCIT-3(B1)_12', '14042005', 'active', NULL),
(10, 'Dhameliya Nirbhay K', '2', 6, 'male', '2006-03-22', 'second year', 'BSCIT-3(B1)_14', '22032006', 'active', NULL),
(11, 'Dobariya Jeel B', '2', 6, 'male', '2006-09-02', 'second year', 'BSCIT-3(B1)_15', '02092006', 'active', NULL),
(12, 'Domadiya Yash N', '2', 6, 'male', '2005-12-28', 'second year', 'BSCIT-3(B1)_16', '28122005', 'active', NULL),
(13, 'Dudhatra Yash V', '2', 6, 'male', '2005-10-08', 'second year', 'BSCIT-3(B1)_17', '08102005', 'active', NULL),
(14, 'Gauswami Aakashpuri R', '2', 6, 'male', '2006-03-06', 'second year', 'BSCIT-3(B1)_18', '06032006', 'active', NULL),
(15, 'Gujarati Jayraj B', '2', 6, 'male', '2006-07-11', 'second year', 'BSCIT-3(B1)_20', '11072006', 'active', NULL),
(16, 'Hirpara Hitesh V', '2', 6, 'male', '2004-10-09', 'second year', 'BSCIT-3(B1)_21', '09102004', 'active', NULL),
(17, 'Jalera Yogesh G', '2', 6, 'male', '2005-10-11', 'second year', 'BSCIT-3(B1)_22', '11102005', 'active', NULL),
(18, 'Kamliya Ravi B', '2', 6, 'male', '2006-06-21', 'second year', 'BSCIT-3(B1)_24', '21062006', 'active', NULL),
(19, 'Kaneriya Shyam N', '2', 6, 'male', '2005-07-23', 'second year', 'BSCIT-3(B1)_25', '23072005', 'active', NULL),
(20, 'Kapdi Rajesh P', '2', 6, 'male', '2004-08-21', 'second year', 'BSCIT-3(B1)_26', '21082004', 'active', NULL),
(21, 'Kargthiya Parth R', '2', 6, 'male', '2006-07-02', 'second year', 'BSCIT-3(B1)_28', '02072006', 'active', NULL),
(22, 'Kathi Sahil J', '2', 6, 'male', '2006-02-16', 'second year', 'BSCIT-3(B1)_30', '16022006', 'active', NULL),
(23, 'Karmur Ravi N', '2', 6, 'male', '2006-04-15', 'second year', 'BSCIT-3(B1)_29', '15042006', 'active', NULL),
(24, 'Khanpara Jaldeep S', '2', 6, 'male', '2006-01-30', 'second year', 'BSCIT-3(B1)_31', '30012006', 'active', NULL),
(25, 'Madam Hiren M', '2', 6, 'male', '2004-09-10', 'second year', 'BSCIT-3(B1)_33', '10092004', 'active', NULL),
(26, 'Makadiya Nand M', '2', 6, 'male', '2005-10-07', 'second year', 'BSCIT-3(B1)_34', '07102005', 'active', NULL),
(27, 'Memon Amaan S', '2', 6, 'male', '2004-10-30', 'second year', 'BSCIT-3(B1)_37', '30102004', 'active', NULL),
(28, 'Movaliya Renish M', '2', 6, 'male', '2005-11-01', 'second year', 'BSCIT-3(B1)_38', '01112005', 'active', NULL),
(29, 'Paghdar Marmik P', '2', 6, 'male', '2006-08-24', 'second year', 'BSCIT-3(B1)_39', '24082006', 'active', NULL),
(30, 'Ramani Harsh V', '2', 6, 'male', '2004-10-08', 'second year', 'BSCIT-3(B1)_42', '08102004', 'active', NULL),
(31, 'Sinhar Jay B', '2', 6, 'male', '2005-09-14', 'second year', 'BSCIT-3(B1)_44', '14092005', 'active', NULL),
(32, 'Sinhar Kishan J', '2', 6, 'male', '2006-07-22', 'second year', 'BSCIT-3(B1)_45', '22072006', 'active', NULL),
(33, 'Prajapati Divyesh J', '2', 6, 'male', '2006-06-20', 'second year', 'BSCIT-3(B1)_41', '20062006', 'active', NULL),
(34, 'Sharma Parth P', '2', 6, 'male', '2005-06-03', 'second year', 'BSCIT-3(B1)_43', '03062005', 'active', NULL),
(35, 'Sudani Meet V', '2', 6, 'male', '2006-06-03', 'second year', 'BSCIT-3(B1)_50', '03062006', 'active', NULL),
(36, 'Sisodiya Ronak R', '2', 6, 'male', '2006-01-11', 'second year', 'BSCIT-3(B1)_47', '11012006', 'active', NULL),
(37, 'Sojitra Krish M', '2', 6, 'male', '2005-10-24', 'second year', 'BSCIT-3(B1)_48', '24102005', 'active', NULL),
(38, 'Bhalgariya Divyasinh H', '2', 6, 'male', '2006-03-29', 'second year', 'BSCIT-3(B1)_5', '29032006', 'active', NULL),
(39, 'Talaviya Deep K', '2', 6, 'male', '2006-02-02', 'second year', 'BSCIT-3(B1)_52', '02022006', 'active', NULL),
(40, 'Suva Abhi J', '2', 6, 'male', '2006-01-09', 'second year', 'BSCIT-3(B1)_51', '09012006', 'active', NULL),
(41, 'Vadher Parth N', '2', 6, 'male', '2005-03-25', 'second year', 'BSCIT-3(B1)_55', '25032005', 'active', NULL),
(42, 'Vagdiya Man V', '2', 6, 'male', '2006-07-30', 'second year', 'BSCIT-3(B1)_56', '30072006', 'active', NULL),
(44, 'Vala Bhargav R', '2', 6, 'male', '2005-11-06', 'second year', 'BSCIT-3(B1)_58', '06112005', 'active', NULL),
(45, 'Vagdiya Meet V', '2', 6, 'male', '2006-07-30', 'second year', 'BSCIT-3(B1)_57', '30072006', 'active', NULL),
(46, 'Varsani Parth M', '2', 6, 'male', '2005-11-26', 'second year', 'BSCIT-3(B1)_59', '26112005', 'active', NULL),
(47, 'Gondaliya Keyur P', '2', 6, 'male', '2005-10-23', 'second year', 'BSCIT-3(B1)_19', '23102005', 'active', NULL),
(48, 'Vyas Aditya C', '2', 6, 'male', '2005-09-11', 'second year', 'BSCIT-3(B1)_60', '11092005', 'active', NULL),
(49, 'Bambhroliya Vinay S', '2', 6, 'male', '2005-06-06', 'second year', 'BSCIT-3(B1)_3', '06062005', 'active', NULL),
(50, 'Baldaniya Harshad H', '2', 7, 'male', '2005-02-23', 'second year', 'BSCIT-3(B2)_1', '23022005', 'active', NULL),
(51, 'Bhakhar Parth L', '2', 7, 'male', '2005-08-09', 'second year', 'BSCIT-3(B2)_5', '09082005', 'active', NULL),
(52, 'Barad Deep A', '2', 7, 'male', '2005-11-12', 'second year', 'BSCIT-3(B2)_3', '12112005', 'active', NULL),
(53, 'Bhut Siddh A', '2', 7, 'male', '2006-04-23', 'second year', 'BSCIT-3(B2)_7', '23042006', 'active', NULL),
(54, 'Chauhan Jenish B', '2', 7, 'male', '2006-07-12', 'second year', 'BSCIT-3(B2)_8', '12072006', 'active', NULL),
(55, 'Bhammar Raju D', '2', 7, 'male', '2003-11-23', 'second year', 'BSCIT-3(B2)_6', '23112003', 'active', NULL),
(56, 'Dodiya Shreyjeetsinh U', '2', 7, 'male', '2000-12-30', 'second year', 'BSCIT-3(B2)_12', '30122000', 'active', NULL),
(57, 'Dadhaniya Om R', '2', 7, 'male', '2006-02-04', 'second year', 'BSCIT-3(B2)_11', '04022006', 'active', NULL),
(58, 'Chhaya Yagnik K', '2', 7, 'male', '2005-09-11', 'second year', 'BSCIT-3(B2)_9', '11092005', 'active', NULL),
(59, 'Humbal Devang M', '2', 7, 'male', '2004-07-12', 'second year', 'BSCIT-3(B2)_16', '12072004', 'active', NULL),
(60, 'Karena Jay R', '2', 7, 'male', '2005-11-07', 'second year', 'BSCIT-3(B2)_24', '07112005', 'active', NULL),
(61, 'Kagda Raviraj B', '2', 7, 'male', '2005-12-25', 'second year', 'BSCIT-3(B2)_21', '25122005', 'active', NULL),
(62, 'Kamliya Virendra V', '2', 7, 'male', '2006-02-21', 'second year', 'BSCIT-3(B2)_22', '21022006', 'active', NULL),
(63, 'Kamriya Divyesh V', '2', 7, 'male', '2006-08-23', 'second year', 'BSCIT-3(B2)_23', '23082006', 'active', NULL),
(64, 'Kodavla Rakesh D', '2', 7, 'male', '2006-01-22', 'second year', 'BSCIT-3(B2)_30', '22012006', 'active', NULL),
(65, 'Kodavla Krish P', '2', 7, 'male', '2006-05-01', 'second year', 'BSCIT-3(B2)_29', '01052006', 'active', NULL),
(66, 'Khunt Deep R', '2', 7, 'male', '2004-05-14', 'second year', 'BSCIT-3(B2)_28', '14052004', 'active', NULL),
(67, 'Kathiriya Dhruvit H', '2', 7, 'male', '2005-01-10', 'second year', 'BSCIT-3(B2)_26', '10012005', 'active', NULL),
(68, 'Makvana Jitendra C', '2', 7, 'male', '2006-01-05', 'second year', 'BSCIT-3(B2)_32', '05012006', 'active', NULL),
(69, 'Mathukiya Dishant V', '2', 7, 'male', '2006-06-18', 'second year', 'BSCIT-3(B2)_34', '18062006', 'active', NULL),
(70, 'Rakholiya Deval G', '2', 7, 'male', '2005-08-08', 'second year', 'BSCIT-3(B2)_38', '08082005', 'active', NULL),
(71, 'Nakum Kiran N', '2', 7, 'male', '2003-10-16', 'second year', 'BSCIT-3(B2)_36', '16102003', 'active', NULL),
(72, 'Savaliya Prit H', '2', 7, 'male', '2006-02-17', 'second year', 'BSCIT-3(B2)_42', '17022006', 'active', NULL),
(73, 'Sindhav Harshad H', '2', 7, 'male', '2006-05-04', 'second year', 'BSCIT-3(B2)_43', '04052006', 'active', NULL),
(74, 'Sisodiya Dharmaraj S', '2', 7, 'male', '2005-07-22', 'second year', 'BSCIT-3(B2)_44', '22072005', 'active', NULL),
(75, 'Solanki Akshit M', '2', 7, 'male', '2006-02-13', 'second year', 'BSCIT-3(B2)_49', '13022006', 'active', NULL),
(76, 'Sojitra Fenil K', '2', 7, 'male', '2006-03-24', 'second year', 'BSCIT-3(B2)_47', '24032006', 'active', NULL),
(77, 'Solanki Dhaval R', '2', 7, 'male', '2006-06-14', 'second year', 'BSCIT-3(B2)_50', '14062006', 'active', NULL),
(78, 'Sisodiya Pruthviraj M', '2', 7, 'male', '2005-11-27', 'second year', 'BSCIT-3(B2)_46', '27112005', 'active', NULL),
(79, 'solanki Arjun M', '2', 7, 'male', '2006-08-03', 'second year', 'BSCIT-3(B2)_48', '03082006', 'active', NULL),
(80, 'Sorathiya Rutvik P', '2', 7, 'male', '2005-07-15', 'second year', 'BSCIT-3(B2)_51', '15072005', 'active', NULL),
(81, 'Thummar Jaydip J', '2', 7, 'male', '2006-02-26', 'second year', 'BSCIT-3(B2)_52', '26022006', 'active', NULL),
(82, 'Vadi Keyur B', '2', 7, 'male', '2006-04-05', 'second year', 'BSCIT-3(B2)_56', '05042006', 'active', NULL),
(83, 'Vaja Harshal R', '2', 7, 'male', '2006-03-10', 'second year', 'BSCIT-3(B2)_58', '10032006', 'active', NULL),
(84, 'Vadher Ashok R', '2', 6, 'male', '2005-09-21', 'second year', 'BSCIT-3(B1)_54', '21092005', 'active', NULL),
(85, 'Lakhani Harshdip R', '2', 6, 'male', '2006-05-05', 'second year', 'BSCIT-3(B1)_32', '05052006', 'active', NULL),
(86, 'Karangiya Hardik K', '2', 6, 'male', '2006-08-22', 'second year', 'BSCIT-3(B1)_27', '22082006', 'active', NULL),
(87, 'BADIYAVADRA HARDIK PALABHAI', '2', 5, 'male', '12-11-2006', 'first year', 'BSCIT-1(B1)_1', '12112006', 'active', NULL),
(88, 'BARAD PARTH KANABHAI', '2', 5, 'male', '11-08-2005', 'first year', 'BSCIT-1(B1)_2', '08112005', 'active', NULL),
(89, 'BARAIYA VIJAY MANUBHAI', '2', 5, 'male', '07-11-2007', 'first year', 'BSCIT-1(B1)_3', '11072007', 'active', NULL),
(90, 'BAVISHIYA BHAUTIK VIPULBHAI', '2', 5, 'male', '10-07-2006', 'first year', 'BSCIT-1(B1)_4', '10072006', 'active', NULL),
(91, 'BHADARKA NANDAN TARUNKUMAR', '2', 5, 'male', '21-02-2006', 'first year', 'BSCIT-1(B1)_5', '21022006', 'active', NULL),
(92, 'BHALGARIYA HARDIK RAMBHAI', '2', 5, 'male', '02-02-2007', 'first year', 'BSCIT-1(B1)_6', '02022007', 'active', NULL),
(93, 'BORKHATARIYA NAIMISH VIJAYBHAI', '2', 5, 'male', '19-12-2006', 'first year', 'BSCIT-1(B1)_7', '19122006', 'active', NULL),
(94, 'CHAUHAN PRADIP HASMUKHBHAI', '2', 5, 'male', '14-12-2006', 'first year', 'BSCIT-1(B1)_8', '14122006', 'active', NULL),
(95, 'CHAUHAN SAMIR VINODBHAI', '2', 5, 'male', '08-12-2005', 'first year', 'BSCIT-1(B1)_9', '08122005', 'active', NULL),
(96, 'CHAUHAN VISHAL MANJIBHAI', '2', 5, 'male', '29-09-2003', 'first year', 'BSCIT-1(B1)_10', '29092003', 'active', NULL),
(97, 'CHAVDA KASHYAP RAJABHAI', '2', 5, 'male', '29-03-2004', 'first year', 'BSCIT-1(B1)_11', '29032004', 'active', NULL),
(98, 'CHOTALIYA SHARAD VINODBHAI', '2', 5, 'male', '19-02-2007', 'first year', 'BSCIT-1(B1)_12', '19022007', 'active', NULL),
(99, 'DABHI HARSH MANUBHAI', '2', 5, 'male', '01-03-2007', 'first year', 'BSCIT-1(B1)_13', '01032007', 'active', NULL),
(100, 'DABHI PRINCE HARESHBHAI', '2', 5, 'male', '11-01-2007', 'first year', 'BSCIT-1(B1)_14', '11012007', 'active', NULL),
(101, 'DAFDA BIPIN BHIMJIBHAI', '2', 5, 'male', '17-05-2007', 'first year', 'BSCIT-1(B1)_15', '17052007', 'active', NULL),
(102, 'DER UTTAM RAMESHBHAI', '2', 5, 'male', '31-12-2006', 'first year', 'BSCIT-1(B1)_16', '31122006', 'active', NULL),
(103, 'DHRANGAD MILAN NARENDRABHAI', '2', 5, 'male', '29-09-2007', 'first year', 'BSCIT-1(B1)_17', '29092007', 'active', NULL),
(104, 'DOBARIYA RENSH JITENDARBHAI', '2', 5, 'male', '19-11-2006', 'first year', 'BSCIT-1(B1)_18', '19112006', 'active', NULL),
(105, 'GATHANI KEVAL MANISHBHAI', '2', 5, 'male', '14-09-2006', 'first year', 'BSCIT-1(B1)_19', '14092006', 'active', NULL),
(106, 'GIDA JAYPAL DILABHAI', '2', 5, 'male', '01-03-2006', 'first year', 'BSCIT-1(B1)_20', '03012006', 'active', NULL),
(107, 'GOHEL DHANANJAY HARSHADBHAI', '2', 5, 'male', '29-10-2006', 'first year', 'BSCIT-1(B1)_21', '29102006', 'active', NULL),
(108, 'HIRANI JAYKUMAR NATAVARBHAI', '2', 5, 'male', '15-06-2006', 'first year', 'BSCIT-1(B1)_22', '15062006', 'active', NULL),
(109, 'JADVANI AXIT RAJNIKANTBHAI', '2', 5, 'male', '04-02-2006', 'first year', 'BSCIT-1(B1)_23', '02042006', 'active', NULL),
(110, 'JOSHI JAL MUKESHBHAI', '2', 5, 'male', '15-03-2007', 'first year', 'BSCIT-1(B1)_24', '15032007', 'active', NULL),
(111, 'KACHHADIYA RAJ JAMNADAS', '2', 5, 'male', '05-07-2006', 'first year', 'BSCIT-1(B1)_25', '05072006', 'active', NULL),
(112, 'KAGDA BANESINH PRAVINBHAI', '2', 5, 'male', '07-12-2007', 'first year', 'BSCIT-1(B1)_26', '12072007', 'active', NULL),
(113, 'KANET BHAVIN RAVAJIBHAI', '2', 5, 'male', '05-07-2007', 'first year', 'BSCIT-1(B1)_27', '07052007', 'active', NULL),
(114, 'KANJARIYA SMIT SHAILESHBHAI', '2', 5, 'male', '08-09-2006', 'first year', 'BSCIT-1(B1)_28', '08092006', 'active', NULL),
(115, 'KAPADIYA HARSH ASHVINBHAI', '2', 5, 'male', '19-06-2007', 'first year', 'BSCIT-1(B1)_29', '19062007', 'active', NULL),
(116, 'KODAVALA YASH RAJESHBHAI', '2', 5, 'male', '29-06-2007', 'first year', 'BSCIT-1(B1)_30', '29062007', 'active', NULL),
(117, 'KORIYA DHARMESHKUMAR MANUBHAI', '2', 5, 'male', '20-09-2007', 'first year', 'BSCIT-1(B1)_31', '20092007', 'active', NULL),
(118, 'KORIYA NIRAVKUMAR JENTIBHAI', '2', 5, 'male', '22-08-2007', 'first year', 'BSCIT-1(B1)_32', '22082007', 'active', NULL),
(119, 'KOTADIYA SMIT RAMESHBHAI', '2', 5, 'male', '11-08-2006', 'first year', 'BSCIT-1(B1)_33', '11082006', 'active', NULL),
(120, 'KOTHIVAL RAJVIR KARSHANBHAI', '2', 5, 'male', '30-05-2007', 'first year', 'BSCIT-1(B1)_34', '30052007', 'active', NULL),
(121, 'LAKHANOTRA HARSH NANUBHAI', '2', 5, 'male', '11-11-2006', 'first year', 'BSCIT-1(B1)_35', '11112006', 'active', NULL),
(122, 'LIMBASIYA JENIL SHAILESHBHAI', '2', 5, 'male', '26-08-2007', 'first year', 'BSCIT-1(B1)_36', '26082007', 'active', NULL),
(123, 'MALAVIYA ANKUR CHIMANBHAI', '2', 5, 'male', '11-09-2006', 'first year', 'BSCIT-1(B1)_37', '11092006', 'active', NULL),
(124, 'MATHUKIYA JENISH RAMESHBHAI', '2', 5, 'male', '20-01-2007', 'first year', 'BSCIT-1(B1)_38', '20012007', 'active', NULL),
(125, 'MAVADIYA HARSHKUMAR SANJAYBHAI', '2', 5, 'male', '08-11-2007', 'first year', 'BSCIT-1(B1)_39', '11082007', 'active', NULL),
(126, 'NARIYA HARMISH ABCDBHAI', '2', 5, 'male', '26-07-2006', 'first year', 'BSCIT-1(B1)_40', '26072006', 'active', NULL),
(127, 'NIMAVAT MIT ABCDBHAI', '2', 5, 'male', '24-11-2005', 'first year', 'BSCIT-1(B1)_41', '24112005', 'active', NULL),
(128, 'PANDYA VIVEK ASHVINBHAI', '2', 5, 'male', '25-03-2007', 'first year', 'BSCIT-1(B1)_42', '25032007', 'active', NULL),
(129, 'PANERA PRAKASH HARDASBHAI', '2', 5, 'male', '01-11-2007', 'first year', 'BSCIT-1(B1)_43', '11012007', 'active', NULL),
(130, 'PARMAR MIT ABCDBHAI', '2', 5, 'male', '11-09-2007', 'first year', 'BSCIT-1(B1)_44', '11092007', 'active', NULL),
(131, 'PITHIYA DAX MALDE', '2', 5, 'male', '09-06-2007', 'first year', 'BSCIT-1(B1)_45', '09062007', 'active', NULL),
(132, 'RATHOD HARSIDDHKUMAR JAMNADAS', '2', 5, 'male', '05-06-2006', 'first year', 'BSCIT-1(B1)_46', '06052006', 'active', NULL),
(133, 'RATHOD KALPESH RAMESHBHAI', '2', 5, 'male', '05-07-2005', 'first year', 'BSCIT-1(B1)_47', '05072005', 'active', NULL),
(134, 'RATHOD KRISHKUMAR HARESHBHAI', '2', 5, 'male', '16-09-2006', 'first year', 'BSCIT-1(B1)_48', '16092006', 'active', NULL),
(135, 'SAGAR ARYANKUMAR DIPAKBHAI', '2', 5, 'male', '12-09-2006', 'first year', 'BSCIT-1(B1)_49', '12092006', 'active', NULL),
(136, 'SAVALIYA ZEEL DHARMESHBHAI', '2', 5, 'male', '23-12-2006', 'first year', 'BSCIT-1(B1)_50', '23122006', 'active', NULL),
(137, 'SINDHAV AJAY VIKRAMBHAI', '2', 5, 'male', '07-10-2007', 'first year', 'BSCIT-1(B1)_51', '10072007', 'active', NULL),
(138, 'SISODIYA YOVRAJSINH VIKRAMBHAI', '2', 5, 'male', '25-04-2007', 'first year', 'BSCIT-1(B1)_52', '25042007', 'active', NULL),
(139, 'SOLANKI HARSH RAMESHBHAI', '2', 5, 'male', '18-09-2006', 'first year', 'BSCIT-1(B1)_53', '18092006', 'active', NULL),
(140, 'TALAVIYA LOMESH UMESHBHAI', '2', 5, 'male', '28-07-2005', 'first year', 'BSCIT-1(B1)_54', '28072005', 'active', NULL),
(141, 'TANK DEEP HARESHBHAI', '2', 5, 'male', '07-10-2006', 'first year', 'BSCIT-1(B1)_55', '07102006', 'active', NULL),
(142, 'VADHEL DIVYESHBHAI SHAMJIBHAI', '2', 5, 'male', '07-08-2007', 'first year', 'BSCIT-1(B1)_56', '08072007', 'active', NULL),
(143, 'VADHER AJAYKUMAR HIRENBHAI', '2', 5, 'male', '04-08-2007', 'first year', 'BSCIT-1(B1)_57', '08042007', 'active', NULL),
(144, 'VADHER DHRUVIT RAMESHBHAI', '2', 5, 'male', '30-06-2007', 'first year', 'BSCIT-1(B1)_58', '30062007', 'active', NULL),
(145, 'VALA HARMITKUMAR NILESHBHAI', '2', 5, 'male', '13-08-2007', 'first year', 'BSCIT-1(B1)_59', '13082007', 'active', NULL),
(146, 'VANAVI PREM HARIBHAI', '2', 5, 'male', '24-12-2005', 'first year', 'BSCIT-1(B1)_60', '24122005', 'active', NULL),
(147, 'VYAS VIVEK TEJAS', '2', 5, 'male', '13-09-2006', 'first year', 'BSCIT-1(B1)_61', '13092006', 'active', NULL),
(148, 'YADAV NAKUL RAKESHBHAI', '2', 5, 'male', '27-09-2006', 'first year', 'BSCIT-1(B1)_62', '27092006', 'active', NULL),
(149, 'ZALA HARSH MAHESHBHAI', '2', 5, 'male', '05-01-2007', 'first year', 'BSCIT-1(B1)_63', '05012007', 'active', NULL),
(150, 'BABARIYA MIT RAMESHBHAI', '2', 5, 'male', '18-07-2007', 'first year', 'BSCIT-1(B1)_64', '18072007', 'active', NULL),
(151, 'BARAD KRIPAL RAMESHBHAI', '2', 5, 'male', '5/29/2006', 'first year', 'BSCIT-1(B1)_65', '29052006', 'active', NULL),
(152, 'VIRGAMA BHAVIN SURESHBHAI', '2', 5, 'male', '21-12-2006', 'first year', 'BSCIT-1(B1)_66', '21122006', 'active', NULL),
(153, 'THUMMAR SHYAM BHAVANBHAI', '2', 5, 'male', '25-04-2006', 'first year', 'BSCIT-1(B1)_67', '25042006', 'active', NULL),
(154, 'AJAKIYA PRITKUMAR ABCDBHAI', '1', 1, 'male', '10-01-2007', 'first year', 'BCA-1(A)_1', '10012007', 'active', NULL),
(155, 'AJANI MOHIT SANJAYBHAI', '1', 1, 'male', '02-05-2007', 'first year', 'BCA-1(A)_2', '05022007', 'active', NULL),
(156, 'BAGIYA ABHISHEK DINESHBHAI', '1', 1, 'male', '21-03-2007', 'first year', 'BCA-1(A)_3', '21032007', 'active', NULL),
(157, 'BALAI SAVANKUMAR KANABHAI', '1', 1, 'male', '23-05-2006', 'first year', 'BCA-1(A)_4', '23052006', 'active', NULL),
(158, 'BAMROLIYA BRIJ ABCDBHAI', '1', 1, 'male', '07-11-2006', 'first year', 'BCA-1(A)_5', '11072006', 'active', NULL),
(159, 'BHAKHAR KUNJ SANJAYBHAI', '1', 1, 'male', '13-10-2006', 'first year', 'BCA-1(A)_6', '13102006', 'active', NULL),
(160, 'BHATT DHARMIK KETANBHAI', '1', 1, 'male', '30-09-2006', 'first year', 'BCA-1(A)_7', '30092006', 'active', NULL),
(161, 'BHATTI SANDIP BHARATBHAI', '1', 1, 'male', '26-12-2006', 'first year', 'BCA-1(A)_8', '26122006', 'active', NULL),
(162, 'CHAUHAN SHOBHAN RASIKBHAI', '1', 1, 'male', '04-10-2006', 'first year', 'BCA-1(A)_9', '04102006', 'active', NULL),
(163, 'CHAVADA MANDIP KARMANBHAI', '1', 1, 'male', '03-02-2007', 'first year', 'BCA-1(A)_10', '02032007', 'active', NULL),
(164, 'CHUDASAMA SAGAR RAKESH', '1', 1, 'male', '21-01-2007', 'first year', 'BCA-1(A)_11', '21012007', 'active', NULL),
(165, 'DABHI DHRUV RAMESHBHAI', '1', 1, 'male', '10-10-2005', 'first year', 'BCA-1(A)_12', '10102005', 'active', NULL),
(166, 'DABHI JEMS BHIKHABHAI', '1', 1, 'male', '03-07-2007', 'first year', 'BCA-1(A)_13', '03072007', 'active', NULL),
(167, 'DHADUK PARTHIV RAJESHBHAI', '1', 1, 'male', '20-07-2007', 'first year', 'BCA-1(A)_14', '20072007', 'active', NULL),
(168, 'DHUNT BHAVIN VASARAMBHAI', '1', 1, 'male', '06-02-2007', 'first year', 'BCA-1(A)_15', '02062007', 'active', NULL),
(169, 'DODIYA DIYANG NAYANBHAI', '1', 1, 'male', '09-10-2006', 'first year', 'BCA-1(A)_16', '10092006', 'active', NULL),
(170, 'GADHIYA BHAVY YOGESHBHAI', '1', 1, 'male', '05-06-2007', 'first year', 'BCA-1(A)_17', '06052007', 'active', NULL),
(171, 'GADHVI KARMDEEP BHARATBHAI', '1', 1, 'male', '19-08-2006', 'first year', 'BCA-1(A)_18', '19082006', 'active', NULL),
(172, 'GINIYA KRISH MANISHBHAI', '1', 1, 'male', '13-10-2006', 'first year', 'BCA-1(A)_19', '13102006', 'active', NULL),
(173, 'GODHWANI KARAN RAMCHAND', '1', 1, 'male', '18-03-2005', 'first year', 'BCA-1(A)_20', '18032005', 'active', NULL),
(174, 'GONDALIYA JEEL BHIKHABHAI', '1', 1, 'male', '20-01-2007', 'first year', 'BCA-1(A)_21', '20012007', 'active', NULL),
(175, 'HATHALIYA RAHULKUMAR SARMANBHAI', '1', 1, 'male', '02-08-2006', 'first year', 'BCA-1(A)_22', '02082006', 'active', NULL),
(176, 'HIRAPARA SMIT MANISHBHAI', '1', 1, 'male', '24-09-2007', 'first year', 'BCA-1(A)_23', '24092007', 'active', NULL),
(177, 'JADAV NIKHIL KANTILAL', '1', 1, 'male', '05-11-2005', 'first year', 'BCA-1(A)_24', '05112005', 'active', NULL),
(178, 'JOTANGIYA MITKUMAR MUKESHBHAI', '1', 1, 'male', '02-03-2007', 'first year', 'BCA-1(A)_25', '02032007', 'active', NULL),
(179, 'KAMALIYA PARTH DEVSHIBHAI', '1', 1, 'male', '20-01-2006', 'first year', 'BCA-1(A)_26', '20012006', 'active', NULL),
(180, 'KARENA SUMIT BHANJIBHAI', '1', 1, 'male', '07-08-2007', 'first year', 'BCA-1(A)_27', '08072007', 'active', NULL),
(181, 'KATARA KEVAL CHANABHAI', '1', 1, 'male', '29-04-2005', 'first year', 'BCA-1(A)_28', '29042005', 'active', NULL),
(182, 'KOTADIYA MOHIT CHAKUBHAI', '1', 1, 'male', '12-12-2006', 'first year', 'BCA-1(A)_29', '12122006', 'active', NULL),
(183, 'KUBAVAT HITARTH MAYURBHAI', '1', 1, 'male', '10-12-2006', 'first year', 'BCA-1(A)_30', '09122006', 'active', NULL),
(184, 'LADVA MEET JAGDISHBHAI', '1', 1, 'male', '30-07-2006', 'first year', 'BCA-1(A)_31', '30072006', 'active', NULL),
(185, 'MAKWANA DEVANG SANJAYBHAI', '1', 1, 'male', '10-09-2006', 'first year', 'BCA-1(A)_32', '10092006', 'active', NULL),
(186, 'MARU HARDIKKUMAR HARSUKHBHAI', '1', 1, 'male', '17-03-2007', 'first year', 'BCA-1(A)_33', '17032007', 'active', NULL),
(187, 'MATHUKIYA VRUNDAN RAMESHBHAI', '1', 1, 'male', '29-01-2007', 'first year', 'BCA-1(A)_34', '29012007', 'active', NULL),
(188, 'MEHTA HRIMKAR VIMALBHAI', '1', 1, 'male', '08-02-2006', 'first year', 'BCA-1(A)_35', '02082006', 'active', NULL),
(189, 'MESWANIYA VEDANT JITENDRA', '1', 1, 'male', '01-01-2007', 'first year', 'BCA-1(A)_36', '01012007', 'active', NULL),
(190, 'NANDHA JIMIT VIPULBHAI', '1', 1, 'male', '10-03-2006', 'first year', 'BCA-1(A)_37', '03102006', 'active', NULL),
(191, 'NIMAVAT RAHUL DINESHBHAI', '1', 1, 'male', '25-09-2006', 'first year', 'BCA-1(A)_38', '25092006', 'active', NULL),
(192, 'ODEDARA VANRAJ VINUBHAI', '1', 1, 'male', '29-11-2006', 'first year', 'BCA-1(A)_39', '29112006', 'active', NULL),
(193, 'PANARA RHYTHM ARVINDBHAI', '1', 1, 'male', '05-04-2007', 'first year', 'BCA-1(A)_40', '05042007', 'active', NULL),
(194, 'PANDYA ABHISHEK JAYESH', '1', 1, 'male', '22-02-2007', 'first year', 'BCA-1(A)_41', '22022007', 'active', NULL),
(195, 'PARMAR BHAUTIK LAXMANBHAI', '1', 1, 'male', '03-09-2006', 'first year', 'BCA-1(A)_42', '03092006', 'active', NULL),
(196, 'PARMAR DIPEN BHARATBHAI', '1', 1, 'male', '09-08-2006', 'first year', 'BCA-1(A)_43', '08092006', 'active', NULL),
(197, 'PARMAR JEET MANISHBHAI', '1', 1, 'male', '05-08-2007', 'first year', 'BCA-1(A)_44', '08052007', 'active', NULL),
(198, 'PARMAR RAVI KARSHANBHAI', '1', 1, 'male', '27-07-2006', 'first year', 'BCA-1(A)_45', '27072006', 'active', NULL),
(199, 'SAIYAD AMAN VAHIDBHAI', '1', 1, 'male', '23-04-2005', 'first year', 'BCA-1(A)_46', '23042005', 'active', NULL),
(200, 'SAIYAD RIHAN SHAHIDBHAI', '1', 1, 'male', '21-09-2006', 'first year', 'BCA-1(A)_47', '21092006', 'active', NULL),
(201, 'SHINGADIYA DHARMIK ALPESHBHAI', '1', 1, 'male', '14-11-2007', 'first year', 'BCA-1(A)_48', '14112007', 'active', NULL),
(202, 'SHYARA DARSHAL BHUPATBHAI', '1', 1, 'male', '01-06-2007', 'first year', 'BCA-1(A)_49', '06012007', 'active', NULL),
(203, 'SOLANKI DEVANG GOVINDBHAI', '1', 1, 'male', '03-01-2006', 'first year', 'BCA-1(A)_50', '01032006', 'active', NULL),
(204, 'SOLANKI HARDIK CHANDUBHAI', '1', 1, 'male', '05-04-2006', 'first year', 'BCA-1(A)_51', '04052006', 'active', NULL),
(205, 'SOLANKI JIT PARBATBHAI', '1', 1, 'male', '01-02-2006', 'first year', 'BCA-1(A)_52', '02012006', 'active', NULL),
(206, 'SOLANKI SRAVAN VIJAYBHAI', '1', 1, 'male', '20-09-2006', 'first year', 'BCA-1(A)_53', '20092006', 'active', NULL),
(207, 'SORATHIYA MOHAMD MO.ALTAF', '1', 1, 'male', '09-08-2005', 'first year', 'BCA-1(A)_54', '08092005', 'active', NULL),
(208, 'TANK HARSH JAGDISHBHAI', '1', 1, 'male', '09-09-2007', 'first year', 'BCA-1(A)_55', '09092007', 'active', NULL),
(209, 'TEJANI JATIN RAVJIBHAI', '1', 1, 'male', '12-06-2005', 'first year', 'BCA-1(A)_56', '06122005', 'active', NULL),
(210, 'TRIVEDI MANTHAN VIJAYBHAI', '1', 1, 'male', '17-09-2006', 'first year', 'BCA-1(A)_57', '17092006', 'active', NULL),
(211, 'VAJA PARTH DEVRAJBHAI', '1', 1, 'male', '31-01-2005', 'first year', 'BCA-1(A)_58', '31012005', 'active', NULL),
(212, 'VALA DHRUV DEVSHIBHAI', '1', 1, 'male', '06-01-2007', 'first year', 'BCA-1(A)_59', '01062007', 'active', NULL),
(213, 'VEGAD YASHRAJ AJITBHAI', '1', 1, 'male', '03-11-2007', 'first year', 'BCA-1(A)_60', '11032007', 'active', NULL),
(214, 'ZALA PRUTHVIRAJ HARIBHAI', '1', 1, 'male', '09-06-2007', 'first year', 'BCA-1(A)_61', '06092007', 'active', NULL),
(215, 'AMBALIYA HITESH AALABHAI', '1', 2, 'male', '20-06-2004', 'first year', 'BCA-1(B)_1', '20062004', 'active', NULL),
(216, 'BHEDA PRATIK MAHESHBHAI', '1', 2, 'male', '17-03-2006', 'first year', 'BCA-1(B)_2', '17032006', 'active', NULL),
(217, 'CHAVDA DHARMESH RANJIBHAI', '1', 2, 'male', '21-09-2007', 'first year', 'BCA-1(B)_3', '21092007', 'active', NULL),
(218, 'CHOCHA JAYKUMAR RANMALBHAI', '1', 2, 'male', '20-01-2007', 'first year', 'BCA-1(B)_4', '20012007', 'active', NULL),
(219, 'CHOTALIYA RAJ PARSOTAMBHAI', '1', 2, 'male', '30-05-2007', 'first year', 'BCA-1(B)_5', '30052007', 'active', NULL),
(220, 'CHUDASAMA GAURAV BHIMJIBHAI', '1', 2, 'male', '28-02-2006', 'first year', 'BCA-1(B)_6', '28022006', 'active', NULL),
(221, 'DABHI KAUSHIKKUMAR ABCDBHAI', '1', 2, 'male', '10-08-2007', 'first year', 'BCA-1(B)_7', '10082007', 'active', NULL),
(222, 'DARBAR MISHAL NABINBHAI', '1', 2, 'male', '21-12-2005', 'first year', 'BCA-1(B)_8', '21122005', 'active', NULL),
(223, 'DER DIXITKUMAR KHIMABHAI', '1', 2, 'male', '19-03-2007', 'first year', 'BCA-1(B)_9', '19032007', 'active', NULL),
(224, 'DER RIDHDHESHKUMAR MERAMANBHAI', '1', 2, 'male', '23-07-2007', 'first year', 'BCA-1(B)_10', '23072007', 'active', NULL),
(225, 'DIVRANIYA JAYESH PUNJABHAI', '1', 2, 'male', '25-03-2006', 'first year', 'BCA-1(B)_11', '25032006', 'active', NULL),
(226, 'EKLAVA KRUPALKUMAR CHANDUBHAI', '1', 2, 'male', '10-08-2007', 'first year', 'BCA-1(B)_12', '10082007', 'active', NULL),
(227, 'GADHIYA URVESH MANISHBHAI', '1', 2, 'male', '05-04-2007', 'first year', 'BCA-1(B)_13', '04052007', 'active', NULL),
(228, 'GARCHAR KARAN NARANBHAI', '1', 2, 'male', '08-03-2007', 'first year', 'BCA-1(B)_14', '03082007', 'active', NULL),
(229, 'KAGDA JOGIDAS KARANABHAI', '1', 2, 'male', '02-10-2006', 'first year', 'BCA-1(B)_15', '02102006', 'active', NULL),
(230, 'KARAMATA RAMBHAI SAMATBHAI', '1', 2, 'male', '12-09-2005', 'first year', 'BCA-1(B)_16', '09122005', 'active', NULL),
(231, 'KHANIYA BHASKAR MADHAVJIBHAI', '1', 2, 'male', '26-10-2006', 'first year', 'BCA-1(B)_17', '26102006', 'active', NULL),
(232, 'KODAVALA DEEPKUMAR CHANDUBHAI', '1', 2, 'male', '15-10-2005', 'first year', 'BCA-1(B)_18', '15102005', 'active', NULL),
(233, 'KODAVALA TEJAS CHANDUBHAI', '1', 2, 'male', '14-09-2007', 'first year', 'BCA-1(B)_19', '14092007', 'active', NULL),
(234, 'KUKADIYA JENISHKUMAR KAMLESHBHAI', '1', 2, 'male', '01-02-2006', 'first year', 'BCA-1(B)_20', '02012006', 'active', NULL),
(235, 'LAANGA MAULIK KARANDAN', '1', 2, 'male', '15-11-2006', 'first year', 'BCA-1(B)_21', '15112006', 'active', NULL),
(236, 'MAKDIYA TIRTH VINOD', '1', 2, 'male', '28-05-2007', 'first year', 'BCA-1(B)_22', '28052007', 'active', NULL),
(237, 'MARANDH YASH DINESHBHAI', '1', 2, 'male', '21-11-2006', 'first year', 'BCA-1(B)_23', '21112006', 'active', NULL),
(238, 'MERAVADA MIHIRKUMAR RAMESHBHAI', '1', 2, 'male', '15-11-2006', 'first year', 'BCA-1(B)_24', '15112006', 'active', NULL),
(239, 'MEVADA DIPCHAND NATHABHAI', '1', 2, 'male', '23-11-2005', 'first year', 'BCA-1(B)_25', '23112005', 'active', NULL),
(240, 'MUCHHAL MILAN KARASHANBHAI', '1', 2, 'male', '08-03-2007', 'first year', 'BCA-1(B)_26', '03082007', 'active', NULL),
(241, 'ODEDARA DILIP EBHABHAI', '1', 2, 'male', '23-07-2007', 'first year', 'BCA-1(B)_27', '23072007', 'active', NULL),
(242, 'PANDIT MUKESH BHANABHAI', '1', 2, 'male', '17-10-2006', 'first year', 'BCA-1(B)_28', '17102006', 'active', NULL),
(243, 'PANKHANIYA KARTIK ASHOKBHAI', '1', 2, 'male', '20-11-2005', 'first year', 'BCA-1(B)_29', '20112005', 'active', NULL),
(244, 'PARMAR HITESH SURESHBHAI', '1', 2, 'male', '08-12-2007', 'first year', 'BCA-1(B)_30', '12082007', 'active', NULL),
(245, 'PARMAR RAKESH RAMESHBHAI', '1', 2, 'male', '01-11-2007', 'first year', 'BCA-1(B)_31', '11012007', 'active', NULL),
(246, 'PATODIYA SUJAL KALPESHBHAI', '1', 2, 'male', '02-08-2007', 'first year', 'BCA-1(B)_32', '02082007', 'active', NULL),
(247, 'PITHIYA VISHAL HAMIRBHAI', '1', 2, 'male', '10-10-2006', 'first year', 'BCA-1(B)_33', '10102006', 'active', NULL),
(248, 'RAIYANI DARSHIL BHARATBHAI', '1', 2, 'male', '09-04-2007', 'first year', 'BCA-1(B)_34', '04092007', 'active', NULL),
(249, 'RATANPARA AMIT CHANDRAKANTBHAI', '1', 2, 'male', '16-04-2004', 'first year', 'BCA-1(B)_35', '16042004', 'active', NULL),
(250, 'RATHOD JIGNESH KANABHAI', '1', 2, 'male', '01-11-2008', 'first year', 'BCA-1(B)_36', '11012008', 'active', NULL),
(251, 'RATHOD SHUBHAM SHANTIBHAI', '1', 2, 'male', '25-12-2006', 'first year', 'BCA-1(B)_37', '25122006', 'active', NULL),
(252, 'SANCHANIYA JAY HARESHBHAI', '1', 2, 'male', '05-09-2006', 'first year', 'BCA-1(B)_38', '05092006', 'active', NULL),
(253, 'SANGANI UTTAMKUMAR SHAILESHBHAI', '1', 2, 'male', '05-12-2006', 'first year', 'BCA-1(B)_39', '05122006', 'active', NULL),
(254, 'SHIDHA DHAVALBHAI DANUBHAI', '1', 2, 'male', '07-03-2004', 'first year', 'BCA-1(B)_40', '03072004', 'active', NULL),
(255, 'SHINGALA YASH NARAYANBHAI', '1', 2, 'male', '26-01-2006', 'first year', 'BCA-1(B)_41', '26012006', 'active', NULL),
(256, 'SISODIYA DHARMESHSINH GHANSHYAMBHAI', '1', 2, 'male', '04-10-2007', 'first year', 'BCA-1(B)_42', '10042007', 'active', NULL),
(257, 'SISODIYA GIRISHKUMAR THARANBHAI', '1', 2, 'male', '26-08-2002', 'first year', 'BCA-1(B)_43', '26082002', 'active', NULL),
(258, 'SISODIYA SHIVBHADRA BHARATBHAI', '1', 2, 'male', '26-08-2007', 'first year', 'BCA-1(B)_44', '26082007', 'active', NULL),
(259, 'SOJITRA ROMISH JAYSUKHBHAI', '1', 2, 'male', '18-01-2007', 'first year', 'BCA-1(B)_45', '18012007', 'active', NULL),
(260, 'SOLANKI PRAMIT KANAKSINH', '1', 2, 'male', '18-08-2007', 'first year', 'BCA-1(B)_46', '18082007', 'active', NULL),
(261, 'SOLANKI RAJ HARADASHBHAI', '1', 2, 'male', '12-12-2006', 'first year', 'BCA-1(B)_47', '12122006', 'active', NULL),
(262, 'SOLANKI SIDDHARTH MAHENDRABHAI', '1', 2, 'male', '29-08-2007', 'first year', 'BCA-1(B)_48', '29082007', 'active', NULL),
(263, 'SURTREJA RAJ SARMANBHAI', '1', 2, 'male', '10-06-2007', 'first year', 'BCA-1(B)_49', '10062007', 'active', NULL),
(264, 'TANK JEELKUMAR VIJAYBHAI', '1', 2, 'male', '08-09-2006', 'first year', 'BCA-1(B)_50', '09082006', 'active', NULL),
(265, 'TANNA JAYESH ISHVARBHAI', '1', 2, 'male', '18-05-2006', 'first year', 'BCA-1(B)_51', '18052006', 'active', NULL),
(266, 'THAPALIYA VIJAY DEVSHIBHAI', '1', 2, 'male', '06-09-2007', 'first year', 'BCA-1(B)_52', '06092007', 'active', NULL),
(267, 'VACHHANI SAVAN SANJAYBHAI', '1', 2, 'male', '08-11-2006', 'first year', 'BCA-1(B)_53', '11082006', 'active', NULL),
(268, 'VAJA MAYANK JADAVBHAI', '1', 2, 'male', '13-11-2006', 'first year', 'BCA-1(B)_54', '13112006', 'active', NULL),
(269, 'VALA DHRUV DINESHBHAI', '1', 2, 'male', '02-03-2007', 'first year', 'BCA-1(B)_55', '03022007', 'active', NULL),
(270, 'VALA SANDIP JAGMALBHAI', '1', 2, 'male', '14-05-2007', 'first year', 'BCA-1(B)_56', '14052007', 'active', NULL),
(271, 'VANAR PARTH DEVJIBHAI', '1', 2, 'male', '01-11-2007', 'first year', 'BCA-1(B)_57', '11012007', 'active', NULL),
(272, 'VARA SUJAL PRAVINBHAI', '1', 2, 'male', '19-11-2004', 'first year', 'BCA-1(B)_58', '19112004', 'active', NULL),
(273, 'VASARA DIXIT BHIMASHIBHAI', '1', 2, 'male', '02-11-2006', 'first year', 'BCA-1(B)_59', '02112006', 'active', NULL),
(274, 'VORA PRINCE BHAVESHBHAI', '1', 2, 'male', '30-07-2006', 'first year', 'BCA-1(B)_60', '30072006', 'active', NULL),
(275, 'BHALGARIYA MAHAVIRSINH RAMBHAI', '1', 2, 'male', '21-06-2007', 'first year', 'BCA-1(B)_61', '21062007', 'active', NULL),
(276, 'SOJITRA TANISHKUMAR SANJAYBHAI', '1', 2, 'male', '04-04-2007', 'first year', 'BCA-1(B)_62', '04042007', 'active', NULL),
(278, 'AGRAVAT SHUBHAM SANJAYBHAI', '1', 3, 'male', '10-03-2006', 'first year', 'BCA-1(C)_1', '03102006', 'active', NULL),
(279, 'BARAD RIPALKUMAR KESHUBHAI', '1', 3, 'male', '02-09-2007', 'first year', 'BCA-1(C)_2', '09022007', 'active', NULL),
(280, 'BARAD VIREN GOVINDBHAI', '1', 3, 'male', '06-01-2006', 'first year', 'BCA-1(C)_3', '01062006', 'active', NULL),
(281, 'BHAGNANI HIMESH DILIPBHAI', '1', 3, 'male', '11-08-2007', 'first year', 'BCA-1(C)_4', '11082007', 'active', NULL),
(282, 'BHUVA DHRUV SAILESHBHAI', '1', 3, 'male', '13-03-2007', 'first year', 'BCA-1(C)_5', '13032007', 'active', NULL),
(283, 'BHUVA KRISH MAHESHBHAI', '1', 3, 'male', '08-11-2006', 'first year', 'BCA-1(C)_6', '08112006', 'active', NULL),
(284, 'DABHI ABHAY PRAFULBHAI', '1', 3, 'male', '15-03-2005', 'first year', 'BCA-1(C)_7', '15032005', 'active', NULL),
(285, 'DHOKIYA DENISH DINESHBHAI', '1', 3, 'male', '08-12-2006', 'first year', 'BCA-1(C)_8', '08122006', 'active', NULL),
(286, 'DODIYA HARSH GIRISHBHAI', '1', 3, 'male', '26-07-2006', 'first year', 'BCA-1(C)_9', '26072006', 'active', NULL),
(287, 'GAUSWAMI DEVPURI VIJAYPURI', '1', 3, 'male', '16-04-2006', 'first year', 'BCA-1(C)_10', '16042007', 'active', NULL),
(288, 'GOHEL SMIT PRAVINBHAI', '1', 3, 'male', '28-11-2006', 'first year', 'BCA-1(C)_11', '28112006', 'active', NULL),
(289, 'GOJIYA DILESH SAVDAS', '1', 3, 'male', '03-08-2007', 'first year', 'BCA-1(C)_12', '03082007', 'active', NULL),
(290, 'GONDALIYA VAIBHAV PRAVINBHAI', '1', 3, 'male', '08-08-2007', 'first year', 'BCA-1(C)_13', '08082007', 'active', NULL),
(291, 'JOTVA ABHAY SARMANBHAI', '1', 3, 'male', '06-11-2006', 'first year', 'BCA-1(C)_14', '11062006', 'active', NULL),
(292, 'JOTVA JAY RAJESHBHAI', '1', 3, 'male', '20-01-2007', 'first year', 'BCA-1(C)_15', '20012007', 'active', NULL),
(293, 'JUNEJA AEJAJ HANIFBHAI', '1', 3, 'male', '03-03-2007', 'first year', 'BCA-1(C)_16', '03032007', 'active', NULL),
(294, 'KACHHADIYA GREVIN KISHORBHAI', '1', 3, 'male', '04-07-2007', 'first year', 'BCA-1(C)_17', '04072007', 'active', NULL),
(295, 'KADACHHA RAJ DINESHBHAI', '1', 3, 'male', '03-03-2007', 'first year', 'BCA-1(C)_18', '03032007', 'active', NULL),
(296, 'KAKADIYA HEET PRAFULBHAI', '1', 3, 'male', '15-10-2006', 'first year', 'BCA-1(C)_19', '15102006', 'active', NULL),
(297, 'KAMALIYA MAYUR MANISHBHAI', '1', 3, 'male', '15-08-2007', 'first year', 'BCA-1(C)_20', '15082007', 'active', NULL),
(298, 'KAMANI VISHVASH KISHORBHAI', '1', 3, 'male', '21-04-2007', 'first year', 'BCA-1(C)_21', '21042007', 'active', NULL),
(299, 'KANKADIYA JAYDIP NARENDRABHAI', '1', 3, 'male', '12-10-2005', 'first year', 'BCA-1(C)_22', '12102005', 'active', NULL),
(300, 'KATARIYA DEV GOBARBHAI', '1', 3, 'male', '09-10-2006', 'first year', 'BCA-1(C)_23', '10092006', 'active', NULL),
(301, 'KHIMANI PIYUSH RAMESHBHAI', '1', 3, 'male', '20-10-2006', 'first year', 'BCA-1(C)_24', '20102006', 'active', NULL),
(302, 'KIKANI SHYAM NAVNEETBHAI', '1', 3, 'male', '05-10-2006', 'first year', 'BCA-1(C)_25', '10052006', 'active', NULL),
(303, 'KOREJA TAUFIK ANVARBHAI', '1', 3, 'male', '03-04-2007', 'first year', 'BCA-1(C)_26', '04032007', 'active', NULL),
(304, 'KOTADIYA VISHVAM INDRESHBHAI', '1', 3, 'male', '11-08-2006', 'first year', 'BCA-1(C)_27', '08112006', 'active', NULL),
(305, 'LATHIYA BHAVIN PRAVINBHAI', '1', 3, 'male', '27-07-2007', 'first year', 'BCA-1(C)_28', '27072007', 'active', NULL),
(306, 'MAKAVANA MILAN KADUBHAI', '1', 3, 'male', '17-10-2006', 'first year', 'BCA-1(C)_29', '17102006', 'active', NULL),
(307, 'MAKWANA UMANG RASIKBHAI', '1', 3, 'male', '10-11-2006', 'first year', 'BCA-1(C)_30', '11102006', 'active', NULL),
(308, 'MAKWANA YASH PARSOTAMBHAI', '1', 3, 'male', '03-12-2007', 'first year', 'BCA-1(C)_31', '12032007', 'active', NULL),
(309, 'MATHUKIYA DHARMIKKUMAR KANTIBHAI', '1', 3, 'male', '06-03-2007', 'first year', 'BCA-1(C)_32', '03062007', 'active', NULL),
(310, 'MOKARIYA KRISH RAMESHBHAI', '1', 3, 'male', '14-10-2006', 'first year', 'BCA-1(C)_33', '14102006', 'active', NULL),
(311, 'NIMAVAT PAVANKUMAR BHARATBHAI', '1', 3, 'male', '05-04-2004', 'first year', 'BCA-1(C)_34', '05042004', 'active', NULL),
(312, 'PARMAR PRIYANSHU YOGESHBHAI', '1', 3, 'male', '21-07-2007', 'first year', 'BCA-1(C)_35', '21072007', 'active', NULL),
(313, 'PONKIYA AYUSH RAMESHBHAI', '1', 3, 'male', '23-02-2007', 'first year', 'BCA-1(C)_36', '23022007', 'active', NULL),
(314, 'RAISH MAAZ MOLDADBHAI', '1', 3, 'male', '26-09-2007', 'first year', 'BCA-1(C)_37', '26092007', 'active', NULL),
(315, 'RAM SUMIT DINESHBHAI', '1', 3, 'male', '06-07-2007', 'first year', 'BCA-1(C)_38', '06072007', 'active', NULL),
(316, 'RANGANI SUJAL HITESHBHAI', '1', 3, 'male', '31-10-2006', 'first year', 'BCA-1(C)_39', '31102006', 'active', NULL),
(317, 'RIBADIYA VISMAY VIPULBHAI', '1', 3, 'male', '25-02-2007', 'first year', 'BCA-1(C)_40', '25022007', 'active', NULL),
(318, 'RUPARELIYA MONARK JITENDRABHAI', '1', 3, 'male', '18-10-2006', 'first year', 'BCA-1(C)_41', '18102006', 'active', NULL),
(319, 'SAIYAD GULAMMUDASSIR GULAMMUJAMMIL', '1', 3, 'male', '03-11-2006', 'first year', 'BCA-1(C)_42', '11032006', 'active', NULL),
(320, 'SAVALIYA DENISH SANJAYBHAI', '1', 3, 'male', '18-06-2007', 'first year', 'BCA-1(C)_43', '18062007', 'active', NULL),
(321, 'SHELADIYA PURVISH JITUBHAI', '1', 3, 'male', '27-11-2005', 'first year', 'BCA-1(C)_44', '27112005', 'active', NULL),
(322, 'SOJITRA HARSHIL ANILBHAI', '1', 3, 'male', '06-06-2007', 'first year', 'BCA-1(C)_45', '06062007', 'active', NULL),
(323, 'SOLANKI AADITY BHAVESHBHAI', '1', 3, 'male', '25-01-2007', 'first year', 'BCA-1(C)_46', '25012007', 'active', NULL),
(324, 'SOLANKI KEVAL MANISHKUMAR', '1', 3, 'male', '05-01-2006', 'first year', 'BCA-1(C)_47', '01052006', 'active', NULL),
(325, 'SUTARIYA SAURAV VINODBHAI', '1', 3, 'male', '01-04-2006', 'first year', 'BCA-1(C)_48', '04012006', 'active', NULL),
(326, 'THUMMAR MANTHAN RAJENDRABHAI', '1', 3, 'male', '24-05-2007', 'first year', 'BCA-1(C)_49', '24052007', 'active', NULL),
(327, 'VAGHASIYA YAGNIK RAJESHBHAI', '1', 3, 'male', '31-05-2007', 'first year', 'BCA-1(C)_50', '31052007', 'active', NULL),
(328, 'VAGHELA CHANDRAKUMAR RAMESHBHAI', '1', 3, 'male', '02-02-2007', 'first year', 'BCA-1(C)_51', '02022007', 'active', NULL),
(329, 'VAGHELA CHHATRAPALSINH BHAVASANGSINH', '1', 3, 'male', '24-09-2006', 'first year', 'BCA-1(C)_52', '24092006', 'active', NULL),
(330, 'VAGHELA RUTURAJSINH PRAVINSINH', '1', 3, 'male', '20-02-2006', 'first year', 'BCA-1(C)_53', '20022006', 'active', NULL),
(331, 'VAGHELA UPENDRASINH NARENDRASINH', '1', 3, 'male', '29-04-2006', 'first year', 'BCA-1(C)_54', '29042006', 'active', NULL),
(332, 'VARU HARSH YOGESHBHAI', '1', 3, 'male', '27-09-2005', 'first year', 'BCA-1(C)_55', '27092005', 'active', NULL),
(333, 'VISHNU JAYDIPKUMAR SANJAYBHAI', '1', 3, 'male', '05-09-2007', 'first year', 'BCA-1(C)_56', '09052007', 'active', NULL),
(334, 'YADAV VIJAY NARESHBHAI', '1', 3, 'male', '02-05-2005', 'first year', 'BCA-1(C)_57', '05022005', 'active', NULL),
(335, 'YOGANANDI PARTHKUMAR MUKESHKUMAR', '1', 3, 'male', '03-04-2007', 'first year', 'BCA-1(C)_58', '03042007', 'active', NULL),
(336, 'ZINZUVADIYA JAYESH SHAILESHBHAI', '1', 3, 'male', '26-09-2007', 'first year', 'BCA-1(C)_59', '26092007', 'active', NULL),
(337, 'CHAUHAN NIKHIL MANISHBHAI', '1', 3, 'male', '14-01-2007', 'first year', 'BCA-1(C)_60', '14012007', 'active', NULL),
(338, 'KAMBARIYA RAHUL KHIMABHAI', '1', 3, 'male', '17-12-2006', 'first year', 'BCA-1(C)_61', '17122006', 'active', NULL),
(339, 'ASANI PARAKSH LAGDHIRBHAI', '1', 4, 'male', '13-12-2006', 'first year', 'BCA-1(D)_1', '13122006', 'active', 'lrfreh3re6675n134dhb8qf8ol'),
(340, 'BALDANIYA MANAV KALUBHAI', '1', 4, 'male', '01-08-2007', 'first year', 'BCA-1(D)_2', '08012007', 'active', NULL),
(341, 'BALDANIYA RAJ VINODBHAI', '1', 4, 'male', '27-06-2007', 'first year', 'BCA-1(D)_3', '27062007', 'active', NULL),
(342, 'BASIYA BHAVDIP BHARATBHAI', '1', 4, 'male', '20-09-2007', 'first year', 'BCA-1(D)_4', '20092007', 'active', NULL),
(343, 'BHUTIYA NAGAJAN MERUBHAI', '1', 4, 'male', '22-11-2007', 'first year', 'BCA-1(D)_5', '22112007', 'active', NULL),
(344, 'BHUVA HIT PANKAJBHAI', '1', 4, 'male', '18-06-2007', 'first year', 'BCA-1(D)_6', '18062007', 'active', NULL),
(345, 'CHAPANERA JENISH BHARATBHAI', '1', 4, 'male', '18-08-2005', 'first year', 'BCA-1(D)_7', '18082005', 'active', 'ouvmrfn8g41jct7tarc4oubjps'),
(346, 'CHAUHAN MALDE HAJA', '1', 4, 'male', '06-10-2007', 'first year', 'BCA-1(D)_8', '10062007', 'active', NULL),
(347, 'CHAVADA YOGESH VIRAM', '1', 4, 'male', '31-05-2007', 'first year', 'BCA-1(D)_9', '31052007', 'active', '692e3v33qbmk11brs8b843bm2i'),
(348, 'CHOTHANI RUTANSH NARENDRABHAI', '1', 4, 'male', '17-12-2006', 'first year', 'BCA-1(D)_10', '17122006', 'active', NULL),
(349, 'CHUDASAMA KULDIP KANJIBHAI', '1', 4, 'male', '22-04-2007', 'first year', 'BCA-1(D)_11', '22042007', 'active', 'ttqeu8v2a0oino7scipab7ae50'),
(350, 'DHRANGIYA ASHISHKUMAR MAHESHBHAI', '1', 4, 'male', '20-12-2006', 'first year', 'BCA-1(D)_12', '20122006', 'active', 'q8imteipaiur2rebpflpmrbjlo'),
(351, 'DOBARIYA ARYAN MAHESHBHAI', '1', 4, 'male', '18-07-2006', 'first year', 'BCA-1(D)_13', '18072006', 'active', NULL),
(352, 'DOLARIYA PRUTHVI MANSUKH', '1', 4, 'male', '17-02-2006', 'first year', 'BCA-1(D)_14', '17022006', 'active', NULL),
(353, 'GAGIYA RAJ PRAVINBHAI', '1', 4, 'male', '04-04-2007', 'first year', 'BCA-1(D)_15', '4042007', 'active', NULL),
(354, 'GAREJA DILIP NAGAJANBHAI', '1', 4, 'male', '20-07-2007', 'first year', 'BCA-1(D)_16', '20072007', 'active', NULL),
(355, 'GONDALIYA MITESHKUMAR VINUBHAI', '1', 4, 'male', '11-09-2007', 'first year', 'BCA-1(D)_17', '11092007', 'active', NULL),
(356, 'KODIYATAR DEVALBHAI JIVANBHAI', '1', 4, 'male', '11-10-2004', 'first year', 'BCA-1(D)_18', '11102004', 'active', NULL),
(357, 'MAKAVANA MAYURKUMAR RAMJIBHAI', '1', 4, 'male', '15-08-2007', 'first year', 'BCA-1(D)_19', '15082007', 'active', NULL),
(358, 'MAKVANA DARSHIT RAMESHBHAI', '1', 4, 'male', '29-12-2006', 'first year', 'BCA-1(D)_20', '29122006', 'active', NULL),
(359, 'MAKVANA GAURANG CHANDUBHAI', '1', 4, 'male', '05-12-2007', 'first year', 'BCA-1(D)_21', '12052007', 'active', NULL),
(360, 'MAKVANA JAYDIPKUMAR BABUBHAI', '1', 4, 'male', '31-10-2006', 'first year', 'BCA-1(D)_22', '31102006', 'active', NULL),
(361, 'MASHRU BHAVYA HITESHBHAI', '1', 4, 'male', '26-01-2006', 'first year', 'BCA-1(D)_23', '26012006', 'active', NULL),
(362, 'MORI DIVYESHKUMAR PRAVINBHAI', '1', 4, 'male', '24-01-2007', 'first year', 'BCA-1(D)_24', '24012007', 'active', NULL),
(363, 'MORI VISHAL JIVRAJBHAI', '1', 4, 'male', '22-03-2007', 'first year', 'BCA-1(D)_25', '22032007', 'active', NULL),
(364, 'ODEDARA DHARMIK ALA', '1', 4, 'male', '30-09-2006', 'first year', 'BCA-1(D)_26', '30092006', 'active', NULL),
(365, 'ODEDARA MANISH KANA', '1', 4, 'male', '03-03-2007', 'first year', 'BCA-1(D)_27', '03032007', 'active', NULL),
(366, 'ODEDARA NAGARJAN BHANUBHAI', '1', 4, 'male', '17-05-2007', 'first year', 'BCA-1(D)_28', '17052007', 'active', NULL),
(367, 'PAGHADAR HARSHAD MUKESHBHAI', '1', 4, 'male', '07-08-2005', 'first year', 'BCA-1(D)_29', '08072005', 'active', 'h7vcfqnkgevojuf8k5k05jmk7c'),
(368, 'PARMAR BHARAT SARAM', '1', 4, 'male', '28-10-2006', 'first year', 'BCA-1(D)_30', '28102006', 'active', '7ar9u43mpk6f36q0fjc6p1ccip'),
(369, 'PARMAR DILIP LAKHA', '1', 4, 'male', '20-03-2007', 'first year', 'BCA-1(D)_31', '20032007', 'active', NULL),
(370, 'PARMAR JAYESH BALU', '1', 4, 'male', '16-02-2007', 'first year', 'BCA-1(D)_32', '16022007', 'active', '7okdl30lctj7dlo9vf4epjohng'),
(371, 'PARMAR MALDE VASTA', '1', 4, 'male', '15-02-2007', 'first year', 'BCA-1(D)_33', '15022007', 'active', 'tlihun9j4utusfogur0hr4pp8v'),
(372, 'PARMAR MAYUR PRATAP', '1', 4, 'male', '04-03-2007', 'first year', 'BCA-1(D)_34', '03042007', 'active', '2ahpq2ueqc0euje3jo0dkuhntg'),
(373, 'PARMAR RONAKKUMAR PUNABHAI', '1', 4, 'male', '02-10-2007', 'first year', 'BCA-1(D)_35', '10022007', 'active', 'nkocgaabop763velbgdbifu3tj'),
(374, 'PARMAR UDAYKUMAR AMRUTLAL', '1', 4, 'male', '05-09-2004', 'first year', 'BCA-1(D)_36', '05092004', 'active', 'tsgd95cct1fe1t0295herbn635'),
(375, 'PATTANI ROHIT DIPAKBHAI', '1', 4, 'male', '09-02-2007', 'first year', 'BCA-1(D)_37', '09022007', 'active', NULL),
(376, 'RAJPARA AYUSH RAJESHBHAI', '1', 4, 'male', '16-11-2005', 'first year', 'BCA-1(D)_38', '16112005', 'active', 'sd5g4avoeq0u4oaplg7jvn8rfg'),
(377, 'RAMANI HENIL PARSOTAMBHAI', '1', 4, 'male', '18-06-2007', 'first year', 'BCA-1(D)_39', '18062007', 'active', NULL),
(378, 'SAVALIYA RAJ JITESHBHAI', '1', 4, 'male', '09-08-2007', 'first year', 'BCA-1(D)_40', '08092007', 'active', NULL),
(379, 'SOLANKI PARMIT ASHVINBHAI', '1', 4, 'male', '22-06-2007', 'first year', 'BCA-1(D)_41', '22062007', 'active', NULL),
(380, 'TAPASIYA DHRUVKUMAR RAJESHBHAI', '1', 4, 'male', '23-11-2006', 'first year', 'BCA-1(D)_42', '23112006', 'active', NULL),
(381, 'VADHIYA JASMIN KESHAV', '1', 4, 'male', '19-01-2007', 'first year', 'BCA-1(D)_43', '19012007', 'active', NULL),
(382, 'VADHIYA JAYANT MERAMANBHAI', '1', 4, 'male', '05-08-2007', 'first year', 'BCA-1(D)_44', '08052007', 'active', NULL),
(383, 'VADHIYA KEVALKUMAR NATHABHAI', '1', 4, 'male', '06-12-2006', 'first year', 'BCA-1(D)_45', '06122006', 'active', NULL),
(384, 'VADHIYA RAJESH BHUPATBHAI', '1', 4, 'male', '29-05-2007', 'first year', 'BCA-1(D)_46', '29052007', 'active', NULL),
(385, 'VADHIYA YUVRAJ JAGMALBHAI', '1', 4, 'male', '21-08-2007', 'first year', 'BCA-1(D)_47', '21082007', 'active', NULL),
(386, 'VAGHAMSHI JENISH DEVRAJBHAI', '1', 4, 'male', '25-08-2007', 'first year', 'BCA-1(D)_48', '25082007', 'active', NULL),
(387, 'VAGHASIYA DUSHYANT PARESHBHAI', '1', 4, 'male', '21-02-2007', 'first year', 'BCA-1(D)_49', '21022007', 'active', NULL),
(388, 'VAGHELA JAY VAJUBHAI', '1', 4, 'male', '30-07-2007', 'first year', 'BCA-1(D)_50', '30072007', 'active', NULL),
(389, 'VAGHELA RAJ JAGADISHBHAI', '1', 4, 'male', '15-08-2007', 'first year', 'BCA-1(D)_51', '15082007', 'active', NULL),
(390, 'VANIYA MOHIT BHARATBHAI', '1', 4, 'male', '15-08-2007', 'first year', 'BCA-1(D)_52', '15082007', 'active', NULL),
(391, 'VEKARIYA MEET DINESHBHAI', '1', 4, 'male', '08-09-2007', 'first year', 'BCA-1(D)_53', '08092007', 'active', NULL),
(392, 'BHADARKA PARTHKUMAR MASRIBHAI', '1', 4, 'male', '26-05-2007', 'first year', 'BCA-1(D)_54', '26052007', 'active', NULL),
(393, 'MARU RAHULKUMAR DINESHBHAI', '1', 4, 'male', '25-09-2006', 'first year', 'BCA-1(D)_55', '25092006', 'active', NULL),
(394, 'THAKAR NANDAN RAJENDRAKUMAR', '1', 4, 'male', '12-02-2007', 'first year', 'BCA-1(D)_56', '12022007', 'active', '0uinu1su3mk547aqplkkad6qba'),
(395, 'VAJA NIMESHKUMAR GIRISHBHAI', '1', 4, 'male', '05-09-2006', 'first year', 'BCA-1(D)_57', '05092006', 'active', NULL),
(396, 'VAVAIYA BHUMIT PRAFULBHAI', '1', 4, 'male', '10-10-1999', 'first year', 'BCA-1(D)_58', '04092006', 'active', 'mj6i5e568d7slvcu5t8k2u3ilp'),
(397, 'VAGADIYA SAMARTH DINESHBHAI', '1', 4, 'male', '07-04-2007', 'first year', 'BCA-1(D)_59', '07042007', 'active', NULL),
(398, 'VALA MOHIT B', '2', 7, 'male', '2006-04-15', 'second year', 'BSCIT-3(B2)_59', '15042006', 'active', NULL);




--Exam Section


-- Table structure for table `exam_question_tbl`
--
 drop table examQuestion_Tbl;
create table examQuestion_Tbl(
que_Id int  identity (1,1) not null,
exam_Id int primary key  not null,
exam_Question varchar(max) not null,
exam_Ch1 varchar(1000) not null,
exam_Ch2 varchar(1000) not null,
exam_Ch3 varchar(1000) not null,
exam_Ch4 varchar(1000) not null,
exam_Answer varchar(1000) not null,
exam_Status varchar(1000) not null default 'active'
);

--procedure for  question Display

create procedure sp_getExamQuestion 
as
begin
select que_Id,exam_Id,exam_Question,exam_Ch1,exam_Ch2,exam_Ch3,exam_Ch4,exam_Answer,exam_Status from examQuestion_Tbl;
end
--
-- Dumping data for table `exam_question_tbl`
--

insert into examQuestion_Tbl(que_Id,exam_Id,exam_Question,exam_Ch1,exam_Ch2,exam_Ch3,exam_Ch4,exam_Answer,exam_Status) values
(1, 1, 'Martin Richards Developed a Language is Called ____.', 'Algol', 'BCPL', 'B Language', 'C Language', 'BCPL', 'active'),
(2, 1, '____ is Developed C Language.', 'Dennis Ritchie', 'Ken Thompson', 'Martin Richards', 'Kerningham', 'Dennis Ritchie', 'active'),
(3, 1, 'Full Form of ANSI.', 'American National Standard Information', 'American National Standard Institute', 'American National Standard Input', 'American National Standard Isolation', 'American National Standard Institute', 'active'),
(4, 1, 'The documentation section consists of a set of ______ lines.', 'Digits', 'Key', 'Comment', 'New', 'Comment', 'active'),
(5, 1, 'Main Function Devides ____ Section.', '1', '2', '3', '4', '2', 'active'),
(6, 1, 'User defined functions are generally placed _____.', 'Defination Section', 'Linkage Section', 'Defination Section', 'Sub Program Section', 'Sub Program Section', 'active'),
(7, 1, 'How Many Type of Tokens.', '1', '2', '4', '6', '6', 'active'),
(8, 1, 'All keywords have ____ meanings and these meanings cannot be changed.', 'Fixed', 'One', 'Multiple ', 'Single', 'Fixed', 'active'),
(9, 1, 'ANSI standard recognizes a length of _____ characters.', '21', '31', '41', '51', '31', 'active'),
(10, 1, 'How Many Type of Operators.', '5', '6', '7', '8', '8', 'active'),
(11, 1, 'How Many Type of Logical Operators.', '1', '2', '3', '4', '3', 'active'),
(12, 1, 'Syntage of Conditional Operators.', '(Condition) ? Truepart : Falsepart', '(Condition) : Truepart ? Falsepart', '(Condition)= Truepart : Falsepart', '(Condition)= Truepart ? Falsepart', '(Condition) ? Truepart : Falsepart', 'active'),
(13, 1, '____ is the Special Operators.', 'AND', 'OR', 'Sizeof', 'Not', 'Sizeof', 'active'),
(14, 1, 'ANSI C supports ______ categories of data types.', 'One', 'Two', 'Three', 'Four', 'Three', 'active'),
(15, 1, 'How Many Types of User Define Data Types.', '1', '2', '3', '4', '2', 'active'),
(16, 1, 'Range of Integer Datatypes', '32766', '32767', '32768', '32769', '32768', 'active'),
(17, 1, 'Formate Specifier to Input String data. ', '%c', '%d', '%f', '%s', '%s', 'active'),
(18, 1, 'How Many types of type conversion.', '1', '2', '3', '4', '2', 'active'),
(19, 1, 'Output of a = (int ) 21.3/(int)4.5', '3', '4', '5', '6', '5', 'active'),
(20, 1, 'All pre processor commands begin with _____ Symbol.', '#', '//', '/*', '&', '#', 'active'),
(21, 1, 'Symbolic names are written in ________.', 'Lower Case', 'Upper Case', 'Title Case', 'Sentence Case', 'Upper Case', 'active'),
(22, 1, '#define statements must not end with a ____ .', '.', ':', ';', '\"', ';', 'active'),
(23, 1, 'B Language Developed ____ Years.', '1960', '1970', '1980', '1990', '1970', 'active'),
(24, 1, 'Write a Output Printf(\"C Language\");', 'C Language', 'CLanguage', 'Error', 'c language', 'Error', 'active'),
(25, 1, 'To Declare the Variable First character must be an ________.', 'Alphabet or Underscore', 'Alphabet ', 'Underscore', 'Digits', 'Alphabet or Underscore', 'active'),
(26, 1, 'Which of the following Integer Constants.', '123', '123.23', '12.ab', '-12.45', '123', 'active'),
(27, 1, 'Logical Operators Returns _____ Values.', 'Int', 'Float', 'Boolean', 'Char', 'Boolean', 'active'),
(28, 1, 'What is will be Output of int a=5; a++; printf(\"%d\",a);', '5', '6', '7', '8', '6', 'active'),
(29, 1, 'The operator ++ add _____ to operand', '1', '2', '3', '4', '1', 'active'),
(30, 1, 'What is will be Output of 100 + 200 / 10 - 3 * 10', '50', '80', '90', '100', '90', 'active'),
(31, 1, 'Who is the father of computer', 'Charles Merin', 'Charles Babbage', 'Henry Ford', 'Henry Missel', 'Charles Babbage', 'active'),
(32, 1, 'Data-->_______--->Information', 'Input', 'Output', 'Process', 'CPU', 'Process', 'active'),
(33, 1, 'Computer is ______device', 'Mechincal', 'Electronics', 'Mecatronics', 'None', 'Electronics', 'active'),
(34, 1, 'Which feature is used for Analog computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Speed', 'active'),
(35, 1, 'Which feature is used for Digital computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Accuracy', 'active'),
(36, 1, 'Which feature is used for Hybrid computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Both', 'active'),
(37, 1, 'What is the smallest name of computer in the histroy of computer?', 'Analtical Engine', 'Abacus', 'Univac-1', 'None', 'Abacus', 'active'),
(38, 1, 'Which hardware is used in first generation of computer?', 'IC', 'LSI', 'Vaccum tube', 'Semiconductor', 'Vaccum tube', 'active'),
(39, 1, 'Which hardware is used in Second generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'Semiconductor', 'Transistor', 'active'),
(40, 1, 'Which hardware is used in Third generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'None', 'IC', 'active'),
(41, 1, 'Which genration is giving start to network technology?', 'First', 'Second ', 'Third', 'Fourth', 'Fourth', 'active'),
(42, 1, 'Which genration is having largest power usage in computers?', 'First', 'Fifth', 'Third', 'Second', 'First', 'active'),
(43, 1, 'Full form of VLSI', 'Very Large System Item', 'Very Large Scale Item', 'Vary Large Scale Integration', 'Very Large Scale Integration', 'Very Large Scale Integration', 'active'),
(44, 1, 'LSI is used in _____generation', 'Third', 'Fourth', 'Fifth', 'None', 'Third', 'active'),
(45, 1, 'ULSI is used in_____generation.', 'First', 'Fifth', 'Third', 'Second', 'Fifth', 'active'),
(46, 1, 'Full form of CPU', 'Central Processing Union', 'Center Primary Unit', 'Centeral Processing Unit', 'Center Pressure Unit', 'Central Processing Unit', 'active'),
(47, 1, 'Full form of ALU', 'Arithmatic Love Unit', 'Aroma Logic Unit', 'Arithmatic Logic Unit', 'Aramica Lovely Unit', 'Arithmatic Logic Unit', 'active'),
(48, 1, 'Full form of PS______', 'Personal System', 'Persistent System', 'Personal Scooter', 'Perry System', 'Personal System', 'active'),
(49, 1, 'Full form of USB_______', 'Union Sorry Bus', 'Union System Bus', 'Universal Serial Bus', 'Union System Berry', 'Universal Serial Bus', 'active'),
(50, 1, 'Full form of VGA_____', 'Visual Groom Array', 'Vital Graphics Array', 'Visual Graphics Array', 'Video Graphics Array', 'Video Graphics Array', 'active'),
(51, 1, 'Full form of DVI_____', 'Digital Video Interface', 'Digital Video Intrcept', 'Digital Viral Inteface', 'Digital Video Intermediate', 'Digital Video Interface', 'active'),
(52, 1, 'Graphics card is connected on____Slot', 'PCI', 'AGP', 'Slot', 'None', 'AGP', 'active'),
(53, 1, 'Sound Card is connected on _____Slot', 'PCI', 'AGP', 'Slot', 'None', 'PCI', 'active'),
(54, 1, 'Full form of NIC', 'Network interim Cord', 'New Interface Card', 'Network Interface Card', 'Network Intrim Card', 'Network Interface Card', 'active'),
(55, 1, 'Full form of UPS', 'Uniterupptible Panic System', 'Uninterupptible Power Derivative', 'Uninterupptible Power Device', 'Uninterupptible Primary Device', 'Uninterupptible Power Device', 'active'),
(56, 1, 'RAM is fitted on ____Slot', 'ROM', 'RAM', 'Both', 'None', 'RAM', 'active'),
(57, 1, 'Static and Dynamic are types of ______', 'RAM', 'ROM', 'Both', 'None', 'RAM', 'active'),
(58, 1, 'Full form of BIOS', 'Basic Input and Output system', 'Better Input and Output system', 'Basic Input and Output size', 'Basic Iron and Oral system', 'Basic Input and Output system', 'active'),
(59, 1, 'Which device is known as Processor in computer', 'RAM', 'ROM', 'Both ', 'ALU', 'ALU', 'active'),
(60, 1, 'Computer word is coming from _____word', 'Computer', 'Compute', 'Calculate', 'Calling', 'Compute', 'active'),
(61, 1, 'FULL FORM OF HTML_______________', 'HYPERTEXT MARKUP LANGUAGE', 'Danis Root', 'Danish Clark', 'None of these', 'HYPERTEXT MARKUP LANGUAGE', 'active'),
(62, 1, 'FATHER OF THE HTML______________', 'Gayle', 'TIM BERNERS ? LEE', 'Dr.E.F.Codd', 'None of these', 'TIM BERNERS ? LEE', 'active'),
(63, 1, 'HTML IS A SUBSET OF______________', 'HTML', 'JSP', 'SGML', 'XML', 'SGML', 'active'),
(64, 1, 'BODY TAG SPECIFIES THE___________________', 'MAIN CONTENT OF THE PAGE', 'TITLE OF PAGE', 'BACKGROUND OF PAGE', 'None of these', 'MAIN CONTENT OF THE PAGE', 'active'),
(65, 1, 'LIST OUT BASIC ELEMENTS OF HTML____________', 'DIV', 'P', 'H1', 'TAGS, ATTRIBUTES, URL', 'TAGS, ATTRIBUTES, URL', 'active'),
(66, 1, 'FULL NAME OF CSS', 'Cascading Style Sheet', 'DIV', 'case cading style', 'UL', 'Cascading Style Sheet', 'active'),
(67, 1, 'TITLE TAG IS WRITTEN UNDER _________TAG', 'HTML', 'HEAD', 'XML', 'SGML', 'HEAD', 'active'),
(68, 1, 'WHAT IS THE USE OF SUB TAG?', 'Display the text', 'DISPLAY TEXT IN SUB SCRIPT', 'CREATING UNORDERED LIST', 'None of these', 'DISPLAY TEXT IN SUB SCRIPT', 'active'),
(69, 1, 'OL TAG IS USED FOR', 'CREATING ORDERED LIST', 'UNORDER LIST', 'LIST', 'None of these', 'CREATING ORDERED LIST', 'active'),
(70, 1, 'UL TAG IS USED FOR', 'ORDER LIST', 'CREATING UNORDERED LIST', 'LIST', 'None of these', 'CREATING UNORDERED LIST', 'active'),
(71, 1, 'DL TAG IS USED FOR', 'CREATING DEFINITION LIST', 'CREATING UNORDERED LIST', 'CREATING UNORDERED LIST', 'None of these', 'CREATING DEFINITION LIST', 'active'),
(72, 1, 'FULL FORM OF DT __________', 'DATA LIST', 'VIEW LIAT', 'RAW DATA', 'DEFINITION TERM', 'DEFINITION TERM', 'active'),
(73, 1, 'FULL FORM OF DD', 'DATABASE LIST', 'DEFINITION DESCRIPTION', 'DATA LIST', 'None of these', 'DEFINITION DESCRIPTION', 'active'),
(74, 1, 'WHICH TAG IS USED TO GIVE HYPERLINK?', 'A TAG', 'P TAG', 'H1', 'None of these', 'A TAG ', 'active'),
(75, 1, 'WHICH SIGH USED TO DELCARE A CLASS ____', '.', '#', '@', 'None of these', '.', 'active'),
(76, 1, 'HREF ATTRIBUTE IS USED FOR________', 'URL OF THE PAGE', 'PAGE HEADE ', 'NONE OF THEASE', 'A AND B', 'URL OF THE PAGE', 'active'),
(77, 1, 'TARGET ATTRIBUTE IS USED FOR', 'OPEN DOCUMENT', 'CLOSE THE DOCUMENT', 'SPECIFIES WHERE TO OPEN DOCUMENTS', 'None of these', 'SPECIFIES WHERE TO OPEN DOCUMENTS', 'active'),
(78, 1, 'WHICH SIGH USED TO DELCARE A ID ____', '#', '.', '@', 'None of these', '#', 'active'),
(79, 1, 'WHICH TAG IS USED TO DISPLAY IMAGE ON PAGE?', 'UL TAG', 'IMG TAG', 'PRE TAG', 'None of these', 'IMG TAG', 'active'),
(80, 1, 'SRC ATTRIBUTE IS USED FOR', 'IMAGE SOURCE / PATH', 'PATH IMAGE', 'A AND B', 'None of these', 'IMAGE SOURCE / PATH', 'active'),
(81, 1, 'HEIGHT & WIDTH ATTRIBUTES ARE USED FOR', 'COLOR OF IMAGE', 'TEXT IN PAGE', 'SIZE OF THE IMAGE', 'None of these', 'SIZE OF THE IMAGE', 'active'),
(82, 1, 'BORDER ATTRIBUTE IS USED FOR', 'SET THE BORDER', 'NONE OF THESE', 'PUT BORDER ON IMAGE', 'PUT DATA', 'PUT BORDER ON IMAGE', 'active'),
(83, 1, 'How many Types of Css available ?', '3', '4', '5', '6', '3', 'active'),
(84, 1, 'VSPACE ATTRIBUTE IS USED FOR', 'TOP BORDER AND VALUE', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'NONE OF THEASE', 'TAGS, ATTRIBUTES, URL', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'active'),
(85, 1, 'WHICH TAG IS USED TO CREATE TABLE?', 'TABLE TAG', 'FRAME', 'frameset', 'None of these', 'TABLE TAG', 'active'),
(86, 1, 'WHAT IS THE USE OF TR TAG?', 'CREATE TABLE RAW', 'CREATE DATA', 'CREATING UNORDERED LIST', 'None of these', 'CREATE TABLE RAW', 'active'),
(87, 1, 'TO MARGE ROWS AND COLUMNS WHICH ATTRIBUTES ARE USED?', 'IMAGE SOURCE / PATH', 'PATH IMAGE', 'COLSPAN AND ROWSPAN', 'None of these', 'COLSPAN AND ROWSPAN', 'active'),
(88, 1, 'FRAMESET TAG MEANS_______', 'SET OF FRAMES', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'DATA LIST', 'None of these', 'SET OF FRAMES', 'active'),
(89, 1, 'HTML IS ________ SIDE SCRIPTING LANGUAGE', 'CLIENT', 'ROWS OF FILE', 'SERVER', 'None of these', 'CLIENT', 'active'),
(90, 1, 'FRAME TAG IS AVAILABLE IN HTML 5', 'YES', 'YES & NO', 'NONE OF THEASE', 'NO', 'NO', 'active'),
(91, 2, 'Martin Richards Developed a Language is Called ____.', 'Algol', 'BCPL', 'B Language', 'C Language', 'BCPL', 'active'),
(92, 2, '____ is Developed C Language.', 'Dennis Ritchie', 'Ken Thompson', 'Martin Richards', 'Kerningham', 'Dennis Ritchie', 'active'),
(93, 2, 'Full Form of ANSI.', 'American National Standard Information', 'American National Standard Institute', 'American National Standard Input', 'American National Standard Isolation', 'American National Standard Institute', 'active'),
(94, 2, 'The documentation section consists of a set of ______ lines.', 'Digits', 'Key', 'Comment', 'New', 'Comment', 'active'),
(95, 2, 'Main Function Devides ____ Section.', '1', '2', '3', '4', '2', 'active'),
(96, 2, 'User defined functions are generally placed _____.', 'Defination Section', 'Linkage Section', 'Defination Section', 'Sub Program Section', 'Sub Program Section', 'active'),
(97, 2, 'How Many Type of Tokens.', '1', '2', '4', '6', '6', 'active'),
(98, 2, 'All keywords have ____ meanings and these meanings cannot be changed.', 'Fixed', 'One', 'Multiple ', 'Single', 'Fixed', 'active'),
(99, 2, 'ANSI standard recognizes a length of _____ characters.', '21', '31', '41', '51', '31', 'active'),
(100, 2, 'How Many Type of Operators.', '5', '6', '7', '8', '8', 'active'),
(101, 2, 'How Many Type of Logical Operators.', '1', '2', '3', '4', '3', 'active'),
(102, 2, 'Syntage of Conditional Operators.', '(Condition) ? Truepart : Falsepart', '(Condition) : Truepart ? Falsepart', '(Condition)= Truepart : Falsepart', '(Condition)= Truepart ? Falsepart', '(Condition) ? Truepart : Falsepart', 'active'),
(103, 2, '____ is the Special Operators.', 'AND', 'OR', 'Sizeof', 'Not', 'Sizeof', 'active'),
(104, 2, 'ANSI C supports ______ categories of data types.', 'One', 'Two', 'Three', 'Four', 'Three', 'active'),
(105, 2, 'How Many Types of User Define Data Types.', '1', '2', '3', '4', '2', 'active'),
(106, 2, 'Range of Integer Datatypes', '32766', '32767', '32768', '32769', '32768', 'active'),
(107, 2, 'Formate Specifier to Input String data. ', '%c', '%d', '%f', '%s', '%s', 'active'),
(108, 2, 'How Many types of type conversion.', '1', '2', '3', '4', '2', 'active'),
(109, 2, 'Output of a = (int ) 21.3/(int)4.5', '3', '4', '5', '6', '5', 'active'),
(110, 2, 'All pre processor commands begin with _____ Symbol.', '#', '//', '/*', '&', '#', 'active'),
(111, 2, 'Symbolic names are written in ________.', 'Lower Case', 'Upper Case', 'Title Case', 'Sentence Case', 'Upper Case', 'active'),
(112, 2, '#define statements must not end with a ____ .', '.', ':', ';', '\"', ';', 'active'),
(113, 2, 'B Language Developed ____ Years.', '1960', '1970', '1980', '1990', '1970', 'active'),
(114, 2, 'Write a Output Printf(\"C Language\");', 'C Language', 'CLanguage', 'Error', 'c language', 'Error', 'active'),
(115, 2, 'To Declare the Variable First character must be an ________.', 'Alphabet or Underscore', 'Alphabet ', 'Underscore', 'Digits', 'Alphabet or Underscore', 'active'),
(116, 2, 'Which of the following Integer Constants.', '123', '123.23', '12.ab', '-12.45', '123', 'active'),
(117, 2, 'Logical Operators Returns _____ Values.', 'Int', 'Float', 'Boolean', 'Char', 'Boolean', 'active'),
(118, 2, 'What is will be Output of int a=5; a++; printf(\"%d\",a);', '5', '6', '7', '8', '6', 'active'),
(119, 2, 'The operator ++ add _____ to operand', '1', '2', '3', '4', '1', 'active'),
(120, 2, 'What is will be Output of 100 + 200 / 10 - 3 * 10', '50', '80', '90', '100', '90', 'active'),
(121, 2, 'Who is the father of computer', 'Charles Merin', 'Charles Babbage', 'Henry Ford', 'Henry Missel', 'Charles Babbage', 'active'),
(122, 2, 'Data-->_______--->Information', 'Input', 'Output', 'Process', 'CPU', 'Process', 'active'),
(123, 2, 'Computer is ______device', 'Mechincal', 'Electronics', 'Mecatronics', 'None', 'Electronics', 'active'),
(124, 2, 'Which feature is used for Analog computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Speed', 'active'),
(125, 2, 'Which feature is used for Digital computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Accuracy', 'active'),
(126, 2, 'Which feature is used for Hybrid computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Both', 'active'),
(127, 2, 'What is the smallest name of computer in the histroy of computer?', 'Analtical Engine', 'Abacus', 'Univac-1', 'None', 'Abacus', 'active'),
(128, 2, 'Which hardware is used in first generation of computer?', 'IC', 'LSI', 'Vaccum tube', 'Semiconductor', 'Vaccum tube', 'active'),
(129, 2, 'Which hardware is used in Second generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'Semiconductor', 'Transistor', 'active'),
(130, 2, 'Which hardware is used in Third generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'None', 'IC', 'active'),
(131, 2, 'Which genration is giving start to network technology?', 'First', 'Second ', 'Third', 'Fourth', 'Fourth', 'active'),
(132, 2, 'Which genration is having largest power usage in computers?', 'First', 'Fifth', 'Third', 'Second', 'First', 'active'),
(133, 2, 'Full form of VLSI', 'Very Large System Item', 'Very Large Scale Item', 'Vary Large Scale Integration', 'Very Large Scale Integration', 'Very Large Scale Integration', 'active'),
(134, 2, 'LSI is used in _____generation', 'Third', 'Fourth', 'Fifth', 'None', 'Third', 'active'),
(135, 2, 'ULSI is used in_____generation.', 'First', 'Fifth', 'Third', 'Second', 'Fifth', 'active'),
(136, 2, 'Full form of CPU', 'Central Processing Union', 'Center Primary Unit', 'Centeral Processing Unit', 'Center Pressure Unit', 'Central Processing Unit', 'active'),
(137, 2, 'Full form of ALU', 'Arithmatic Love Unit', 'Aroma Logic Unit', 'Arithmatic Logic Unit', 'Aramica Lovely Unit', 'Arithmatic Logic Unit', 'active'),
(138, 2, 'Full form of PS______', 'Personal System', 'Persistent System', 'Personal Scooter', 'Perry System', 'Personal System', 'active'),
(139, 2, 'Full form of USB_______', 'Union Sorry Bus', 'Union System Bus', 'Universal Serial Bus', 'Union System Berry', 'Universal Serial Bus', 'active'),
(140, 2, 'Full form of VGA_____', 'Visual Groom Array', 'Vital Graphics Array', 'Visual Graphics Array', 'Video Graphics Array', 'Video Graphics Array', 'active'),
(141, 2, 'Full form of DVI_____', 'Digital Video Interface', 'Digital Video Intrcept', 'Digital Viral Inteface', 'Digital Video Intermediate', 'Digital Video Interface', 'active'),
(142, 2, 'Graphics card is connected on____Slot', 'PCI', 'AGP', 'Slot', 'None', 'AGP', 'active'),
(143, 2, 'Sound Card is connected on _____Slot', 'PCI', 'AGP', 'Slot', 'None', 'PCI', 'active'),
(144, 2, 'Full form of NIC', 'Network interim Cord', 'New Interface Card', 'Network Interface Card', 'Network Intrim Card', 'Network Interface Card', 'active'),
(145, 2, 'Full form of UPS', 'Uniterupptible Panic System', 'Uninterupptible Power Derivative', 'Uninterupptible Power Device', 'Uninterupptible Primary Device', 'Uninterupptible Power Device', 'active'),
(146, 2, 'RAM is fitted on ____Slot', 'ROM', 'RAM', 'Both', 'None', 'RAM', 'active'),
(147, 2, 'Static and Dynamic are types of ______', 'RAM', 'ROM', 'Both', 'None', 'RAM', 'active'),
(148, 2, 'Full form of BIOS', 'Basic Input and Output system', 'Better Input and Output system', 'Basic Input and Output size', 'Basic Iron and Oral system', 'Basic Input and Output system', 'active'),
(149, 2, 'Which device is known as Processor in computer', 'RAM', 'ROM', 'Both ', 'ALU', 'ALU', 'active'),
(150, 2, 'Computer word is coming from _____word', 'Computer', 'Compute', 'Calculate', 'Calling', 'Compute', 'active'),
(151, 2, 'FULL FORM OF HTML_______________', 'HYPERTEXT MARKUP LANGUAGE', 'Danis Root', 'Danish Clark', 'None of these', 'HYPERTEXT MARKUP LANGUAGE', 'active'),
(152, 2, 'FATHER OF THE HTML______________', 'Gayle', 'TIM BERNERS ? LEE', 'Dr.E.F.Codd', 'None of these', 'TIM BERNERS ? LEE', 'active'),
(153, 2, 'title tag is written under ____ tag', 'HTML', 'HEAD', 'SGML', 'XML', 'HEAD', 'active'),
(154, 2, 'Full form of OL is ___', 'Unordered List', 'Listing List', 'Ordered List', 'Oriented List', 'Ordered List', 'active'),
(155, 2, 'Full form of a is ___', 'Action Tag', 'Attribute Tag', 'Anchor Tag', 'Acquire Tag', 'Anchor Tag', 'active'),
(156, 2, '__ is the property used to change color of font', 'face', 'color', 'background', 'None of these', 'color', 'active'),
(157, 2, 'sup tag is known as ___', 'Superscript Tag', 'Subscript Tag', 'Secure Tag', 'Southern Tag', 'Superscript Tag', 'active'),
(158, 2, 'WHAT IS THE USE OF SUB TAG?', 'Display the text', 'DISPLAY TEXT IN SUB SCRIPT', 'CREATING UNORDERED LIST', 'None of these', 'DISPLAY TEXT IN SUB SCRIPT', 'active'),
(159, 2, 'IMG TAG IS USED FOR', 'CREATING ORDERED LIST', 'UNORDER LIST', 'DISPLAYING IMAGE', 'None of these', 'DISPLAYING IMAGE', 'active'),
(160, 2, 'target is property of __ tag', 'A TAG', 'b tag', 'c tag', 'None of these', 'A TAG', 'active'),
(161, 2, 'DL TAG IS USED FOR', 'CREATING DEFINITION LIST', 'CREATING UNORDERED LIST', 'CREATING UNORDERED LIST', 'None of these', 'CREATING DEFINITION LIST', 'active'),
(162, 2, 'FULL FORM OF DT __________', 'DATA LIST', 'DECLARATION LIST', 'DIVIDEND LIST', 'DEFINITION TERM', 'DEFINITION TERM', 'active'),
(163, 2, 'FRAME is the subset of ___ tag', 'section', 'memo', 'subsection', 'frameset', 'frameset', 'active'),
(164, 2, '\"input type=submit\" is used to display ___', 'Section', 'Color', 'Object', 'Button', 'Button', 'active'),
(165, 2, 'Full form of CSS is ___', 'Caste Style Sheet', 'Cascading Style Sheet', 'Caution Style Sheet', 'Curator Style Sheet', 'Cascading Style Sheet', 'active'),
(166, 2, 'There are total __ types of Stylesheet', '1', '2', '3', '4', '3', 'active'),
(167, 2, 'p style=\"\" is example of ___ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(168, 2, '\"style p {color:red;}\" is example of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(169, 2, 'Creating a file style.css is type of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'External', 'active'),
(170, 2, 'NORESIZE is the property of __ tag', 'frameset', 'frame', 'fluid', 'flouroscent', 'frame', 'active'),
(171, 2, 'To display textbox ___ input type should be used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=text', 'active'),
(172, 2, 'To display password box __ input type is used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=password', 'active'),
(173, 2, 'To display big text box __ tag is used', 'button', 'textarea', 'text', 'today', 'textarea', 'active'),
(174, 2, 'HTML is __ side scripting language', 'Client', 'Server', 'Both', 'None of these', 'Client', 'active'),
(175, 2, 'BORDER property is part of ___', 'html', 'hul', 'col', 'None of these', 'None of these', 'active'),
(176, 2, 'Full form of HR is __', 'HYPERTEXT MARKUP LANGUAGE', 'HEAD', 'Horizontal ruler', 'Hype', 'Horizontal ruler', 'active'),
(177, 2, '___ is NOT the property of TABLE', 'border', 'summary', 'align', 'adjustment', 'adjustment', 'active'),
(178, 2, 'METHOD property in form by default is ___', 'POST', 'GET', 'REQUEST', 'FOLLOW', 'GET', 'active'),
(179, 2, '___ is NOT the property of marquee', 'direction', 'behavior', 'color', 'loop', 'color', 'active'),
(180, 2, '__ is NOT the type of stylesheet', 'Inline', 'Internal', 'Inferior', 'External', 'Inferior', 'active'),
(181, 3, 'Martin Richards Developed a Language is Called ____.', 'Algol', 'BCPL', 'B Language', 'C Language', 'BCPL', 'active'),
(182, 3, '____ is Developed C Language.', 'Dennis Ritchie', 'Ken Thompson', 'Martin Richards', 'Kerningham', 'Dennis Ritchie', 'active'),
(183, 3, 'Full Form of ANSI.', 'American National Standard Information', 'American National Standard Institute', 'American National Standard Input', 'American National Standard Isolation', 'American National Standard Institute', 'active'),
(184, 3, 'The documentation section consists of a set of ______ lines.', 'Digits', 'Key', 'Comment', 'New', 'Comment', 'active'),
(185, 3, 'Main Function Devides ____ Section.', '1', '2', '3', '4', '2', 'active'),
(186, 3, 'User defined functions are generally placed _____.', 'Defination Section', 'Linkage Section', 'Defination Section', 'Sub Program Section', 'Sub Program Section', 'active'),
(187, 3, 'How Many Type of Tokens.', '1', '2', '4', '6', '6', 'active'),
(188, 3, 'All keywords have ____ meanings and these meanings cannot be changed.', 'Fixed', 'One', 'Multiple ', 'Single', 'Fixed', 'active'),
(189, 3, 'ANSI standard recognizes a length of _____ characters.', '21', '31', '41', '51', '31', 'active'),
(190, 3, 'How Many Type of Operators.', '5', '6', '7', '8', '8', 'active'),
(191, 3, 'How Many Type of Logical Operators.', '1', '2', '3', '4', '3', 'active'),
(192, 3, 'Syntage of Conditional Operators.', '(Condition) ? Truepart : Falsepart', '(Condition) : Truepart ? Falsepart', '(Condition)= Truepart : Falsepart', '(Condition)= Truepart ? Falsepart', '(Condition) ? Truepart : Falsepart', 'active'),
(193, 3, '____ is the Special Operators.', 'AND', 'OR', 'Sizeof', 'Not', 'Sizeof', 'active'),
(194, 3, 'ANSI C supports ______ categories of data types.', 'One', 'Two', 'Three', 'Four', 'Three', 'active'),
(195, 3, 'How Many Types of User Define Data Types.', '1', '2', '3', '4', '2', 'active'),
(196, 3, 'Range of Integer Datatypes', '32766', '32767', '32768', '32769', '32768', 'active'),
(197, 3, 'Formate Specifier to Input String data. ', '%c', '%d', '%f', '%s', '%s', 'active'),
(198, 3, 'How Many types of type conversion.', '1', '2', '3', '4', '2', 'active'),
(199, 3, 'Output of a = (int ) 21.3/(int)4.5', '3', '4', '5', '6', '5', 'active'),
(200, 3, 'All pre processor commands begin with _____ Symbol.', '#', '//', '/*', '&', '#', 'active'),
(201, 3, 'Symbolic names are written in ________.', 'Lower Case', 'Upper Case', 'Title Case', 'Sentence Case', 'Upper Case', 'active'),
(202, 3, '#define statements must not end with a ____ .', '.', ':', ';', '\"', ';', 'active'),
(203, 3, 'B Language Developed ____ Years.', '1960', '1970', '1980', '1990', '1970', 'active'),
(204, 3, 'Write a Output Printf(\"C Language\");', 'C Language', 'CLanguage', 'Error', 'c language', 'Error', 'active'),
(205, 3, 'To Declare the Variable First character must be an ________.', 'Alphabet or Underscore', 'Alphabet ', 'Underscore', 'Digits', 'Alphabet or Underscore', 'active'),
(206, 3, 'Which of the following Integer Constants.', '123', '123.23', '12.ab', '-12.45', '123', 'active'),
(207, 3, 'Logical Operators Returns _____ Values.', 'Int', 'Float', 'Boolean', 'Char', 'Boolean', 'active'),
(208, 3, 'What is will be Output of int a=5; a++; printf(\"%d\",a);', '5', '6', '7', '8', '6', 'active'),
(209, 3, 'The operator ++ add _____ to operand', '1', '2', '3', '4', '1', 'active'),
(210, 3, 'What is will be Output of 100 + 200 / 10 - 3 * 10', '50', '80', '90', '100', '90', 'active'),
(211, 3, 'Who is the father of computer', 'Charles Merin', 'Charles Babbage', 'Henry Ford', 'Henry Missel', 'Charles Babbage', 'active'),
(212, 3, 'Data-->_______--->Information', 'Input', 'Output', 'Process', 'CPU', 'Process', 'active'),
(213, 3, 'Computer is ______device', 'Mechincal', 'Electronics', 'Mecatronics', 'None', 'Electronics', 'active'),
(214, 3, 'Which feature is used for Analog computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Speed', 'active'),
(215, 3, 'Which feature is used for Digital computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Accuracy', 'active'),
(216, 3, 'Which feature is used for Hybrid computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Both', 'active'),
(217, 3, 'What is the smallest name of computer in the histroy of computer?', 'Analtical Engine', 'Abacus', 'Univac-1', 'None', 'Abacus', 'active'),
(218, 3, 'Which hardware is used in first generation of computer?', 'IC', 'LSI', 'Vaccum tube', 'Semiconductor', 'Vaccum tube', 'active'),
(219, 3, 'Which hardware is used in Second generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'Semiconductor', 'Transistor', 'active'),
(220, 3, 'Which hardware is used in Third generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'None', 'IC', 'active'),
(221, 3, 'Which genration is giving start to network technology?', 'First', 'Second ', 'Third', 'Fourth', 'Fourth', 'active'),
(222, 3, 'Which genration is having largest power usage in computers?', 'First', 'Fifth', 'Third', 'Second', 'First', 'active'),
(223, 3, 'Full form of VLSI', 'Very Large System Item', 'Very Large Scale Item', 'Vary Large Scale Integration', 'Very Large Scale Integration', 'Very Large Scale Integration', 'active'),
(224, 3, 'LSI is used in _____generation', 'Third', 'Fourth', 'Fifth', 'None', 'Third', 'active'),
(225, 3, 'ULSI is used in_____generation.', 'First', 'Fifth', 'Third', 'Second', 'Fifth', 'active'),
(226, 3, 'Full form of CPU', 'Central Processing Union', 'Center Primary Unit', 'Centeral Processing Unit', 'Center Pressure Unit', 'Central Processing Unit', 'active'),
(227, 3, 'Full form of ALU', 'Arithmatic Love Unit', 'Aroma Logic Unit', 'Arithmatic Logic Unit', 'Aramica Lovely Unit', 'Arithmatic Logic Unit', 'active'),
(228, 3, 'Full form of PS______', 'Personal System', 'Persistent System', 'Personal Scooter', 'Perry System', 'Personal System', 'active'),
(229, 3, 'Full form of USB_______', 'Union Sorry Bus', 'Union System Bus', 'Universal Serial Bus', 'Union System Berry', 'Universal Serial Bus', 'active'),
(230, 3, 'Full form of VGA_____', 'Visual Groom Array', 'Vital Graphics Array', 'Visual Graphics Array', 'Video Graphics Array', 'Video Graphics Array', 'active'),
(231, 3, 'Full form of DVI_____', 'Digital Video Interface', 'Digital Video Intrcept', 'Digital Viral Inteface', 'Digital Video Intermediate', 'Digital Video Interface', 'active'),
(232, 3, 'Graphics card is connected on____Slot', 'PCI', 'AGP', 'Slot', 'None', 'AGP', 'active'),
(233, 3, 'Sound Card is connected on _____Slot', 'PCI', 'AGP', 'Slot', 'None', 'PCI', 'active'),
(234, 3, 'Full form of NIC', 'Network interim Cord', 'New Interface Card', 'Network Interface Card', 'Network Intrim Card', 'Network Interface Card', 'active'),
(235, 3, 'Full form of UPS', 'Uniterupptible Panic System', 'Uninterupptible Power Derivative', 'Uninterupptible Power Device', 'Uninterupptible Primary Device', 'Uninterupptible Power Device', 'active'),
(236, 3, 'RAM is fitted on ____Slot', 'ROM', 'RAM', 'Both', 'None', 'RAM', 'active'),
(237, 3, 'Static and Dynamic are types of ______', 'RAM', 'ROM', 'Both', 'None', 'RAM', 'active'),
(238, 3, 'Full form of BIOS', 'Basic Input and Output system', 'Better Input and Output system', 'Basic Input and Output size', 'Basic Iron and Oral system', 'Basic Input and Output system', 'active'),
(239, 3, 'Which device is known as Processor in computer', 'RAM', 'ROM', 'Both ', 'ALU', 'ALU', 'active'),
(240, 3, 'Computer word is coming from _____word', 'Computer', 'Compute', 'Calculate', 'Calling', 'Compute', 'active'),
(241, 3, 'FULL FORM OF HTML_______________', 'HYPERTEXT MARKUP LANGUAGE', 'Danis Root', 'Danish Clark', 'None of these', 'HYPERTEXT MARKUP LANGUAGE', 'active'),
(242, 3, 'FATHER OF THE HTML______________', 'Gayle', 'TIM BERNERS ? LEE', 'Dr.E.F.Codd', 'None of these', 'TIM BERNERS ? LEE', 'active'),
(243, 3, 'title tag is written under ____ tag', 'HTML', 'HEAD', 'SGML', 'XML', 'HEAD', 'active'),
(244, 3, 'Full form of OL is ___', 'Unordered List', 'Listing List', 'Ordered List', 'Oriented List', 'Ordered List', 'active'),
(245, 3, 'Full form of a is ___', 'Action Tag', 'Attribute Tag', 'Anchor Tag', 'Acquire Tag', 'Anchor Tag', 'active'),
(246, 3, '__ is the property used to change color of font', 'face', 'color', 'background', 'None of these', 'color', 'active'),
(247, 3, 'sup tag is known as ___', 'Superscript Tag', 'Subscript Tag', 'Secure Tag', 'Southern Tag', 'Superscript Tag', 'active'),
(248, 3, 'WHAT IS THE USE OF SUB TAG?', 'Display the text', 'DISPLAY TEXT IN SUB SCRIPT', 'CREATING UNORDERED LIST', 'None of these', 'DISPLAY TEXT IN SUB SCRIPT', 'active'),
(249, 3, 'IMG TAG IS USED FOR', 'CREATING ORDERED LIST', 'UNORDER LIST', 'DISPLAYING IMAGE', 'None of these', 'DISPLAYING IMAGE', 'active'),
(250, 3, 'target is property of __ tag', 'A TAG', 'b tag', 'c tag', 'None of these', 'A TAG', 'active'),
(251, 3, 'DL TAG IS USED FOR', 'CREATING DEFINITION LIST', 'CREATING UNORDERED LIST', 'CREATING UNORDERED LIST', 'None of these', 'CREATING DEFINITION LIST', 'active'),
(252, 3, 'FULL FORM OF DT __________', 'DATA LIST', 'DECLARATION LIST', 'DIVIDEND LIST', 'DEFINITION TERM', 'DEFINITION TERM', 'active'),
(253, 3, 'FRAME is the subset of ___ tag', 'section', 'memo', 'subsection', 'frameset', 'frameset', 'active'),
(254, 3, '\"input type=submit\" is used to display ___', 'Section', 'Color', 'Object', 'Button', 'Button', 'active'),
(255, 3, 'Full form of CSS is ___', 'Caste Style Sheet', 'Cascading Style Sheet', 'Caution Style Sheet', 'Curator Style Sheet', 'Cascading Style Sheet', 'active'),
(256, 3, 'There are total __ types of Stylesheet', '1', '2', '3', '4', '3', 'active'),
(257, 3, 'p style=\"\" is example of ___ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(258, 3, '\"style p {color:red;}\" is example of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(259, 3, 'Creating a file style.css is type of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'External', 'active'),
(260, 3, 'NORESIZE is the property of __ tag', 'frameset', 'frame', 'fluid', 'flouroscent', 'frame', 'active'),
(261, 3, 'To display textbox ___ input type should be used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=text', 'active'),
(262, 3, 'To display password box __ input type is used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=password', 'active'),
(263, 3, 'To display big text box __ tag is used', 'button', 'textarea', 'text', 'today', 'textarea', 'active'),
(264, 3, 'HTML is __ side scripting language', 'Client', 'Server', 'Both', 'None of these', 'Client', 'active'),
(265, 3, 'BORDER property is part of ___', 'html', 'hul', 'col', 'None of these', 'None of these', 'active'),
(266, 3, 'Full form of HR is __', 'HYPERTEXT MARKUP LANGUAGE', 'HEAD', 'Horizontal ruler', 'Hype', 'Horizontal ruler', 'active'),
(267, 3, '___ is NOT the property of TABLE', 'border', 'summary', 'align', 'adjustment', 'adjustment', 'active'),
(268, 3, 'METHOD property in form by default is ___', 'POST', 'GET', 'REQUEST', 'FOLLOW', 'GET', 'active'),
(269, 3, '___ is NOT the property of marquee', 'direction', 'behavior', 'color', 'loop', 'color', 'active'),
(270, 3, '__ is NOT the type of stylesheet', 'Inline', 'Internal', 'Inferior', 'External', 'Inferior', 'active'),
(271, 4, 'Martin Richards Developed a Language is Called ____.', 'Algol', 'BCPL', 'B Language', 'C Language', 'BCPL', 'active'),
(272, 4, '____ is Developed C Language.', 'Dennis Ritchie', 'Ken Thompson', 'Martin Richards', 'Kerningham', 'Dennis Ritchie', 'active'),
(273, 4, 'Full Form of ANSI.', 'American National Standard Information', 'American National Standard Institute', 'American National Standard Input', 'American National Standard Isolation', 'American National Standard Institute', 'active'),
(274, 4, 'The documentation section consists of a set of ______ lines.', 'Digits', 'Key', 'Comment', 'New', 'Comment', 'active'),
(275, 4, 'Main Function Devides ____ Section.', '1', '2', '3', '4', '2', 'active'),
(276, 4, 'User defined functions are generally placed _____.', 'Defination Section', 'Linkage Section', 'Defination Section', 'Sub Program Section', 'Sub Program Section', 'active'),
(277, 4, 'How Many Type of Tokens.', '1', '2', '4', '6', '6', 'active'),
(278, 4, 'All keywords have ____ meanings and these meanings cannot be changed.', 'Fixed', 'One', 'Multiple ', 'Single', 'Fixed', 'active'),
(279, 4, 'ANSI standard recognizes a length of _____ characters.', '21', '31', '41', '51', '31', 'active'),
(280, 4, 'How Many Type of Operators.', '5', '6', '7', '8', '8', 'active'),
(281, 4, 'How Many Type of Logical Operators.', '1', '2', '3', '4', '3', 'active'),
(282, 4, 'Syntage of Conditional Operators.', '(Condition) ? Truepart : Falsepart', '(Condition) : Truepart ? Falsepart', '(Condition)= Truepart : Falsepart', '(Condition)= Truepart ? Falsepart', '(Condition) ? Truepart : Falsepart', 'active'),
(283, 4, '____ is the Special Operators.', 'AND', 'OR', 'Sizeof', 'Not', 'Sizeof', 'active'),
(284, 4, 'ANSI C supports ______ categories of data types.', 'One', 'Two', 'Three', 'Four', 'Three', 'active'),
(285, 4, 'How Many Types of User Define Data Types.', '1', '2', '3', '4', '2', 'active'),
(286, 4, 'Range of Integer Datatypes', '32766', '32767', '32768', '32769', '32768', 'active'),
(287, 4, 'Formate Specifier to Input String data. ', '%c', '%d', '%f', '%s', '%s', 'active'),
(288, 4, 'How Many types of type conversion.', '1', '2', '3', '4', '2', 'active'),
(289, 4, 'Output of a = (int ) 21.3/(int)4.5', '3', '4', '5', '6', '5', 'active'),
(290, 4, 'All pre processor commands begin with _____ Symbol.', '#', '//', '/*', '&', '#', 'active'),
(291, 4, 'Symbolic names are written in ________.', 'Lower Case', 'Upper Case', 'Title Case', 'Sentence Case', 'Upper Case', 'active'),
(292, 4, '#define statements must not end with a ____ .', '.', ':', ';', '\"', ';', 'active'),
(293, 4, 'B Language Developed ____ Years.', '1960', '1970', '1980', '1990', '1970', 'active'),
(294, 4, 'Write a Output Printf(\"C Language\");', 'C Language', 'CLanguage', 'Error', 'c language', 'Error', 'active'),
(295, 4, 'To Declare the Variable First character must be an ________.', 'Alphabet or Underscore', 'Alphabet ', 'Underscore', 'Digits', 'Alphabet or Underscore', 'active'),
(296, 4, 'Which of the following Integer Constants.', '123', '123.23', '12.ab', '-12.45', '123', 'active'),
(297, 4, 'Logical Operators Returns _____ Values.', 'Int', 'Float', 'Boolean', 'Char', 'Boolean', 'active'),
(298, 4, 'What is will be Output of int a=5; a++; printf(\"%d\",a);', '5', '6', '7', '8', '6', 'active'),
(299, 4, 'The operator ++ add _____ to operand', '1', '2', '3', '4', '1', 'active'),
(300, 4, 'What is will be Output of 100 + 200 / 10 - 3 * 10', '50', '80', '90', '100', '90', 'active'),
(301, 4, 'Who is the father of computer', 'Charles Merin', 'Charles Babbage', 'Henry Ford', 'Henry Missel', 'Charles Babbge', 'active'),
(302, 4, 'Data-->_______--->Information', 'Input', 'Output', 'Process', 'CPU', 'Process', 'active'),
(303, 4, 'Computer is ______device', 'Mechincal', 'Electronics', 'Mecatronics', 'None', 'Electronics', 'active'),
(304, 4, 'Which feature is used for Analog computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Speed', 'active'),
(305, 4, 'Which feature is used for Digital computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Accuracy', 'active'),
(306, 4, 'Which feature is used for Hybrid computer?', 'Speed', 'Accuracy ', 'Both', 'None', 'Both', 'active'),
(307, 4, 'What is the smallest name of computer in the histroy of computer?', 'Analtical Engine', 'Abacus', 'Univac-1', 'None', 'Abacus', 'active'),
(308, 4, 'Which hardware is used in first generation of computer?', 'IC', 'LSI', 'Vaccum tube', 'Semiconductor', 'Vaccum tube', 'active'),
(309, 4, 'Which hardware is used in Second generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'Semiconductor', 'Transistor', 'active'),
(310, 4, 'Which hardware is used in Third generation of computer?', 'IC', 'Transistor', 'Vaccum tube', 'None', 'IC', 'active'),
(311, 4, 'Which genration is giving start to network technology?', 'First', 'Second ', 'Third', 'Fourth', 'Fourth', 'active'),
(312, 4, 'Which genration is having largest power usage in computers?', 'First', 'Fifth', 'Third', 'Second', 'First', 'active'),
(313, 4, 'Full form of VLSI', 'Very Large System Item', 'Very Large Scale Item', 'Vary Large Scale Integration', 'Very Large Scale Integration', 'Very Large Scale Integration', 'active'),
(314, 4, 'LSI is used in _____generation', 'Third', 'Fourth', 'Fifth', 'None', 'Third', 'active'),
(315, 4, 'ULSI is used in_____generation.', 'First', 'Fifth', 'Third', 'Second', 'Fifth', 'active'),
(316, 4, 'Full form of CPU', 'Central Processing Union', 'Center Primary Unit', 'Centeral Processing Unit', 'Center Pressure Unit', 'Central Processing Unit', 'active'),
(317, 4, 'Full form of ALU', 'Arithmatic Love Unit', 'Aroma Logic Unit', 'Arithmatic Logic Unit', 'Aramica Lovely Unit', 'Arithmatic Logic Unit', 'active'),
(318, 4, 'Full form of PS______', 'Personal System', 'Persistent System', 'Personal Scooter', 'Perry System', 'Personal System', 'active'),
(319, 4, 'Full form of USB_______', 'Union Sorry Bus', 'Union System Bus', 'Universal Serial Bus', 'Union System Berry', 'Universal Serial Bus', 'active'),
(320, 4, 'Full form of VGA_____', 'Visual Groom Array', 'Vital Graphics Array', 'Visual Graphics Array', 'Video Graphics Array', 'Video Graphics Array', 'active'),
(321, 4, 'Full form of DVI_____', 'Digital Video Interface', 'Digital Video Intrcept', 'Digital Viral Inteface', 'Digital Video Intermediate', 'Digital Video Interface', 'active'),
(322, 4, 'Graphics card is connected on____Slot', 'PCI', 'AGP', 'Slot', 'None', 'AGP', 'active'),
(323, 4, 'Sound Card is connected on _____Slot', 'PCI', 'AGP', 'Slot', 'None', 'PCI', 'active'),
(324, 4, 'Full form of NIC', 'Network interim Cord', 'New Interface Card', 'Network Interface Card', 'Network Intrim Card', 'Network Interface Card', 'active'),
(325, 4, 'Full form of UPS', 'Uniterupptible Panic System', 'Uninterupptible Power Derivative', 'Uninterupptible Power Device', 'Uninterupptible Primary Device', 'Uninterupptible Power Device', 'active'),
(326, 4, 'RAM is fitted on ____Slot', 'ROM', 'RAM', 'Both', 'None', 'RAM', 'active'),
(327, 4, 'Static and Dynamic are types of ______', 'RAM', 'ROM', 'Both', 'None', 'RAM', 'active'),
(328, 4, 'Full form of BIOS', 'Basic Input and Output system', 'Better Input and Output system', 'Basic Input and Output size', 'Basic Iron and Oral system', 'Basic Input and Output system', 'active'),
(329, 4, 'Which device is known as Processor in computer', 'RAM', 'ROM', 'Both ', 'ALU', 'ALU', 'active'),
(330, 4, 'Computer word is coming from _____word', 'Computer', 'Compute', 'Calculate', 'Calling', 'Compute', 'active'),
(331, 4, 'FULL FORM OF HTML_______________', 'HYPERTEXT MARKUP LANGUAGE', 'Danis Root', 'Danish Clark', 'None of these', 'HYPERTEXT MARKUP LANGUAGE', 'active'),
(332, 4, 'FATHER OF THE HTML______________', 'Gayle', 'TIM BERNERS ? LEE', 'Dr.E.F.Codd', 'None of these', 'TIM BERNERS ? LEE', 'active'),
(333, 4, 'title tag is written under ____ tag', 'HTML', 'HEAD', 'SGML', 'XML', 'HEAD', 'active'),
(334, 4, 'Full form of OL is ___', 'Unordered List', 'Listing List', 'Ordered List', 'Oriented List', 'Ordered List', 'active'),
(335, 4, 'Full form of a is ___', 'Action Tag', 'Attribute Tag', 'Anchor Tag', 'Acquire Tag', 'Anchor Tag', 'active'),
(336, 4, '__ is the property used to change color of font', 'face', 'color', 'background', 'None of these', 'color', 'active'),
(337, 4, 'sup tag is known as ___', 'Superscript Tag', 'Subscript Tag', 'Secure Tag', 'Southern Tag', 'Superscript Tag', 'active'),
(338, 4, 'WHAT IS THE USE OF SUB TAG?', 'Display the text', 'DISPLAY TEXT IN SUB SCRIPT', 'CREATING UNORDERED LIST', 'None of these', 'DISPLAY TEXT IN SUB SCRIPT', 'active'),
(339, 4, 'IMG TAG IS USED FOR', 'CREATING ORDERED LIST', 'UNORDER LIST', 'DISPLAYING IMAGE', 'None of these', 'DISPLAYING IMAGE', 'active'),
(340, 4, 'target is property of __ tag', 'A TAG', 'b tag', 'c tag', 'None of these', 'A TAG', 'active'),
(341, 4, 'DL TAG IS USED FOR', 'CREATING DEFINITION LIST', 'CREATING UNORDERED LIST', 'CREATING UNORDERED LIST', 'None of these', 'CREATING DEFINITION LIST', 'active'),
(342, 4, 'FULL FORM OF DT __________', 'DATA LIST', 'DECLARATION LIST', 'DIVIDEND LIST', 'DEFINITION TERM', 'DEFINITION TERM', 'active'),
(343, 4, 'FRAME is the subset of ___ tag', 'section', 'memo', 'subsection', 'frameset', 'frameset', 'active'),
(344, 4, '\"input type=submit\" is used to display ___', 'Section', 'Color', 'Object', 'Button', 'Button', 'active'),
(345, 4, 'Full form of CSS is ___', 'Caste Style Sheet', 'Cascading Style Sheet', 'Caution Style Sheet', 'Curator Style Sheet', 'Cascading Style Sheet', 'active'),
(346, 4, 'There are total __ types of Stylesheet', '1', '2', '3', '4', '3', 'active'),
(347, 4, 'p style=\"\" is example of ___ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(348, 4, '\"style p {color:red;}\" is example of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'Internal', 'active'),
(349, 4, 'Creating a file style.css is type of __ stylesheet', 'Inline', 'Internal', 'External', 'None of these', 'External', 'active'),
(350, 4, 'NORESIZE is the property of __ tag', 'frameset', 'frame', 'fluid', 'flouroscent', 'frame', 'active'),
(351, 4, 'To display textbox ___ input type should be used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=text', 'active'),
(352, 4, 'To display password box __ input type is used', 'type=checkbox', 'type=radio', 'type=text', 'type=password', 'type=password', 'active'),
(353, 4, 'To display big text box __ tag is used', 'button', 'textarea', 'text', 'today', 'textarea', 'active'),
(354, 4, 'HTML is __ side scripting language', 'Client', 'Server', 'Both', 'None of these', 'Client', 'active'),
(355, 4, 'BORDER property is part of ___', 'html', 'hul', 'col', 'None of these', 'None of these', 'active'),
(356, 4, 'Full form of HR is __', 'HYPERTEXT MARKUP LANGUAGE', 'HEAD', 'Horizontal ruler', 'Hype', 'Horizontal ruler', 'active'),
(357, 4, '___ is NOT the property of TABLE', 'border', 'summary', 'align', 'adjustment', 'adjustment', 'active'),
(358, 4, 'METHOD property in form by default is ___', 'POST', 'GET', 'REQUEST', 'FOLLOW', 'GET', 'active'),
(359, 4, '___ is NOT the property of marquee', 'direction', 'behavior', 'color', 'loop', 'color', 'active'),
(360, 4, '__ is NOT the type of stylesheet', 'Inline', 'Internal', 'Inferior', 'External', 'Inferior', 'active'),
(361, 5, 'HTML IS A SUBSET OF______________', 'HTML', 'JSP', 'SGML', 'XML', 'SGML', 'active'),
(362, 5, 'BODY TAG SPECIFIES THE___________________', 'MAIN CONTENT OF THE PAGE', 'TITLE OF PAGE', 'BACKGROUND OF PAGE', 'None of these', 'MAIN CONTENT OF THE PAGE', 'active'),
(363, 5, 'LIST OUT BASIC ELEMENTS OF HTML____________', 'DIV', 'P', 'H1', 'TAGS, ATTRIBUTES, URL', 'TAGS, ATTRIBUTES, URL', 'active'),
(364, 5, 'FULL NAME OF CSS', 'Cascading Style Sheet', 'DIV', 'case cading style', 'UL', 'Cascading Style Sheet', 'active'),
(365, 5, 'TITLE TAG IS WRITTEN UNDER _________TAG', 'HTML', 'HEAD', 'XML', 'SGML', 'HEAD', 'active'),
(366, 5, 'WHAT IS THE USE OF SUB TAG?', 'Display the text', 'DISPLAY TEXT IN SUB SCRIPT', 'CREATING UNORDERED LIST', 'None of these', 'DISPLAY TEXT IN SUB SCRIPT', 'active'),
(367, 5, 'OL TAG IS USED FOR', 'CREATING ORDERED LIST', 'UNORDER LIST', 'LIST', 'None of these', 'CREATING ORDERED LIST', 'active'),
(368, 5, 'UL TAG IS USED FOR', 'ORDER LIST', 'CREATING UNORDERED LIST', 'LIST', 'None of these', 'CREATING UNORDERED LIST', 'active'),
(369, 5, 'DL TAG IS USED FOR', 'CREATING DEFINITION LIST', 'CREATING UNORDERED LIST', 'CREATING UNORDERED LIST', 'None of these', 'CREATING DEFINITION LIST', 'active'),
(370, 5, 'FULL FORM OF DT is __________', 'DATA LIST', 'VIEW LIAT', 'RAW DATA', 'DEFINITION TERM', 'DEFINITION TERM', 'active'),
(371, 5, 'FULL FORM OF DD', 'DATABASE LIST', 'DEFINITION DESCRIPTION', 'DATA LIST', 'None of these', 'DEFINITION DESCRIPTION', 'active'),
(372, 5, 'WHICH TAG IS USED TO GIVE HYPERLINK?', 'A TAG', 'P TAG', 'H1 TAG', 'None of these', 'A TAG', 'active'),
(373, 5, 'WHICH SIGH USED TO DELCARE A CLASS ____', '.', '#', '@', 'None of these', '.', 'active'),
(374, 5, 'HREF ATTRIBUTE IS USED FOR________', 'URL OF THE PAGE', 'PAGE HEADE ', 'NONE OF THEASE', 'A AND B', 'URL OF THE PAGE', 'active'),
(375, 5, 'TARGET ATTRIBUTE IS USED FOR', 'OPEN DOCUMENT', 'CLOSE THE DOCUMENT', 'SPECIFIES WHERE TO OPEN DOCUMENTS', 'None of these', 'SPECIFIES WHERE TO OPEN DOCUMENTS', 'active'),
(376, 5, 'WHICH SIGH USED TO DELCARE A ID ____', '#', '.', '@', 'None of these', '#', 'active'),
(377, 5, 'WHICH TAG IS USED TO DISPLAY IMAGE ON PAGE?', 'UL', 'IMG TAG', 'PRE TAG', 'None of these', 'IMG TAG', 'active'),
(378, 5, 'SRC ATTRIBUTE IS USED FOR', 'IMAGE SOURCE / PATH', 'PATH IMAGE', 'A AND B', 'None of these', 'IMAGE SOURCE / PATH', 'active'),
(379, 5, 'HEIGHT & WIDTH ATTRIBUTES ARE USED FOR', 'COLOR OF IMAGE', 'TEXT IN PAGE', 'SIZE OF THE IMAGE', 'None of these', 'SIZE OF THE IMAGE', 'active'),
(380, 5, 'BORDER ATTRIBUTE IS USED FOR', 'SET THE BORDER', 'NONE OF THESE', 'PUT BORDER ON IMAGE', 'PUT DATA', 'PUT BORDER ON IMAGE', 'active'),
(381, 5, 'How many Types of Css available ?', '3', '4', '5', '6', '3', 'active'),
(382, 5, 'VSPACE ATTRIBUTE IS USED FOR', 'TOP BORDER AND VALUE', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'NONE OF THEASE', 'TAGS, ATTRIBUTES, URL', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'active'),
(383, 5, 'WHICH TAG IS USED TO CREATE TABLE?', 'TABLE TAG', 'FRAME', 'frameset', 'None of these', 'TABLE TAG', 'active'),
(384, 5, 'WHAT IS THE USE OF TR TAG?', 'CREATE TABLE RAW', 'CREATE DATA', 'CREATING UNORDERED LIST', 'None of these', 'CREATE TABLE RAW', 'active'),
(385, 5, 'TO MARGE ROWS AND COLUMNS WHICH ATTRIBUTES ARE USED?', 'IMAGE SOURCE / PATH', 'PATH IMAGE', 'COLSPAN AND ROWSPAN', 'None of these', 'COLSPAN AND ROWSPAN', 'active'),
(386, 5, 'FRAMESET TAG MEANS_______', 'SET OF FRAMES', 'SPACE BETWEEN TOP & BOTTOM EDGES', 'DATA LIST', 'None of these', 'SET OF FRAMES', 'active'),
(387, 5, 'HTML IS ________ SIDE SCRIPTING LANGUAGE', 'CLIENT', 'ROWS OF FILE', 'SERVER', 'None of these', 'CLIENT', 'active'),
(388, 5, 'FRAME TAG IS AVAILABLE IN HTML 5', 'YES', 'YES & NO', 'NONE OF THEASE', 'NO', 'NO', 'active'),
(389, 5, 'FULL FORM OF HTML_______________', 'HYPERTEXT MARKUP LANGUAGE', 'Danis Root', 'Danish Clark', 'None of these', 'HYPERTEXT MARKUP LANGUAGE', 'active'),
(390, 5, 'FATHER OF THE HTML______________', 'Gayle', 'TIM BERNERS ? LEE', 'Dr.E.F.Codd', 'None of these', 'TIM BERNERS ? LEE', 'active'),
(391, 5, 'Who is the father of C Language?', 'Steve Jobs', 'James Gosling', 'Dennis Ritche', 'Rasmus Lerdorf', 'Dennis Ritche', 'active'),
(392, 5, 'Which of the following is not a valid C variable?', 'int number;', 'float rate;', 'int var_count', 'int $main', 'int $main', 'active'),
(393, 5, 'All keywords in C are in _________.', 'LowerCase', 'UpperCase', 'CamelCase', 'None of the above', 'LowerCase', 'active'),
(394, 5, 'C is _______ level language.', 'High', 'Low', 'Middle', 'Machine', 'High', 'active'),
(395, 5, 'Which statement is used to terminate a statement?', ':', ';', '.', '|', ';', 'active'),
(396, 5, 'int datatype occupies _____ bytes', '8', '4', '6', '2', '2', 'active'),
(397, 5, 'which is the increment operator?', '+', '++', '||', '&&', '++', 'active');

--procedure for Add Questions

create procedure sp_InsertQuestion
@Question varchar(max),
@option_1 varchar(1000),
@option_2 varchar(1000),
@option_3 varchar(1000),
@option_4 varchar(1000),
@option_Correct varchar(1000)
as
begin
insert into examQuestion_Tbl(exam_Question,exam_Ch1,exam_Ch2,exam_Ch3,exam_Ch4,exam_Answer) values (@Question,@option_1,@option_2,@option_3,@option_4,@option_Correct);
end


--Procedure for ManageExam Page

create procedure sp_ManageExam
as
begin
select exam_Tbl.exam_Title,exam_Tbl.course_Id,exam_Tbl.exam_Description,exam_Tbl.exam_Timelimit,exam_Tbl.exam_QuestionlimitDisplay from exam_Tbl;
end

--procedure for Ranking By Exam Page

create procedure sp_RankingByExam
as
begin
select exam_Tbl.exam_Title,exam_Tbl.course_Id,exam_Tbl.exam_Description from exam_Tbl;
end


--procedure for create Exam
create procedure sp_CreateExam
@exam_Id bigint,
@course_Id bigint,
@class_Id bigint,
@exam_Title varchar(1000),
@exam_TimeLimit varchar(1000),
@exam_QuestionLimitDisplay bigint,
@exam_Description varchar(1000),
@exam_Created datetime 
as
begin
insert into exam_Tbl (exam_Id,course_Id,class_Id,exam_Title,exam_TimeLimit,exam_QuestionLimitDisplay,exam_Description,exam_Created)values(@exam_Id,@course_Id,@class_Id,@exam_Title,@exam_TimeLimit,@exam_QuestionLimitDisplay,@exam_Description,@exam_Created);
end
--changes karvano chhe bhai uper add karo upadatedAt

--procedure for delete Exam

create procedure sp_deleteExam
@examId int
as
begin
delete from exam_Tbl where exam_Id=@examId;
end

drop procedure sp_deleteExam;

--Table Time set for exam

create table setTime_Table
(
time_Id bigint primary key identity(1,1),
time_Name varchar(50),
time_Value int
);

select * from setTime_Table;

insert into setTime_Table values('10 Minutes',10);
insert into setTime_Table values('20 Minutes',20);
insert into setTime_Table values('30 Minutes',30);
insert into setTime_Table values('40 Minutes',40);
insert into setTime_Table values('50 Minutes',50);
insert into setTime_Table values('60 Minutes',60);

insert into setTime_Table values('10 Minutes',10);

--create sp  for set time for dropdown

create procedure sp_getTimeForExam
as
begin
select setTime_Table.time_Name,setTime_Table.time_Value from setTime_Table;
end;




