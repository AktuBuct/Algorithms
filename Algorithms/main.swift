//
//  main.swift
//  Algorithms
//
//  Created by AktuBuct on 27.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

func sortMethods() {

    let list = [1,3,450,2,80,4,6,2,56,450,34,23,56,75]
    print(list)

    print(QuickSort().sort(list: list))
    print(CountSort().sort(list: list))
    print(BubleSort().sort(list: list))
    print(MergeSort().sort(list: list))
}

func searchMethods() {

    let nodes = Node.nodesForTest()

    Search().wideSearch(value: nodes[Int(arc4random()) % nodes.count].name, firstNode: nodes[Int(arc4random()) % nodes.count])

    Deijkstra().play(from: nodes[Int(arc4random()) % nodes.count], to: nodes[Int(arc4random()) % nodes.count])

}

sortMethods()
searchMethods()
