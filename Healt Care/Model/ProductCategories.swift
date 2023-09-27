//
//  ProductCategories.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import Foundation

public struct ProductCategories : Decodable {
    let id : String
    let name : String
    let products: [Product]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case products = "producs"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        products = try container.decodeIfPresent([Product].self, forKey: .products) ?? []
    }
}
