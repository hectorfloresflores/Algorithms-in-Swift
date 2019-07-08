//
//  FindAllTriplets.swift
//  Test
//
//  Created by Héctor Flores on 7/3/19.
//  Copyright © 2019 Héctor Flores. All rights reserved.
//

import Foundation



public func getPairs(theList list: [Int],theValue value:Int,_ val:Int,_ actual:[Int]) -> [[Int]] {
    
    var mylistOfPairs =  [[Int]]() 
    var left = 0, right = list.count - 1
    var count = 0
    while left < right {
        
        let sum = list[right] + list[left]
        if sum == value{
            let auxList = [actual[left+val],actual[right+val],actual[val-1]]
            mylistOfPairs.append(auxList)
            break;
            count += 1
            right -= 1
            left += 1
        }else if(sum > value){
            right -= 1
        }else{
            left  += 1
        }
    }
    
    return mylistOfPairs
    
}



public func getTriplets(theList list: inout [Int], theValue value: Int) -> [[Int]]{
    
    if list.count < 4 {
        if list.count == 3 && (list[0] + list[1] + list[2]) == 0{
           return [list]
        }else{
        return []
        }
    }
    
    list.sort()
    
    var listOfLists : [[Int]] = []
    let range = list[0...list.count-3]
    
    var emptyDict: [[Int]: Bool] = [:]
    
    for (a,b) in  range.enumerated() {
        
        let rest = value - b
        let sublist = Array(list[a+1...list.count-1])
        
        var left = 0, right = sublist.count - 1
      
        while left < right {
            
            let sum = sublist[right] + sublist[left]
            if sum == rest{
                let auxList = [list[left+a+1],list[right+a+1],list[a]]
                if emptyDict[auxList] == nil {
                    emptyDict.updateValue(true, forKey: auxList)
                    listOfLists.append(auxList)
                }
          
             
                right -= 1
                left += 1
            }else if(sum > rest){
                right -= 1
            }else{
                left  += 1
            }
        
    
        }
    }
    
    
    
    return listOfLists
}
