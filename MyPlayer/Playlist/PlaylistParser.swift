//
//  PlaylistParser.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-29.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

struct PlaylistParser {
    
    static func parse(_ string: String) -> [Channel] {
        var channels: [Channel] = []
        let substrings = string.components(separatedBy: "#EXTINF:")
            .dropFirst()
            .map {
                $0.replacingOccurrences(of: "\r\n", with: ",").dropLast()
            }
        for substring in substrings {
            let channelString = String(substring)
            let parts = channelString.match("tvg-id=\"(.*)\" tvg-name=\"(.*)\" tvg-logo=\"(.*)\" group-title=\"(.*)\",(.*),(.*)")
            let title = parts[5]
            let url = parts[6]
            let info = Channel.Info(id: parts[1],
                                    name: parts[2],
                                    logo: parts[3],
                                    group: parts[4])
            let channel = Channel(title: title, url: url, info: info)
            channels.append(channel)
        }
        return channels
    }
}
