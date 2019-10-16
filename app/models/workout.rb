class Workout < ApplicationRecord
    has_many :routines
    has_many :users, through: :routines
end
