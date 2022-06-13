class PlantsController < ApplicationController
    def index
        @plants = Plant.all
        render json: @plants
    end

    def show
        @plant = Plant.find_by(id: params[:id])
        if @plant
            render json: @plant, status: 200
        else
            render json: {error: "Plant not found"}, status: 404
        end
    end
end
