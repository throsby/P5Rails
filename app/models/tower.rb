class Tower < ApplicationRecord
    has_many :plots
    belongs_to :greenhouse
    has_many :plants, through: :plots

    def topPlot
        self.plots[0]
    end

    def bottomPlot
        self.plots[self.plots.length-1]
    end

    def waterPlots(num)
        waterPerPlot = num / 4
        self.plots.each do |plot|
            plot.water_level += waterPerPlot.to_f
        end
    end

    def dryOutTower
        self.plots.each do |plot|
            plot.water_level -= plot.dehydration_rate.to_f
        end
    end

    def plotPopulate        
        botPlot = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: self.id)        
        lowMidPlot = Plot.create(water_level: 0, following_plot: botPlot.id, dehydration_rate: 0.1, tower_id: self.id)
        highMidPlot = Plot.create(water_level: 0, following_plot: lowMidPlot.id, dehydration_rate: 0.1, tower_id: self.id)
        topPlot = Plot.create(water_level: 0, following_plot: highMidPlot.id, dehydration_rate: 0.1, tower_id: self.id)
    end
end
