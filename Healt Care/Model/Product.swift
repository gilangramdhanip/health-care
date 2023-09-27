//
//  Product.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import Foundation

public struct Product : Decodable {
    let id : String
    let name : String
    let price: Double
    let isReadyStock: Bool
    let score: Int
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case isReadyStock = "is_ready_stock"
        case score = "score"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
        isReadyStock = try container.decodeIfPresent(Bool.self, forKey: .isReadyStock) ?? false
        score = try container.decodeIfPresent(Int.self, forKey: .score) ?? 0
    }
}
