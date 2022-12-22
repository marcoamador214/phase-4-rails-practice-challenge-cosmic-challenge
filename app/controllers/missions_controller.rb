class MissionsController < ApplicationController

    #POST /missions
    def create
        new_mission = Mission.new(missions_params)
        if new_mission.save 
            render json: new_mission.planet, status: :created
        else
            render json: { errors: new_mission.errors.full_messages }, status: 422
        end
    end

    def missions_params
        params.permit(:name, :scientist_id, :planet_id)
    end
    
end
