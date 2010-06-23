SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `wopr` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `wopr`;

-- -----------------------------------------------------
-- Table `wopr`.`persons`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons` (
  `person_id` INT NOT NULL AUTO_INCREMENT ,
  `person_first_name` VARCHAR(45) NULL ,
  `person_last_name` VARCHAR(45) NULL ,
  `person_email` VARCHAR(45) NULL ,
  `person_dob` TIMESTAMP NULL ,
  `person_drivers_license` VARCHAR(45) NULL ,
  PRIMARY KEY (`person_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT ,
  `user_persons_id` INT NOT NULL ,
  `user_username` VARCHAR(45) NULL ,
  `user_password` VARCHAR(45) NULL ,
  `user_pin` INT(4) NULL ,
  `user_last_login` TIMESTAMP NULL ,
  `user_ssn` INT(9) NULL ,
  `user_active` TINYINT NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`user_id`, `user_persons_id`) ,
  INDEX `persons_id` (`user_persons_id` ASC) ,
  CONSTRAINT `persons_id`
    FOREIGN KEY (`user_persons_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`addresses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`addresses` (
  `address_id` INT NOT NULL AUTO_INCREMENT ,
  `address_first_line` VARCHAR(45) NULL ,
  `address_second_line` VARCHAR(45) NULL ,
  `address_city` VARCHAR(45) NULL ,
  `address_state` CHAR(2) NULL ,
  `address_zip` INT(6) NULL ,
  PRIMARY KEY (`address_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`phones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`phones` (
  `phone_id` INT NOT NULL AUTO_INCREMENT ,
  `phone_area_code` INT(3) NULL ,
  `phone_prefix` INT(3) NULL ,
  `phone_suffix` INT(4) NULL ,
  `phone_extension` VARCHAR(45) NULL ,
  PRIMARY KEY (`phone_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_addresses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_addresses` (
  `pa_person_id` INT NOT NULL ,
  `pa_address_id` INT NOT NULL ,
  PRIMARY KEY (`pa_address_id`, `pa_person_id`) ,
  INDEX `pa_person_id` (`pa_person_id` ASC) ,
  INDEX `pa_address_id` (`pa_address_id` ASC) ,
  CONSTRAINT `pa_person_id`
    FOREIGN KEY (`pa_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pa_address_id`
    FOREIGN KEY (`pa_address_id` )
    REFERENCES `wopr`.`addresses` (`address_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_phones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_phones` (
  `pp_person_id` INT NOT NULL ,
  `pp_phone_id` INT NOT NULL ,
  PRIMARY KEY (`pp_person_id`, `pp_phone_id`) ,
  INDEX `pp_person_id` (`pp_person_id` ASC) ,
  INDEX `pp_phone_id` (`pp_phone_id` ASC) ,
  CONSTRAINT `pp_person_id`
    FOREIGN KEY (`pp_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pp_phone_id`
    FOREIGN KEY (`pp_phone_id` )
    REFERENCES `wopr`.`phones` (`phone_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`credits`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`credits` (
  `credit_id` INT NOT NULL AUTO_INCREMENT ,
  `credit_amount` DECIMAL(10,2) NOT NULL ,
  `credit_date` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`credit_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_credits`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_credits` (
  `pc_person_id` INT NOT NULL ,
  `pc_credit_id` INT NOT NULL ,
  PRIMARY KEY (`pc_person_id`, `pc_credit_id`) ,
  INDEX `pc_person_id` (`pc_person_id` ASC) ,
  INDEX `pc_credit_id` (`pc_credit_id` ASC) ,
  CONSTRAINT `pc_person_id`
    FOREIGN KEY (`pc_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pc_credit_id`
    FOREIGN KEY (`pc_credit_id` )
    REFERENCES `wopr`.`credits` (`credit_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`levels`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`levels` (
  `level_id` INT NOT NULL AUTO_INCREMENT ,
  `level_name` VARCHAR(45) NULL ,
  `level_description` TINYTEXT NULL ,
  PRIMARY KEY (`level_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`users_levels`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`users_levels` (
  `ul_user_id` INT NOT NULL ,
  `ul_level_id` INT NOT NULL ,
  PRIMARY KEY (`ul_level_id`, `ul_user_id`) ,
  INDEX `ul_user_id` (`ul_user_id` ASC) ,
  INDEX `ul_level_id` (`ul_level_id` ASC) ,
  CONSTRAINT `ul_user_id`
    FOREIGN KEY (`ul_user_id` )
    REFERENCES `wopr`.`users` (`user_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ul_level_id`
    FOREIGN KEY (`ul_level_id` )
    REFERENCES `wopr`.`levels` (`level_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_inventory_times`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_inventory_times` (
  `pit_person_id` INT NOT NULL ,
  `pit_inventory_id` INT NOT NULL ,
  `pit_time_id` INT NOT NULL ,
  PRIMARY KEY (`pit_time_id`, `pit_inventory_id`, `pit_person_id`) ,
  INDEX `pit_person_id` (`pit_inventory_id` ASC) ,
  CONSTRAINT `pit_person_id`
    FOREIGN KEY (`pit_inventory_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`times`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`times` (
  `time_id` INT NOT NULL AUTO_INCREMENT ,
  `time_in` TIMESTAMP NULL ,
  `time_out` TIMESTAMP NULL ,
  PRIMARY KEY (`time_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`drawers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`drawers` (
  `drawer_id` INT NOT NULL AUTO_INCREMENT ,
  `drawer_name` VARCHAR(45) NULL ,
  `drawer_location` VARCHAR(45) NULL ,
  `drawer_ones` INT(4) NULL ,
  `drawer_fives` INT(4) NULL ,
  `drawer_pennies` INT(4) NULL ,
  `drawer_nickels` INT(4) NULL ,
  `drawer_dimes` INT(4) NULL ,
  `drawer_quarters` INT(4) NULL ,
  `drawer_penny_rolls` INT(4) NULL ,
  `drawer_nickel_rolls` INT(4) NULL ,
  `drawer_dime_rolls` INT(4) NULL ,
  `drawer_quarter_rolls` INT(4) NULL ,
  `drawer_tens` INT(4) NULL ,
  `drawer_twenties` INT(4) NULL ,
  `drawer_fifties` INT(4) NULL ,
  `drawer_hundreds` INT(4) NULL ,
  `drawer_active` TINYINT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`drawer_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`drawers_times`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`drawers_times` (
  `dt_drawer_id` INT NOT NULL ,
  `dt_time_id` INT NOT NULL ,
  PRIMARY KEY (`dt_time_id`, `dt_drawer_id`) ,
  INDEX `dt_drawer_id` (`dt_drawer_id` ASC) ,
  INDEX `dt_time_id` (`dt_time_id` ASC) ,
  CONSTRAINT `dt_drawer_id`
    FOREIGN KEY (`dt_drawer_id` )
    REFERENCES `wopr`.`drawers` (`drawer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dt_time_id`
    FOREIGN KEY (`dt_time_id` )
    REFERENCES `wopr`.`times` (`time_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_times`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_times` (
  `pt_person_id` INT NOT NULL ,
  `pt_time_id` INT NOT NULL ,
  PRIMARY KEY (`pt_time_id`, `pt_person_id`) ,
  INDEX `pt_person_id` (`pt_person_id` ASC) ,
  INDEX `pt_time_id` (`pt_time_id` ASC) ,
  CONSTRAINT `pt_person_id`
    FOREIGN KEY (`pt_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pt_time_id`
    FOREIGN KEY (`pt_time_id` )
    REFERENCES `wopr`.`times` (`time_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`transactions_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`transactions_types` (
  `transaction_type_id` INT NOT NULL AUTO_INCREMENT ,
  `transaction_type` VARCHAR(45) NULL ,
  PRIMARY KEY (`transaction_type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`transactions`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`transactions` (
  `transaction_id` INT NOT NULL AUTO_INCREMENT ,
  `transaction_type_id` INT NOT NULL ,
  `transaction_amount` DECIMAL(10,2) NOT NULL ,
  `transaction_tax` DECIMAL(10,2) NOT NULL ,
  `transaction_credit` DECIMAL(10,2) NOT NULL ,
  `transaction_subtotal` DECIMAL(10,2) NOT NULL ,
  `transaction_total` DECIMAL(10,2) NOT NULL ,
  `transaction_time` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`transaction_id`, `transaction_type_id`) ,
  INDEX `transaction_type_id` (`transaction_type_id` ASC) ,
  CONSTRAINT `transaction_type_id`
    FOREIGN KEY (`transaction_type_id` )
    REFERENCES `wopr`.`transactions_types` (`transaction_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`transactions_inventory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`transactions_inventory` (
  `ti_transaction_id` INT NOT NULL ,
  `ti_inventory_id` INT NOT NULL ,
  PRIMARY KEY (`ti_transaction_id`, `ti_inventory_id`) ,
  INDEX `ti_transaction_id` (`ti_transaction_id` ASC) ,
  CONSTRAINT `ti_transaction_id`
    FOREIGN KEY (`ti_transaction_id` )
    REFERENCES `wopr`.`transactions` (`transaction_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`printers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`printers` (
  `printer_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`printer_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`scanners`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`scanners` (
  `scanner_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`scanner_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`credit_card_readers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`credit_card_readers` (
  `credit_card_reader_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`credit_card_reader_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`kiosks`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`kiosks` (
  `kiosk_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`kiosk_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`locations` (
  `location_id` INT NOT NULL AUTO_INCREMENT ,
  `location_name` VARCHAR(45) NULL ,
  `location_description` VARCHAR(45) NULL ,
  `location_lft` INT NULL ,
  `location_rgt` INT NULL ,
  PRIMARY KEY (`location_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`drawers_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`drawers_locations` (
  `dl_drawer_id` INT NOT NULL ,
  `dl_location_id` INT NOT NULL ,
  PRIMARY KEY (`dl_location_id`, `dl_drawer_id`) ,
  INDEX `dl_drawer_id` (`dl_drawer_id` ASC) ,
  INDEX `dl_location_id` (`dl_location_id` ASC) ,
  CONSTRAINT `dl_drawer_id`
    FOREIGN KEY (`dl_drawer_id` )
    REFERENCES `wopr`.`drawers` (`drawer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `dl_location_id`
    FOREIGN KEY (`dl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`stores`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`stores` (
  `store_id` INT NOT NULL AUTO_INCREMENT ,
  `store_address_id` INT NOT NULL ,
  `store_name` VARCHAR(45) NULL ,
  `store_description` TINYTEXT NULL ,
  PRIMARY KEY (`store_id`, `store_address_id`) ,
  INDEX `store_address_id` (`store_address_id` ASC) ,
  CONSTRAINT `store_address_id`
    FOREIGN KEY (`store_address_id` )
    REFERENCES `wopr`.`addresses` (`address_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`stores_phones`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`stores_phones` (
  `sp_store_id` INT NOT NULL ,
  `sp_phone_id` INT NOT NULL ,
  PRIMARY KEY (`sp_phone_id`, `sp_store_id`) ,
  INDEX `sp_store_id` (`sp_store_id` ASC) ,
  INDEX `sp_phone_id` (`sp_phone_id` ASC) ,
  CONSTRAINT `sp_store_id`
    FOREIGN KEY (`sp_store_id` )
    REFERENCES `wopr`.`stores` (`store_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sp_phone_id`
    FOREIGN KEY (`sp_phone_id` )
    REFERENCES `wopr`.`phones` (`phone_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`stores_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`stores_locations` (
  `sl_store_id` INT NOT NULL ,
  `sl_location_id` INT NOT NULL ,
  PRIMARY KEY (`sl_location_id`, `sl_store_id`) ,
  INDEX `sl_store_id` (`sl_store_id` ASC) ,
  INDEX `sl_location_id` (`sl_location_id` ASC) ,
  CONSTRAINT `sl_store_id`
    FOREIGN KEY (`sl_store_id` )
    REFERENCES `wopr`.`stores` (`store_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `sl_location_id`
    FOREIGN KEY (`sl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`kiosks_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`kiosks_locations` (
  `kl_kiosk_id` INT NOT NULL ,
  `kl_location_id` INT NOT NULL ,
  PRIMARY KEY (`kl_location_id`, `kl_kiosk_id`) ,
  INDEX `kl_kiosk_id` (`kl_kiosk_id` ASC) ,
  INDEX `kl_location_id` (`kl_location_id` ASC) ,
  CONSTRAINT `kl_kiosk_id`
    FOREIGN KEY (`kl_kiosk_id` )
    REFERENCES `wopr`.`kiosks` (`kiosk_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `kl_location_id`
    FOREIGN KEY (`kl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`printers_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`printers_locations` (
  `pl_printer_id` INT NOT NULL ,
  `pl_location_id` INT NOT NULL ,
  PRIMARY KEY (`pl_location_id`, `pl_printer_id`) ,
  INDEX `pl_printer_id` (`pl_printer_id` ASC) ,
  INDEX `pl_location_id` (`pl_location_id` ASC) ,
  CONSTRAINT `pl_printer_id`
    FOREIGN KEY (`pl_printer_id` )
    REFERENCES `wopr`.`printers` (`printer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pl_location_id`
    FOREIGN KEY (`pl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`credit_card_readers_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`credit_card_readers_locations` (
  `ccrl_credit_card_reader_id` INT NOT NULL ,
  `ccrl_location_id` INT NOT NULL ,
  PRIMARY KEY (`ccrl_location_id`, `ccrl_credit_card_reader_id`) ,
  INDEX `ccrl_credit_card_reader_id` (`ccrl_credit_card_reader_id` ASC) ,
  INDEX `ccrl_location_id` (`ccrl_location_id` ASC) ,
  CONSTRAINT `ccrl_credit_card_reader_id`
    FOREIGN KEY (`ccrl_credit_card_reader_id` )
    REFERENCES `wopr`.`credit_card_readers` (`credit_card_reader_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ccrl_location_id`
    FOREIGN KEY (`ccrl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`scanners_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`scanners_locations` (
  `scl_scanner_id` INT NOT NULL ,
  `scl_location_id` INT NOT NULL ,
  PRIMARY KEY (`scl_location_id`, `scl_scanner_id`) ,
  INDEX `scl_scanner_id` (`scl_scanner_id` ASC) ,
  INDEX `scl_location_id` (`scl_location_id` ASC) ,
  CONSTRAINT `scl_scanner_id`
    FOREIGN KEY (`scl_scanner_id` )
    REFERENCES `wopr`.`scanners` (`scanner_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `scl_location_id`
    FOREIGN KEY (`scl_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`messages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`messages` (
  `message_id` INT NOT NULL AUTO_INCREMENT ,
  `message_subject` VARCHAR(45) NULL ,
  `message_body` MEDIUMTEXT NULL ,
  `message_time` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`message_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_messages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_messages` (
  `pm_sender_person_id` INT NOT NULL ,
  `pm_receiver_person_id` INT NOT NULL ,
  `pm_message_id` INT NOT NULL ,
  PRIMARY KEY (`pm_receiver_person_id`, `pm_message_id`, `pm_sender_person_id`) ,
  INDEX `pm_receiver_person_id` (`pm_sender_person_id` ASC) ,
  INDEX `pm_sender_person_id` (`pm_sender_person_id` ASC) ,
  INDEX `pm_message_id` (`pm_message_id` ASC) ,
  CONSTRAINT `pm_receiver_person_id`
    FOREIGN KEY (`pm_sender_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pm_sender_person_id`
    FOREIGN KEY (`pm_sender_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pm_message_id`
    FOREIGN KEY (`pm_message_id` )
    REFERENCES `wopr`.`messages` (`message_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`repairs_statuses`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`repairs_statuses` (
  `repair_status_id` INT NOT NULL AUTO_INCREMENT ,
  `repair_status_type` VARCHAR(45) NULL ,
  PRIMARY KEY (`repair_status_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`repairs`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`repairs` (
  `repair_id` INT NOT NULL AUTO_INCREMENT ,
  `repair_transaction_id` INT NOT NULL ,
  `repair_status_id` INT NOT NULL ,
  `repair_quote` DECIMAL(10,2) NOT NULL ,
  `repair_total` DECIMAL(10,2) NULL ,
  `repair_active` TINYINT(1) NOT NULL DEFAULT 1 ,
  PRIMARY KEY (`repair_id`, `repair_transaction_id`, `repair_status_id`) ,
  INDEX `repair_transaction_id` (`repair_transaction_id` ASC) ,
  INDEX `repair_status_id` (`repair_status_id` ASC) ,
  CONSTRAINT `repair_transaction_id`
    FOREIGN KEY (`repair_transaction_id` )
    REFERENCES `wopr`.`transactions` (`transaction_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `repair_status_id`
    FOREIGN KEY (`repair_status_id` )
    REFERENCES `wopr`.`repairs_statuses` (`repair_status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`persons_repairs_times`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`persons_repairs_times` (
  `prt_person_id` INT NOT NULL ,
  `prt_repair_id` INT NOT NULL ,
  `prt_time_id` INT NOT NULL ,
  PRIMARY KEY (`prt_time_id`, `prt_repair_id`, `prt_person_id`) ,
  INDEX `prt_person_id` (`prt_person_id` ASC) ,
  INDEX `prt_repair_id` (`prt_repair_id` ASC) ,
  INDEX `prt_time_id` (`prt_time_id` ASC) ,
  CONSTRAINT `prt_person_id`
    FOREIGN KEY (`prt_person_id` )
    REFERENCES `wopr`.`persons` (`person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prt_repair_id`
    FOREIGN KEY (`prt_repair_id` )
    REFERENCES `wopr`.`repairs` (`repair_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prt_time_id`
    FOREIGN KEY (`prt_time_id` )
    REFERENCES `wopr`.`times` (`time_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`repairs_persons_messages`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`repairs_persons_messages` (
  `rpm_repair_id` INT NOT NULL ,
  `rpm_pm_sender_person_id` INT NOT NULL ,
  `rpm_pm_receiver_person_id` INT NOT NULL ,
  `rpm_pm_message_id` INT NOT NULL ,
  PRIMARY KEY (`rpm_repair_id`, `rpm_pm_message_id`, `rpm_pm_receiver_person_id`, `rpm_pm_sender_person_id`) ,
  INDEX `rpm_repair_id` (`rpm_repair_id` ASC) ,
  INDEX `rpm_pm_sender_person_id` (`rpm_pm_sender_person_id` ASC) ,
  INDEX `rpm_pm_receiver_person_id` (`rpm_pm_receiver_person_id` ASC) ,
  INDEX `rpm_pm_message_id` (`rpm_pm_message_id` ASC) ,
  CONSTRAINT `rpm_repair_id`
    FOREIGN KEY (`rpm_repair_id` )
    REFERENCES `wopr`.`repairs` (`repair_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rpm_pm_sender_person_id`
    FOREIGN KEY (`rpm_pm_sender_person_id` )
    REFERENCES `wopr`.`persons_messages` (`pm_sender_person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rpm_pm_receiver_person_id`
    FOREIGN KEY (`rpm_pm_receiver_person_id` )
    REFERENCES `wopr`.`persons_messages` (`pm_receiver_person_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `rpm_pm_message_id`
    FOREIGN KEY (`rpm_pm_message_id` )
    REFERENCES `wopr`.`persons_messages` (`pm_message_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`categories` (
  `category_id` INT NOT NULL AUTO_INCREMENT ,
  `category_name` VARCHAR(45) NULL ,
  `category_description` TINYTEXT NULL ,
  `category_lft` INT NOT NULL ,
  `category_rgt` INT NOT NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`items` (
  `item_id` INT NOT NULL AUTO_INCREMENT ,
  `item_lft` INT NULL ,
  `item_rgt` INT NULL ,
  PRIMARY KEY (`item_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`items_categories`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`items_categories` (
  `ic_item_id` INT NOT NULL ,
  `ic_category_id` INT NOT NULL ,
  PRIMARY KEY (`ic_category_id`, `ic_item_id`) ,
  INDEX `ic_item_id` (`ic_item_id` ASC) ,
  INDEX `ic_category_id` (`ic_category_id` ASC) ,
  CONSTRAINT `ic_item_id`
    FOREIGN KEY (`ic_item_id` )
    REFERENCES `wopr`.`items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ic_category_id`
    FOREIGN KEY (`ic_category_id` )
    REFERENCES `wopr`.`categories` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`pieces`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`pieces` (
  `piece_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`piece_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`items_pieces`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`items_pieces` (
  `ip_item_id` INT NOT NULL ,
  `ip_piece_id` INT NOT NULL ,
  PRIMARY KEY (`ip_piece_id`, `ip_item_id`) ,
  INDEX `ip_item_id` (`ip_item_id` ASC) ,
  INDEX `ip_piece_id` (`ip_piece_id` ASC) ,
  CONSTRAINT `ip_item_id`
    FOREIGN KEY (`ip_item_id` )
    REFERENCES `wopr`.`items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ip_piece_id`
    FOREIGN KEY (`ip_piece_id` )
    REFERENCES `wopr`.`pieces` (`piece_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`attributes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`attributes` (
  `attribute_id` INT NOT NULL AUTO_INCREMENT ,
  `attribute_name` VARCHAR(45) NULL ,
  `attribute_value` VARCHAR(45) NULL ,
  `attribute_description` TINYTEXT NULL ,
  PRIMARY KEY (`attribute_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`pieces_attributes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`pieces_attributes` (
  `pa_piece_id` INT NOT NULL ,
  `pa_attribute_id` INT NOT NULL ,
  PRIMARY KEY (`pa_attribute_id`, `pa_piece_id`) ,
  INDEX `pa_piece_id` (`pa_piece_id` ASC) ,
  INDEX `pa_attribute_id` (`pa_attribute_id` ASC) ,
  CONSTRAINT `pa_piece_id`
    FOREIGN KEY (`pa_piece_id` )
    REFERENCES `wopr`.`pieces` (`piece_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pa_attribute_id`
    FOREIGN KEY (`pa_attribute_id` )
    REFERENCES `wopr`.`attributes` (`attribute_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`inventory`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`inventory` (
  `inventory_id` INT NOT NULL AUTO_INCREMENT ,
  `inventory_piece_id` INT NOT NULL ,
  `inventory_location_id` INT NOT NULL ,
  `inventory_count` INT NOT NULL DEFAULT 0 ,
  PRIMARY KEY (`inventory_id`, `inventory_piece_id`, `inventory_location_id`) ,
  INDEX `inventory_piece_id` (`inventory_piece_id` ASC) ,
  INDEX `inventory_location_id` (`inventory_location_id` ASC) ,
  CONSTRAINT `inventory_piece_id`
    FOREIGN KEY (`inventory_piece_id` )
    REFERENCES `wopr`.`pieces` (`piece_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `inventory_location_id`
    FOREIGN KEY (`inventory_location_id` )
    REFERENCES `wopr`.`locations` (`location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`scans`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`scans` (
  `scan_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`scan_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`scanners_scans`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`scanners_scans` (
  `ss_scanner_id` INT NOT NULL ,
  `ss_scan_id` INT NOT NULL ,
  PRIMARY KEY (`ss_scanner_id`, `ss_scan_id`) ,
  INDEX `ss_scanner_id` (`ss_scanner_id` ASC) ,
  INDEX `ss_scan_id` (`ss_scan_id` ASC) ,
  CONSTRAINT `ss_scanner_id`
    FOREIGN KEY (`ss_scanner_id` )
    REFERENCES `wopr`.`scanners` (`scanner_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ss_scan_id`
    FOREIGN KEY (`ss_scan_id` )
    REFERENCES `wopr`.`scans` (`scan_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`prints`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`prints` (
  `print_id` INT NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`print_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`printers_prints`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`printers_prints` (
  `pp_printer_id` INT NOT NULL ,
  `pp_print_id` INT NOT NULL ,
  PRIMARY KEY (`pp_printer_id`, `pp_print_id`) ,
  INDEX `pp_printer_id` (`pp_printer_id` ASC) ,
  INDEX `pp_print_id` (`pp_print_id` ASC) ,
  CONSTRAINT `pp_printer_id`
    FOREIGN KEY (`pp_printer_id` )
    REFERENCES `wopr`.`printers` (`printer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `pp_print_id`
    FOREIGN KEY (`pp_print_id` )
    REFERENCES `wopr`.`prints` (`print_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `wopr`.`inventory_stores_locations`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `wopr`.`inventory_stores_locations` (
  `isl_inventory_id` INT NOT NULL ,
  `isl_store_id` INT NOT NULL ,
  `isl_location_id` INT NOT NULL ,
  PRIMARY KEY (`isl_inventory_id`, `isl_store_id`, `isl_location_id`) ,
  INDEX `isl_inventory_id` (`isl_inventory_id` ASC) ,
  INDEX `isl_store_id` (`isl_store_id` ASC) ,
  INDEX `isl_location_id` (`isl_location_id` ASC) ,
  CONSTRAINT `isl_inventory_id`
    FOREIGN KEY (`isl_inventory_id` )
    REFERENCES `wopr`.`inventory` (`inventory_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `isl_store_id`
    FOREIGN KEY (`isl_store_id` )
    REFERENCES `wopr`.`stores_locations` (`sl_store_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `isl_location_id`
    FOREIGN KEY (`isl_location_id` )
    REFERENCES `wopr`.`stores_locations` (`sl_location_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
