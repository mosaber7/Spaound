//
//  WebServices.swift
//  Spaound
//
//  Created by Saber on 24/03/2021.
//

import UIKit
import Alamofire
class WebServices: NSObject {
    static let shared = WebServices()
    
    private override init() {
        
    }
    
    func getJson(completion: @escaping (Result<[Space], Error>)-> Void){
        guard let url = URL(string: "http://localhost:3000/spaces/") else{
            return
        }
        AF.request(url).validate().responseDecodable {(response: DataResponse<[Space], AFError>) in
            switch response.result{
            
            case .success(let spaces):
                completion(.success(spaces))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
        
        
    }
    
    
    
    
    
    
}
