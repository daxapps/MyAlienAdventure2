//
//  MatchMoonRocks.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 9/30/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

extension Hero {
    
    func matchMoonRocks(inventory: [UDItem]) -> [UDItem] {
        
        var itemWithMR = [UDItem]()
        
        if inventory.count != 0 {
            
            for item in inventory {
                
                if item.name == "MoonRock" {
                    
                    itemWithMR.append(item)
                }
            }
        }
        return [UDItem](itemWithMR)
    
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 2"