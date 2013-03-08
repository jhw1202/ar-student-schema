require_relative '../../db/config'
require 'faker'

class Teacher < ActiveRecord::Base
  has_many :students



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

