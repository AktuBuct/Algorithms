//
//  Search.swift
//  Algorithms
//
//  Created by AktuBuct on 27.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

class Search {

    init() {

    }

    func wideSearch(value serachingValue: String, firstNode: Node) {

        var visited = Set<String>()
        var queue = [firstNode]
        var result: Node?
        var count = 0

        while result == nil && queue.count > 0 {

            count += 1

            let node = queue.removeFirst()
            visited.insert(node.name)

            if node.name == serachingValue { result = node; break }

            for connection in node.connections {
                if !visited.contains(connection.destination.name) {
                    queue += [connection.destination]
                }
            }
        }

        print(result != nil ? "node \"" + result!.name + "\" was found after \(count) steps" : "no objects")
    }
}
