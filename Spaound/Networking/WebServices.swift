//
//  WebServices.swift
//  Spaound
//
//  Created by Saber on 24/03/2021.
//

import UIKit
import Alamofire
class WebServices: NSObject {
    var spacess: [Space]!

    
      class func getJson(completion: @escaping (_ spaces: [Space]?, _ error: Error?)-> Void){
        let url = URL(string: "http://localhost:3000/spaces/")!
        AF.request(url).validate().responseDecodable {(response: DataResponse<[Space], AFError>) in
            switch response.result{
            
            case .success(let spaces):
                OperationQueue.main.addOperation {
                    completion(spaces,nil)
                }
            case .failure(let error):
                OperationQueue.main.addOperation {
                    completion(nil, error)
                    
                }
            }
            
        }
        
        
    }
    
    func fetchSpaces(){
        
        WebServices.getJson { (spaces, error) in
            if let error = error{
                preconditionFailure("\(error)")
            }
            
            self.spacess = spaces!
        }
        
        
    }
    
    
    
    
}
