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

    def water
        @plot = Plot.find_by(id: params[:plot_id].to_i)
        if @plot
            @plot.water
            render json: @plot, status: 200
        else
            render json: {error: "Plot #{params[:plot_id]} not found"}, status: 404
        end        
      end

      def dryOut
        @plot = Plot.find_by(id: params[:plot_id].to_i)
        if @plot
            @plot.dryOut
            render json: @plot, status: 200
        else
            render json: {error: "Plot #{params[:plot_id]} not found"}, status: 404
        end        
      end


end
