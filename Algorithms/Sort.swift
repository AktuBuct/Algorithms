//
//  Sort.swift
//  Algorithms
//
//  Created by AktuBuct on 27.03.2018.
//  Copyright © 2018 AktuBuct. All rights reserved.
//

import Foundation

class QuickSort {

    func sort<T: Comparable>(list: [T]) -> [T] {

        var result = list
        quickSort(list: &result, startIndex: 0, endIndex: list.count)
        return result
    }

    private func quickSort<T: Comparable>(list: inout [T], startIndex: Int, endIndex: Int) {

        if endIndex - startIndex < 2 {
            return
        }

        let pivot = list[(endIndex + startIndex) / 2]
        var low = startIndex
        var high = endIndex - 1

        while low <= high {

            if list[low] < pivot {
                low += 1
                continue
            }

            if list[high] > pivot {
                high -= 1
                continue
            }

            let temp = list[low]
            list[low] = list[high]
            list[high] = temp

            low += 1
            high -= 1
        }
        quickSort(list: &list, startIndex: startIndex, endIndex: high + 1)
        quickSort(list: &list, startIndex: high + 1, endIndex: endIndex)
    }

}

class CountSort {

    func sort(list: [Int]) -> [Int] {

        var maxValue = 0
        list.forEach { maxValue = maxValue > $0 ? maxValue : $0 }

        var indexesArray = Array(repeating: 0, count: maxValue + 1)
        list.forEach { indexesArray[$0] += 1 }

        var result = [Int]()

        for i in 0..<indexesArray.count {
            result += Array(repeating:i , count: indexesArray[i])
        }

        return result
    }

}

class BubleSort {

    func sort<T: Comparable>(list: [T]) -> [T] {
        var list = list
        var lastIndex = list.count - 1

        for _ in list {

            for j in 0..<lastIndex {
                if list[j] > list[j + 1] {
                    let temp = list[j]
                    list[j] = list[j + 1]
                    list[j + 1] = temp
                }
            }

            lastIndex -= 1
        }
        return list
    }

}

class MergeSort {

    func sort<T: Comparable>(list: [T]) -> [T] {

        if list.count < 2 {
            return list
        }

        let pivot = list.count / 2
        return  merge(first: sort(list:Array(list[0..<pivot])),
                      second: sort(list: Array(list[pivot..<list.count])))
    }

    private func merge<T: Comparable>(first: [T], second: [T]) -> [T] {

        if first.count == 0 {
            return second
        }

        if second.count == 0 {
            return first
        }

        if first.first! < second.first! {
            return [first.first!] + merge(first: Array(first[1..<first.count]), second: second)
        } else {
            return [second.first!] + merge(first: first, second: Array(second[1..<second.count]))
        }
    }

}
