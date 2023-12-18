class Teacher < ApplicationRecord
  belongs_to :sclass
  
  has_one :school, through: :sclass
  has_many :students, through: :sclasses
end
