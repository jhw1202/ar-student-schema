require_relative '../../db/config'
require 'date'

class Validator < ActiveModel::Validator

  def validate(info)
    unless info.email =~ /\D+@\D+\.{1}\D{0,2}\D{2,5}/
      info.errors[:base] << "Enter valid email"
    end

    unless info.age > 4
      info.errors[:base] << "Too young dude"
    end

    unless info.phone =~ /.?\d{3}.{0,2}\d{3}.?\d{4}.?.{0,5}/
      info.errors[:base] << "Enter valid phone number"
    end

  end
end

# implement your Student model here
class Student < ActiveRecord::Base
  belongs_to :teacher

  validates_with Validator, :fields => [:birthday, :email, :phone]
  validates :email, :uniqueness => true
  
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
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - self.birthday.year - ((now.month > self.birthday.month || (now.month == self.birthday.month && now.day >= self.birthday.day)) ? 0 : 1)
  end

  #validations
end


