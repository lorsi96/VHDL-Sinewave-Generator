
# Circuitos Lógicos Programables: Generador de Señales Senoidales (VHDL)
## Descripción
El programa implementado en VHDL tiene por objeto generar señales senoidales de distintas frecuencias. 
El mismo cuenta con dos entradas que permiten al usuario incrementar/decrementar la frecuencia de salida, ideadas para ser utilizadas con botones físicos, y una única señal de salida, compatible con la entrada de un conversor digital-analógico de 8 bits. Se puede observar a continuación un esquema de alto nivel del sistema.

![Description](./doc/images/BlockDiagram.svg)

Puede observarse en el diagrama que hay dos componentes que no intervienen directamente en el funcionamiento del programa/sistema: el bloque _ILA_ y el bloque _VIO_. Su presencia se debe a que el desarrollo del proyecto fue llevado a cabo sin la disponibilidad del hardware en forma física (se accedió mediante un servidor remoto). Esto no permite utilizar botones, o analizar la señal de salida con un osciloscopio y/o un analizador de señales ordinario, por lo cual, se ha utilizado (1) un bloque de VIO para emular los botones y (2) un ILA propio del hardware que hace las veces de analizador lógico y permite inspeccionar las señales de salida. 

Esto se ve claramente en el esquemático de más alto nivel generado por _Vivado_, presentado a continuación.

![Esquemático](./doc/images/SchematicHighLevel.png)

## Bloque principal
La arquitectura del bloque principal generador de señales es la siguiente

![GeneradorSenoidales](./doc/images/SchematicDetailed.png)

El bloque principal se descompone en tres sub-bloques:
- ```buttons_counter```: un contador up/down con staturación que cuenta hacia arriba al recibir un flanco ascendente en _up_ y hacia abajo en _down_. Se utiliza para controlar el _offset_ con el que avanza *counter*.
- ```counter```: un contador módulo N que se utiliza para recorrer la memoria que contine las muestras de la senoidal. Se incrementa de a _1 + offset_, permitiendo recorrer la tabla de senoidales a mayor velocidad (salteando muestras) obteniendo así señales de salida d e mayor frecuencia.
- ```sine```: una tabla de valores (implementada en forma de ROM) que retorna las muestras de la senoidal.

## Características de Señal de Salida
Para este trabajo se ha elegido que la señal de salida cuente con 256 niveles (8 bits) y tenga 1024 muestras. 

- La cantidad de niveles fue elegida para ser compatible con un DAC de 8 bits. 
- La cantidad de muestras fue elegida en base a la cantidad máxima de muestras que puede tomar el _ILA_. De esta forma resulta sencillo evaluar el correcto funcionamiento del programa ya que, al analizar la señal de salida con el analizador lógico integrado, se visualizan multiplos enteros de cíclos de senoidal. 

Se muestra a continuación una captura del ILA en Vivado utilizando el hardware remoto.

![Capturavivado](./doc/images/Sine.png)

## Senoidales Generadas
Se muestran 4 senoidales de distintas frecuencias generadas por el programa, capturadas por el ILA. En ``x6`` ya se puede apreciar la degradación de la señal, producto del _salteo de muestras_.

![Capturepython](./doc/images/Sinewaves.png)

## Simulaciones Relevantes
A continuación se detallan las pruebas, junto a las simulaciones correspondientes, de los bloques más relevantes del sistema.

### Bloque Principal: Sin Gen
Prueba de generación de una señal senoidal con el bloque principal. En esta prueba se utilizaron las señales de control ("botones") para verificar el cambio de frecuencia en la señal de salida, así cómo también que las muestras eran las esperadas.
![SimGen](./doc/images/SinGen.png)

### Contador Módulo N
Prueba en FPGA del módulo contador N utilizado para regular la velocidad de lectura de la tabla de senoidales. En esta prueba se utilizó en modo _Módulo 8_, si bien para la aplicación final se ha utilizado en _Módulo 10_. 
![MainCounterIla](./doc/images/MainCounterILA.png)

### Botones + Contador de control de frecuencia
Prueba del contador up/down con saturación, utilizando las señales de botones para corroborar su funcionamiento (incremento, decremento y saturación).
![CountButton](./doc/images/ButtonCountSim.png)

## Tabla de uso de recursos
![Utilización](./doc/images/Utilización.png)


```
+----------------------------+------+-------+-----------+-------+
|          Site Type         | Used | Fixed | Available | Util% |
+----------------------------+------+-------+-----------+-------+
| Slice LUTs                 | 1367 |     0 |     17600 |  7.77 |
|   LUT as Logic             | 1270 |     0 |     17600 |  7.22 |
|   LUT as Memory            |   97 |     0 |      6000 |  1.62 |
|     LUT as Distributed RAM |   24 |     0 |           |       |
|     LUT as Shift Register  |   73 |     0 |           |       |
| Slice Registers            | 2149 |     0 |     35200 |  6.11 |
|   Register as Flip Flop    | 2149 |     0 |     35200 |  6.11 |
|   Register as Latch        |    0 |     0 |     35200 |  0.00 |
| F7 Muxes                   |   47 |     0 |      8800 |  0.53 |
| F8 Muxes                   |   19 |     0 |      4400 |  0.43 |
+----------------------------+------+-------+-----------+-------+
```
