**** Tesis de Grado
**** Estefanía Elizabeth Capriata
**** Universidad de San Andrés

* Comenzamos con una base de datos nueva
cls
clear

* Base de datos a utilizar
cd "C:\Users\estef\Desktop\Tesis\Tesis-Licenciatura\Matrícula y Secciones"

* La información de cada año está en un archivo de excel distinto, hacemos un loop para que repita el procedimiento para cada una de las bases
foreach y in 1 2 3 4 5 6 7 8 9 {
    display `y'
    import excel "C:\Users\estef\Desktop\Tesis\Tesis-Licenciatura\Matrícula y Secciones\201`y'.xlsx", firstrow clear
	
	* Esto sirve para cambiar el formato de la columna ID1 y que no redondee el valor
	format ID1 %15.0f
	
	* Generamos una variable "year" en cada uno de los loops
    generate int year = 201`y'
	
	* Las bases de datos no tienen los mismos nombres de las columnas por lo que tenemos que poner condiciones diferentes para cada una de ellas
	if `y' <= 3 {
		egen matriculados_total = rowtotal (Lactantes Deambulantes Salade2 Salade3 Salade4 Salade5 _1 _2 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _1314 AJ) if ID1 !=.
	}
	if `y' >= 6 {
		egen matriculados_total = rowtotal (Lactantes Deambulantes Salade2 Salade3 Salade4 Salade5 _1 _2 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _13y14 AJ) if ID1 !=.
	}
	if `y' == 4 {
		egen matriculados_total = rowtotal (Lactantes Deambulantes Salade2 Salade3 Salade4 Salade5 _1 _2 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _1314 SNU) if ID1 !=.
	}
	if `y' == 5 {
		egen matriculados_total = rowtotal (Lactantes Deambulantes Salade2 Salade3 Salade4 Salade5 _1 _2 _3 _4 _5 _6 _7 _8 _9 _10 _11 _12 _1314 SNU) if ID1 !=.
	}
	
	* Las observaciones que son cero están representadas por un missing value en la base de datos, así que cambiamos estos valores
	replace Lactantes=0 if matriculados_total>0 & Lactantes==.
	replace Deambulantes=0 if matriculados_total>0 & Deambulantes==.
	replace Salade2=0 if matriculados_total>0 & Salade2==.
	replace Salade3=0 if matriculados_total>0 & Salade3==.
	replace Salade4=0 if matriculados_total>0 & Salade4==.
	replace Salade5=0 if matriculados_total>0 & Salade5==.
	replace _1=0 if matriculados_total>0 & _1==.
	replace _2=0 if matriculados_total>0 & _2==.
	replace _3=0 if matriculados_total>0 & _3==.
	replace _4=0 if matriculados_total>0 & _4==.
	replace _5=0 if matriculados_total>0 & _5==.
	replace _6=0 if matriculados_total>0 & _6==.
	replace _7=0 if matriculados_total>0 & _7==.
	replace _8=0 if matriculados_total>0 & _8==.
	replace _9=0 if matriculados_total>0 & _9==.
	replace _10=0 if matriculados_total>0 & _10==.
	replace _11=0 if matriculados_total>0 & _11==.
	replace _12=0 if matriculados_total>0 & _12==.
	
	* Nuevamente las bases de datos de los distintos años son diferentes por lo que tenemos que hacer esta aclaración
	if `y' <= 5 {
		replace _1314=0 if matriculados_total>0 & _1314==.
	}
	if `y' > 5 {
		replace _13y14=0 if matriculados_total>0 & _13y14==.
	}
	if `y' != 4 & `y' != 5  {
		replace AJ=0 if matriculados_total>0 & AJ==.
	}
	if `y' == 4 {
		replace SNU=0 if matriculados_total>0 & SNU==.
	}
	if `y' == 5 {
		replace SNU=0 if matriculados_total>0 & SNU==.
	}
	
	* Generamos una variable que identifique la cantidad de matriculados varones
	egen matriculados_var = rowtotal (AK AL AM AN AO AP AQ AR AS AT AU AV AW AX AY AZ BA BB BC BD) if ID1 !=.
	label variable matriculados_var "Matriculados varones"
	
	* De nuevo, reemplazamos con ceros los missing values en estas columnas.
	replace AK=0 if matriculados_total>0 & AK==.
	replace AL=0 if matriculados_total>0 & AL==.
	replace AM=0 if matriculados_total>0 & AM==.
	replace AN=0 if matriculados_total>0 & AN==.
	replace AO=0 if matriculados_total>0 & AO==.
	replace AP=0 if matriculados_total>0 & AP==.
	replace AQ=0 if matriculados_total>0 & AQ==.
	replace AR=0 if matriculados_total>0 & AR==.
	replace AS=0 if matriculados_total>0 & AS==.
	replace AT=0 if matriculados_total>0 & AT==.
	replace AU=0 if matriculados_total>0 & AU==.
	replace AV=0 if matriculados_total>0 & AV==.
	replace AW=0 if matriculados_total>0 & AW==.
	replace AX=0 if matriculados_total>0 & AX==.
	replace AY=0 if matriculados_total>0 & AY==.
	replace AZ=0 if matriculados_total>0 & AZ==.
	replace BA=0 if matriculados_total>0 & BA==.
	replace BB=0 if matriculados_total>0 & BB==.
	replace BC=0 if matriculados_total>0 & BC==.
	replace BD=0 if matriculados_total>0 & BD==.
	
	* Generamos la variable de repitentes
	egen repitentes_total = rowtotal (BE BF BG BH BI BJ BK BL BM BN BO BP BQ) if ID1 !=.
	label variable repitentes_total "Repitentes"

	* De nuevo, reemplazamos con ceros los missing values en estas columnas.
	replace BE=0 if repitentes_total>0 & BE==.
	replace BF=0 if repitentes_total>0 & BF==.
	replace BG=0 if repitentes_total>0 & BG==.
	replace BH=0 if repitentes_total>0 & BH==.
	replace BI=0 if repitentes_total>0 & BI==.
	replace BJ=0 if repitentes_total>0 & BJ==.
	replace BK=0 if repitentes_total>0 & BK==.
	replace BL=0 if repitentes_total>0 & BL==.
	replace BM=0 if repitentes_total>0 & BM==.
	replace BN=0 if repitentes_total>0 & BN==.
	replace BO=0 if repitentes_total>0 & BO==.
	replace BP=0 if repitentes_total>0 & BP==.
	replace BQ=0 if repitentes_total>0 & BQ==.

	* Generamos la variable que identifica la cantidad de repitentes sobre matriculados
	gen repienmat = repitentes_total/matriculados_total
	label variable repienmat "Repitentes del total de matriculados"
	* Generamos una variable que muestre el porcentaje de los repitentes sobre los matriculados
	gen porcentajerepi = repienmat*100
	label variable porcentajerepi "Porcentaje de repitentes"

	* Guardamos cada uno de los archivos por separado
	save "C:\Users\estef\Desktop\Tesis\Tesis-Licenciatura\Matrícula y Secciones\datos201`y'.dta"
	clear
}

* Juntamos todas las bases de datos
use datos2011, clear
	foreach num of numlist 2012/2019 {
		append using datos`num'
}

* Quitamos aquellas filas que contienen missings en la columna ID.
drop if missing(ID1)

* Guardamos el archivo
save "C:\Users\estef\Desktop\Tesis\Tesis-Licenciatura\Matrícula y Secciones\datosmatyrep.dta"

