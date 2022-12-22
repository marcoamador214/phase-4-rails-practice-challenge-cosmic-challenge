class PlanetsController < ApplicationController

    #GET /planets
    def index
        render json: Planet.all
    end
    
end
