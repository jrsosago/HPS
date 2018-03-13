SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema hsp
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hsp
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hsp` DEFAULT CHARACTER SET utf8 ;
USE `hsp` ;

-- -----------------------------------------------------
-- Table `hsp`.`Blood`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Blood` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(5) NULL,
  `volume` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Area`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Area` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`MediaType`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`MediaType` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `type` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Media`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Media` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `mediaTypeId` INT NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_media_mediaType_idx` (`mediaTypeId` ASC),
  CONSTRAINT `fk_media_mediaType`
    FOREIGN KEY (`mediaTypeId`)
    REFERENCES `hsp`.`MediaType` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`User` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `areaId` INT NOT NULL,
  `bloodId` INT NOT NULL,
  `mediaId` INT NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `name` VARCHAR(50) NOT NULL,
  `phone` VARCHAR(10) NULL,
  `role` VARCHAR(10) NOT NULL,
  `genre` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_user_blood_idx` (`bloodId` ASC),
  INDEX `fk_user_area_idx` (`areaId` ASC),
  INDEX `fk_user_media_idx` (`mediaId` ASC),
  CONSTRAINT `fk_user_blood`
    FOREIGN KEY (`bloodId`)
    REFERENCES `hsp`.`Blood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_area`
    FOREIGN KEY (`areaId`)
    REFERENCES `hsp`.`Area` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_media`
    FOREIGN KEY (`mediaId`)
    REFERENCES `hsp`.`Media` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Donation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Donation` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `bloodId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_donation_user_idx` (`userId` ASC),
  INDEX `fk_donation_blood_idx` (`bloodId` ASC),
  CONSTRAINT `fk_donation_user`
    FOREIGN KEY (`userId`)
    REFERENCES `hsp`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_donation_blood`
    FOREIGN KEY (`bloodId`)
    REFERENCES `hsp`.`Blood` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Exam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Exam` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `result` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`ExamUser`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`ExamUser` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `examId` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_examUser_user_idx` (`userId` ASC),
  INDEX `fk_examUser_exam_idx` (`examId` ASC),
  CONSTRAINT `fk_examUser_user`
    FOREIGN KEY (`userId`)
    REFERENCES `hsp`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_examUser_exam`
    FOREIGN KEY (`examId`)
    REFERENCES `hsp`.`Exam` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Request` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `userId` INT NOT NULL,
  `date` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_request_user_idx` (`userId` ASC),
  CONSTRAINT `fk_request_user`
    FOREIGN KEY (`userId`)
    REFERENCES `hsp`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`RequestProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`RequestProduct` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `requestId` INT NOT NULL,
  `idProduct` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_requestProduct_request_idx` (`requestId` ASC),
  INDEX `fk_requestProduct_product_idx` (`idProduct` ASC),
  CONSTRAINT `fk_requestProduct_request`
    FOREIGN KEY (`requestId`)
    REFERENCES `hsp`.`Request` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_requestProduct_product`
    FOREIGN KEY (`idProduct`)
    REFERENCES `hsp`.`Product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hsp`.`Message`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hsp`.`Message` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `content` VARCHAR(200) NOT NULL,
  `date` DATETIME NOT NULL,
  `author` INT NOT NULL,
  `destinationUser` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_message_user_idx` (`author` ASC),
  INDEX `fk_message_user2_idx` (`destinationUser` ASC),
  CONSTRAINT `fk_message_user`
    FOREIGN KEY (`author`)
    REFERENCES `hsp`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_message_user2`
    FOREIGN KEY (`destinationUser`)
    REFERENCES `hsp`.`User` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
