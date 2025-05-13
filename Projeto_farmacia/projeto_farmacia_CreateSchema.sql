-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Farmacia` DEFAULT CHARACTER SET utf8 ;
USE `Farmacia` ;

-- -----------------------------------------------------
-- Table `Farmacia`.`tipos_produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`tipos_produtos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`tipos_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`fabricantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`fabricantes` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`fabricantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fabricante` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`produtos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `produto` VARCHAR(45) NOT NULL,
  `designacao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `preco_venda` DECIMAL(8,2) NOT NULL,
  `id_tipo_produto` INT NOT NULL,
  `id_fabricante` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_1_idx` (`id_tipo_produto` ASC),
  INDEX `fk_produtos_2_idx` (`id_fabricante` ASC),
  CONSTRAINT `fk_produtos_1`
    FOREIGN KEY (`id_tipo_produto`)
    REFERENCES `Farmacia`.`tipos_produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_2`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `Farmacia`.`fabricantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`Cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(200) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(15) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`compras`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`compras` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`compras` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_cliente` INT NOT NULL,
  `data` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_compras_1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_compras_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Farmacia`.`Cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`produtos_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`produtos_compra` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`produtos_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_compra_1_idx` (`id_compra` ASC),
  INDEX `fk_produtos_compra_2_idx` (`id_produto` ASC),
  CONSTRAINT `fk_produtos_compra_1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `Farmacia`.`compras` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_compra_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `Farmacia`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`medicos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`medicos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`medicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`receitas_medica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`receitas_medica` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`receitas_medica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produtos_compra` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_receitas_medica_1_idx` (`id_produtos_compra` ASC),
  INDEX `fk_receitas_medica_2_idx` (`id_medico` ASC),
  CONSTRAINT `fk_receitas_medica_1`
    FOREIGN KEY (`id_produtos_compra`)
    REFERENCES `Farmacia`.`produtos_compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receitas_medica_2`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Farmacia`.`medicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;