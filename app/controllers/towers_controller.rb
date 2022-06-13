class TowersController < ApplicationController
    def index
        @towers = Tower.all
        render json: @towers, status: 200
    end

    def show
        @tower = Tower.find_by(id: params[:id])
        if @tower
            render json: @tower, status: 200
        else
            render json: {error: "Tower not found"}, status: 404
        end
    end

    


end
