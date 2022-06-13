class Tower < ApplicationRecord
    has_many :plots
    belongs_to :greenhouse
    has_many :plants, through: :plots
end
