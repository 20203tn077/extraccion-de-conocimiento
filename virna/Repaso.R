read.


# Repaso - Unidad 2

## Tipos de datos

- Cuantitativos: aquellos que el resultado es un número. Se dividen en dos:
- Discretos: valores específico de un conjunto de valores finitos. Ejemplo: numero de sensores, numero de autos estacionados,etc.
- Continuos: rango de valores. Ejemplo: peso de las personas,presión, temperatura.
- Cualitativos: aquellos que los resultados no son valores numéricos.
- Nominales: compuestos por dos o mas categorías basado en la identidad del objeto. Ejemplos: color de ojos (café, azul, verde) o tipo de animal (carnívoro, herbívoro).
- Ordinales: compuestos por dos o más categorías, donde el orden es importante en el valor. Ejemplo: Rango de clases de estudiantes, escalas de encuestas de satisfacción (insatisfecho, neutro, satisfecho)

### Fuentes de datos

Hay muchas fuentes de datos diferentes.

- Una gran cantidad de datos históricos se puede encontrar en archivos como estos:
- Documentos de MS Word
- Correos electrónicos
- Hojas de cálculo
- PowerPoints de MS
- PDF
- HTML
- Archivos públicos y privados
- Sensores
- Bases de datos

## Data Warehouse

### **Almacén de datos.**

- Contiene datos históricos de varias fuentes para facilitar reportes y análisis de una organización.
- Colección de datos en la cual se encuentra integrada la información de la empresa y que se usa como soporte para el proceso de toma de decisiones gerenciales.
- Repositorio de datos de una organización que integra y depura información de una o varias fuentes, la procesa y permite un análisis rápido y flexible de los datos.

Según Bill Inmon, presentan las siguientes características:

- Orientado a un tema: se organiza una colección de información alrededor de un tema central.
- Integrado: incluye datos de múltiples orígenes y presenta consistencia de datos.
- Variable en el tiempo: los cambios en los datos se registran históricamente, para que los informen reflejen las variaciones.
- No volátil: la información solo puede ser leída pero no modificada. La información es permanente.

### **¿Quién lo utiliza?**

Cualquier empresa que busque asistencia en la toma de desiciones.

- Aeronáutica: analizar rentabilidad de trayectos o promociones personalizadas.
- Salud: predecir resultados de un tratamiento, informes sobre pacientes.
- Turismo: campañas publicitarias y promociones basadas en datos de las preferencias y hábitos de los pasajeros.

### **Ventajas:**

- Facilita el acceso a al información.
- Estandariza la información.
- Proporciona herramienta para la toma de decisiones.
- Aumenta la productividad

## **Arquitectura básica**

ETL
Extraer, transformar y cargar
(Extract, Transform and Load)

## **Modelado dimensional**

### **Esquema Estrella**

- Requiere una sola tabla de hechos.
- Utiliza diferentes tablas de dimensiones para contener atributos propios.

https://troyanx.com/Hefesto/estrella.html

### **Esquema copo de nieve**

- Requiere una sola tabla de hechos.
- Cada tabla de dimensión esta vinculada a otra tabla de dimensión.

https://troyanx.com/Hefesto/copo-de-nieve.html

- Hechos: Procesos de negocio de la organización
- Ejemplo: una venta
- Dimensión: Representación del punto de vista para cierto proceso de negocio
- Ejemplo: Cliente que ha comprado, fecha de compra, producto vendido, etc. (Compras realizadas por un cliente)
- Métrica: Indicadores del proceso de negocio, conceptos cuantificables que permiten medir el proceso de negocio.
- Ejemplo: Importe de la venta, cantidad vendida.

## Actividad

Modelar la tabla de hechos y dimensiones necesarias de acuerdo al siguiente texto:

- En una institución de educativa se quiere tener un concentrado de datos que permita obtener la información de las calificaciones de los alumnos por asignatura. Se desea que esta información pueda obtenerse por periodo parcial, por semestre y por año.



![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/740b4eb3-8175-4ce2-8041-ce2e104eab62/Untitled.png)

# Modelado de cubos de información

Análisis OLAP
OLAP = Online Analytical Processing

- Método utilizado para exploración de información especializada en el contenido del data warehouse.
- Organiza y resume los datos para mejorar la eficiencia de las consultas analíticas.
- Llamados cubos OLAP o hipercubos.
- Contienen datos de la variable a analizar.
- Proporcionan una vista logica de los datos provistos por el sistema de información hacia el data warehouse.
- Construidos mediante las dimensiones del data warehouse.
- Análisis de variables o indicadores de gestión.
- Dimensiones: producto, localidad, tiempo, cliente.
- Variables: ventas, gastos, beneficios, calificaciones.

## Actividad

Dadas la tabla de hechos y dimensiones de la institución educativa, realiza un diagrama ejemplificando el cubo de datos que se puede generar.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/96a3827b-62a4-4ef7-adb9-b8cd79a1c627/Untitled.png)

# Minería de datos

Analizar los datos desde diferentes perspectivas y resumirlos en información útil.

- Clasificación: clasificar los datos en distintas categorías.
- Clustering: agrupar varios puntos de datos en función de sus similitudes.
- Reglas de asociación: encontrar relaciones entre dos conjuntos de datos diferentes y aparentemente no relacionados. (Pañales y cerveza)

## Estructura de los datos

Cuando se trabaja con conjunto de datos existentes, es necesario comprender la estructura que estos tienen.
Para ello, tenemos funciones como:

- **class:** obtener la clase del objeto.
- **dim:** obtener las dimensiones de los datos.
- **names:** obtener los nombres de las columnas.
- **str:** previsualización de los datos y su estructura.
- **glimpse:** versión mejorada de str, de dplyr.
- **summary:** resumen de los datos.

## Actividad

Carga los datos del archivo maraton_ny.csv

Analiza la estructura de los datos utilizando las funciones presentadas previamente.

```r
> maraton <- read.csv('maraton_ny.csv',sep = ',')
> maraton
## Muestra los datos de maraton_ny.csv
> class(maraton)
[1] "data.frame"
> dim(maraton)
[1] 1000    6
> names(maraton)
[1] "Corredor" "place"    "gender"   "age"      "home"     "time"
> str(maraton)
'data.frame':	1000 obs. of  6 variables:
 $ Corredor: int  3475 13594 12012 10236 9476 1720 15736 10580 11957 18933 ...
 $ place   : int  3592 13853 12256 10457 9686 1784 16020 10805 12201 19266 ...
 $ gender  : chr  "Male" "Female" "Male" "Female" ...
 $ age     : int  52 40 31 33 33 40 30 27 42 48 ...
 $ home    : chr  "GBR" "NY" "FRA" "MI" ...
 $ time    : num  217 273 265 256 252 ...
```

En R...

- Una columna de un data frame se conoce como **variable**.
- Un registro se conoce como **observación.**
- Cada data frame corresponde a un solo tipo de **observational unit**.

Por ejemplo:

- **variable:** age
- **observación:**


| Corredor | place | gender | age | home | time |
| --- | --- | --- | --- | --- | --- |
| 3475 | 3592 | Male | 53 | GBR | 217.48333 |
- **observational unit:** corredor

```r
> install.packages("dplyr")
> library(dplyr)
> glimpse(maraton)
Rows: 1,000
Columns: 6
$ Corredor <int> 3475, 13594, 12012, 10236, 9476, 1720, 15736, 10580, 11957, 18933, 14956, 14987, 10447, 10435, 191, 99…
$ place    <int> 3592, 13853, 12256, 10457, 9686, 1784, 16020, 10805, 12201, 19266, 15229, 15260, 10670, 10658, 200, 10…
$ gender   <chr> "Male", "Female", "Male", "Female", "Male", "Male", "Female", "Male", "Male", "Male", "Female", "Male"…
$ age      <int> 52, 40, 31, 33, 33, 40, 30, 27, 42, 48, 63, 49, 33, 43, 40, 33, 40, 36, 49, 34, 26, 50, 33, 71, 39, 28…
$ home     <chr> "GBR", "NY", "FRA", "MI", "NY", "NJ", "CA", "GBR", "NED", "B.C", "GBR", "ITA", "NY", "NY", "GER", "NY"…
$ time     <dbl> 217.4833, 272.5500, 265.2833, 256.1500, 252.2500, 201.9667, 283.5667, 255.8833, 264.2500, 306.6833, 28…
> summary(maraton)
    Corredor         place          gender               age           home                time
 Min.   :   53   Min.   :   54   Length:1000        Min.   : 5.0   Length:1000        Min.   :147.3
 1st Qu.: 5936   1st Qu.: 6095   Class :character   1st Qu.:31.0   Class :character   1st Qu.:233.8
 Median :11722   Median :11962   Mode  :character   Median :38.0   Mode  :character   Median :262.8
 Mean   :11763   Mean   :11992                      Mean   :39.1                      Mean   :268.6
 3rd Qu.:17601   3rd Qu.:17922                      3rd Qu.:46.0                      3rd Qu.:294.9
 Max.   :23290   Max.   :23662                      Max.   :81.0                      Max.   :566.8
```

## Conjunto de datos

### Data set

Colección de valores donde cada uno pertenece a una variable y a una observación.

## Data cleaning

Proceso de corregir y eliminar registros incorrectos de un data set.

- Implica la identificación y reemplazo de datos incompletos, incorrectos, irrelevantes o problemáticos.

### Objetivo

Obtener data sets consistentes y libres de errores que puedan ocasionar problemas durante el análisis.

### Problemas comunes

| Datos duplicados | Datos conflictivos | Datos incompletos | Datos inválidos |
| --- | --- | --- | --- |
| Existen dos o mas
observaciones
idénticas. | Cuando existen
dos observaciones
con distintos
atributos. | Las observaciones
tienen valores
faltantes. | Los valores no
cumplen con la
estandarización
correcta para la
variable. |

Una vez conociendo la estructura de los datos, es necesario **revisar algunas observaciones** del dataset para verificar los valores que contiene.

- Se pueden utilizar funciones como **head** o **tail** para ver datos representativos del inicio y fin del dataset.

```r
> head(maraton,10)
   Corredor place gender age home     time
1      3475  3592   Male  52  GBR 217.4833
2     13594 13853 Female  40   NY 272.5500
3     12012 12256   Male  31  FRA 265.2833
4     10236 10457 Female  33   MI 256.1500
5      9476  9686   Male  33   NY 252.2500
6      1720  1784   Male  40   NJ 201.9667
7     15736 16020 Female  30   CA 283.5667
8     10580 10805   Male  27  GBR 255.8833
9     11957 12201   Male  42  NED 264.2500
10    18933 19266   Male  48  B.C 306.6833
```

```r
> tail(maraton,10)
     Corredor place gender age home     time
991     23273 23645 Female  46   NY 501.5500
992     15901 16189 Female  51   TN 285.3500
993     14889 15162 Female  50  GER 278.1167
994     11547 11784 Female  40   NY 263.3833
995      4079  4206   Male  27  CAN 223.3333
996     15972 16261   Male  61  FRA 285.8833
997      1090  1131   Male  37  GBR 191.9167
998     16419 16713 Female  53  IRL 289.0167
999     13977 14241 Female  21   NY 276.0500
1000     8527  8726   Male  55  GER 240.9667
```

### Datos incompletos

El core de R cuenta con algunas funciones para el tratamiento de valores faltantes:

- [**is.na](http://is.na/):** verifica si falta el valor.
- **complete.cases:** indica si la observación tiene todos sus valores.
- **na.omit:** muestra las observaciones, removiendo aquellas que tienen valores faltantes.

### Actividad

Carga los datos del archivo contaminacion.csv

- Verifica el resultado de las funciones [**is.na](http://is.na/),** **complete.cases** y **na.omit** sobre el dataset.

```r
> contaminacion <- read.csv('contaminacion.csv',sep = ',')
> is.na(contaminacion)
      Numero_de_empresas  PM10 PM2.5   SO2    CO   NOX   COV   NH3    CN
 [1,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [2,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
 [3,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
 [4,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [5,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [6,]              FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
 [7,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
 [8,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
 [9,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[10,]              FALSE FALSE  TRUE FALSE FALSE FALSE FALSE FALSE FALSE
[11,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[12,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[13,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[14,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[15,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[16,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[17,]              FALSE FALSE  TRUE FALSE FALSE  TRUE FALSE FALSE FALSE
[18,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
[19,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[20,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE FALSE
[21,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[22,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[23,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[24,]              FALSE FALSE FALSE FALSE FALSE  TRUE FALSE FALSE  TRUE
[25,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[26,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[27,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[28,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[29,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[30,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[31,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[32,]              FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[33,]              FALSE FALSE  TRUE  TRUE FALSE  TRUE FALSE FALSE  TRUE
> complete.cases(contaminacion)
 [1]  TRUE FALSE FALSE  TRUE  TRUE FALSE FALSE  TRUE  TRUE FALSE  TRUE  TRUE  TRUE  TRUE  TRUE  TRUE FALSE FALSE FALSE
[20] FALSE  TRUE FALSE  TRUE FALSE FALSE  TRUE  TRUE  TRUE  TRUE FALSE  TRUE  TRUE FALSE
> na.omit(contaminacion)
   Numero_de_empresas  PM10 PM2.5    SO2     CO   NOX   COV  NH3   CN
1                   0   945   629   1814    235   843  1836   14    5
4                  39  4527  3847 574973   8698 34132  3465  382  356
5                 214  5063  3083  54592   2510  4845  3419  912  812
8                 367  8207  4958 166476   1767 20578  1296  449  508
9                1569  1381   826    699    766  2217 21967   50   23
11                233  3810  2770  48462  74299  9249 10155 1137  171
12                  8  8215  7725 104172   2327 11206   708   88  451
13                129 12532  8977 216611 115085 31484  7567  322  370
14                692  8768  5399  23897   3216  6323 15623 1983 1172
15               1232  5103  3627   6763   6244 15159 48140  233  187
16                151  5095  3460  13717   2856  4303  5379 1957  379
21                252  4556  2673   4558   2576  6335  3685   54  552
23                 11  2076  1199    566    349   512   866  387  348
26                214  5063  3083  54592   2510  4845  3419  912  812
27                179  7986  5116  75004   3732 13328  4093  327  259
28                104  3612  2501  14118   6911 21139  6280  607  496
29                222  7572  6162  50158  69356 30307 30732 2071  324
31                197 41938 25779 160835  81529 45656 26427 7877 5608
32                 51  2108  1769  19008   2973 10184  3834  198  124
```

Con los datos del archivo contaminacion.csv, ¿cómo obtendrías las observaciones que tienen datos incompletos?

```r
> contaminacion[!complete.cases(contaminacion),]
   Numero_de_empresas  PM10 PM2.5    SO2     CO    NOX   COV  NH3  CN
2                 588  1978  1842   5588   6850     NA 11692  254  NA
3                  27  1028   752  22890    505     NA   516  115  58
6                  34  3360    NA  33287   9505  11015  4741  264 137
7                  42 19963 16177 190970  24171 158743  6202 1220  NA
10                 80  2971    NA  27144   2930   6645  3156  157 166
17                 65  3133    NA  10141   1325     NA  2885  484 450
18                  8  2913  1650    286    472     NA  1427  536  NA
19                480  9752  7074  35548  85330     NA 13498  511 337
20                 20  9218  5838 111005 104373     NA  7383 3376 838
22                184  1510  1153   4444   2379   6916  5930   92  NA
24                132 14733  9472  86202   5083     NA  6327 1840  NA
25                 62  7203  4623 106277   1209  10896  3119  763  NA
30                 94   307   211   1456    244    822  1216   10  NA
33                 12    40    NA     NA      2     NA   193    0  NA
```

Con los datos del archivo contaminacion.csv, ¿cómo obtendrías las observaciones que tienen datos incompletos?

- Utilizando la librería **mice**, se tiene acceso a la función **md.pattern** que permiten verificar los valores faltantes en un data frame.
- Analiza los valores de las observaciones de maraton y contaminación utilizando md.pattern.

```r
> install.packages("mice")
> library(mice)
> md.pattern(maraton)
 /\     /\
{  `---'  }
{  O   O  }
==>  V <==  No need for mice. This data set is completely observed.
 \  \|/  /
  `-----'

Corredor place gender age home time
1000        1     1      1   1    1    1 0
0     0      0   0    0    0 0
> md.pattern(contaminacion)
Numero_de_empresas PM10 CO COV NH3 SO2 PM2.5 NOX CN
19                  1    1  1   1   1   1     1   1  1  0
4                   1    1  1   1   1   1     1   1  0  1
3                   1    1  1   1   1   1     1   0  1  1
3                   1    1  1   1   1   1     1   0  0  2
2                   1    1  1   1   1   1     0   1  1  1
1                   1    1  1   1   1   1     0   0  1  2
1                   1    1  1   1   1   0     0   0  0  4
0    0  0   0   0   1     4   8  8 21
```

### Datos duplicados

Para el tratamiento de datos duplicados, se cuenta con la función **duplicated.**

```r
> duplicated(contaminacion)
[1] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE
[14] FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE FALSE  TRUE
[27] FALSE FALSE FALSE FALSE FALSE FALSE FALSE
```

Con los datos de contaminación, ¿cómo obtienes las observaciones duplicadas?

```r
> contaminacion[duplicated(contaminacion),]
Numero_de_empresas PM10 PM2.5   SO2   CO  NOX  COV NH3  CN
26                214 5063  3083 54592 2510 4845 3419 912 812
```

## Técnicas para la limpieza de datos

- Se conoce como ***data imputation*** al proceso de reemplazar los datos incompletos o valores faltantes.
- Para ello existen distintas técnicas, entre las que se encuentran:
    - Promedio
    - Moda
    - Vecinos cercanos

### Promedio

- Es posible utilizar el promedio de los valores de una columna para sustituir los valores faltantes.
- Para esto, se utiliza la función **mean.**
- NOTA: la suma de valores NA, da como resultado NA. **mean** utiliza la suma de valores, por lo que hay que indicar que deben **ignorarse los valores faltantes** con **na.rm=TRUE**.

```r
> sum(contaminacion$CN)
[1] NA
> sum(contaminacion$CN, na.rm = TRUE)
[1] 14943
```

Usando la función mean se llenen todos los datos faltantes de la columna CN

```r
> promedio <- mean(contaminacion$CN)
> promedio
[1] NA
> promedio <- mean(contaminacion$CN, na.rm = TRUE)
> promedio
[1] 597.72
> contaminacion$CN_p <- ifelse(is.na(contaminacion$CN),promedio,contaminacion$CN)
> contaminacion$CN_p <- ifelse(is.na(contaminacion$CN),mean(contaminacion$CN,na.rm = TRUE),contaminacion$CN)
> contaminacion
Numero_de_empresas  PM10 PM2.5    SO2     CO    NOX   COV  NH3   CN    CN_p
1                   0   945   629   1814    235    843  1836   14    5    5.00
2                 588  1978  1842   5588   6850     NA 11692  254   NA  597.72
3                  27  1028   752  22890    505     NA   516  115   58   58.00
4                  39  4527  3847 574973   8698  34132  3465  382  356  356.00
5                 214  5063  3083  54592   2510   4845  3419  912  812  812.00
6                  34  3360    NA  33287   9505  11015  4741  264  137  137.00
7                  42 19963 16177 190970  24171 158743  6202 1220   NA  597.72
8                 367  8207  4958 166476   1767  20578  1296  449  508  508.00
9                1569  1381   826    699    766   2217 21967   50   23   23.00
10                 80  2971    NA  27144   2930   6645  3156  157  166  166.00
11                233  3810  2770  48462  74299   9249 10155 1137  171  171.00
12                  8  8215  7725 104172   2327  11206   708   88  451  451.00
13                129 12532  8977 216611 115085  31484  7567  322  370  370.00
14                692  8768  5399  23897   3216   6323 15623 1983 1172 1172.00
15               1232  5103  3627   6763   6244  15159 48140  233  187  187.00
16                151  5095  3460  13717   2856   4303  5379 1957  379  379.00
17                 65  3133    NA  10141   1325     NA  2885  484  450  450.00
18                  8  2913  1650    286    472     NA  1427  536   NA  597.72
19                480  9752  7074  35548  85330     NA 13498  511  337  337.00
20                 20  9218  5838 111005 104373     NA  7383 3376  838  838.00
21                252  4556  2673   4558   2576   6335  3685   54  552  552.00
22                184  1510  1153   4444   2379   6916  5930   92   NA  597.72
23                 11  2076  1199    566    349    512   866  387  348  348.00
24                132 14733  9472  86202   5083     NA  6327 1840   NA  597.72
25                 62  7203  4623 106277   1209  10896  3119  763   NA  597.72
26                214  5063  3083  54592   2510   4845  3419  912  812  812.00
27                179  7986  5116  75004   3732  13328  4093  327  259  259.00
28                104  3612  2501  14118   6911  21139  6280  607  496  496.00
29                222  7572  6162  50158  69356  30307 30732 2071  324  324.00
30                 94   307   211   1456    244    822  1216   10   NA  597.72
31                197 41938 25779 160835  81529  45656 26427 7877 5608 5608.00
32                 51  2108  1769  19008   2973  10184  3834  198  124  124.00
33                 12    40    NA     NA      2     NA   193    0   NA  597.72
```

## Moda

- Para valores faltantes de una variable categórica, es necesario utilizar la moda para colocar el valor más repetido de la columna.
- Para esto, se utiliza la función **mfv** de la librería **modeest.**
- NOTA: aplica los mismo que para el promedio con **na.rm=TRUE**.

```r
> install.packages("modeest")
> library(modeest)
> b <- data.frame(v1 = c ("a","b","c","d"), v2 = c("hola","hola",NA,"adios"))
> b$v2_moda <- ifelse(is.na(b$v2),mfv(b$v2,na_rm = TRUE),b$v2)
> b
v1    v2 v2_moda
1  a  hola    hola
2  b  hola    hola
3  c  <NA>    hola
4  d adios   adios
```

## Vecinos Cercanos

- K- Nearest Neighbors (KNN)
- Método de clasificación supervisado que calcula la distancia entre el elemento a clasificar y el resto de los elementos en el dataset de entrenamiento.

### Función knnImputation de la libreria DMwR.

```r
> install.packages("DMwR2")
> library(DMwR2)
> knncontaminacion <- knnImputation(contaminacion)
> knncontaminacion
Numero_de_empresas  PM10     PM2.5       SO2     CO        NOX   COV  NH3        CN    CN_p
1                   0   945   629.000   1814.00    235    843.000  1836   14    5.0000    5.00
2                 588  1978  1842.000   5588.00   6850   7738.117 11692  254  529.7206  597.72
3                  27  1028   752.000  22890.00    505   6686.862   516  115   58.0000   58.00
4                  39  4527  3847.000 574973.00   8698  34132.000  3465  382  356.0000  356.00
5                 214  5063  3083.000  54592.00   2510   4845.000  3419  912  812.0000  812.00
6                  34  3360  2838.564  33287.00   9505  11015.000  4741  264  137.0000  137.00
7                  42 19963 16177.000 190970.00  24171 158743.000  6202 1220  506.5921  597.72
8                 367  8207  4958.000 166476.00   1767  20578.000  1296  449  508.0000  508.00
9                1569  1381   826.000    699.00    766   2217.000 21967   50   23.0000   23.00
10                 80  2971  2735.998  27144.00   2930   6645.000  3156  157  166.0000  166.00
11                233  3810  2770.000  48462.00  74299   9249.000 10155 1137  171.0000  171.00
12                  8  8215  7725.000 104172.00   2327  11206.000   708   88  451.0000  451.00
13                129 12532  8977.000 216611.00 115085  31484.000  7567  322  370.0000  370.00
14                692  8768  5399.000  23897.00   3216   6323.000 15623 1983 1172.0000 1172.00
15               1232  5103  3627.000   6763.00   6244  15159.000 48140  233  187.0000  187.00
16                151  5095  3460.000  13717.00   2856   4303.000  5379 1957  379.0000  379.00
17                 65  3133  2780.965  10141.00   1325   7949.331  2885  484  450.0000  450.00
18                  8  2913  1650.000    286.00    472   7335.993  1427  536  409.5039  597.72
19                480  9752  7074.000  35548.00  85330  15861.000 13498  511  337.0000  337.00
20                 20  9218  5838.000 111005.00 104373  17175.226  7383 3376  838.0000  838.00
21                252  4556  2673.000   4558.00   2576   6335.000  3685   54  552.0000  552.00
22                184  1510  1153.000   4444.00   2379   6916.000  5930   92  424.3762  597.72
23                 11  2076  1199.000    566.00    349    512.000   866  387  348.0000  348.00
24                132 14733  9472.000  86202.00   5083  10411.169  6327 1840  544.3552  597.72
25                 62  7203  4623.000 106277.00   1209  10896.000  3119  763  493.5189  597.72
26                214  5063  3083.000  54592.00   2510   4845.000  3419  912  812.0000  812.00
27                179  7986  5116.000  75004.00   3732  13328.000  4093  327  259.0000  259.00
28                104  3612  2501.000  14118.00   6911  21139.000  6280  607  496.0000  496.00
29                222  7572  6162.000  50158.00  69356  30307.000 30732 2071  324.0000  324.00
30                 94   307   211.000   1456.00    244    822.000  1216   10  386.8019  597.72
31                197 41938 25779.000 160835.00  81529  45656.000 26427 7877 5608.0000 5608.00
32                 51  2108  1769.000  19008.00   2973  10184.000  3834  198  124.0000  124.00
33                 12    40  2841.470  89050.55      2  10313.290   193    0  386.3871  597.72
```

## Valores atípicos

Observación que es numéricamente distante del resto de los datos.

Grafica los valores del archivo **rivers.csv** con la función **plot** e identifica los valores atípicos que se muestran en la gráfica.

```r
> r <- read.csv('rivers.csv',sep = ',')
> rivers <- c(r$V1)
> plot(rivers)
```

## Gráficas de caja

- Las gráficas de caja permiten visualizar valores atípicos de forma sencilla.
- Todos los valores fuera de la barra son atípicos
- Función **boxplot.**

## Actividad

- Grafica los valores del archivo rivers.csv con la función boxplot.
- Vuelve a realizar la grafica con el argumento horizontal = TRUE.

```r
> boxplot(rivers)
> boxplot(rivers,horizontal = TRUE)
```

### Boxplots.stats

La función **boxplots.stats** da accesos a las estadísticas de la gráfica de caja.

- Valores de las líneas límite
- Cantidad de valores
- Intervalo de confianza
- Outliers

```r
> boxplot.stats(r$V1)
$stats
[1]  135.0  301.0  408.5  605.0 1054.0

$n
[1] 130

$conf
[1] 366.3731 450.6269

$out
[1] 1171 1100 1205
```

¿Como eliminar los outliers?

```r
> minimo1 <- min(boxplot.stats(rivers)$out)
> rivers1 <- rivers[rivers<minimo1]
> boxplot(rivers1)
```

```r
> minimo1 <- min(boxplot.stats(rivers)$out)
> rivers1 <- rivers[rivers<minimo1]

> minimo2 <- min(boxplot.stats(rivers1)$out)
> rivers2 <- rivers1[rivers1<minimo2]

> minimo3 <- min(boxplot.stats(rivers2)$out)
> rivers3 <- rivers2[rivers2<minimo3]
> boxplot(rivers3)
```

## Actividad

Crea un script en R que permita eliminar los outliers del arreglo rivers de manera automática.

Prueba el script con alguna columna de maraton o contaminación, para verificar que funciona correctamente.

## Transformación de los datos

Técnicas de transformación de los datos:

- Generalización: Agrupar valores en distintas categorías.
- Reescalamiento: Ajustar los valores medidos en una escala [0,1] para reducir la complejidad del analisis. Una columna.
- Normalización: Ajustar los valores medidos en diferentes escalas a una escala común. Dos o más columnas.
- Smoothing: Remueve datos que generan ruido en un dataset. Ignora los outliers o valores atípicos.

### Generalización

- Agrupar valores en distintas categorías.
- Función **cut**, realiza agrupaciones de acuerdo a intervalos establecidos.

```r
> maraton$nivel <- cut(maraton$time,breaks = 3,labels = c("alto","medio","bajo"))
> View(maraton)
```

### Reescalamiento

- Ajusta los valores medidos en un escala [0,1] con la finalidad de reducir la complejidad del análisis.
- Se utiliza la fórmula:
- Función **rescale** de la librería **scales.**

```r
> install.packages("scales")
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/652e2f88-492d-459d-be4a-4004be46028c/Untitled.png)

### Normalización

- Los valores medidos en diferentes escalas se ajustan a una escala en común.
- Se utiliza la fórmula:
- Función scale
- Algoritmos como SVM, k-means y KNN se ven afectados por la diferencia en escala de años de experiencia y salario.