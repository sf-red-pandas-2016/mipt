require 'faker'

students = []

File.foreach("MiPT_student_roster.csv") do |line|
	student_row = line.split(", ")
	students << student_row
end

header = students[0]
students.delete_at(0)

students.each do |row|
	#if teacher doesn't already exist, create new teacher given the 'assigned_teacher' column in student data
	if Teacher.find_by(full_name: row[6])
	else
		teacher = Teacher.create(full_name: row[6])
		course = Course.create(teacher_id: teacher.id, title: 'Untitled', description: 'No description.')
	end
end


students.each do |row|
	#if student already exists, do nothing
	if Student.find_by(first_name: row[0], last_name: row[1])
	#if doesn't exist, create student with corre
	else
		teacher = Teacher.find_by(full_name: row[6])
		if teacher.courses.first
			id_course = teacher.courses.first.id
		end
		Student.create({
			header[0].to_sym => row[0],
			header[1].to_sym => row[1],
	 		header[2].to_sym => row[2].to_i,
	 		header[3].to_sym => row[3],
	 		header[4].downcase.to_sym => row[4].to_f,
	 		header[5].to_sym => row[5].to_i,
	 		course_id: id_course,
	 		header[7].chomp.to_sym => row[7].chomp
			# first_name: row[0],
			# last_name: row[1],
			# grade_level: row[2].to_i,
			# gender: row[3],
			# gpa: row[4].to_f,
			# number_of_detentions: row[5].to_i,
			# teacher_id: teacher.id,
			# shirt_size: row[7].chomp
			})
	end
end

# Seed course data

	titles = [
		"Intro to Puppetry",
		"Puppet Making",
		"Advanced Puppet Making",
		"Marionettes",
		"Miming",
		"The Art of Felt",
		"Voice Throwing",
		"Advanced Puppetry",
		"Bert and Ernie, BFFs",
		"Is Snuffalupagus Real?"
	]

	descriptions = [
		"Learn how to puppet.",
		"Learn how to make a puppet.",
		"Make a puppet like a boss",
		"Play with strings and make your puppet dance",
		"How to not talk",
		"Play with soft things",
		"Make your puppet talk",
		"Puppet like a boss",
		"How to be the best Ernie to your Bert",
		"Search the applacians for the elusive Snuffalupagus"
	]

	i = 0
	titles.each do

		r = Random.new

		Course.create(
			title: titles[i],
			description: descriptions[i],
			teacher_id: r.rand(1...400)
		)
		i += 1
	end
