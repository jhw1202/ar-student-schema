require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class CreateStudents < ActiveRecord::Migration
  def change
    # HINT: checkout ActiveRecord::Migration.create_table
    create_table :students do |student|
      student.integer :id
      student.string :first_name
      student.string :last_name
      student.string :gender
      student.string :email
      student.string :phone
      student.date :birthday
    end

    create_table :teachers do |teacher|
      teacher.integer :id
      teacher.string :first_name
      teacher.string :last_name
      teacher.string :gender
      teacher.string :email
      teacher.string :phone
      teacher.date :birthday
    end

    create_table :students_teachers do |pair|
      pair.integer :id
      pair.integer :student_id
      pair.integer :teacher_id
    
    end
  end
end
