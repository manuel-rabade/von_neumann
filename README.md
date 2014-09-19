Microprocesador Von Neumann en VHDL
===================================

Proyecto final de mi curso **Arquitectura de Computadoras** en la
[Facultad de Ingeniería](http://ingenieria.unam.mx) de la [Universidad
Nacional Autónoma de México](http://unam.mx).

El objetivo de este proyecto es implementar un microprocesador de tipo
Von Neumann en lenguaje VDHL dentro del entorno [MAX+PLUS
II](http://www.altera.com/support/software/sof-maxplus2.html) para
validar el diseño en el FPGA de una tarjeta de desarrollo
[Altera](http://www.altera.com/).

Instrucciónes implementadas
---------------------------

### LDA #opr

Opcode: 10

Tamaño: 2 bytes

Carga el valor inmediato a la instrucción en el registro A.

### SUMA #opr

Opcode: 20

Tamaño: 2 bytes

Suma el valor inmediato a la instrucción al valor en el registro A.

### SHA

Opcode: 40

Tamaño: 1 byte

Corrimiento a la derecha del valor en el registro A.

### BNZ addr

Opcode: 30

Tamaño: 2 bytes

Ramifica a la dirección de memoría inmediata a la instrucción en caso
de que el valor en el registro A sea diferente a cero.

Programa de prueba
------------------

```
          LDA #226
ciclo-1	: SUMA #5
          BNZ ciclo-1
          LDA #10
ciclo-2	: SHA
          BNZ ciclo-2
```

Y su codificación en la memoria de programa:

Dirección | Valor | Ensamblador
--------- | ----- | -----------
0 | 10 | LDA
1 | E2 | #226
2 | 20 | SUMA
3 | 5 | #5
4 | 30 | BNZ
5 | 2 | 2
6 | 10 | LDA
7 | A | 10
8 | 40 | SHA
9 | 30 | BNZ
A | 8 | 8

Capturas de pantalla
--------------------

### Arquitectura

![Arquitectura](img/arch.png "Arquitectura")

### Unidad de control

![Unidad de control](img/cu.png "Unidad de control")

### Ruta de datos

![Ruta de datos](img/datapath.png "Ruta de datos")

### Microprogramación

![Microprogramación](img/rom.png "Microprogramación")

### Memoria de programa

![Memoria de programa](img/mem.png "Memoria de programa")

### Simulación

![Simulación](img/sim.png "Simulación")

Autor
-----

Manuel Rábade <[manuel@rabade.net](mailto:manuel@rabade.net)>

Licencia
--------

Este obra está bajo una [Licencia Pública General de GNU](LICENSE.txt).
