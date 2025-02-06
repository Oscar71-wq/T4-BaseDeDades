-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Pacients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pacients` (
  `idPacient` INT NOT NULL,
  `Nom Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  `Seguretat Social` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Metge` (
  `idMetge` INT NOT NULL,
  `Nom Cognom` VARCHAR(45) NULL,
  `Especialitat` VARCHAR(45) NULL,
  `Carrec` VARCHAR(45) NULL,
  PRIMARY KEY (`idMetge`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Consulta` (
  `idConsulta INT` INT NOT NULL,
  `pacient` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `Metge` VARCHAR(45) NULL,
  `Llit` VARCHAR(45) NULL,
  `Planta` VARCHAR(45) NULL,
  `Diagnostic` VARCHAR(45) NULL,
  `Metge_idMetge` INT NOT NULL,
  `Pacients_idPacient` INT NOT NULL,
  PRIMARY KEY (`idConsulta INT`),
  INDEX `fk_Consulta_Metge1_idx` (`Metge_idMetge` ASC) VISIBLE,
  INDEX `fk_Consulta_Pacients1_idx` (`Pacients_idPacient` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_idMetge`)
    REFERENCES `mydb`.`Metge` (`idMetge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Pacients1`
    FOREIGN KEY (`Pacients_idPacient`)
    REFERENCES `mydb`.`Pacients` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
