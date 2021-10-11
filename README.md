
# Circuitos Lógicos Programables: Generador de Señales Senoidales (VHDL)
## Descripción
El programa implementado en VHDL tiene por objeto generar señales senoidales de distintas frecuencias. 
El mismo cuenta con dos entradas que permiten al usuario incrementar/decrementar la frecuencia de salida, pensadas para ser utilizadas con botones físicos. La señal de salida, por su parte, está pensada para ser mapeada a un conversor digital a analógico de 8 bits. Se puede observar a continuación un esquema de alto nivel del sistema.

![Description](./doc/images/BlockDiagram.svg)

Puede observarse que hay en el diagrama dos componentes que no intervienen directamente en el funcionamiento del programa/sistema: el bloque _ILA_ y el bloque _VIO_. Su presencia se debe a que el desarrollo del proyecto fue llevado a cabo sin la disponibilidad del hardware involucrado de froma física, sino mediante un servidor remoto. Esto no permite utilizar botones, o analizar la señal de salida con un osciloscopio y/o un analizador de señales físico, por lo cual, se ha utilizado (1) un bloque de VIO para emular los botones y (2) el ILA propio del hardware que hace las veces de analizador lógico y permite inspeccionar las señales de salida. 

Esto se ve clara_mente en el esquemático de más alto nivel generado por _Vivado_ presentado a continuación.

![Esquemático](./doc/images/SchematicHighLevel.png)

## Bloque principal
La arquitectura del bloque principal generador de señales es la siguiente

![GeneradorSenoidales](./doc/images/SchematicDetailed.png)

Consiste de tres sub-bloques:
- ```buttons_counter```: un contador up/down con staturación que cuenta hacia arriba al recibir un flanco ascendente en _up_ y hacia abajo en _down_. Se utiliza para controlar el _offset_ con el que avanza *counter*.
- ```counter```: un contador módulo N que se utiliza para recorrer la memoria que contine las muestras de la senoidal. Se incrementa de a _1 + offset_, permitiendo recorrer la tabla de senoidales a mayor velocidad (salteando muestras) obteniendo así señales de salida d emayor frecuencia.
- ```sine```: una tabla de valores (ROM) que retorna las muestras de la senoidal.

## Características de Señal de Salida
Para este trabajo se ha elegido que la señal de salida cuente con 256 niveles (8 bits) y tenga 1024 muestras. 

- La cantidad de niveles fue elegida para que la señal sea apta para ser usada a la entrada de un DAC de 8 bits en forma directa. 
- La cantidad de muestras fue elegida en base a que es la cantidad máxima de muestras que puede tomar el _ILA_. De esta forma resulta sencillo evaluar el correcto funcionamiento del programa ya que se observa exactamente un ciclo completo de senoidal al analizar la señal de salida con el analizador lógico integrado.


Se muestra a continuación una captura del ILA en Vivado utilizando el hardware remoto.

![Capturavivado](./doc/images/Sine.png)

## Senoidales Generadas
Finalmente se muestran 4 senoidales de distintas frecuencias generadas por el programa. En ``x6`` ya se puede apreciar la degradación de la señal, producto del _salteo de muestras_.

![Capturepython](./doc/images/Sinewaves.png)





