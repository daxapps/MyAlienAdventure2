//
//  MostCommonCharacter.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func mostCommonCharacter(inventory: [UDItem]) -> Character? {
        
        var mostCommonCharacter: Character = "a"
        var arrayOfCharacters: [Character?] = []
        var characterCounts: [Character: Int] = [:]
        var maxValue = 0        
        
        if inventory.isEmpty {
            return nil
        } else {
            
            for item in inventory {
                for character in item.name.lowercaseString.characters {
                    arrayOfCharacters.append(character)
                }
            }
            
            for character in arrayOfCharacters {
                characterCounts[character!] = (characterCounts[character!] ?? 0) + 1
            }
            
            for (letter, number) in characterCounts {
                if number > maxValue {
                    maxValue = number
                    mostCommonCharacter = letter
                }
            }
            
            return mostCommonCharacter
        }
    }
    
}

