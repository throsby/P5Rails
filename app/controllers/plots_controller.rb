class PlotsController < ApplicationController
    def index
        @plots = Plot.all
        render json: @plots
    end

    def show
        @plot = Plot.find_by(id: params[:id])
        if @plot
            render json: @plot, status: 200
        else
            render json: {error: "Plot not found"}, status: 404
        end
    end
end
