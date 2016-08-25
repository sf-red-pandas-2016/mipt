class CreateStudents < ActiveRecord::Migration[5.0]
  def change
    create_table :students do |t|
      t.string :first_name
      t.string :last_name
      t.integer :grade_level
      t.string :gender
      t.float :gpa
      t.integer :number_of_detentions
      t.integer :teacher_id
      t.string :shirt_size
      t.string :email
      t.text :interests

      t.timestamps
    end
  end
end
