class ScientistsController < ApplicationController

    #GET /scientists
    def index
        render json: Scientist.all
    end

    #GET /scientists/:id
    def show
        scientist = Scientist.find_by(id: params[:id])
        if scientist
            render json: scientist, serializer: ShowScientistSerializer
        else
            render json: { error: "Scientist not found" }
        end
    end

    #POST /scientist
    def create
        new_scientist = Scientist.new(scientist_params)
        if new_scientist.save
            render json: new_scientist, status: :created
        else
            render json: { errors: new_scientist.errors.full_messages }, status: 422
        end
    end

    #PATCH /scientists/:id
    def update
        scientist = Scientist.find_by(id: params[:id])
        scientist.update!(scientist_params)
        render json: scientist, status: :accepted
    end

    #DELETE /scientists/:id
    def destroy
        scientist = Scientist.find_by(id: params[:id])
        scientist.missions.destroy_all
        scientist.destroy
        head :none
    end

    private

    def scientist_params
        params.permit(:name, :field_of_study, :avatar)
    end

end
