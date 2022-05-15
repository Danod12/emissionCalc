require 'distance_finder'



class DistfindController < ApplicationController
#adding a commit comment
    def journeyCalculator

    end

    
    def distanceProfileCalc

        @srtPos = params[:startingLocation] 
        @fnsPos = params[:finishLocation]

    if @srtPos !=nil && @fnsPos !=nil

   
    @startLatitudeInt = DistanceFinder.findLatStartPosition(@srtPos)
    @startLongitudeInt = DistanceFinder.findLonStartPosition(@srtPos)
    

    @finishLatitudeInt = DistanceFinder.findLatFinishPosition(@fnsPos)
    @finishLongitudeInt = DistanceFinder.findLonFinishPosition(@fnsPos)

    @totalDistance = DistanceFinder.distanceCalculation(@startLatitudeInt,@finishLatitudeInt, @startLongitudeInt,@finishLongitudeInt)

    @roundedTotalDistance = @totalDistance.round(2)

    @totalEmissionsCar = (CarbonCalcCar.checkCar(@roundedTotalDistance)).round(2);
    @totalEmissionsPlane = (CarbonCalcCar.checkPlane(@roundedTotalDistance)).round(2);
    
   else

   flash.now[:alert] = 'Error while sending message!'
   
    end
    
    end


end
