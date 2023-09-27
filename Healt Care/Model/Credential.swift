//
//  Token.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation

public struct Credential : Decodable {
    let token : String
    
    enum CodingKeys: String, CodingKey {
        case token = "token"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        token = try container.decodeIfPresent(String.self, forKey: .token) ?? ""
    }
}
