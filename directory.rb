# let's puts students into an array

def input_students
  puts "Please enter the names of students"
  puts "To finish, just hit return twice"
  #create an empty array
  students = []
  #get the first name
  name = gets.rstrip
  #while name is not empty, repeat this line
  while !name.empty? do
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    if cohort == ""
      cohort = "Not assigned"
    else
      cohort = cohort.to_sym
    end
    puts "What is the student\'s nationality?"
    nationality = gets.chomp
    puts "What is the student\'s age?"
    age = gets.chomp
    puts "What is the student\'s height?"
    height = gets.chomp
    
    #add the students hash to the array
    students << {name: name, cohort: cohort, nationality: nationality, 
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

def group_cohort(students)
  groups = {}
  students.each do |student|
    cohort = student[:cohort].to_sym
    if groups[cohort] == nil
      groups[cohort] = []
    end
    groups[cohort].push(student)
  end
  groups
end

def print(students)
  students.each do |cohort, cohort_students|
    puts "#{cohort.capitalize} Cohort".center(32, "-")
    cohort_students.each_with_index do |identity , index|
      puts "#{index + 1}. #{identity[:name]}".center(32, "-")
      puts "-nationality: #{identity[:nationality]}".center(37) 
      puts "-age: #{identity[:age]}".center(37)
      puts "-height: #{identity[:height]}".center(37)
    end
  end
end

def print_footer(students)
  if students.count == 1
    puts "Overall, we have 1 great student"
  else
    puts "Overall, we have #{students.count} great students"
  end
end  

def interactive_menu
  students = []
  loop do
    #1. Print the menu and ask user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more options
    #2. Read the input and save it into a variable
    selection = gets.chomp
    #3. Do what the user has asked
    case selection
      when "1"
        students = input_students
      when "2"
        length = print_students(students)
        grouped_students = group_cohort(length)
        print_header
        print(grouped_students)
        print_footer(students)
      when "9"
        exit # This will cause the program to terminate
      else
        puts "I don't know what you mean, try again"
    end
  end
end

interactive_menu
  
# nothing happens unless we call the methods
#students = input_students
#length = print_students(students)
#grouped_students = group_cohort(length)
#print_header
#print(grouped_students)
#print_footer(students)
