//
//  ProductsViewModel.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import Foundation
import UIKit

protocol ProductsViewModelDelegate: AnyObject{
    var products: Products { get set }
}

class ProductsViewModel: APIServiceDelegate{
    
    private let apiService = APIService()
    
    init(){
        apiService.APIServiceDelegate = self
    }
    func bringData(){
        apiService.fetchData()
    }
    func fetchedData(result: Result<Products, Error>) {
        switch result{
        case .success(let products):
            
            print(products)
        case .failure(let e):
            print(e)
        }
    }
    
}
