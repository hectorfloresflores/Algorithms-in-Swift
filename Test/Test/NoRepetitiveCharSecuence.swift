//
//  NoRepetitiveCharSecuence.swift
//  Test
//
//  Created by Héctor Flores on 7/8/19.
//  Copyright © 2019 Héctor Flores. All rights reserved.
//


// Given a string of letters from a to z write a function that test if
// this string has state where a letter can not repetive more than one in secuence
// Eg. input : "aaabbacadf" Result = true, becasue "ababacadaf"
import Foundation


public func function(theString str: String) -> Bool {
    
    //HashMap for storing the letter and its frecuency
    var map : [Character:Int] = [:]
    // Lets have the max Val of frecuency
    var maxFrecuency : Int = 0
    // Lets have the letter of max Frecuency
    var letter : Character = " "
    //Lets have a list of lists
    var secuence : [[Character]] = []
    //Fill the hash map with letters and frecuencies
    for (_,b) in str.enumerated() {

        let mapValue = map[b]
        
        if map[b] == nil {
            map.updateValue(1, forKey: b)
        }else{
            
            if mapValue! > maxFrecuency {
                maxFrecuency = mapValue! + 1
                letter = b
            }
            
            map.updateValue(mapValue!+1, forKey: b)
        }
        
    }
    
    var counter = maxFrecuency
    while counter > 0 {
        secuence.append([letter])
        counter -= 1
    }
    
    map.updateValue(0, forKey: letter)
    
    var countUp = 0
    
    for (a,b) in map.enumerated() {
        
        var count = b.value
        
        
        while count > 0 {
            secuence[countUp].append(b.key)
            
            count -= 1
            countUp += 1
            
            if countUp >= maxFrecuency {
                countUp = 0
            }
        }
        
       
        
    }
    
    var auxstr = ""
    var auxLetter :Character = " "
    
    for i in 0..<secuence.count {

        for j in 0..<secuence[i].count {
            letter = secuence[i][j]
           // auxstr = auxstr + String(letter)
            if auxLetter == letter {
            return false
            }
            auxstr = auxstr + String(letter)
            auxLetter = letter

        }
        
    }
    
    
    return true
}
