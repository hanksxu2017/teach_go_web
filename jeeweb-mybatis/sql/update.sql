ALTER TABLE tg_course ADD COLUMN teacher_id VARCHAR(32);

CREATE TABLE `tg_teacher_course_rel` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8

