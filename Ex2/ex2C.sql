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
-- Table `mydb`.`Alumnat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Alumnat` (
  `idAlumnat` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `NOM` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idAlumnat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Matricula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Matricula` (
  `idMatricula` INT NOT NULL,
  `Alumnat_idAlumnat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `Alumne` VARCHAR(45) NULL,
  `Assignatura` VARCHAR(45) NULL,
  PRIMARY KEY (`idMatricula`),
  INDEX `fk_Matricula_Alumnat_idx` (`Alumnat_idAlumnat` ASC) VISIBLE,
  CONSTRAINT `fk_Matricula_Alumnat`
    FOREIGN KEY (`Alumnat_idAlumnat`)
    REFERENCES `mydb`.`Alumnat` (`idAlumnat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Departament`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Departament` (
  `idDepartament` INT NOT NULL,
  PRIMARY KEY (`idDepartament`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Professor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Professor` (
  `idProfessor` INT NOT NULL,
  `` VARCHAR(45) NULL,
  `Departament_idDepartament` INT NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Titulacio` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `CapDelDepartament` VARCHAR(45) NULL,
  PRIMARY KEY (`idProfessor`),
  INDEX `fk_Professor_Departament1_idx` (`Departament_idDepartament` ASC) VISIBLE,
  CONSTRAINT `fk_Professor_Departament1`
    FOREIGN KEY (`Departament_idDepartament`)
    REFERENCES `mydb`.`Departament` (`idDepartament`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Assignatura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Assignatura` (
  `idAssignatura` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Credits` VARCHAR(45) NULL,
  `departament` VARCHAR(45) NULL,
  `Assignaturacol` VARCHAR(45) NULL,
  `Professor` VARCHAR(45) NULL,
  PRIMARY KEY (`idAssignatura`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Map`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Map` (
  `idMap` INT NOT NULL,
  `Matricula_idMatricula` INT NOT NULL,
  `Professor_idProfessor` INT NOT NULL,
  `Assignatura_idAssignatura` INT NOT NULL,
  PRIMARY KEY (`idMap`),
  INDEX `fk_Map_Matricula1_idx` (`Matricula_idMatricula` ASC) VISIBLE,
  INDEX `fk_Map_Professor1_idx` (`Professor_idProfessor` ASC) VISIBLE,
  INDEX `fk_Map_Assignatura1_idx` (`Assignatura_idAssignatura` ASC) VISIBLE,
  CONSTRAINT `fk_Map_Matricula1`
    FOREIGN KEY (`Matricula_idMatricula`)
    REFERENCES `mydb`.`Matricula` (`idMatricula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Map_Professor1`
    FOREIGN KEY (`Professor_idProfessor`)
    REFERENCES `mydb`.`Professor` (`idProfessor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Map_Assignatura1`
    FOREIGN KEY (`Assignatura_idAssignatura`)
    REFERENCES `mydb`.`Assignatura` (`idAssignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
