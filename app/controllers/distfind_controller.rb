require 'distance_finder'
require 'co2_travel_calc'


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

    @roundedTotalDistance = @totalDistance.round(2)

    @totalEmissionsCar = (CarbonCalcCar.checkCar(@roundedTotalDistance)).round(2);
    @totalEmissionsPlane = (CarbonCalcCar.checkPlane(@roundedTotalDistance)).round(2);

    


    end


end
