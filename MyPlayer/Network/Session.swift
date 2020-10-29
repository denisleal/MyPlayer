//
//  Session.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-28.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

enum Result {
    case success(Data)
    case error(MyPlayerError.APIError)
    
    var value: Data? {
        if case .success(let value) = self {
            return value
        }
        return nil
    }
    
    var error: MyPlayerError.APIError? {
        if case .error(let error) = self {
            return error
        }
        return nil
    }
}

final class Session {
    private let session = URLSession(configuration: .default)
    
    func load(url: String, completion: @escaping (Result) -> ()) {
        guard let url = URL(string: url) else { return }
        let task = session.dataTask(with: url) {  (responseData, response, responseError) in
            let response = response as? HTTPURLResponse
            if let responseError = responseError {
                completion(.error(.error(responseError)))
            } else if let response = response {
                let acceptRange = 200..<300
                if acceptRange.contains(response.statusCode) {
                    completion(.success(responseData ?? Data()))
                } else {
                    completion(.error(.unacceptableStatusCode(response.statusCode)))
                }
            } else {
                completion(.error(.badResponse))
            }
        }
        task.resume()
    }
}
