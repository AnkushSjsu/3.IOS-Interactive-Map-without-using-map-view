import UIKit
import CoreLocation

class ViewController: UIViewController, UIScrollViewDelegate,CLLocationManagerDelegate, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var myGestureRecognizer: UITapGestureRecognizer!
    var locationManager:CLLocationManager!
    
    var userLattitudeCordinate = 0.0
    var userLongitudeCordinate = 0.0
    let zoomkey = "ZoomLevel"
    
    let button1   = UIButton(type: UIButtonType.System) as UIButton
    let button2   = UIButton(type: UIButtonType.System) as UIButton
    let button3   = UIButton(type: UIButtonType.System) as UIButton
    let button4   = UIButton(type: UIButtonType.System) as UIButton
    let button5   = UIButton(type: UIButtonType.System) as UIButton
    let button6   = UIButton(type: UIButtonType.System) as UIButton
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollView.minimumZoomScale=1.0
        self.scrollView.maximumZoomScale=4.0
        self.scrollView.zoomScale=1.0
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.imageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "didTapImage:"))
        imageView.userInteractionEnabled = true
        
        //button for bldgs
        button1.frame = CGRectMake(76-16, 196-20, 40, 70)
        button1.setTitle("", forState: UIControlState.Normal)
        button1.addTarget(self, action: "openKingsLibraryDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button1)
        
        
        button2.frame = CGRectMake(286, 180, 70, 77)
        //button2.backgroundColor = UIColor.greenColor()
        button2.setTitle("", forState: UIControlState.Normal)
        button2.addTarget(self, action: "openEngBldDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button2)
        
        
        button3.frame = CGRectMake(50, 350, 55, 60)
        //button3.backgroundColor = UIColor.greenColor()
        button3.setTitle("", forState: UIControlState.Normal)
        button3.addTarget(self, action: "openychDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button3)
        
        
        button4.frame = CGRectMake(281, 272, 90, 30)
        //button4.backgroundColor = UIColor.greenColor()
        button4.setTitle("", forState: UIControlState.Normal)
        button4.addTarget(self, action: "openstdUnionDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button4)
        
        
        button5.frame = CGRectMake(436, 313, 51, 36)
        //button5.backgroundColor = UIColor.greenColor()
        button5.setTitle("", forState: UIControlState.Normal)
        button5.addTarget(self, action: "openBBCDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button5)
        
        
        button6.frame = CGRectMake(166, 486, 82, 60)
        //button6.backgroundColor = UIColor.greenColor()
        button6.setTitle("", forState: UIControlState.Normal)
        button6.addTarget(self, action: "openSGarageDetails:", forControlEvents: UIControlEvents.TouchUpInside)
        self.imageView.addSubview(button6)
        
        
        //set to last zoom
        let defaults = NSUserDefaults.standardUserDefaults()
        if let zoomLevel = defaults.stringForKey(zoomkey)
        {
            print("last zoom level: "+zoomLevel)
            scrollView.setZoomScale(CGFloat(Double(zoomLevel)!), animated: false)
        }
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        unhighLightButton()
        var searchT = searchBar.text!
        searchT = searchT.stringByReplacingOccurrencesOfString(" ", withString: "")
        searchT = searchT.lowercaseString
        
        var kingsLibrary = "kinglibrary"
        var engineeringBuilding = "engineeringbuilding"
        var yoshihirouChidaHall = "yoshihirouchidahall"
        var studentUnion = "studentunion"
        var bbc = "bbc"
        var south​Parking​Garage = "southparkinggarage"
        if (searchT==kingsLibrary)  {
            print("kinglibrary")
            highLightButton(1)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 170,y: 570)
            return
        }
        if searchT==engineeringBuilding {
            print("engineeringbuilding")
            highLightButton(2)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 1100,y: 570)
            return
        }
        if(searchT==yoshihirouChidaHall){
            print("yoshihirouchidahall")
            highLightButton(3)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 140,y: 1200)
            return
        }
        if(searchT==studentUnion){
            print("studentunion")
            highLightButton(4)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 1100,y: 870)
            return
        }
        if(searchT==bbc){
            print("bbc")
            highLightButton(5)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 1700,y: 1000)
            return
        }
        if(searchT==south​Parking​Garage){
            print("south​parking​garage")
            highLightButton(6)
            scrollView.setZoomScale(4.0, animated: false)
            scrollView.contentOffset=CGPoint(x: 660,y: 1800)
            return
        }
        
        
    }
    
    //action for bld buttons
    func openKingsLibraryDetails(sender:UIButton!)
    {
        print("openKingsLibraryDetails")
        openBldDetails(37.3346722, toLong: -121.8871817, bldNo: 0)
    }
    
    func openEngBldDetails(sender:UIButton!)
    {
        print("openEngBldDetails")
        openBldDetails(37.336740, toLong: -121.881645, bldNo: 1)
    }
    
    func openychDetails(sender:UIButton!)
    {
        print("openychDetails")
        openBldDetails(37.333626, toLong: -121.883748, bldNo: 2)
    }
    
    func openstdUnionDetails(sender:UIButton!)
    {
        print("openstdUnionDetails")
        openBldDetails(37.336390, toLong: -121.880948, bldNo: 3)
    }
    
    func openBBCDetails(sender:UIButton!)
    {
        print("openBBCDetails")
        openBldDetails(37.336467, toLong: -121.878776, bldNo: 4)
    }
    
    func openSGarageDetails(sender:UIButton!)
    {
        print("openSGarageDetails")
        openBldDetails(37.333055, toLong: -121.880958, bldNo: 5)
    }
    
    func openBldDetails(toLat:Double, toLong:Double, bldNo:Int){
        unhighLightButton()
        let googleMapServiceWrapper = GoogleMapServiceWrapper(fromLattitude: userLattitudeCordinate, fromLongitude: userLongitudeCordinate)
        var result = googleMapServiceWrapper.calculateDistance(toLat, toLongitude: toLong)
        if let buildingInformationController = storyboard?.instantiateViewControllerWithIdentifier("buildinginfo") as? BuildingInformationController {
            buildingInformationController.result=result
            buildingInformationController.bldInfoName=bldNo
            presentViewController(buildingInformationController, animated:true, completion: nil)
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            let location = touch.locationInView(self.imageView)
            print(location)
        }
        super.touchesBegan(touches, withEvent:event)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.imageView
    }
 
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let locationObj = locations[0] as CLLocation
        let coord = locationObj.coordinate
        print(coord.latitude)
        print(coord.longitude)
        userLattitudeCordinate = coord.latitude
        userLongitudeCordinate = coord.longitude
        var locationPlotterHelper = LocationPlotterHelper(x: Double(imageView.bounds.size.width), y: Double(imageView.bounds.size.height))
        var screenCoordinates:(Double, Double) = locationPlotterHelper.getXYCoordinates(coord.latitude, longloc: coord.longitude)
        print("x cord: \(Double(imageView.bounds.size.width))")
        print("y cord: \(Double(imageView.bounds.size.height))")
        var scrollViewXCord = imageView.frame.origin.x
        var scrollViewYCord = imageView.frame.origin.y
        let button = UIButton(type: .System)
        button.frame = CGRectMake(CGFloat(screenCoordinates.0)
            , CGFloat(screenCoordinates.1), 10,10)
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor=UIColor.redColor()
        self.imageView.addSubview(button)
        print("scrollViewXCord: \(screenCoordinates.0)")
        print("scrollViewYCord: \(screenCoordinates.1)")
        
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        if let imageView = gesture.view as? UIImageView {
            print("Image Tapped")
            
        }
    }
    
    func didTapImage(gesture: UIGestureRecognizer) {
        let point = gesture.locationInView(gesture.view)
        print(point)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        print("scroll")
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject(scrollView.zoomScale, forKey: zoomkey)
    }

    func highLightButton(btno:Int){
        switch btno{
        case 1: button1.layer.borderColor=UIColor.yellowColor().CGColor
                button1.layer.cornerRadius = 2;
                button1.layer.borderWidth = 1;
        case 2: button2.layer.borderColor=UIColor.yellowColor().CGColor
                button2.layer.cornerRadius = 2;
                button2.layer.borderWidth = 1;
        case 3: button3.layer.borderColor=UIColor.yellowColor().CGColor
                button3.layer.cornerRadius = 2;
                button3.layer.borderWidth = 1;
        case 4: button4.layer.borderColor=UIColor.yellowColor().CGColor
                button4.layer.cornerRadius = 2;
                button4.layer.borderWidth = 1;
        case 5: button5.layer.borderColor=UIColor.yellowColor().CGColor
                button5.layer.cornerRadius = 2;
                button5.layer.borderWidth = 1;
        case 6: button6.layer.borderColor=UIColor.yellowColor().CGColor
                button6.layer.cornerRadius = 2;
                button6.layer.borderWidth = 1;
        default: print("")
        }
    }
    
    func unhighLightButton(){
        button1.layer.borderWidth = 0;
        button2.layer.borderWidth = 0;
        button3.layer.borderWidth = 0;
        button4.layer.borderWidth = 0;
        button5.layer.borderWidth = 0;
        button6.layer.borderWidth = 0;
    }
    
}

