-- MySQL Script generated by MySQL Workbench
-- Mon Mar 22 22:52:31 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema projeto2IGTI
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema projeto2IGTI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `projeto2IGTI` DEFAULT CHARACTER SET utf8 ;
USE `projeto2IGTI` ;

-- -----------------------------------------------------
-- Table `projeto2IGTI`.`bebida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`bebida` (
  `cod_bebida` INT NOT NULL AUTO_INCREMENT,
  `bebida` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_bebida`),
  UNIQUE INDEX `bebida_UNIQUE` (`bebida` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto2IGTI`.`animal_estimacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`animal_estimacao` (
  `cod_animal_estimacao` INT NOT NULL AUTO_INCREMENT,
  `animal` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_animal_estimacao`),
  UNIQUE INDEX `animal_UNIQUE` (`animal` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto2IGTI`.`clima`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`clima` (
  `cod_clima` INT NOT NULL AUTO_INCREMENT,
  `clima` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_clima`),
  UNIQUE INDEX `clima_UNIQUE` (`clima` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto2IGTI`.`pessoa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`pessoa` (
  `cod_pessoa` INT NOT NULL,
  `genero` VARCHAR(45) NULL,
  `data_nascimento` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_pessoa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto2IGTI`.`hobbie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`hobbie` (
  `cod_hobbie` INT NOT NULL AUTO_INCREMENT,
  `hobbie` VARCHAR(45) NULL,
  PRIMARY KEY (`cod_hobbie`),
  UNIQUE INDEX `hobbie_UNIQUE` (`hobbie` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `projeto2IGTI`.`pesquisa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `projeto2IGTI`.`pesquisa` (
  `cod_pesquisa` INT NOT NULL AUTO_INCREMENT,
  `data_pesquisa` DATE NOT NULL,
  `cod_bebida` INT NOT NULL,
  `cod_animal_estimacao` INT NOT NULL,
  `cod_clima` INT NOT NULL,
  `cod_pessoa` INT NOT NULL,
  `cod_hobbie` INT NOT NULL,
  PRIMARY KEY (`cod_pesquisa`),
  INDEX `fk_pesquisa_bebida_idx` (`cod_bebida` ASC) VISIBLE,
  INDEX `fk_pesquisa_animal_estimacao1_idx` (`cod_animal_estimacao` ASC) VISIBLE,
  INDEX `fk_pesquisa_clima1_idx` (`cod_clima` ASC) VISIBLE,
  INDEX `fk_pesquisa_pessoa1_idx` (`cod_pessoa` ASC) VISIBLE,
  INDEX `fk_pesquisa_hobbie1_idx` (`cod_hobbie` ASC) VISIBLE,
  CONSTRAINT `fk_pesquisa_bebida`
    FOREIGN KEY (`cod_bebida`)
    REFERENCES `projeto2IGTI`.`bebida` (`cod_bebida`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pesquisa_animal_estimacao1`
    FOREIGN KEY (`cod_animal_estimacao`)
    REFERENCES `projeto2IGTI`.`animal_estimacao` (`cod_animal_estimacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pesquisa_clima1`
    FOREIGN KEY (`cod_clima`)
    REFERENCES `projeto2IGTI`.`clima` (`cod_clima`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pesquisa_pessoa1`
    FOREIGN KEY (`cod_pessoa`)
    REFERENCES `projeto2IGTI`.`pessoa` (`cod_pessoa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pesquisa_hobbie1`
    FOREIGN KEY (`cod_hobbie`)
    REFERENCES `projeto2IGTI`.`hobbie` (`cod_hobbie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
