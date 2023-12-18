class Student < ApplicationRecord
  belongs_to :sclass
  has_one :school, through: :sclass
  has_many :teachers, through: :sclasses
end
