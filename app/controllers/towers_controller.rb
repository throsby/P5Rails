class TowersController < ApplicationController
    
    def index_gh
        hash_out = {}
        Tower.where(greenhouse_id: params[:id]).each do |tower|
            p tower
            hash_out[tower["tower_number"]] = tower.plots.order("id ASC")
        end
        render json: hash_out, status: 200
    end

    def index
        hash_out = {}
        Greenhouse.all.each do |greenhouse|
            plots = []
            greenhouse.plots.order("id ASC").in_groups_of(4) {|pl|
                plots << [pl]
            }
            hash_out[greenhouse[:id]] = plots
        end
        render json: hash_out, status: 200
    end

    # def index
    #     hash_out = {}
    #     Tower.all.each do |tower|
    #         hash_out[tower["tower_number"]] = tower.plots.order("id ASC")
    #     end
    #     # @towers = Tower.all
    #     render json: hash_out, status: 200
    # end

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
        Greenhouse.find_by(id: params[:id]).towers.last.plots.each do |plot|
            plot.destroy
        end

        # p "Parameter here\n"
        # p params[:id]
        Greenhouse.find_by(id: params[:id]).towers.last.destroy
        hash_out = {}
        Greenhouse.all.each do |greenhouse|
            plots = []
            greenhouse.plots.order("id ASC").in_groups_of(4) {|pl|
                plots << [pl]
            }
            hash_out[greenhouse[:id]] = plots
        end
        render json: hash_out, status: 200
    end

    # def destroy
    #     # Destroy the plots of the last tower
    #     Tower.last.plots.each do |plot|
    #       plot.destroy
    #     end
    #     # THEN Destroy the last tower
    #     Tower.last.destroy
    #     hash_out = {} #Hash of towers to-be
    #     Tower.all.each do |tower|
    #       hash_out[tower.id] = tower.plots
    #     end
    #     render json: hash_out
    # end

    def create
        @newTower = Tower.create(next_neighbor: Tower.last.id, greenhouse: Greenhouse.last, tower_number: Tower.last.tower_number + 1)
        @newTower.plotPopulate
        render json: {@newTower[:tower_number] => @newTower.plots}, status: 200
    end

    def create_gh
        # gh = Greenhouse.where(id: params)
        (prev_tower = Tower.where(greenhouse: Greenhouse.find_by(id: params[:id])).last) || prev_tower = {id: 0, next_neighbor: nil, tower_number: 0}
        @newTower = Tower.create(next_neighbor: prev_tower[:id], greenhouse: Greenhouse.find_by(id: params[:id]), tower_number: prev_tower[:tower_number] + 1)
    
        @newTower.plotPopulate
        hash_out = {}
        Greenhouse.all.each do |greenhouse|
            plots = []
            greenhouse.plots.order("id ASC").in_groups_of(4) {|pl|
                plots << [pl]
            }
            hash_out[greenhouse[:id]] = plots
        end
        render json: hash_out, status: 200
    end
end
