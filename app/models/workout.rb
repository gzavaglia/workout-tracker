class Workout < ApplicationRecord
    has_many :routines
    has_many :users, through: :routines

    validates :name, presence: true, uniqueness: true
    validates :muscle_group, presence: true
end
