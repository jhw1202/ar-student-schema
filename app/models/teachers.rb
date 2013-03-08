require_relative '../../db/config'
require 'faker'

class Teacher < ActiveRecord::Base
  has_many :students
  validates :email, :format => { :with =>  /\D+@\D+\.{1}\D{0,2}\D{2,5}/, :message => "Not a valid email address."}
  validates :email, :uniqueness => true

end








