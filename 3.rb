class Roulette
    # inicializo la ruleta solo pasandole el numero al que "apuesto"
    def initialize(numberPlayer)
        @playerNumber = numberPlayer.to_i
    end

    def play
        # se obtiene el resultado de la ruleta
        r = (1..10).to_a
        @random = r.sample

        # se compara con el numero elegido por el usuarios
        if @playerNumber == @random
         puts "GANASTE!!! Tu numero #{@random} es el ganador"
        else
         puts "El numero ganador es #{@random} tu apuesta fue #{@playerNumber}"
        end
    end

    def historyNumber
        # se almace cada jugada
        File.open('roulette_history.txt', 'a'){|file| file.puts @random}

        # se almacenan las "ganadas"
        if @playerNumber == @random
            File.open('winners.txt', 'a'){|file| file.puts @random}
        end
    end

    def repeatNumber
        file = File.open('roulette_history.txt', 'r')
        data = file.readlines.map(&:to_i)
        file.close

        freq = data.inject(Hash.new(0)) { |h,v| h[v] += 1; h }
        puts data.max_by { |v| freq[v] }

    end
end


azar = Roulette.new(2)
puts azar.play
puts azar.historyNumber
print azar.repeatNumber
