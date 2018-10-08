require_relative "../services/weather_service"

class MainController < ApplicationController

    city = City.new(
        name: "Berkeley",
        landmark: "sather tower",
        population: 2
    )

    city.save

    city2 = City.new(
        name: "Singapore",
        landmark: "marina bay sands",
        population: 4
    )

    city2.save

    def index
        # Uncomment and pass a parameter to the get function
        @cities = City.all.values
    end
end  
