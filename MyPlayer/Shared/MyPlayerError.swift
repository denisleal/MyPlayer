//
//  APIError.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-28.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

public enum MyPlayerError: LocalizedError {
    
    public enum APIError: Error {
        case badResponse
        case unacceptableStatusCode(Int)
        case error(Error)
    }
    
    public enum ParserError: Error {
        case malformedResponse
    }
}
