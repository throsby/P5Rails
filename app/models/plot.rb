class Plot < ApplicationRecord
    belongs_to :tower
    has_one :plant
end
