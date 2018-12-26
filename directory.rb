@students = []

def input_students
  puts "Please enter the names of students"
  puts "To finish, hit return twice"
  name = gets.chomp
  while !name.empty? do
    puts "Which cohort is the student in?"
    cohort = gets.chomp
    if cohort == ""
      cohort = "Not assigned"
    else
      cohort = cohort.to_sym
    end
    puts "What is the student's nationality?"
    nationality = gets.chomp
    puts "What is the student's age?"
    age = gets.chomp
    puts "What is the student's height?"
    height = gets.chomp
    @students << {name: name, cohort: cohort, nationality: nationality, 
    age: age, height: height}
    puts "Now we have #{@students.count} students"
    puts"Please enter another name, or press enter to skip"
    name = gets.chomp
  end
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

def print_students_list(students)
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

def print_menu
  #1. Print the menu and ask user what to do
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit" # 9 because we'll be adding more options
end

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you mean, try again"
  end
end

def show_students
  grouped_students = group_cohort(@students)
  print_header
  print_students_list(grouped_students)
  print_footer(@students)
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def save_students
  # open the file for writing
  file = File.open("students.csv", "w")
  # iterate over the array of students
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

interactive_menu
  