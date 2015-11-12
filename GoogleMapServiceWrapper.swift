import Foundation

class GoogleMapServiceWrapper{
    
    let distanceEndpint: String = "https://maps.googleapis.com/maps/api/distancematrix/json?"
    let APIKEY = "AIzaSyB3lCXSCTKf83y5NY3z8OkHwtyunqFikTY"
    
    var fromLattitude = 0.0
    var fromLongitude = 0.0
    
    init(fromLattitude:Double, fromLongitude:Double){
        self.fromLattitude=fromLattitude
        self.fromLongitude=fromLongitude
    }
    
    func calculateDistance(toLattitude:Double, toLongitude:Double)->(String, String){
        var originParameters = "origins=\(fromLattitude),\(fromLongitude)"
        var destinationParameters = "destinations=\(toLattitude),\(toLongitude)"
        var mode = "mode=walking"
        var key = "key=\(APIKEY)"
        var stringUrl = distanceEndpint+originParameters+"&"+destinationParameters+"&"+mode+"&"+key
        var url = NSURL(string: stringUrl)
        var data = NSData(contentsOfURL: url!)
        var distance = ""
        var duration = ""
        do {
            if let jsonResult = try NSJSONSerialization.JSONObjectWithData(data!, options: []) as? NSDictionary {
                //print(jsonResult)
                if let rows = jsonResult["rows"] as? NSArray {
                    for row in rows {
                        if let elements = row["elements"] as? NSArray{
                            var count = 0
                            for element in elements{
                                if let elementObj = element as? Dictionary<String, AnyObject>{
                                    for (key, value) in elementObj{
                                        if key == "distance" {
                                            if let distanceObj = value as? Dictionary<String, AnyObject>{
                                                for (okey, ovalue) in distanceObj{
                                                    if okey == "text"{
                                                        if let ovalueString = ovalue as AnyObject? as? String {
                                                            distance=ovalueString
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        if key == "duration" {
                                            if let durationObj = value as? Dictionary<String, AnyObject>{
                                                for (okey, ovalue) in durationObj{
                                                    if okey == "text"{
                                                        if let ovalueString = ovalue as AnyObject? as? String{
                                                            duration=ovalueString
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                                
                        }
                    }
                }
            }
        } catch {
            print(error)
        }
        print("distance "+distance)
        print("duration "+duration)
        return (distance, duration)
    }
   
}