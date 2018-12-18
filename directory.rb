# let's puts students into an array

def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.chomp
  #while name is not empty, repeat this line
  while !name.empty? do
    #add the students hash to the array
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    #get another name from the user
    name = gets.chomp
  end
  #return the array of students
  students
end

def specific_letter
  puts "Please enter student's first initial"
  initial = gets.chomp
  initial
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_students(students, initial)
  students.select {|student| student[:name].chars.first == initial.upcase}
end

def print(students)
  students.each_with_index do |student, index|
    puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end  
# nothing happens unless we call the methods
students = input_students
initial = specific_letter
initial_students = print_students(students, initial)
print_header
print(initial_students)
print_footer(students)
