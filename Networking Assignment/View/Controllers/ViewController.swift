//
//  ViewController.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import UIKit
import Alamofire

//MARK: - ViewController
class ViewController: UIViewController{
    
    //MARK: - IBOutlets
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    @IBOutlet weak var productsTableView: UITableView!
    
    //MARK: - Properties
    var products: Products?
    let productViewModel = ProductsViewModel()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        loader.startAnimating()
        sleep(2)
        productViewModel.bringData()
        cellRegister()
        setDelegates()
        
    }
    
    func setDelegates(){
        
        productViewModel.productsViewModelDelegate = self
        productsTableView.dataSource = self
        productsTableView.delegate = self
        
    }
    
    func cellRegister(){
//        productsTableView.register(ProductsCell.self, forCellReuseIdentifier: ProductsCell.identifier)
    }
    
    func errorDisplay(msg:String){
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: .alert)
                 
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { _ in
               }))
        self.present(alert, animated: false, completion: nil)
    }
}

//MARK: - TableView Delegate and DataSource
extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products?.data.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductsCell.identifier, for: indexPath) as! ProductsCell
//        debugPrint(products?.data)
        cell.setUI(name: products?.data[indexPath.row].name ?? "", producer: products?.data[indexPath.row].producer ?? "", price: products?.data[indexPath.row].cost ?? 0, imgURL: products?.data[indexPath.row].productImages ?? "")
        return cell
    }
    
}

//MARK: - ViewModel Delegate
extension ViewController:ProductsViewModelDelegate {
    
    func productsData(result: Result<Products, Error>) {
        
        DispatchQueue.main.async {
            switch result{
            case .success(let products):
                self.products = products
                self.loader.stopAnimating()
                self.productsTableView.reloadData()
                self.errorDisplay(msg: "Loaded all the Data")
            case .failure(let e):
                self.errorDisplay(msg: "Got \(e.localizedDescription)")
            }
        }
        print("reloaded")
    }
}
