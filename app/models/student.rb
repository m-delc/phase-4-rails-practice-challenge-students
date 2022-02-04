class Student < ApplicationRecord
    validates :name, presence: true
    validates :major
    # # validates :age
    # validates :age, :inclusion => 18..150
    # validates :age, numericality: { in: 18..100 }
    validates :age, numericality: { minimum: 18 }
    belongs_to :instructor
end
