import Foundation

/*
 This class has a function that receive a sorted list of numbers and
 a value. Find two numbers that the sum of it would be a certain value
 
 
 */

public struct Solution {
    
     var indexA:Int
     var indexB:Int
    
    
}

public func getNumbers(theList list: [Int],theValue value:Int) -> [Solution] {

    var mylistOfPairs : [Solution] = []   
    var left = 0, right = list.count - 1
    
    while left < right {
        
        let sum = list[right] + list[left]
        if sum == value{
           
            mylistOfPairs.append(Solution(indexA: left, indexB: right))
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
