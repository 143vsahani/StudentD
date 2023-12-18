class Sclass < ApplicationRecord
  belongs_to :school
  has_many :teachers
  has_many :students
end
