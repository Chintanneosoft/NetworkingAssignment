//
//  ProductsViewModel.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import Foundation
import UIKit

//MARK: - ViewModel Delegate Protocol
protocol ProductsViewModelDelegate: AnyObject{
    func productsData(result: Result<Products, Error>)
}

//MARK: - Products ViewModel
class ProductsViewModel: APIServiceDelegate {
    
    private let apiService = APIService()
    weak var productsViewModelDelegate: ProductsViewModelDelegate!
    
    init(){
        apiService.APIServiceDelegate = self
    }
    
    func bringData(){
        DispatchQueue.global().async {
            self.apiService.fetchData()
        }
    }
    
    func fetchedData(result: Result<Products, Error>) {
        switch result{
        case .success(let products):
            productsViewModelDelegate.productsData(result: Result.success(products))
        case .failure(let e):
            productsViewModelDelegate.productsData(result: Result.failure(e))
        }
    }
    
}
