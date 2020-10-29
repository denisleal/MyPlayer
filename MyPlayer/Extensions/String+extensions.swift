//
//  String+extensions.swift
//  MyPlayer
//
//  Created by Denis Leal on 2020-10-29.
//  Copyright © 2020 Denis Leal. All rights reserved.
//

import Foundation

extension String {
    func match(_ pattern: String) -> RegexMatches {
        do {
            let nsstring = self as NSString
            let expression = try NSRegularExpression(pattern: pattern, options: [])

            var matches = [String]()
            expression.enumerateMatches(in: self, options: [], range: NSRange(location: 0, length: nsstring.length)) { (result, _, _) -> () in
                guard let result = result else {
                    return
                }

                for i in 0..<result.numberOfRanges {
                    let subMatch = nsstring.substring(with: result.range(at: i))
                    matches.append(subMatch)
                }
            }

            return matches.isEmpty ? RegexMatches(items: []) : RegexMatches(items: matches)
        } catch {
            return RegexMatches(items: [])
        }
    }
}

struct RegexMatches: Sequence {
    var items: [String]
    
    struct Generator: IteratorProtocol {
        var items: ArraySlice<String>
        mutating func next() -> String? {
            if self.items.isEmpty {
                return nil
            }
            return self.items.popFirst()
        }
    }
    
    func makeIterator() -> Generator {
        return Generator(items: items[0..<items.count])
    }
    
    subscript(i: Int) -> String {
        return items[i]
    }
}
