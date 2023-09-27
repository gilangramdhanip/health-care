//
//  LoginViewModel.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation

class LoginViewModel: NSObject {
    private var apiService = APIService()
    
    func login(email: String, password: String, completion: @escaping (Credential) -> Void) {
        apiService.login(email: email, password: password, completion: { [weak self] (result) in
            switch result {
            case .success(let token):
                print("Result data: \(token)")
                completion(token)
            case.failure(let error):
                print("Error processing json data: \(error)")
            }
        })
    }
}
