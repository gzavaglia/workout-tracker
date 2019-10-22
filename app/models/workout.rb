class Workout < ApplicationRecord
    has_many :routines
    has_many :users, through: :routines

    #validations
    validates :muscle_group, presence: true
    validates :name, presence: true, uniqueness: true
end
