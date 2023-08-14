//
//  APIService.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import Foundation
import UIKit
import Alamofire

class APIService: ProductsViewModelDelegate{
    
    func fetchData() -> Products {
        
        var fetchedData: Products!
        
        AF.request("http://staging.php-dev.in:8844/trainingapp/api/products/getList?product_category_id=1", parameters: nil, headers: nil).validate(statusCode: 200 ..< 299).responseData { response in
            
            switch response.result {
            
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    let finalRes = try decoder.decode(Products.self, from: data)
                    print(finalRes)
                    fetchedData = finalRes
                } catch {
                    print("Error: Trying to convert JSON data to string")
                    return
                }
            case .failure(let error):
                print(error)
            }
        }
        
        return fetchedData
    }
}
