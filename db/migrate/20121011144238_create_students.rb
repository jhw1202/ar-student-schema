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
  end



end
