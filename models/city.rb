class City
    attr_accessor :name, :landmark, :population, :weather
    $cities = {}
    
    def initialize(city_params)
        @name = city_params[:name]
        @landmark = city_params[:landmark]
        @population = city_params[:population]
        @weather = WeatherService.get(@name)
    end

    def save
        $cities[@name.to_sym] = self
    end

    def self.all
        $cities
    end

    def update(landmark, population)
        if landmark != nil
            @landmark = landmark
        end
        if population != nil
            @population = population
        end
    end
end