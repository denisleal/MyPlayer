//
//  Channel.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-29.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

struct Channel {
    
    struct Info {
        let id: String
        let name: String
        let logo: String
        let group: String
    }
    
    let title: String
    let url: String
    let info: Info
}
