//
//  APIService.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import Foundation
import UIKit
import Alamofire


//MARK:- APIService Protocol
protocol APIServiceDelegate: AnyObject{
    func fetchedData(result: Result<Products,Error>)
}

//MARK:- APIService
class APIService{
    
    weak var APIServiceDelegate: APIServiceDelegate!
    
    // Fetch Data Using Alamofire
    
//    func fetchData(){
//
//        AF.request("http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
//
//            switch response.result {
//
//            case .success(let data):
//                do {
//                    let decoder = JSONDecoder()
//                    let finalRes = try decoder.decode(Products.self, from: data)
//                    print(finalRes)
//                    self.APIServiceDelegate.fetchedData(result: .success(finalRes))
//                } catch {
//                    print("Error: Trying to convert JSON data to string")
//                    return
//                }
//            case .failure(let error):
//                print(error)
//                self.APIServiceDelegate.fetchedData(result: .failure(error))
//            }
//        }
//        }
    
    
    // Fetch Data Using URLSession
    
    func fetchData(){
        URLSession.shared.dataTask(with: URL(string: "http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1")!){
            data , response , error in
            if error != nil{
                self.APIServiceDelegate.fetchedData(result: Result.failure(error!))
                return
            }
            guard let content = data else{
                return
            }
            do {
                let decoder = JSONDecoder()
                let finalRes = try decoder.decode(Products.self, from: content)
                print(finalRes)
                self.APIServiceDelegate.fetchedData(result: Result.success(finalRes))
            } catch {
                print("Error: Trying to convert JSON data to string")
                return
            }
            
        }.resume()
    }
}
