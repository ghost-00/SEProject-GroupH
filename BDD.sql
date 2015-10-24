-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Tennis_Tournament
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Tennis_Tournament` ;

-- -----------------------------------------------------
-- Schema Tennis_Tournament
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Tennis_Tournament` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `Tennis_Tournament` ;

-- -----------------------------------------------------
-- Table `Tennis_Tournament`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tennis_Tournament`.`Users` ;

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
  `Username` VARCHAR(45) NULL COMMENT '',
  `Userpassword` LONGTEXT NULL COMMENT '',
  `UserCreationDate` DATE NULL COMMENT '',
  `RoleId` INT NOT NULL COMMENT '',
  PRIMARY KEY (`UserId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tennis_Tournament`.`Tournaments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tennis_Tournament`.`Tournaments` ;

CREATE TABLE IF NOT EXISTS `Tennis_Tournament`.`Tournaments` (
  `TournamentId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `TournamentName` VARCHAR(45) NULL COMMENT '',
  PRIMARY KEY (`TournamentId`)  COMMENT '')
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Tennis_Tournament`.`Courts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tennis_Tournament`.`Courts` ;

CREATE TABLE IF NOT EXISTS `Tennis_Tournament`.`Courts` (
  `CourtId` INT NOT NULL AUTO_INCREMENT COMMENT '',
  `CourtName` VARCHAR(45) NULL COMMENT '',
  `CourtZone` VARCHAR(45) NULL COMMENT '',
  `CourtAddress` VARCHAR(45) NULL COMMENT '',
  `CourtSurface` FLOAT NULL COMMENT '',
  `CourtAvailability` INT NULL COMMENT '',
  `CourtOwner` INT NULL COMMENT '',
  PRIMARY KEY (`CourtId`)  COMMENT '',
  INDEX `UserId_idx` (`CourtOwner` ASC)  COMMENT '',
  CONSTRAINT `UserId`
    FOREIGN KEY (`CourtOwner`)
    REFERENCES `Tennis_Tournament`.`Users` (`UserId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
