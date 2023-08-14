//
//  ProductsCell.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import UIKit
import SDWebImage

//MARK: - TableView Cell
class ProductsCell: UITableViewCell {

    static let identifier = "ProductsCell"
    
    @IBOutlet weak var imgProducts: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblProducer: UILabel!
    
    @IBOutlet weak var lblPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUI(name: String, producer:String, price:Int, imgURL:String){
        
        self.lblName?.text = name
        self.lblProducer?.text = producer
        self.lblPrice?.text = "Rs: " + String(price)
        self.setImage(url: imgURL)
        
    }
    
    func setImage(url: String){
        self.imgProducts.sd_setImage(with: URL(string: url)) { (image, error, cacheType, url) in
            if let e = error{
                print(e)
            }
            else{
                print("Image Set")
            }
        }
    }
}
