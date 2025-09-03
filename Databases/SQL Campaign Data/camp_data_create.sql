-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema camp_data
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `camp_data` ;

-- -----------------------------------------------------
-- Schema camp_data
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `camp_data` DEFAULT CHARACTER SET utf8 ;
USE `camp_data` ;

-- -----------------------------------------------------
-- Table `camp_data`.`payee_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`payee_type` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`payee_type` (
  `type_id` INT UNSIGNED NOT NULL,
  `payee_type` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`type_id`),
  UNIQUE INDEX `payee_type_UNIQUE` (`payee_type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`payee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`payee` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`payee` (
  `payee_id` INT NOT NULL,
  `payee_name` VARCHAR(60) NOT NULL,
  `payee_address` VARCHAR(60) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  `type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`payee_id`),
  INDEX `fk_payee_payee_type1_idx` (`type_id` ASC) VISIBLE,
  CONSTRAINT `fk_payee_payee_type1`
    FOREIGN KEY (`type_id`)
    REFERENCES `camp_data`.`payee_type` (`type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`payer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`payer` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`payer` (
  `payer_id` INT NOT NULL,
  `payer_name` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`payer_id`),
  UNIQUE INDEX `payer_name_UNIQUE` (`payer_name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`ex_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`ex_type` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`ex_type` (
  `ex_type_id` INT NOT NULL,
  `ex_type` VARCHAR(65) NOT NULL,
  PRIMARY KEY (`ex_type_id`),
  UNIQUE INDEX `ex_type_UNIQUE` (`ex_type` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`report_info`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`report_info` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`report_info` (
  `report_id` INT NOT NULL,
  `report_filed` VARCHAR(80) NOT NULL,
  PRIMARY KEY (`report_id`),
  UNIQUE INDEX `report_filed_UNIQUE` (`report_filed` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`ex_description`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`ex_description` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`ex_description` (
  `description_id` INT NOT NULL,
  `description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`description_id`),
  UNIQUE INDEX `description_UNIQUE` (`description` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`expenditures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`expenditures` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`expenditures` (
  `description_id` INT NOT NULL,
  `ex_type_id` INT NOT NULL,
  PRIMARY KEY (`description_id`, `ex_type_id`),
  INDEX `fk_expenditures_ex_type1_idx` (`ex_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_expenditures_ex_description1`
    FOREIGN KEY (`description_id`)
    REFERENCES `camp_data`.`ex_description` (`description_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_expenditures_ex_type1`
    FOREIGN KEY (`ex_type_id`)
    REFERENCES `camp_data`.`ex_type` (`ex_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `camp_data`.`transactions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `camp_data`.`transactions` ;

CREATE TABLE IF NOT EXISTS `camp_data`.`transactions` (
  `transaction_id` VARCHAR(80) NOT NULL,
  `payment_amount` DECIMAL(8,2) UNSIGNED NOT NULL,
  `payment_date` DATE NOT NULL,
  `pol_obligation` VARCHAR(45) NOT NULL,
  `date_reported` DATE NOT NULL,
  `payer_id` INT NOT NULL,
  `report_id` INT NOT NULL,
  `description_id` INT NOT NULL,
  `ex_type_id` INT NOT NULL,
  `payee_id` INT NOT NULL,
  PRIMARY KEY (`transaction_id`),
  INDEX `fk_transactions_payee_idx` (`payee_id` ASC) VISIBLE,
  INDEX `fk_transactions_payer1_idx` (`payer_id` ASC) VISIBLE,
  INDEX `fk_transactions_report_info1_idx` (`report_id` ASC) VISIBLE,
  INDEX `fk_transactions_expenditures1_idx` (`description_id` ASC, `ex_type_id` ASC) VISIBLE,
  CONSTRAINT `fk_transactions_payee`
    FOREIGN KEY (`payee_id`)
    REFERENCES `camp_data`.`payee` (`payee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_payer1`
    FOREIGN KEY (`payer_id`)
    REFERENCES `camp_data`.`payer` (`payer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_report_info1`
    FOREIGN KEY (`report_id`)
    REFERENCES `camp_data`.`report_info` (`report_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transactions_expenditures1`
    FOREIGN KEY (`description_id` , `ex_type_id`)
    REFERENCES `camp_data`.`expenditures` (`description_id` , `ex_type_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
