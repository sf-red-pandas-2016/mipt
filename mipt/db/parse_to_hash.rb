# This file is independent of database.

students = []

File.foreach("MiPT_student_roster.csv") do |line|
	student_row = line.split(", ")
	students << student_row
end

header = students[0]
students.delete_at(0)

student_array = []
student_hash = {}

students.each do |row|
	student_hash = {
		header[0] => row[0],
		header[1] => row[1],
 		header[2] => row[2].to_i,
 		header[3] => row[3],
 		header[4] => row[4].to_f,
 		header[5] => row[5].to_i,
 		header[6] => row[6],
 		header[7].chomp => row[7].chomp
	}
	
	student_array << student_hash

end

p student_array[5]
