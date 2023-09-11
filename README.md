CLASS MASTERMIND

La clase Mastermind es un juego de adivinanzas de código. El objetivo del juego es adivinar un código de cuatro colores en un orden específico. El jugador tiene 12 intentos para adivinar el código.

Los colores disponibles son rojo, verde, amarillo, azul, negro, magenta, cian y blanco.

La clase Mastermind tiene los siguientes atributos:

gameboard: Un objeto de la clase GameBoard que representa el tablero de juego.
win: Un booleano que indica si el jugador ha adivinado el código.
turns: Un contador que indica el número de intentos que el jugador ha realizado.
color_spectrum: Un arreglo de los colores disponibles.
player_mode: Un booleano que indica si el jugador está jugando o la computadora está jugando.
computer: Un objeto de la clase Computer que representa la computadora.
Los siguientes son los métodos de la clase Mastermind:

initialize: El constructor de la clase.
play: El método principal que ejecuta el juego.
instructions: Muestra las instrucciones del juego.
prompt_switch_mode: Pide al jugador que elija si quiere jugar o que la computadora juegue.
set_solution: Permite al jugador establecer la solución del código.
start: Inicia el juego.
make_guesses: Realiza las adivinanzas del jugador.
prompt_guess: Pide al jugador que haga una adivinanza.
get_player_guess: Obtiene una adivinanza del jugador.
get_computer_guess: Obtiene una adivinanza de la computadora.
add_guess: Agrega una adivinanza al tablero de juego.
lose: Muestra una notificación de pérdida.
win: Muestra una notificación de victoria.
Aquí hay un ejemplo de cómo se puede usar la clase Mastermind:

Ruby
game = Mastermind.new()
game.play()

Este código iniciará el juego de Mastermind y le dará al jugador 12 intentos para adivinar el código.

El siguiente es un ejemplo de cómo se puede usar el método prompt_switch_mode() para que la computadora juegue:

Ruby
game = Mastermind.new()
game.prompt_switch_mode()
game.play()
Utiliza el código con precaución. Más información
Este código iniciará el juego de Mastermind y hará que la computadora juegue.

CLASS COLORCODE

La clase ColorCode representa un código de colores en el juego Mastermind. Un código de colores es una secuencia de cuatro colores.

La clase tiene los siguientes atributos:

colors: Un arreglo de los colores en el código de colores.
selected_colors: Un arreglo de los colores que ya se han usado en el juego.
Los siguientes son los métodos de la clase ColorCode:

initialize: El constructor de la clase. Toma cuatro argumentos, que son los colores para el código de colores.
random: Un método que genera un código de colores aleatorio. Primero crea un arreglo de todos los colores disponibles. Luego, selecciona aleatoriamente cuatro colores del arreglo, asegurándose de que ningún color se seleccione más de una vez.
Aquí hay un ejemplo de cómo se puede usar la clase ColorCode:

Ruby
color_code = ColorCode.new("rojo", "verde", "amarillo", "azul")

Este código crea un código de colores con los colores rojo, verde, amarillo y azul.

El siguiente es un ejemplo de cómo se puede usar el método random():

Ruby
color_code = ColorCode.random()

Este código genera un código de colores aleatorio.

Aquí hay algunas explicaciones adicionales:

El atributo colors se inicializa con cuatro argumentos en el constructor. Estos argumentos son los colores para el código de colores.
El método random() primero crea un arreglo de todos los colores disponibles. Luego, usa el método sample() del arreglo para seleccionar aleatoriamente cuatro colores. El método sample() devuelve un elemento aleatorio del arreglo.
El método sample() se usa con el argumento !@selected_colors.include?(random) para asegurarse de que no se seleccione el mismo color más de una vez. Si el color ya se ha seleccionado, el método sample() seleccionará otro color.

CLASS HINT

La clase Hint representa una pista en el juego Mastermind. Una pista es una secuencia de cuatro colores que indica al jugador cuántos colores están en la posición correcta y cuántos colores están en el código pero en la posición incorrecta.

La clase tiene los siguientes atributos:

colors: Un arreglo de los colores en la pista.
Los siguientes son los métodos de la clase Hint:

initialize: El constructor de la clase. Toma cuatro argumentos, que son los colores para la pista.
Aquí hay un ejemplo de cómo se puede usar la clase Hint:

Ruby
hint = Hint.new("rojo", "verde", "amarillo", "azul")

Este código crea una pista con los colores rojo, verde, amarillo y azul.

La clase Hint no tiene métodos adicionales.

Espero que esta explicación sea útil. Hágame saber si tiene alguna otra pregunta.

Aquí hay algunas explicaciones adicionales:

El atributo colors se inicializa con cuatro argumentos en el constructor. Estos argumentos son los colores para la pista.
La clase Hint no tiene métodos adicionales porque solo se usa para representar una pista. No tiene que realizar ninguna acción.

CLASS COMPUTER

La clase Computer representa la computadora en el juego Mastermind. La computadora hace una suposición de cuatro colores en cada turno.

La clase tiene los siguientes atributos:

color_spectrum: Un arreglo de los colores disponibles.
guess_set: Un contador que indica el número de colores que la computadora ha seleccionado.
correct_colors: Un arreglo de los colores que la computadora ha adivinado correctamente.
Los siguientes son los métodos de la clase Computer:

initialize: El constructor de la clase. No toma ningún argumento.
guess: Un método que hace una suposición de cuatro colores. El método primero genera un número aleatorio entre 0 y 7. Luego, usa el número aleatorio para seleccionar cuatro colores del arreglo color_spectrum.
get_guess: Un método auxiliar que llama al método guess().
color_is_correct: Un método que indica si un color está en la posición correcta. El método toma dos argumentos: el arreglo de pistas y el número de turno. El método devuelve true si el color está en la posición correcta y false si no lo está.
Aquí hay un ejemplo de cómo se puede usar la clase Computer:

Ruby
computer = Computer.new()
computer.guess()
Utiliza el código con precaución. Más información
Este código hace que la computadora haga una suposición de cuatro colores.


Aquí hay algunas explicaciones adicionales:

El método guess() genera un número aleatorio entre 0 y 7. Esto se hace porque hay 8 colores disponibles.
El método get_guess() llama al método guess() y luego imprime la suposición de la computadora.
El método color_is_correct() toma dos argumentos: el arreglo de pistas y el número de turno. El método devuelve true si el color está en la posición correcta y false si no lo está. El método utiliza el número de turno para determinar qué pista debe usar.
La clase Computer es una clase simple que implementa un algoritmo simple para hacer una suposición de cuatro colores. El algoritmo puede mejorarse para hacer que la computadora sea más efectiva en adivinar el código.

CLASS GAMEBOARD

La clase GameBoard representa el tablero de juego en el juego Mastermind. El tablero de juego tiene 12 filas, cada una de las cuales representa una suposición del jugador. Cada fila tiene dos columnas: la primera columna es la suposición del jugador y la segunda columna es la pista que se da al jugador.

La clase tiene los siguientes atributos:

solution: El código secreto que el jugador debe adivinar.
guesses: Un arreglo de 12 objetos ColorCode que representan las suposiciones del jugador.
hints: Un arreglo de 12 objetos Hint que representan las pistas que se dan al jugador.
Los siguientes son los métodos de la clase GameBoard:

initialize: El constructor de la clase. Inicializa el tablero de juego con un código secreto aleatorio y 12 suposiciones y pistas vacías.
display: Imprime el tablero de juego en la consola.
refresh: Actualiza el tablero de juego con una nueva suposición y pista.
evaluate: Calcula la pista que se debe dar al jugador para una suposición dada.
colorize: Colorea una cadena de texto de acuerdo con el color especificado.
Aquí hay un ejemplo de cómo se puede usar la clase GameBoard:

Ruby
gameboard = GameBoard.new()
gameboard.display()
Utiliza el código con precaución. Más información
Este código inicializa el tablero de juego y lo imprime en la consola.


Aquí hay algunas explicaciones adicionales:

El método initialize() genera un código secreto aleatorio de cuatro colores.
El método display() imprime el tablero de juego en la consola. Cada fila del tablero de juego se imprime en una línea separada. La primera columna de cada fila es la suposición del jugador y la segunda columna es la pista que se da al jugador.
El método refresh() actualiza el tablero de juego con una nueva suposición y pista. El método toma un argumento que es el número de la fila que se debe actualizar.
El método evaluate() calcula la pista que se debe dar al jugador para una suposición dada. El método toma un argumento que es el número de la fila que se debe evaluar.
El método colorize() colorea una cadena de texto de acuerdo con el color especificado. El método toma dos argumentos: la cadena de texto que se debe colorear y el color que se debe usar.
La clase GameBoard es una clase simple que implementa las funciones básicas de un tablero de juego de Mastermind. La clase puede extenderse para agregar más funciones, como la capacidad de guardar y cargar juegos, o la capacidad de jugar contra un oponente en línea.
