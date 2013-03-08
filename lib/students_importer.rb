require_relative '../app/models/student'
require_relative '../app/models/teachers'

module StudentsTeachersImporter
  def self.import(filename=File.dirname(__FILE__) + "/../db/data/students.csv")
    field_names = nil
    Student.transaction do
      File.open(filename).each do |line|
        data = line.chomp.split(',')
        if field_names.nil?
          field_names = data
        else
          attribute_hash = Hash[field_names.zip(data)]
          student = Student.create!(attribute_hash)
        end
      end
    end

    9.times do 
    Teacher.create(
      :first_name => Faker::Name.first_name,
      :last_name => Faker::Name.last_name,
      :birthday => Date.new(1989,9,24),
      :gender => ['male','female'].sample,
      :email => Faker::Internet.email,
      :phone => Faker::PhoneNumber.phone_number)
  end
end

end
