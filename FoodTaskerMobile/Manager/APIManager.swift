
import Foundation
import Alamofire
import SwiftyJSON
import FBSDKLoginKit

class APIManager {
    static let shared = APIManager()
    
    let baseURL = NSURL(string: "localhost:8000/")
    var accessToken = ""
    var refreshToken = ""
    var expired = Date()
    
    // API to login an user
    func login(userType: String, completionHandler: @escaping(NSError?) -> Void){
        
    }
    
    // API to logout an user
    func logout(complitionHandler: @escaping(NSError?) -> Void){
        
    }
    
}
