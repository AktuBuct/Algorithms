//
//  Node+Connection.swift
//  Algorithms
//
//  Created by AktuBuct on 27.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

class Node {

    let name: String
    var visited = false
    var connections = [Connection]()

    init(name: String) {
        self.name = name
    }

    static func nodesForTest() -> [Node] {

        let a = ("a" as UnicodeScalar).value
        let end = a + 28 // "z" as UnicodeScalar

        var nodes = [Node]()

        for char in a...end {
            nodes += [Node(name: String(UnicodeScalar(char)!))]
        }

        for node in nodes {

            let connectionsCounts = arc4random() % 4 + 1

            for _ in 0...connectionsCounts {

                let connectionWeight = arc4random() % 35
                let connectionNodeIndex = Int(arc4random()) % nodes.count
                let connection = Connection(destination: nodes[connectionNodeIndex], weight: connectionWeight)
                node.connections.append(connection)
            }
        }

        return nodes
    }

}

struct Connection {

    var weight: uint
    var destination: Node

    init(destination: Node, weight: uint = 0) {
        self.destination = destination
        self.weight = weight
    }

}
