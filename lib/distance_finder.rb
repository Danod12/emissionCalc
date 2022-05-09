require 'net/http'
require 'json'
require 'uri'

class DistanceFinder
    def self.findLatStartPosition(startLocation)
       

    @startLocUrl = 'http://api.openweathermap.org/geo/1.0/direct?q=' + (startLocation) + '&limit=5&appid=749d7d75a5b2f8f2ef03870866a36cca'

    @startUri = URI(@startLocUrl)
    @startResponse = Net::HTTP.get(@startUri)
    puts @startResponse.body if @startResponse.is_a?(Net::HTTPSuccess)

    @startData = JSON.parse(@startResponse)

    @startLatitude = @startData[4]["lat"]
    @startLatitudeInt =  @startLatitude.to_f

    end

    def self.findLonStartPosition(startLocation)
       
        @startLongitude = @startData[4]["lon"]
        @startLongitudeInt =  @startLongitude.to_f
      
    end
     
    

    def self.findLatFinishPosition(finishLocation)

        @finishLocUrl = 'http://api.openweathermap.org/geo/1.0/direct?q=' + (finishLocation) + '&limit=5&appid=749d7d75a5b2f8f2ef03870866a36cca'
    
        @finishUri = URI(@finishLocUrl)
        @finishResponse = Net::HTTP.get(@finishUri)
        puts @finishResponse.body if @finishResponse.is_a?(Net::HTTPSuccess)
        @finishData = JSON.parse(@finishResponse)
    
      
        @finishLatitude = @finishData[4]["lat"]
        @finishLatitudeInt =  @finishLatitude.to_f
    

    end


    def self.findLonFinishPosition(finishLocation)

    
        @finishLongitude = @finishData[4]["lon"]
        @finishLongitudeInt =  @finishLongitude.to_f
        
    end


    def self.degreeToRadian(deg)

        deg * (Math::PI/180)
    end


    def self.distanceCalculation(lat1,lat2,lon1,lon2)

        @radius = 6371 #radius of th earth in km
        @dLat = degreeToRadian(lat2-lat1) # converting difference in latitude coordinates from degrees to radians
        @dLon = degreeToRadian(lon2-lon1) # converting difference in latitude coordinates from degrees to radians

        @a =  Math.sin(@dLat/2) * Math.sin(@dLat/2) + Math.cos((degreeToRadian(lat1))) * Math.cos((degreeToRadian(lat2))) *  Math.sin(@dLon/2) * Math.sin(@dLon/2)
        @c = 2 * Math.atan2(Math.sqrt(@a), Math.sqrt(1-@a))

        @totalDistance =  @radius * @c;

    end

    

end