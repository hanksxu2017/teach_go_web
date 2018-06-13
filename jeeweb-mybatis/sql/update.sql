ALTER TABLE tg_course ADD COLUMN teacher_id VARCHAR(32);

CREATE TABLE `tg_teacher_course_rel` (
  `id` varchar(32) NOT NULL,
  `teacher_id` varchar(32) DEFAULT NULL,
  `course_id` varchar(32) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




-- 20180613
ALTER TABLE tg_student  DROP COLUMN school_id;
ALTER TABLE tg_student  DROP COLUMN study_school_id;
ALTER TABLE tg_student  DROP COLUMN study_class_id;

CREATE TABLE `tg_student_class_rel` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `study_class_id` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tg_student_course_rel` (
  `id` varchar(255) NOT NULL,
  `course_id` varchar(255) DEFAULT NULL,
  `study_class_id` varchar(255) DEFAULT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(128) DEFAULT NULL,
  `del_flag` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tg_student_school_rel` (
  `id` varchar(255) NOT NULL,
  `student_id` varchar(255) DEFAULT NULL,
  `study_school_id` varchar(255) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `create_by` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `update_by` varchar(255) DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `del_flag` char(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




