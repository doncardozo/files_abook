SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `abook` ;
CREATE SCHEMA IF NOT EXISTS `abook` DEFAULT CHARACTER SET latin1 ;
USE `abook` ;

-- -----------------------------------------------------
-- Table `abook`.`categories`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `abook`.`contact_type` ;

CREATE TABLE IF NOT EXISTS `abook`.`contact_type` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `abook`.`contacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `abook`.`contacts` ;

CREATE TABLE IF NOT EXISTS `abook`.`contacts` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_type_id` INT(11) NULL DEFAULT NULL,
  `first_name` VARCHAR(80) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `last_name` VARCHAR(80) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `address` VARCHAR(80) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_Contacts_ContactType_idx` (`contact_type_id` ASC),
  CONSTRAINT `fk_Contacts_ContactType`
    FOREIGN KEY (`contact_type_id`)
    REFERENCES `abook`.`contact_type` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `abook`.`contacts_emails`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `abook`.`contacts_emails` ;

CREATE TABLE IF NOT EXISTS `abook`.`contacts_emails` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_id` INT NULL,
  `email` VARCHAR(80) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_contacts_emails_Contacts1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_contacts_emails_Contacts1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `abook`.`contacts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `abook`.`contacts_phones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `abook`.`contacts_phones` ;

CREATE TABLE IF NOT EXISTS `abook`.`contacts_phones` (
  `id` INT(11) NOT NULL AUTO_INCREMENT,
  `contact_id` INT NULL,
  `phone_number` VARCHAR(45) CHARACTER SET 'utf8' COLLATE 'utf8_unicode_ci' NULL DEFAULT NULL,
  `active` TINYINT(1) NULL DEFAULT 1,
  `deleted` TINYINT(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  INDEX `fk_contacts_phones_Contacts1_idx` (`contact_id` ASC),
  CONSTRAINT `fk_contacts_phones_Contacts1`
    FOREIGN KEY (`contact_id`)
    REFERENCES `abook`.`contacts` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
