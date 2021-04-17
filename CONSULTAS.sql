
----- CONSULTA 1

SELECT P.location as Pais,MAX(C.total_cases) AS Contagios 
FROM Registro AS R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id
group by P.location
Order by Contagios desc;


select distinct iso_code,continent,location,total_cases from [owid-covid-data] where continent='';

----- CONSULTA 2

SELECT MAX(C.total_cases) as INFECTADO,
MAX(M.total_deaths) AS MUERTES, 
MAX(V.total_vaccinations) AS VACUNADOS,
MONTH(R.datoFecha) as MES,YEAR(R.datoFecha) AS AÑO from Registro as R
inner join Casos as C on C.Registro_Id = R.Id
inner join Muertes as M on M.Registro_Id = R.Id
inner join Vacunas as V on V.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and P.location = 'Guatemala' 
GROUP BY MONTH(R.datoFecha), YEAR(R.datoFecha)
ORDER BY YEAR(R.datoFecha),MONTH(R.datoFecha) ASC;



CREATE PROCEDURE CONSULTA2
@VARPAIS VARCHAR (100)
AS

BEGIN
SELECT MAX(C.total_cases) as INFECTADO,
MAX(M.total_deaths) AS MUERTES, 
MAX(V.total_vaccinations) AS VACUNADOS,
MONTH(R.datoFecha) as MES,YEAR(R.datoFecha) AS AÑO from Registro as R
inner join Casos as C on C.Registro_Id = R.Id
inner join Muertes as M on M.Registro_Id = R.Id
inner join Vacunas as V on V.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and P.location = @VARPAIS 
GROUP BY MONTH(R.datoFecha), YEAR(R.datoFecha)
ORDER BY YEAR(R.datoFecha),MONTH(R.datoFecha) ASC

END
GO

EXEC CONSULTA2 'honduras'

----- CONSULTA 3

SELECT P.continent as Continente,sum(ISNULL(C.new_cases,0)) as Cantidad
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on P.Id = R.Pais_Id
and datoFecha >= DATEADD([month], DATEDIFF([month], '19000101', GETDATE()) - 3, '19000101')
AND datoFecha < DATEADD([month], DATEDIFF([month], '19000101', GETDATE()), '19000101')
group by P.continent;




----- CONSULTA 4

select top 2 P.location as Pais,MAX(C.reproduction_rate) as Aceleracion,
MONTH(R.datoFecha) as Mes, YEAR(R.datoFecha) as año
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and 
(MONTH(R.datoFecha) = 12 and YEAR(R.datoFecha) = 2020 or
MONTH(R.datoFecha) = 1 and YEAR(R.datoFecha) = 2021)
group by MONTH(R.datoFecha),YEAR(R.datoFecha),P.location
order by Aceleracion desc;


----- propuesta de consulta

SELECT TOP 2 P.location as Pais,avg(C.new_cases) as Aceleracion,
MONTH(R.datoFecha),YEAR(R.datoFecha)
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and 
(MONTH(R.datoFecha) = 12 and YEAR(R.datoFecha) = 2020 or
MONTH(R.datoFecha) = 1 and YEAR(R.datoFecha) = 2021)
GROUP BY MONTH(R.datoFecha),YEAR(R.datoFecha),p.location
order by Aceleracion desc

CREATE VIEW CONSULTA4
AS 
SELECT TOP 2 P.location as Pais,MAX(C.reproduction_rate) as Aceleracion,
MONTH(R.datoFecha) as Mes, YEAR(R.datoFecha) as año
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and 
(MONTH(R.datoFecha) = 12 and YEAR(R.datoFecha) = 2020 or
MONTH(R.datoFecha) = 1 and YEAR(R.datoFecha) = 2021)
group by MONTH(R.datoFecha),YEAR(R.datoFecha),P.location
order by Aceleracion desc;

SELECT* FROM CONSULTA4;

------ consulta 5 pendiente

select SUM(cases)/3 as Promedio from(
select SUM(C.new_cases) as cases, MONTH(R.datoFecha) as Fecha
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and YEAR(R.datoFecha) = 2020 and
MONTH(r.datoFecha) > 0 and MONTH(r.datoFecha) < 4
group by MONTH(r.datoFecha)
) t1;


select SUM(cases)/91 as Promedio from(
select SUM(C.new_cases) as cases, MONTH(R.datoFecha) as Fecha
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and YEAR(R.datoFecha) = 2020 and
MONTH(r.datoFecha) BETWEEN 4 AND 6
group by MONTH(r.datoFecha)
) t1;



----- CONSULTA 6 

select P.location AS PAIS, 
R.datoFecha AS FECHA,
C.total_cases AS INFECTADOS
from Registro as R
INNER JOIN Casos C on C.Registro_Id = R.Id
INNER JOIN Pais as P on P.Id = R.Pais_Id AND
C.total_cases BETWEEN 1 AND 1
ORDER BY FECHA;



CREATE PROCEDURE CONSULTA6

@INICIO FLOAT,
@FIN FLOAT

AS
BEGIN

SELECT P.location AS PAIS, 
R.datoFecha AS FECHA,
C.total_cases AS INFECTADOS
FROM Registro as R
INNER JOIN Casos C on C.Registro_Id = R.Id
INNER JOIN Pais as P on P.Id = R.Pais_Id AND
C.total_cases BETWEEN @INICIO  AND @FIN
ORDER BY FECHA

END
GO

EXEC CONSULTA6 1,2



----- CONSULTA 7

	select top 10 P.location as pais, MAX(PR.total_tests) as pruebas
	from Registro as R
	inner join Prueba PR on PR.Registro_Id = R.Id
	inner join Pais as P on R.Pais_Id = P.Id
	Group by p.location
	order by pruebas desc;


CREATE VIEW CONSULTA7
AS 
SELECT TOP 10 P.location as pais, MAX(PR.total_tests) as pruebas
	FROM Registro as R
	inner join Prueba PR on PR.Registro_Id = R.Id
	inner join Pais as P on R.Pais_Id = P.Id
	GROUP BY p.location
	ORDER BY pruebas desc;

	SELECT* FROM CONSULTA7;


---- CONSLTA 8

SELECT top 1 P.location,M.total_deaths MUERTES,r.datoFecha as Fecha
from Registro as R
inner join Muertes M on M.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and R.datoFecha = '2021-04-06'
ORDER BY MUERTES DESC;

CREATE PROCEDURE CONSULTA8

@VARFECHA DATE

AS
BEGIN

SELECT TOP 1 P.location,M.total_deaths MUERTES,r.datoFecha as Fecha
from Registro as R
inner join Muertes M on M.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id AND R.datoFecha = @VARFECHA
ORDER BY MUERTES DESC

END
GO

EXEC CONSULTA8 '20210406'



------- CONSULTA 9

select* from Registro as R
inner join Casos as C on C.Registro_Id = R.Id
inner join Muertes as M on M.Registro_Id = R.Id
inner join Vacunas as V on V.Registro_Id = R.Id
inner join Ingresos as I  on I.Registro_Id = R.Id
inner join Paciente as PA on  PA.Registro_Id = R.Id
inner join Prueba as PR on PR.Registro_Id = R.Id
inner join Poblacion as PL on PL.Registro_Id = R.Id
inner join Equipo as E on E.Registro_Id = R.Id
inner join Desarrollo as D on D.Registro_Id = R.Id
inner join Rigurosidad as RI on RI.Registro_Id = R.Id
inner join Pais as P  on  P.id = R.pais_id and 
P.location = 'Guatemala' and R.datoFecha BETWEEN '2020-03-28' AND '2020-04-01';


CREATE PROCEDURE CONSULTA9

@FECHAINICIO DATE,
@FECHAFIN DATE

AS
BEGIN

select* from Registro as R
inner join Casos as C on C.Registro_Id = R.Id
inner join Muertes as M on M.Registro_Id = R.Id
inner join Vacunas as V on V.Registro_Id = R.Id
inner join Ingresos as I  on I.Registro_Id = R.Id
inner join Paciente as PA on  PA.Registro_Id = R.Id
inner join Prueba as PR on PR.Registro_Id = R.Id
inner join Poblacion as PL on PL.Registro_Id = R.Id
inner join Equipo as E on E.Registro_Id = R.Id
inner join Desarrollo as D on D.Registro_Id = R.Id
inner join Rigurosidad as RI on RI.Registro_Id = R.Id
inner join Pais as P  on  P.id = R.pais_id and 
P.location = 'Guatemala' and R.datoFecha BETWEEN @FECHAINICIO AND @FECHAFIN;

END
GO

EXEC CONSULTA9 '20200328','20200401'

----- CONSULTA 10


SELECT P.location, MAX(C.total_cases) as Infecciones
from Registro as R
inner join Casos C on C.Registro_Id = R.Id
inner join Pais as P on R.Pais_Id = P.Id and 
(P.continent = 'North America' or P.continent = 'South America') and
R.datoFecha BETWEEN '2020-01-01' and '2021-04-06'
GROUP BY p.location
ORDER BY Infecciones desc;
