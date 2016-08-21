-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`department` (
  `dept_name` VARCHAR(45) NOT NULL,
  `building` VARCHAR(45) NULL,
  `budget` VARCHAR(45) NULL,
  PRIMARY KEY (`dept_name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course` (
  `course_id` VARCHAR(45) NOT NULL,
  `title` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  `credit` DECIMAL(10,0) NULL,
  `file` BLOB NULL,
  PRIMARY KEY (`course_id`),
  INDEX `dept_name_idx` (`dept_name` ASC),
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `mydb`.`department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`instructor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`instructor` (
  `ins_id` INT NOT NULL,
  `name_` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  `salary` DECIMAL(10,0) NULL,
  PRIMARY KEY (`ins_id`),
  INDEX `dept_name_idx` (`dept_name` ASC),
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `mydb`.`department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`section` (
  `sec_id` INT NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year_` DECIMAL(10,0) NOT NULL,
  `building` VARCHAR(45) NULL,
  `room_number` VARCHAR(45) NULL,
  `time_slot_id` VARCHAR(45) NULL,
  PRIMARY KEY (`sec_id`, `semester`, `year_`, `course_id`),
  INDEX `course_id_idx` (`course_id` ASC),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`course` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student` (
  `reg_no` INT NOT NULL,
  `name_` VARCHAR(45) NULL,
  `dept_name` VARCHAR(45) NULL,
  PRIMARY KEY (`reg_no`),
  INDEX `dept_name_idx` (`dept_name` ASC),
  CONSTRAINT `dept_name`
    FOREIGN KEY (`dept_name`)
    REFERENCES `mydb`.`department` (`dept_name`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teached`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teached` (
  `reg_no` INT NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `sec_id` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year_` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`reg_no`, `course_id`, `sec_id`, `semester`, `year_`),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `year__idx` (`year_` ASC),
  INDEX `sec_id_idx` (`sec_id` ASC),
  INDEX `semester_idx` (`semester` ASC),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`section` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sec_id`
    FOREIGN KEY (`sec_id`)
    REFERENCES `mydb`.`section` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `semester`
    FOREIGN KEY (`semester`)
    REFERENCES `mydb`.`section` (`semester`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `year_`
    FOREIGN KEY (`year_`)
    REFERENCES `mydb`.`section` (`year_`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `reg_no`
    FOREIGN KEY (`reg_no`)
    REFERENCES `mydb`.`student` (`reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`teaches`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`teaches` (
  `ins_no` INT NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `sec_id` INT NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year_` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`ins_no`, `course_id`, `sec_id`, `semester`, `year_`),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `year__idx` (`year_` ASC),
  INDEX `semester_idx` (`semester` ASC),
  INDEX `sec_id_idx` (`sec_id` ASC),
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`section` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sec_id`
    FOREIGN KEY (`sec_id`)
    REFERENCES `mydb`.`section` (`sec_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `semester`
    FOREIGN KEY (`semester`)
    REFERENCES `mydb`.`section` (`semester`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `year_`
    FOREIGN KEY (`year_`)
    REFERENCES `mydb`.`section` (`year_`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ins_id`
    FOREIGN KEY (`ins_no`)
    REFERENCES `mydb`.`instructor` (`ins_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`group`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`group` (
  `gr_id` INT NOT NULL,
  `gr_code` VARCHAR(45) NOT NULL,
  `reg_no` INT NOT NULL,
  `ins_id` INT NOT NULL,
  `sec_id` INT NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year_` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`year_`, `semester`, `course_id`, `sec_id`, `ins_id`, `reg_no`, `gr_id`, `gr_code`),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `semester_idx` (`semester` ASC),
  INDEX `sec_id_idx` (`sec_id` ASC),
  INDEX `ins_id_idx` (`ins_id` ASC),
  INDEX `reg_no_idx` (`reg_no` ASC),
  CONSTRAINT `reg_no`
    FOREIGN KEY (`reg_no`)
    REFERENCES `mydb`.`student` (`reg_no`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `ins_id`
    FOREIGN KEY (`ins_id`)
    REFERENCES `mydb`.`instructor` (`ins_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`section` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `sec_id`
    FOREIGN KEY (`sec_id`)
    REFERENCES `mydb`.`section` (`sec_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `semester`
    FOREIGN KEY (`semester`)
    REFERENCES `mydb`.`section` (`semester`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `year_`
    FOREIGN KEY (`year_`)
    REFERENCES `mydb`.`section` (`year_`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`question` (
  `ques_id` INT NOT NULL,
  `ques_file` BLOB NULL,
  `marks` INT NULL,
  `type` VARCHAR(45) NOT NULL,
  `sec_id` INT NOT NULL,
  `course_id` VARCHAR(45) NOT NULL,
  `semester` VARCHAR(45) NOT NULL,
  `year_` DECIMAL(10,0) NOT NULL,
  PRIMARY KEY (`ques_id`, `sec_id`, `course_id`, `semester`, `year_`, `type`),
  INDEX `year__idx` (`year_` ASC),
  INDEX `semester_idx` (`semester` ASC),
  INDEX `course_id_idx` (`course_id` ASC),
  INDEX `sec_id_idx` (`sec_id` ASC),
  CONSTRAINT `sec_id`
    FOREIGN KEY (`sec_id`)
    REFERENCES `mydb`.`section` (`sec_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `course_id`
    FOREIGN KEY (`course_id`)
    REFERENCES `mydb`.`section` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `semester`
    FOREIGN KEY (`semester`)
    REFERENCES `mydb`.`section` (`semester`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `year_`
    FOREIGN KEY (`year_`)
    REFERENCES `mydb`.`section` (`year_`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
