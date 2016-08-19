//
//  ShuffleStrings.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func shuffleStrings(s1 s1: String, s2: String, shuffle: String) -> Bool {
        
        var s1Index = s1.startIndex
        var s2Index = s2.startIndex
        
        if s1.isEmpty && s2.isEmpty && shuffle.isEmpty {
            return true
        }
        
        if (s1.characters.count + s2.characters.count) != shuffle.characters.count {
            return false
        }
        
        for character in shuffle.characters {
            if character == s1[s1Index] {
                if s1Index != s1.endIndex.predecessor() {
                    s1Index = s1Index.successor()
                }
            } else if character == s2[s2Index] {
                if s2Index != s2.endIndex.predecessor() {
                    s2Index = s2Index.successor()
                }
            } else {
                return false
            }
            
        }
        return true
    }

}

    