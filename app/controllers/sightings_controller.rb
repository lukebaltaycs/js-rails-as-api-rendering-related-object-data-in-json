class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        if sighting
            render json: sighting.to_json(include: [:bird, :location], except: [:updated_at])
        else
            render json: { message: 'No sighting found with that id' }
        end
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        render json: sighting, include: [:bird, :location]
    end


end
