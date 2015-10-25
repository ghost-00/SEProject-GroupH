-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Tennis_Tournament
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Tennis_Tournament
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tennis_Tournament` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Tennis_Tournament` ;

-- -----------------------------------------------------
-- Table `Tennis_Tournament`.`Users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Tennis_Tournament`.`Users` (
  `UserId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `UserFirstName` VARCHAR(45) NOT NULL COMMENT '',
  `UserLastName` VARCHAR(45) NOT NULL COMMENT '',
  `UsersBirthDate` DATE NULL COMMENT '',
  `UserAddress` VARCHAR(45) NULL COMMENT '',
  `UserAddressN` INT NULL COMMENT '',
  `UserAddressB` INT NULL COMMENT '',
  `UserAddressC` INT NULL COMMENT '',
  `UserAddressL` VARCHAR(45) NULL COMMENT '',
  `UserPhone` VARCHAR(45) NULL COMMENT '',
  `UserMail` VARCHAR(45) NOT NULL COMMENT '',
  `Username` VARCHAR(45) NOT NULL COMMENT '',
  `Userpassword` LONGTEXT NOT NULL COMMENT '',
  `UserCreationDate` DATE NULL COMMENT '',
  PRIMARY KEY (`UserId`)  COMMENT '')
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
