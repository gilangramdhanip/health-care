//
//  Service.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import Foundation

public struct Service : Decodable {
    let id : String
    let name : String
    let price: Double
    let hospitalName: String
    let location: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case price = "price"
        case hospitalName = "hospital_name"
        case location = "location"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        price = try container.decodeIfPresent(Double.self, forKey: .price) ?? 0.0
        hospitalName = try container.decodeIfPresent(String.self, forKey: .hospitalName) ?? ""
        location = try container.decodeIfPresent(String.self, forKey: .location) ?? ""
    }
}
