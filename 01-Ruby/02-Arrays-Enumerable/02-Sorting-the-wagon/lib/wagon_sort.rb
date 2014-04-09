def wagon_sort(students)
  # TODO: return a copy of students, sorted alphabetically
  unless students == [""]
    students.delete_if{|student| student == ""}
    students.sort_by!{|student| student.upcase}
  else
    students
  end
end

def print_students_info(students)
  unless students == [""]
    puts "Congratulations! Your wagon has #{students.length} students:"
    puts "#{students[0]}, #{students[1]} and #{students[2]}"
  end
end

