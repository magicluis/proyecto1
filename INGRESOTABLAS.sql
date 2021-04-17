
---- Insertar Pais

Insert Into Pais (iso_code,location,continent)
select distinct iso_code, location, continent from [owid-covid-data] where continent != '';

----- Insertar Registro

Insert into Registro (Pais_Id,datoFecha)
select P.Id,T.date from 
[owid-covid-data] as T,
Pais as P
where  T.iso_code = P.iso_code and T.location = P.location and T.location = P.location;


---- Insertar Casos

Insert into Casos (
  new_cases,
  new_cases_smoothed,
  new_cases_per_million,
  new_cases_smoothed_per_million,
  total_cases,
  total_cases_per_million,
  reproduction_rate,
  Registro_Id)
Select 
  t.new_cases,
  t.new_cases_smoothed,
  t.new_cases_per_million,
  t.new_cases_smoothed_per_million,
  t.total_cases,
  t.total_cases_per_million,
  t.reproduction_rate,
  R.Id
  from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;

----- Insertar Mertes

Insert into Muertes (
  new_deaths_smoothed,
  new_deaths_per_million,
  new_deaths_smoothed_per_million,
  total_deaths,
  total_deaths_per_million,
  new_deaths,
  Registro_Id
  )
Select 
  t.new_deaths_smoothed,
  t.new_deaths_per_million,
  t.new_deaths_smoothed_per_million,
  t.total_deaths,
  t.total_deaths_per_million,
  t.new_deaths,
  R.Id
 from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;

----- Ingreso Paciente

Insert into Paciente (
  icu_patients,
  icu_patients_per_million,
  hosp_patients,
  hosp_patients_per_million,
  Registro_Id
  )
Select 
  t.icu_patients,
  t.icu_patients_per_million,
  t.hosp_patients,
  t.hosp_patients_per_million,
  R.Id
 from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;



--- Ingresos

Insert into Ingresos (
  weekly_icu_admissions,
  weekly_icu_admissions_per_million,
  weekly_hosp_admissions,
  weekly_hosp_admissions_per_million,
  Registro_Id
  )
Select 
  t.weekly_icu_admissions,
  t.weekly_icu_admissions_per_million,
  t.weekly_hosp_admissions,
  t.weekly_hosp_admissions_per_million,
  R.Id
from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;


----- Ingreso Pruebas

Insert into Prueba (
  total_tests,
  total_tests_per_thousand,
  new_tests_per_thousand,
  new_tests_smoothed,
  new_tests_smoothed_per_thousand,
  tests_per_case,
  tests_units,
  positive_rate,
  new_tests,
  Registro_Id
  )
Select 
  t.total_tests,
  t.total_tests_per_thousand,
  t.new_tests_per_thousand,
  t.new_tests_smoothed,
  t.new_tests_smoothed_per_thousand,
  t.tests_per_case,
  t.tests_units,
  t.positive_rate,
  t.new_tests,
  R.Id
from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;


----- Vacuna

Insert into Vacunas (
  people_vaccinated,
  people_fully_vaccinated,
  new_vaccinations,
  new_vaccinations_smoothed,
  total_vaccinations_per_hundred,
  people_vaccinated_per_hundred,
  people_fully_vaccinated_per_hundred,
  new_vaccinations_smoothed_per_million,
  total_vaccinations,
  Registro_Id
  )
Select 
  t.people_vaccinated,
  t.people_fully_vaccinated,
  t.new_vaccinations,
  t.new_vaccinations_smoothed,
  t.total_vaccinations_per_hundred,
  t.people_vaccinated_per_hundred,
  t.people_fully_vaccinated_per_hundred,
  t.new_vaccinations_smoothed_per_million,
  t.total_vaccinations,
  R.Id
from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;


---- Ingresar Desarrollo

Insert into Desarrollo (
  life_expectancy,
  human_development_index,
  gdp_per_capita,
  extreme_poverty,
  Registro_Id
  )
Select 
  t.life_expectancy,
  t.human_development_index,
  t.gdp_per_capita,
  t.extreme_poverty,
  R.Id
from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;


----- Insertar Poblacion

Insert into poblacion (
  population,
  population_density,
  median_age,
  aged_65_older,
  aged_70_older,
  cardiovasc_death_rate,
  diabetes_prevalence,
  female_smokers,
  male_smokers,
  Registro_Id
  )
Select 
  t.population,
  t.population_density,
  t.median_age,
  t.aged_65_older,
  t.aged_70_older,
  t.cardiovasc_death_rate,
  t.diabetes_prevalence,
  t.female_smokers,
  t.male_smokers,
  R.Id
  from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;


----- Insertar Equipo

Insert into Equipo (
  handwashing_facilities,
  hospital_beds_per_thousand,
  Registro_Id
  )
Select 
  handwashing_facilities,
  hospital_beds_per_thousand,
  R.Id
   from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;

----- Rigurosidad

Insert into Rigurosidad (
  stringency_index,
  Registro_Id
  )
Select 
  t.stringency_index, 
  R.Id
  from
[owid-covid-data] as T,
Registro as R
where 
R.Pais_Id = 
(select P.Id from Pais as P where T.iso_code = P.iso_code and T.location = P.location and T.continent = P.continent)
and R.datoFecha = T.date;
