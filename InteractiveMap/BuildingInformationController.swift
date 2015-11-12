
import UIKit
import CoreLocation

class BuildingInformationController: UIViewController{
    
    var result = ("","")
    var bldInfoName:Int = 0
    
    @IBOutlet weak var bldImageView: UIImageView!
    @IBOutlet weak var bldNameLabel: UILabel!
    @IBOutlet weak var bldAddressLabel: UILabel!
    @IBOutlet weak var wlkingDistance: UILabel!
    @IBOutlet weak var wlkingTime: UILabel!
    
    var bldInformation = [Int: [String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //kings library
        var kingLibraryInfo = [String:String]()
        kingLibraryInfo["bldname"]="King Library​​​"
        kingLibraryInfo["bldaddress"]="Dr. Martin Luther King, Jr. Library, 150 East San Fernando Street, San Jose, CA 95112"
        kingLibraryInfo["imagename"]="kingslibrary"
        //Engineering Building
        var engBldInfo = [String:String]()
        engBldInfo["bldname"]="Engineering Building"
        engBldInfo["bldaddress"]="San José State University Charles W. Davidson College of Engineering, 1 Washington Square, San Jose, CA 95112"
        engBldInfo["imagename"]="engbld"
        //Engineering Building
        var uchidaInfo = [String:String]()
        uchidaInfo["bldname"]="Yoshihiro Uchida Hall​​"
        uchidaInfo["bldaddress"]="Yoshihiro Uchida Hall, San Jose, CA 95112"
        uchidaInfo["imagename"]="ychall"
        //std union
        var studentunion = [String:String]()
        studentunion["bldname"]="Student Union​​"
        studentunion["bldaddress"]="​Student Union Building, San Jose, CA 95112"
        studentunion["imagename"]="stdunion"
        //BBC
        var bbc = [String:String]()
        bbc["bldname"]="BBC​​​"
        bbc["bldaddress"]="​Boccardo Business Complex, San Jose, CA 95112"
        bbc["imagename"]="bbc"
        //South​Parking​Garage
        var garage = [String:String]()
        garage["bldname"]="South ​Parking​ Garage​​​"
        garage["bldaddress"]="​San Jose State University South Garage, 330 South 7th Street, San Jose, CA 95112"
        garage["imagename"]="sgarage"
        
//        bldInformation[String("King Library")]=kingLibraryInfo
//        bldInformation[String("Engineering Building")]=engBldInfo
//        bldInformation[String("Yoshihiro Uchida Hall​​")]=uchidaInfo
//        bldInformation[String("Student Union​​")]=studentunion
//        bldInformation[String("BBC​​")]=bbc
//        bldInformation[String("South​ Parking​ Garage​​")]=garage
        
        bldInformation[0]=kingLibraryInfo
        bldInformation[1]=engBldInfo
        bldInformation[2]=uchidaInfo
        bldInformation[3]=studentunion
        bldInformation[4]=bbc
        bldInformation[5]=garage

        
        bldNameLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bldNameLabel.numberOfLines = 5
        bldAddressLabel.lineBreakMode = NSLineBreakMode.ByWordWrapping
        bldAddressLabel.numberOfLines = 5
        
        bldImageView.image = UIImage(named: bldInformation[bldInfoName]!["imagename"]!)
        bldNameLabel.text = bldInformation[bldInfoName]!["bldname"]
        bldAddressLabel.text = bldInformation[bldInfoName]!["bldaddress"]
        wlkingDistance.text = result.0
        wlkingTime.text = result.1
        
    }
    
}
