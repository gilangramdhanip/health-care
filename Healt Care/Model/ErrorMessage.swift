//
//  Error.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation


public struct ErrorMessage : Decodable {
    let error : String
    
    enum CodingKeys: String, CodingKey {
        case error = "error"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        error = try container.decodeIfPresent(String.self, forKey: .error) ?? ""
    }
}
