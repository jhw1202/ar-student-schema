require_relative '../../db/config'
require 'date'

# implement your Student model here
class Student < ActiveRecord::Base
  attr_accessor :first_name, :last_name, :gender, :birthday, :email, :phone
  # def initialize(args = {})
  #   @first_name = args[:first_name]
  #   @last_name = args[:last_name]
  #   @gender = args[:gender]
  #   @birthday = args[:birthday]
  #   @email = args[:email]
  #   @phone = args[:phone]
  #   @age = nil
  # end

  def name
    "#{@first_name} #{@last_name}"
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  #validations

  

end

