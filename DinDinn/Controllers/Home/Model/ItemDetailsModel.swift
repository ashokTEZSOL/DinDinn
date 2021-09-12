//
//  ItemDetailsModel.swift
//  DinDinnTest
//
//  Created by apple on 10/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation

protocol productPrictProtocol {
    var priceString : String {get}
    var weightString : String {get}
    var quantityString : String {get}
}

struct ProductDetailsModel :  Codable, productPrictProtocol{
    
    var productId: Int!
    var title : String?
    var description : String?
    var image : String?
    var price : Float?
    var weight : Float?
    var quantity : Float?
    
    var priceString: String {
        return String(format: "%.0f", price ?? 0)
    }
    
    var quantityString: String {
        return String(format: "%.0f", quantity ?? 0)
    }
    
    var weightString : String {
        return String(format: "%.0f", weight ?? 0)
    }
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.productId = try? container.decode(Int.self, forKey: .productId)
        self.title = try? container.decode(String.self, forKey: .title)
        self.description = try? container.decode(String.self, forKey: .description)
        self.image = try? container.decode(String.self, forKey: .image)
        if let price = try? container.decode(Int.self, forKey: .price) {
            self.price = Float(price)
        } else if let price = try? container.decode(Float.self, forKey: .price) {
            self.price = price
        }
        if let weight = try? container.decode(Int.self, forKey: .weight) {
            self.weight = Float(weight)
        } else if let weight = try? container.decode(Float.self, forKey: .weight) {
            self.weight = weight
        }
        if let quantity = try? container.decode(Int.self, forKey: .quantity) {
            self.quantity = Float(quantity)
        } else if let quantity = try? container.decode(Float.self, forKey: .quantity) {
            self.quantity = quantity
        }
        
    }
}
