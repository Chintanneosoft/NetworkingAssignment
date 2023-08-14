//
//  Products.swift
//  Networking Assignment
//
//  Created by Neosoft1 on 11/08/23.
//

import Foundation
import UIKit


// MARK: - Products
struct Products: Codable {
    let status: Int
    let data: [ProductsData]
}

// MARK: - Datum
struct ProductsData: Codable {
    let id, productCategoryID: Int
    let name, producer, description: String
    let cost, rating, viewCount: Int
    let created, modified: String
    let productImages: String

    enum CodingKeys: String, CodingKey {
        case id
        case productCategoryID = "product_category_id"
        case name, producer, description, cost, rating
        case viewCount = "view_count"
        case created, modified
        case productImages = "product_images"
    }
}
