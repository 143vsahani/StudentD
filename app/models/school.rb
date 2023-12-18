class School < ApplicationRecord
    has_many :sclasses
    has_many :teachers, through: :sclasses
    has_many :students, through: :sclasses
end
