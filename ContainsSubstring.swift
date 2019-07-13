//
//  ContainsSubstring.swift
//  Test
//
//  Created by Héctor Flores on 7/12/19.
//  Copyright © 2019 Héctor Flores. All rights reserved.
//

import Foundation

extension String {
    func subs(i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
}

public func containsSubstring(_ word: String, _ pattern: String) -> Bool {
    
    for i in 0..<word.count {
        
//        let c = word.subs(i: i)
//        let g = pattern.subs(i: 0)
        let c = word.subs(i: i)
        let g = pattern.subs(i: 0)
        
        if c == g {
            
            var value = 0
            var a = i+1
            var b = 1
            while a < pattern.count && b < pattern.count {
                
                value += 1
                
                if word.index(ofAccessibilityElement: a) != pattern.index(ofAccessibilityElement: b){

                    return false;
                    
                }
                a += 1
                b += 1
            }
            
            if value == pattern.count-1 {
                return true;
            }
            
        }
        
    }
    
    return false;
}


