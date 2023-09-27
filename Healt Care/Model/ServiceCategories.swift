//
//  ServiceCategories.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 24/09/23.
//

import Foundation

public struct ServiceCategories : Decodable {
    let id : String
    let name : String
    let services: [Service]
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case services = "services"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        services = try container.decodeIfPresent([Service].self, forKey: .services) ?? []
    }
}
