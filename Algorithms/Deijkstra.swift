//
//  Deijkstra.swift
//  Algorithms
//
//  Created by AktuBuct on 27.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

private class Path {

    let summaryWeight: uint
    let lastPath: Path?
    let node: Node

    init(to node: Node, withWeight connectionWeight: uint?, lastPath: Path?) {

        if connectionWeight != nil && lastPath != nil {
            self.summaryWeight = lastPath!.summaryWeight + connectionWeight!
        } else {
            self.summaryWeight = 0
        }

        self.node = node
        self.lastPath = lastPath
    }

    func fullPath() -> [String]? {

        var result = [node.name]
        var path = lastPath

        while path != nil {
            result += [path!.node.name]
            path = path?.lastPath
        }
        return result.reversed()
    }

}

class Deijkstra  {

    private func shortWay(from sourceNode: Node, to destinationNode: Node) -> Path? {

        var pathsArray = [Path(to: sourceNode, withWeight: nil, lastPath: nil)]

        while !pathsArray.isEmpty {

            pathsArray.sort{ $0.summaryWeight < $1.summaryWeight }

            let cheapestWay = pathsArray.removeFirst()

            if cheapestWay.node.visited {
                continue
            } else {

                if cheapestWay.node === destinationNode {
                    return cheapestWay
                }

                cheapestWay.node.visited = true

                for connection in cheapestWay.node.connections where !connection.destination.visited {
                    pathsArray += [Path.init(to: connection.destination, withWeight: connection.weight, lastPath: cheapestWay)]
                }
            }
        }
        return nil
    }


    func play(from sourceNode: Node, to destinationNode: Node) {

        let path = shortWay(from: sourceNode, to: destinationNode)

        if let pathString: [String] = path?.fullPath() {
            print("Short path is: \(pathString)")
        } else {
            print("No path between \(sourceNode.name) and \(destinationNode.name)")
        }
    }

}


