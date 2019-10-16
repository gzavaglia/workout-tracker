class User < ApplicationRecord
    has_secure_password
    has_many :routines
    has_many :workouts, through: :routines
end
