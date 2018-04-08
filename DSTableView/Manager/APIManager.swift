//
//  APIManager.swift
//  DSTableView
//
//  Created by Danishuo on 09/04/2018.
//  Copyright © 2018 ettoday. All rights reserved.
//

import RxSwift
import Alamofire
import SwiftyJSON
import Foundation

enum APIErrorType: Error {
    case decodeFailed
    case statusFailed
    case dataResponeFailed
}


class APIManager {
    static var shared = APIManager()
    
    func request(url: String, parameters: [String: Any]?) -> Observable<JSON>{
        return Observable.create({ (observer) -> Disposable in
            Alamofire
                .request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
                .validate()
                .responseData { (dataRespone) in
                    switch dataRespone.result {
                    case .success(let data):
                        let json = try? JSON(data: data)
                        let status = json!["status"].stringValue
                            
                        
//                        switch status {
//                        case "success":
//                            break
//                        default:
//                            observer.onError(APIErrorType.decodeFailed)
//                        }
//                        do {
//
//                        } catch {
//                            print("APIManager OnError : \(url)")
//                            observer.onError(APIErrorType.statusFailed)
//                        }
                        
                    case .failure(_):
                        observer.onError(APIErrorType.dataResponeFailed)
                    }
            }
            return Disposables.create()
        })
    }
}
