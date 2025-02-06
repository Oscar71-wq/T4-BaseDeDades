-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ex6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ex6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ex6` ;
USE `ex6` ;

-- -----------------------------------------------------
-- Table `ex6`.`Avio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex6`.`Avio` (
  `idAvio` INT NOT NULL,
  `Companyia` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`idAvio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex6`.`Vols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex6`.`Vols` (
  `idVols` INT NOT NULL,
  `Numero` VARCHAR(7) NULL,
  `Origen` VARCHAR(45) NULL,
  `Desti` VARCHAR(45) NULL,
  `HSortida` VARCHAR(45) NULL,
  `HArribada` VARCHAR(45) NULL,
  `Avio_idAvio` INT NOT NULL,
  PRIMARY KEY (`idVols`),
  INDEX `fk_Vols_Avio1_idx` (`Avio_idAvio` ASC) VISIBLE,
  CONSTRAINT `fk_Vols_Avio1`
    FOREIGN KEY (`Avio_idAvio`)
    REFERENCES `ex6`.`Avio` (`idAvio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex6`.`Passatgers` (
  `idPassatgers` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Direccio` VARCHAR(45) NULL,
  PRIMARY KEY (`idPassatgers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ex6`.`Reserves`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ex6`.`Reserves` (
  `idReserves` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Passatgers_idPassatgers` INT NOT NULL,
  `Vols_idVols` INT NOT NULL,
  PRIMARY KEY (`idReserves`),
  INDEX `fk_Reserves_Passatgers_idx` (`Passatgers_idPassatgers` ASC) VISIBLE,
  INDEX `fk_Reserves_Vols1_idx` (`Vols_idVols` ASC) VISIBLE,
  CONSTRAINT `fk_Reserves_Passatgers`
    FOREIGN KEY (`Passatgers_idPassatgers`)
    REFERENCES `ex6`.`Passatgers` (`idPassatgers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserves_Vols1`
    FOREIGN KEY (`Vols_idVols`)
    REFERENCES `ex6`.`Vols` (`idVols`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
