require "date"

class Course
  attr_reader :nombre, :f_inicio, :f_termino

  def initialize(nombre, f_inicio, f_termino)
    @nombre = nombre
    @f_inicio = Date.parse(f_inicio)
    @f_termino = Date.parse(f_termino)
  end

  def curso_antes(fecha)

    puts "El curso #{@nombre} inicia el #{@f_inicio}" if @f_inicio < fecha

  end

  def curso_despues(fecha)
    puts "El curso #{@nombre} Finaliza el #{@f_termino}" if @f_termino > fecha
  end


end

courses = []

file = File.open('cursos.txt', 'r') #Leemos el archivo
data = file.readlines #Creamos variable data y en ella guardamos las lineas leidas del archivo
file.close #cerramos

data.each do |lines|

  nombre, f_inicio, f_termino = lines.split(', ') #en ves de asignar una a una, volcamos en cada una de las opciones
  courses << Course.new(nombre, f_inicio, f_termino) #En el array courses almacenamos las instancias

end

courses.each do |course| #Recorremos el Array Courses todos los cursos anteriores
  course.curso_antes(Date.today)
  course.curso_despues(Date.today)
end
