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
    puts "What is the student\'s nationality?"
    nationality = gets.chomp
    puts "What is the student\'s age?"
    age = gets.chomp
    puts "What is the student\'s height?"
    height = gets.chomp
    
    #add the students hash to the array
    students << {name: name, cohort: :november, nationality: nationality, 
    age: age, height: height}
    puts "Now we have #{students.count} students"
    #get another name from the user
    puts"Please enter another name, or press enter to skip"
    name = gets.chomp
  end
  #return the array of students
  students
end

def print_students(students)
  students.select {|student| student[:name].length <= 12}
end

def print_header
  puts "The students of Villains Academy"
  puts "--------------------------------"
end

def print(students)
  tally = 0
  while tally < students.count
    puts "#{tally + 1}. #{students[tally][:name]}".center(32, "-")
    puts "-nationality: #{students[tally][:nationality]}".center(37) 
    puts "-age: #{students[tally][:age]}".center(37)
    puts "-height: #{students[tally][:height]}".center(37)
    puts "-cohort: #{students[tally][:cohort]}".center(37)
    tally += 1
  end
end

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end  
# nothing happens unless we call the methods
students = input_students
length = print_students(students)
print_header
print(length)
print_footer(students)
