//
//  ViewController.swift
//  allTests
//
//  Created by cumulations on 23/05/22.
//

import UIKit
import Alamofire


enum errormessages:Error{
    case error
    case success
}
class ViewController: UIViewController {
    struct detail:Codable{
        var _id:String
        var author:String
    };
    var i = ""
    var n = ""
    struct HTTPBinResponse: Decodable { let url: String }
    var parameters: [String: Any] = ["a":"b", "c":1,"dsf":["id":1]]
    var details:[detail]?
    override func viewDidLoad() {
        super.viewDidLoad()
        fetch()
    

    }
    //for firebase
//    func authen(){
//        let email = "example@gmail.com"
//        let password = "test test"
//        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
//          if let error = error as? NSError {
//                print("Error")
//            }
//          else {
//            print("User signs up successfully")
//            let newUserInfo = Auth.auth().currentUser
//            let email = newUserInfo?.email
//          }
//        }
//    }
    
    @IBAction func p(_ sender: Any) {
        fetch()
        self.details?.append(detail(_id: self.i ?? "nil", author: self.n ?? "nil"))
        print(details)
    }
    
    //for alamofire
    func fetch() {
//        let url = "https://httpbin.org/post"
//        let request = AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
//        request.responseString { (data) in
//            debugPrint(data)
        

//        let url = "https://httpbin.org/get"
//        let request  = AF.request(url)
//        request.responseJSON { (data) in
//            print(data)

        let url = "https://api.quotable.io/random"
        let request  = AF.request(url)
        request.responseJSON { (data) in
            let json = try? JSONDecoder().decode(detail.self, from: data.data!)
            self.details?.append(detail(_id: json?._id ?? "", author: json?.author ?? ""))
            self.i = json?._id ?? ""
            self.n = json?.author ??  ""
            print(self.i,self.n)
            print(self.details)
            
        }
            

      }

}
