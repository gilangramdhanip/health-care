//
//  Login.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation

public struct Login : Decodable {
    let email : String
    let password : String
    
    enum CodingKeys: String, CodingKey {
        case email = "email"
        case password = "password"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        email = try container.decodeIfPresent(String.self, forKey: .email) ?? ""
        password = try container.decodeIfPresent(String.self, forKey: .password) ?? ""
    }
}
