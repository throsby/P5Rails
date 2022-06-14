class TowersController < ApplicationController
    
    def index
        @towers = Tower.all
        render json: @towers, status: 200
    end

    def plots
        arr_out = []
        @towers = Tower.all
        @towers.each do |tower|
            arr_out << {tower: tower, plots: Tower.find_by(id: tower.id).plots}
        end
        render json: arr_out, status: 200
    end

    def show
        @tower = Tower.find_by(id: params[:id])
        if @tower
            render json: @tower, status: 200
        else
            render json: {error: "Tower not found"}, status: 404
        end
    end

    def destroy
        # Destroy the plots of the last tower
        Tower.last.plots.each do |plot|
          plot.destroy
        end
        # THEN Destroy the last tower
        Tower.last.destroy
        hash_out = {} #Hash of towers to-be
        Tower.all.each do |tower|
          hash_out[tower.id] = tower.plots
        end
        render json: hash_out
      end

      def create
        @newTower = Tower.create(next_neighbor: Tower.last.id)
        @newTower.plotPopulate
        render json: @newTower, status: 200
      end
end
