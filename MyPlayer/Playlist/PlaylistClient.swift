//
//  NetworkClient.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-29.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

struct PlaylistClient {
    private let session = Session()
    
    func load(for url: String, completion: @escaping ([Channel], Error?) -> Void) {
        session.load(url: url) { (result) in
            switch result {
            case .error(let error):
                completion([], error)
            case .success(let data):
                guard let string = String(data: data, encoding: .utf8) else {
                    completion([], MyPlayerError.ParserError.malformedResponse)
                    return
                }
                completion(PlaylistParser.parse(string), nil)
            }
        }
    }
}
