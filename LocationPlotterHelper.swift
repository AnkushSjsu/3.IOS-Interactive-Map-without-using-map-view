
import Foundation

class LocationPlotterHelper{
    
    var xcordinates = 0.0;
    var ycordinates = 0.0;
    let R = 6372.8; // In kilometers
    
    //lattitude - horizontal
    //longitude - vertical
    let lllat = 37.337666;
    let lllong = -121.887356;
    
    let ullat = 37.340645;
    let ullong = -121.881059;
    
    let lrlat = 37.331589;
    let lrlong = -121.882835;
    
    let urlat = 37.334571;
    let urlong = -121.876513;
    
    init(x:Double, y:Double){
      self.xcordinates=x
      self.ycordinates=y
    }
    
    func getXYCoordinates(latloc:Double, longloc:Double)->(Double, Double){
        var angle = calculateAngle(lllat, ullat: ullat, lrlat: lrlat, latloc: latloc);
        var distance = calculateStraightLineDistanceBetweenTwoGeoCord(lllat, lon1: lllong, lat2: latloc, lon2: longloc);
        var screenMapDiagDist = calculateEuclidianDistance(0.0, py: 0.0, qx: 0.0, qy: (ycordinates+xcordinates)/2)
        var mapDiagDist = calculateStraightLineDistanceBetweenTwoGeoCord(lllat, lon1: lllong, lat2: lrlat, lon2: lrlong);
        return calculateCoordinates(angle, distance: distance, xstartindex: 0.0, ystartindex: 0.0, screenMapDiagDist: screenMapDiagDist, mapDiagDist: mapDiagDist);
    }
    
    func calculateAngle(lllat:Double, ullat: Double, lrlat: Double, latloc: Double) -> Double{
        var angle = 0.0;
        angle = angle + ullat-lllat
        angle = angle + lllat-latloc
        return calculateScaleAngle(angle)
    }
    
    //distance  = feet
    //anlge = degrees
    func calculateCoordinates(angle:Double, distance:Double, xstartindex:Double, ystartindex:Double,  screenMapDiagDist:Double, mapDiagDist:Double) -> (Double,Double){
        var scaledDistance = convertDistanceToScale(screenMapDiagDist,mapDiagDist: mapDiagDist, distance: distance);
        var xcordinates = round(xstartindex+cos(angle*0.01745329252)*scaledDistance)
        var ycordinates = round(ystartindex+sin(angle*0.01745329252)*scaledDistance)
        return(xcordinates,ycordinates)
    }
    
    func convertDistanceToScale(screenMapDiagDist:Double, mapDiagDist:Double, distance:Double)->Double{
        return (distance*screenMapDiagDist)/mapDiagDist;
    }
    
    //haversine formula
    //google gives distance by road
    //ans is in km
    func calculateStraightLineDistanceBetweenTwoGeoCord(lat1:Double, lon1:Double, lat2:Double, lon2:Double)
        -> Double {
        let lat1rad = lat1 * M_PI/180
        let lon1rad = lon1 * M_PI/180
        let lat2rad = lat2 * M_PI/180
        let lon2rad = lon2 * M_PI/180
        
        let dLat = lat2rad - lat1rad
        let dLon = lon2rad - lon1rad
        let a = sin(dLat/2) * sin(dLat/2) + sin(dLon/2) * sin(dLon/2) * cos(lat1rad) * cos(lat2rad)
        let c = 2 * asin(sqrt(a))
        let R = 6372.8
        
        return R * c
    }
    
    func calculateEuclidianDistance(px:Double, py:Double, qx:Double, qy:Double)->Double{
        return sqrt((qx-px)*(qx-px) + (qy-py)*(qy-py));
    }
    
    func calculateScaleAngle(angle:Double)->Double{
        return (angle*80)/(ullat-lrlat);
    }
    
}

