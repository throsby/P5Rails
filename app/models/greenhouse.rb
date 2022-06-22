class Greenhouse < ApplicationRecord
    has_many :towers
    has_many :plots, through: :towers
    

    
    
end
