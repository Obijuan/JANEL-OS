# JANEL-OS
Mini-kernel for multiplexing between 2 tasks on the Raspberry Pi pico 2's Risc-V (In spanish)

Mini-kernel para la multiplexación de 2 tareas en el Risc-V de la Raspberry Pi pico2

# Puesta en marcha

Este proyecto está pensado para usarse desde VSCODE en Linux (aunque también se puede usar la línea de comandos)

1. Instala la extensión [Raspberry Pi Pico](https://marketplace.visualstudio.com/items?itemName=raspberry-pi.raspberry-pi-pico)  
  -Con esta extensión se nos intala la toolchain para Risc-V (Gcc) así como las picotools para crear los fichero .uf2 (que son los que se cargan en la pico2 en modo "pen drive")

2. Compilar. Desde el VSCODE pulsar las teclas Ctrl-Shift+B (o ejecutar la tarea Build). 
  -También puedes compilar desde la línea de comandos ejecutando el script **build.sh**

3. Para cargar el ejecutable en la pico2 se pueden utilizar estos métodos:
  - Si se tiene el depurador de raspberry:
    - Lanzar la tarea PROGRAM (Lo más fácil es asign arle un shortcut desde VSCODE)
    - También es posible ejecutar el script **exec.sh**
  - Si no se tiene el depurador:
    - Poner la placa en modo BOOT (pulsando Bootsel, conectando al USB, y soltando el botón)
    - Copiar el fichero main.uf2 al dispositivo USB
    - o ejecutar el script "run.sh"

4. Si se queire depurar, entrar en el depurador de VSCode y ejecutar "DEBUG PICO2"

5. Para tener acceso a la consola y poder comunicarse con las tareas hay que abrir un **terminal serie** a la velodiad de 115200 baudios. Si tienes instalado **tio** basta con ejecutar el script **serial.sh**

La tarea 1 hará que el LED de la pico2 se ponga a parpadear  
La tarea 2 cambia el estado del LED GPIO2 cada vez que se recibe un carácter

En la consola aparecerá mensajes como estos:

```
--> TAREA 1: INIT
--> TAREA 2: INIT
--> TAREA 2
--> TAREA 2
--> TAREA 2
--> TAREA 2
```

Las tareas están definidas en el archivo **main.s**

