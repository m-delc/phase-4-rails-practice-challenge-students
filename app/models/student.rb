class Student < ApplicationRecord
    validates :name, presence: true
    validates :major, presence: true
    validates :age, :inclusion => 18..150



    belongs_to :instructor
end


# validates :stock_qty, :numericality => { :only_integer => true, :greater_than_or_equal_to => 0 } 