require_relative 'gameboard.rb'
require_relative 'colorcode.rb'
require_relative 'hint.rb'
require_relative 'computer.rb'


class Mastermind
	attr_accessor :gameboard, :win, :turns, :color_spectrum, :player_mode, :computer

	def initialize
		@gameboard = GameBoard.new()
		@win = false
		@turns = 1
		@color_spectrum = ["red", "green", "yellow", "blue", "black", "magenta", "cyan", "white"]
		@player_mode = true
		@computer = Computer.new()
	end

	def play
		instructions
		prompt_switch_mode
		set_solution if @player_mode == false
		start
	end

	def instructions
		puts "_________________________________________________________\n\n"
		puts "Adivina el codigo para ganar!"
		puts "La computadora va a seleccionar un codigo de 4 colores con un especifico orden!"
		puts "Tienes 12 intentos."
		@gameboard.display
		puts "_________________________________________________________\n\n"
		puts "En el lado izquierdo están tus adivinaciónes."
		puts "En el lado derecho te dirá que tan cerca de acertas estás: "
		puts "El verde es que tienes un color en la posición correcta"
		puts "El rojo es por cada color que esté en la posición incorrecta" 
		puts "\nBuena suerte!"
		puts "_________________________________________________________\n\n"
	end

	def prompt_switch_mode
		puts "Quieres jugar o prefieres que la computadora juegue?"
		print "Di \"computadora\" o \"yo\".\n> "
		mode = gets.chomp
		until mode == "computadora" || mode == "yo"
			print "\nNo te he entendido bien. Di \"computadora\" o \"yo.\"\n> "
			mode = gets.chomp
		end
		puts ""
		@player_mode = false if mode == "computadora"
	end

	def set_solution
		puts "Cual te gustaría que fuera tu solución?"
		puts "\nEscribe 4 colores separados por un espacio."
		print "Tus opciones son: red, green, yellow, blue, black, magenta, cyan, and white.\n> "
		solution = get_player_guess
		@gameboard.solution = ColorCode.new(solution[0], solution[1], solution[2], solution[3])
	end

	def start
		make_guesses
		turns > 12 ? lose : win
	end

	def make_guesses
		while @win == false && @turns < 13
			prompt_guess
			guess = @player_mode ? get_player_guess : get_computer_guess
			add_guess(guess)
			@win = true if gameboard.guesses[12 - @turns].colors == gameboard.solution.colors
			@turns += 1 if @win == false
		end
	end

	def prompt_guess
		puts @player_mode ? "Cual es tu ##{@turns} suposición?" : "\nComputadora, haz tu ##{@turns} supoción."
		puts "Escribe 4 colores separados por espacios."
		print "Tus opciones son: red, green, yellow, blue, black, magenta, cyan, and white.\n> "
	end

	def get_player_guess
		1.times do
			guess = gets.chomp.downcase.split(" ")

			if guess.length != 4
				print "\nEscribiste mal la cantidad de colores! Prueba de nuevo:\n> "
				redo
			end

			if !@color_spectrum.include?(guess[0]) || !@color_spectrum.include?(guess[1]) || !@color_spectrum.include?(guess[2]) || !@color_spectrum.include?(guess[3])
				print "\nSolo puedes escribir los colores especificados! Prueba de nuevo:\n> "
				redo
			end

			if @player_mode == false
				if guess.uniq.length !=4
					print "\nDebes tener diferentes colores para la solucion. Prueba de nuevo:\n> "
					redo
				end
			end

			return guess
		end
	end


	def get_computer_guess
		@computer.guess(@gameboard.hints, @turns)
	end

	def add_guess(guess)
		gameboard.guesses[12 - @turns] = ColorCode.new(guess[0], guess[1], guess[2], guess[3])
		gameboard.refresh(12 - @turns)
	end

	def lose
		puts @player_mode ? "Haz fallado en adivinar el codigo, are u stupid?." : "He fallado...."
		puts "La solucion era #{@gameboard.solution.colors}."
	end

	def win
		puts @player_mode ? "\nHaz resuelto el codigo, eres un crack" : "\nHe adivinado tu codigo... está demasiado fácil"
	end
end

game = Mastermind.new()
game.play