class Plot < ApplicationRecord
    belongs_to :tower
    has_one :plant

    def top
        self.tower.plots[0]
    end

    def water(units = 1.0)
        self.update(water_level: self.water_level + units.to_f)
    end

    def bottom
        self.tower.plots[self.tower.plots.length-1]
    end

    def dryOut
        update(water_level: water_level - dehydration_rate.to_f)
    end
    
    # Is this right? Should be the last one has no following plot
    def isTop?
        self.following_plot == nil
    end

    def distFromTop
        self.tower.plots.find_index(self) + 1
    end
end
