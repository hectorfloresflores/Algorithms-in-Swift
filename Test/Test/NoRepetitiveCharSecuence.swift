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
        //Check if the max with certain letter has no frecuency
        if map[b] == nil {
            //Update value of 1 beacuse is the first time we put a letter
            map.updateValue(1, forKey: b)
        }else{
            //Always keep recording the maxValue and the certain letter
            if mapValue! > maxFrecuency {
                //Plus one because the first time the program reach this line will be 2 times that letter
                maxFrecuency = mapValue! + 1
                //Save the letter with the max Frecuency
                letter = b
            }
            //Updating the map
            map.updateValue(mapValue!+1, forKey: b)
        }
        
    }
    
    // Lets duplicate the value of max frecuency because we need it to create the list
    var counter = maxFrecuency
    
    // Until counter reaches zero append a new list into the list of lists
    while counter > 0 {
        secuence.append([letter])
        counter -= 1
    }
    
    //Update value to zero of the most used letter
    map.updateValue(0, forKey: letter)
    
    //Create variable that will help us fill all the list properly
    var countUp = 0
    
    // Iterate through the map
    for (_,b) in map.enumerated() {
        
        //Store the frecuency of certain letter to fill the lists
        var count = b.value
        
        //Until count is greater than 0 keep appending values
        while count > 0 {
            
            secuence[countUp].append(b.key)
            //Decrease by one because we added a letter
            count -= 1
            //Increase countUp beacuse we dont want to exceed the length of the greater letter list
            countUp += 1
            //If countUp exceed the limit maxFrecuency
            //reset countUp to keep appending from 0 to n list position
            if countUp >= maxFrecuency {
                countUp = 0
            }
        }
        
    }
    
    //Create an aux variable to store the past letter
    var auxLetter :Character = " "
    
    //Here we are going to iterate thro the list of list
    for i in 0..<secuence.count {

        for j in 0..<secuence[i].count {
            //Get the letter
            letter = secuence[i][j]
            //If the actual letter is the same to the past letter return false
            if auxLetter == letter {
            return false
            }
            //Save actual letter beacuse we will need it later
            auxLetter = letter

        }
        
    }
    
    return true
}
