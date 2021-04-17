Create database PROYECTO;

USE [PROYECTO]

CREATE TABLE Pais(
  Id INT NOT NULL identity(1,1) primary key,
  iso_code varchar(100),
  location varchar(100),
  continent varchar(100));	


CREATE TABLE Registro(
  Id INT NOT NULL identity(1,1) primary key,
  Pais_Id INT,
  datoFecha date,
  CONSTRAINT FK_Pais FOREIGN KEY (Pais_Id) REFERENCES Pais (Id));


  CREATE TABLE Casos (
  Id INT NOT NULL identity(1,1) primary key,
  new_cases float,
  new_cases_smoothed float,
  new_cases_per_million float,
  new_cases_smoothed_per_million float,
  total_cases float,
  total_cases_per_million float,
  reproduction_rate float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK1_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));

  -- -----------------------------------------------------
-- Table `mydb`.`Muertes`
-- -----------------------------------------------------
CREATE TABLE Muertes (
  Id INT NOT NULL identity(1,1) primary key,
  new_deaths_smoothed float,
  new_deaths_per_million float,
  new_deaths_smoothed_per_million float,
  total_deaths float,
  total_deaths_per_million float,
  new_deaths float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK2_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));


  -- -----------------------------------------------------
-- `Paciente`
-- -----------------------------------------------------
CREATE TABLE Paciente (
  Id INT NOT NULL identity(1,1) primary key,
  icu_patients float,
  icu_patients_per_million float,
  hosp_patients float,
  hosp_patients_per_million float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK3_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));

  -- -----------------------------------------------------
--`Ingresos`
-- -----------------------------------------------------
CREATE TABLE Ingresos (
  Id INT NOT NULL identity(1,1) primary key,
  weekly_icu_admissions float,
  weekly_icu_admissions_per_million float,
  weekly_hosp_admissions float,
  weekly_hosp_admissions_per_million float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK4_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));

  -- -----------------------------------------------------
-- `Prueba`
-- -----------------------------------------------------
CREATE TABLE Prueba (
  Id INT NOT NULL identity(1,1) primary key,
  total_tests float,
  total_tests_per_thousand float,
  new_tests_per_thousand float,
  new_tests_smoothed float,
  new_tests_smoothed_per_thousand float,
  tests_per_case float,
  tests_units varchar(100),
  positive_rate float,
  new_tests float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK5_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));

  -- -----------------------------------------------------
--`Vacunas`
-- -----------------------------------------------------
CREATE TABLE Vacunas (
  Id INT NOT NULL identity(1,1) primary key,
  people_vaccinated float,
  people_fully_vaccinated float,
  new_vaccinations float,
  new_vaccinations_smoothed float,
  total_vaccinations_per_hundred float,
  people_vaccinated_per_hundred float,
  people_fully_vaccinated_per_hundred float,
  new_vaccinations_smoothed_per_million float,
  total_vaccinations float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK6_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));


 
  -- -----------------------------------------------------
--`Desarrollo`
-- -----------------------------------------------------
CREATE TABLE Desarrollo (
  Id INT NOT NULL identity(1,1) primary key,
  life_expectancy float,
  human_development_index float,
  gdp_per_capita float,
  extreme_poverty float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK7_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));


  -- -----------------------------------------------------
--poblacion
-- -----------------------------------------------------
CREATE TABLE poblacion (
  Id INT NOT NULL identity(1,1) primary key,
  population float,
  population_density float,
  median_age float,
  aged_65_older float,
  aged_70_older float,
  cardiovasc_death_rate float,
  diabetes_prevalence float,
  female_smokers float,
  male_smokers float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK8_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));


   -- -----------------------------------------------------
-- Table `mydb`.`Equipo`
-- -----------------------------------------------------
CREATE TABLE Equipo (
  Id INT NOT NULL identity(1,1) primary key,
  handwashing_facilities float,
  hospital_beds_per_thousand float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK9_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));


  -- -----------------------------------------------------
-- Table `mydb`.`Rigurosidad`
-- -----------------------------------------------------
CREATE TABLE Rigurosidad (
  Id INT NOT NULL identity(1,1) primary key,
  stringency_index float,
  Registro_Id INT NOT NULL,
  CONSTRAINT FK10_Registro FOREIGN KEY (Registro_Id) REFERENCES Registro (Id));