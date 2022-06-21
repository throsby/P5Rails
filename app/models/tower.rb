class Tower < ApplicationRecord
    has_many :plots, dependent: :destroy
    belongs_to :greenhouse
    has_many :plants, through: :plots


    # def create
    
    
    # end


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
        botPlot = Plot.create(water_level: 0, following_plot: nil, dehydration_rate: 0.1, tower_id: self.id, plot_number: Plot.last.plot_number + 1)        
        lowMidPlot = Plot.create(water_level: 0, following_plot: botPlot.id, dehydration_rate: 0.1, tower_id: self.id, plot_number: Plot.last.plot_number + 1)
        highMidPlot = Plot.create(water_level: 0, following_plot: lowMidPlot.id, dehydration_rate: 0.1, tower_id: self.id, plot_number: Plot.last.plot_number + 1)
        topPlot = Plot.create(water_level: 0, following_plot: highMidPlot.id, dehydration_rate: 0.1, tower_id: self.id, plot_number: Plot.last.plot_number + 1)
        return self
    end

    def create_by_greenhouse(greenhouse_id)
        @newTower = Tower.create(next_neighbor: Tower.last.id, greenhouse: Greenhouse.find_by(greenhouse_id), tower_number: Tower.last.tower_number + 1)
        @newTower.plotPopulate
        return @newTower
    end
end
