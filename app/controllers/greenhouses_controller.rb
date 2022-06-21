class GreenhousesController < ApplicationController
    def index
        @greenhouses = Greenhouse.all
        render json: @greenhouses, status: 200
    end

    def show
        @greenhouse = Greenhouse.find_by(id: params[:id])
        if @greenhouse
            render json: @greenhouse, status: 200
        else
            render json: {error: "Greenhouse not found"}, status: 404
        end
    end

    def towers
        @towers = Towers.where(greenhouse_id: params[:id])
    end

end
