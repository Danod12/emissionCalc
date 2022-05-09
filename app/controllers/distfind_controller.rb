require 'distance_finder'

class DistfindController < ApplicationController
#adding a commit comment
    def journeyCalculator

    end

    
    def distanceProfileCalc

        @srtPos = params[:startingLocation] 
        @fnsPos = params[:finishLocation]

   
    @startLatitudeInt = DistanceFinder.findLatStartPosition(@srtPos)
    @startLongitudeInt = DistanceFinder.findLonStartPosition(@srtPos)
    

    @finishLatitudeInt = DistanceFinder.findLatFinishPosition(@fnsPos)
    @finishLongitudeInt = DistanceFinder.findLonFinishPosition(@fnsPos)

    @totalDistance = DistanceFinder.distanceCalculation(@startLatitudeInt,@finishLatitudeInt, @startLongitudeInt,@finishLongitudeInt)



   

    

    

    end

end
