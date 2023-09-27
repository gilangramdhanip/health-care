//
//  ApiService.swift
//  Healt Care
//
//  Created by Gilang Ramdhani Putra on 25/09/23.
//

import Foundation

class APIService {
    private var dataTask : URLSessionDataTask?
    private var url = "https://reqres.in/api/"
    
    func login(email: String, password: String, completion : @escaping (Result<Credential, Error>) -> Void) {
        let loginPath = "\(url)login"
        let headers = [
                    "Content-Type": "application/x-www-form-urlencoded"
                ]
        let data : Data = "email=\(email)&password=\(password)&grant_type=password".data(using: .utf8)!
        let request = NSMutableURLRequest(url: NSURL(string: loginPath)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.allHTTPHeaderFields = headers
        request.httpMethod = "POST"
        request.httpBody = data
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error!)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse!)

                do {
                    let credential = try JSONDecoder().decode(Credential.self, from: data!)
                    PersistanceManager.shared.saveUserToken(token: credential.token)
                    DispatchQueue.main.async {
                        completion(.success(credential))
                    }
                    
                } catch {
                    completion(.failure(error))
                }

            }
        })

        dataTask.resume()
    }
}
