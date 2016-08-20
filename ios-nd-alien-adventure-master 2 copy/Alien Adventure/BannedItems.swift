//
//  BannedItems.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//

import Foundation

extension Hero {
    
    func bannedItems(dataFile: String) -> [Int] {
        
        var banned = [Int]()
        
        let itemPlistURL = NSBundle.mainBundle().URLForResource("ItemList", withExtension: "plist")!
        
        let itemsArray = NSArray(contentsOfURL: itemPlistURL) as! [[String:AnyObject]]
        
        for item in itemsArray {
            if let itemID = item["ItemID"] as? Int {
                if let name = item["Name"] as? String where name.localizedCaseInsensitiveContainsString("laser") {
                    if let historicalData = item["HistoricalData"] as? [String:AnyObject]  {
                        if let carbonAge = historicalData["CarbonAge"] as? Int where carbonAge < 30 {
                            banned.append(itemID)
                        }
                    }
                }
            }            
        }
        
        return banned
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 6"