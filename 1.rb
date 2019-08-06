class Table
  attr_reader :tablename, :collection #Recolecta el nombre de la mesa y las collecciones, datos de cada mesa

  def initialize(tablename, *collection) #construtor recibe el nombre de la mesa y las collecciones

    @tablename = tablename #La variable de instancia guarda el valor de :name
    @collection = collection.map(&:to_i) #La variable de instancia guarda el mapeo de :collection y se transforma a entero

  end

  def numero_maximo #Definimos método max_num
    @collection.max #este método selecciona el numero màximo de :collectio
  end

  def promedio #Definomos método promedio
    @collection.sum / @collection.count.to_f #Promediamos @collection sumando todo y dividiendo por la cantidad de @collection
  end

end

file = File.open('casino.txt', 'r') #Leemos el archivo
data = file.readlines #Creamos variable data y en ella guardamos las lineas leidas del archivo
file.close

table_list = [] #Generamos un array vacio para almacenar

data.each do |lines| #Recorremos variable data

  line = lines.split(', ') #variable line guarda el resultado del lines.split
  table_list << Table.new(*line) #Empujamos a table list la instancia generada todo lo que está en line

end

table_list.each_with_index do |t, i| #Recorremos el array table_list
  puts "#{t.tablename} recaudó #{t.numero_maximo} el dia #{i+1}" #Ponemos
end

promedios = table_list.map(&:promedio) #Reemplaza lo que trae table_list por el resultado del metodo promedio
puts "Promedio_total #{promedios.sum / promedios.count.to_f}" #Ponemos la suma de promedios dividido por la cantidad


# En este ejercicio estamos creando:
# Clase
# 1 - Clase table
# 2 - Dentro generamos el constructor los datos de un archivo externo
# 3 - Esta definodo el metodo numero_maximo el cual nos muestra el número mayor de la variable de instancia collection



#¿Que es lo que hace split?
#Te separa la linea leida dependiendo de cierta condición

# ¿Que es lo que hace el each_with_index?
# Es para saber en que vuelta vamos empezando desde el indice 0
