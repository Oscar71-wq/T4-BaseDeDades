-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Exercici4` ;
USE `Exercici4` ;

-- -----------------------------------------------------
-- Table `Exercici4`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Client` (
  `idClient` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `cognom` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`TipusPolissa` (
  `idTipusPolissa` INT NOT NULL,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripcio` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipusPolissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Polissa` (
  `idPolissa` INT NOT NULL,
  `PreuAnual` VARCHAR(45) NULL,
  `NumPolissa` VARCHAR(45) NULL,
  `DataContratacio` VARCHAR(45) NULL,
  `IniciVigencia` VARCHAR(45) NULL,
  `FiVigencia` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `TipusPolissa_idTipusPolissa` INT NOT NULL,
  PRIMARY KEY (`idPolissa`),
  INDEX `fk_Polissa_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Polissa_TipusPolissa1_idx` (`TipusPolissa_idTipusPolissa` ASC) VISIBLE,
  CONSTRAINT `fk_Polissa_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Exercici4`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Polissa_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_idTipusPolissa`)
    REFERENCES `Exercici4`.`TipusPolissa` (`idTipusPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Exercici4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Exercici4`.`Venedor` (
  `idVenedor` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Polissa_idPolissa` INT NOT NULL,
  `Polissa_idPolissa1` INT NOT NULL,
  PRIMARY KEY (`idVenedor`),
  INDEX `fk_Venedor_Polissa1_idx` (`Polissa_idPolissa1` ASC) VISIBLE,
  CONSTRAINT `fk_Venedor_Polissa1`
    FOREIGN KEY (`Polissa_idPolissa1`)
    REFERENCES `Exercici4`.`Polissa` (`idPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
