class CitiesController < ApplicationController

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

    def view
        @cities = City.all.values
        @city = params[:city]
        if @city.present?
            if defined? @cities[@city]
                @displayCity = @city
            end
        end
    end

    def create
        @cities = City.all.values
        newCity = City.new(
            name: params[:city],
            landmark: params[:landmark],
            population: params[:population])
        newCity.save
        redirect_to 'http://localhost:1337/cities/view'
    end

    def update
        @cities = City.all.values
        @cities.each do |c|
            if c.name.capitalize == params[:city].capitalize
                if (params[:landmark].length > 0) && (params[:landmark].length > 0)
                    c.update(landmark = params[:landmark], population = params[:population])
                elsif (params[:landmark].length > 0) && (params[:landmark].length == 0)
                    c.update(landmark = params[:landmark], population = nil)
                elsif (params[:landmark].length == 0) && (params[:landmark].length > 0)
                    c.update(landmark = nil, population = params[:population])
                end
            end
        end
        redirect_to 'http://localhost:1337/cities/view'
    end

    def delete
        @cities = City.all.values
        @cities.each do |c|
            if c.name.capitalize == params[:deleteCity].capitalize
                c.destroy
            end
        end
        redirect_to 'http://localhost:1337/cities/view'
    end
end