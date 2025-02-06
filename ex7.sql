-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Ex7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Ex7` ;
USE `Ex7` ;

-- -----------------------------------------------------
-- Table `Ex7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `DataNaixament` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Tickets` (
  `idTickets` INT NOT NULL,
  `NumFactura` VARCHAR(45) NULL,
  `Dia` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`idTickets`),
  INDEX `fk_Tickets_Client_idx` (`Client_idClient` ASC) VISIBLE,
  INDEX `fk_Tickets_Empleat1_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `Ex7`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Tickets_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `Ex7`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Producte` (
  `idProducte` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Ex7`.`Linia Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Ex7`.`Linia Ticket` (
  `idLinia Ticket` INT NOT NULL,
  `Import` VARCHAR(45) NULL,
  `Descompte` VARCHAR(45) NULL,
  `Tickets_idTickets` INT NOT NULL,
  `Producte_idProducte` INT NOT NULL,
  PRIMARY KEY (`idLinia Ticket`),
  INDEX `fk_Linia Ticket_Tickets1_idx` (`Tickets_idTickets` ASC) VISIBLE,
  INDEX `fk_Linia Ticket_Producte1_idx` (`Producte_idProducte` ASC) VISIBLE,
  CONSTRAINT `fk_Linia Ticket_Tickets1`
    FOREIGN KEY (`Tickets_idTickets`)
    REFERENCES `Ex7`.`Tickets` (`idTickets`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Linia Ticket_Producte1`
    FOREIGN KEY (`Producte_idProducte`)
    REFERENCES `Ex7`.`Producte` (`idProducte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
