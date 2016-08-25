students = []

File.foreach("MiPT_student_roster.csv") do |line|
	student_row = line.split(",")
	students << student_row
end
students.delete_at(0)

students.each do |row|
	#if teacher doesn't already exist, create new teacher given the 'assigned_teacher' column in student data
	if Teacher.find_by(full_name: row[6])
	else
		Teacher.create(full_name: row[6]) 
	end
end

students.each do |row|
	#if student already exists, do nothing
	if Student.find_by(first_name: student[0], last_name: student[1])
	#if doesn't exist, create student with corre
	else
		teacher = Teacher.find_by(full_name: row[6])
		Student.create(
			first_name: row[0],
			last_name: row[1],
			grade_level: row[2],
			gender: row[3],
			gpa: row[4],
			number_of_detentions: row[5],
			teacher_id: teacher.id,
			shirt_size: row[7])
	end
end