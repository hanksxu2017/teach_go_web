ALTER TABLE tg_course ADD COLUMN CODE VARCHAR(16);

ALTER TABLE tg_course ADD COLUMN start_time_hour VARCHAR(8);
ALTER TABLE tg_course ADD COLUMN start_time_minute VARCHAR(8);
ALTER TABLE tg_course ADD COLUMN end_time_hour VARCHAR(8);
ALTER TABLE tg_course ADD COLUMN end_time_minute VARCHAR(8);