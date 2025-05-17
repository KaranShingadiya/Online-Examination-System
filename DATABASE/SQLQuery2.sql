create procedure sp_DeleteCourse
@courseId bigint
as
begin
delete course_Tbl where course_Id=@courseId;
end

create procedure sp_EditCourse
@courseId bigint,
@courseName varchar(50)
as
begin
update course_Tbl set course_Name=@courseName where course_Id=@courseId;
end

create procedure sp_getSpecificCourse
@courseId bigint
as
begin
select course_Id,course_Name from course_Tbl where course_Id=@courseId;
end

create table exam_Tbl
(
exam_Id int not null,
course_Id int not null,
class_Id int not null,
exam_Title varchar(1000) not null,
exam_Timelimit varchar(1000) not null,
exam_Questionlimit int not null,
exam_Description varchar(1000) not null,
exam_Created DateTime not null default getdate(), UpdatedAt datetime not null default getdate()
);

drop table exam_Tbl;
-- Dumping data for table `exam_tbl`
--
insert into exam_Tbl(exam_Id,course_Id,class_Id,exam_Title,exam_Timelimit,exam_QuestionlimitDisplay,exam_Description,exam_Created) values
(1, 1, 0, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'Subjects of C, HTML and Computer Fundamental.', '2024-09-26 18:11:23'),
(2, 1, 0, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'Subjects of C, HTML and Computer Fundamental.', '2024-09-26 18:08:52'),
(3, 1, 0, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'Subjects of C, HTML and Computer Fundamental.', '2024-09-26 18:08:56'),
(4, 1, 0, 'BCA SEM 1 (D) CLASS MID TERM September 2024', '60', 90, 'Subjects of C, HTML and Computer Fundamental', '2024-09-26 18:09:00'),
(5, 2, 0, 'BSCIT SEM 1 MID TERM EXAM', '60', 90, 'Including C, HTML and Computer Fundamental', '2024-09-26 18:09:03'),
(6, 1, 1, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'OA IKS and ENGLISH SUBJECTS', '2024-09-26 18:07:27'),
(7, 1, 2, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'OA IKS and ENGLISH SUBJECTS', '2024-09-26 18:08:09'),
(8, 1, 3, 'BCA SEM 1 (A/B/C) CLASS MID TERM September 2024', '60', 90, 'OA IKS and ENGLISH SUBJECTS', '2024-09-26 18:07:47'),
(9, 1, 4, 'BCA SEM 1 (D) CLASS MID TERM September 2024', '60', 90, 'OA IKS and ENGLISH SUBJECTS', '2024-09-26 18:08:30'),
(10, 2, 5, 'BSCIT SEM 1 MID TERM EXAM', '60', 90, 'OA IKS AND ENGLISH SUBJECTS', '2024-09-26 18:37:11');

select * from exam_Tbl;





--
-- Table structure for table `feedbacks_tbl`
--
create table feedbacks_Tbl(
fb_Id int not null,
exmne_Id int not null,
fb_Exmne_as varchar(1000) not null,
fb_Feedbacks varchar(1000) not null,
fb_Date varchar(500) not null
);
--
-- Dumping data for table `feedbacks_tbl`
--
insert into feedbacks_Tbl(fb_Id,exmne_Id,fb_Exmne_as,fb_Feedbacks,fb_Date) values
(1, 223, '', 'Fifth', 'September 08, 2024'),
(2, 173, 'GODHWANI KARAN RAMCHAND', 'Questions are not displayed properly. All 4 options are not given . ', 'September 08, 2024'),
(3, 306, 'MAKAVANA MILAN KADUBHAI', 'THANKS', 'September 08, 2024'),
(4, 242, '', '', 'September 08, 2024'),
(5, 242, '', '', 'September 08, 2024'),
(6, 264, '', '', 'September 13, 2024'),
(7, 264, '', '', 'September 13, 2024');


create procedure sp_getFeedbacks
as
begin 
select feedbacks_Tbl.fb_Id,feedbacks_Tbl.exmne_Id,feedbacks_Tbl.fb_Exmne_as,feedbacks_Tbl.fb_Feedbacks,feedbacks_Tbl.fb_Date from feedbacks_Tbl;
end

--get specificExam

 create procedure sp_getSpecificExam
 @Id int
 as
 begin
 select exam_Id,course_Id,class_Id,exam_Timelimit,exam_QuestionlimitDisplay,exam_Title,exam_Description from exam_Tbl where exam_Id=@Id;
 end

--Client Side 
--When Student Login for Exam that logged Student Detail Display.

--Procedure for getSpecificStudentDetail

 create procedure sp_GetSpecificStudentDetail
 @username varchar(100)
 as
 begin 
 select exmne_Fullname,exmne_Username,exmne_Status  from examinee_Tbl where exmne_Username=@username;
 end

 drop procedure sp_GetSpecificStudentDetail;