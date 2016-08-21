//
//  PlanetData.swift
//  Alien Adventure
//
//  Created by Jarrod Parkes on 10/4/15.
//  Copyright © 2015 Udacity. All rights reserved.
//
import Foundation

extension Hero {
    
    func planetData(dataFile: String) -> String {
        
        var planetScore = Int()
        var planet = String()
        
        enum pointScale: Int {
            case Common = 1
            case Uncommon = 2
            case Rare = 3
            case Legendary = 4
        }
        
        let url = NSBundle.mainBundle().URLForResource(dataFile, withExtension: "json")!
        let rawJSON = NSData(contentsOfURL: url)!
        
        var jsonArray: NSArray!
        do {
            jsonArray = try! NSJSONSerialization.JSONObjectWithData(rawJSON, options: NSJSONReadingOptions()) as! NSArray
        }
        
        for item in jsonArray {
            
            var points = 0
            
            if let item = item as? NSDictionary {
                points += item["CommonItemsDetected"] as! Int * pointScale.Common.rawValue
                points += item["UncommonItemsDetected"] as! Int * pointScale.Uncommon.rawValue
                points += item["RareItemsDetected"] as! Int * pointScale.Rare.rawValue
                points += item["LegendaryItemsDetected"] as! Int * pointScale.Legendary.rawValue
                
                if points > planetScore {
                    planetScore = points
                    planet = item["Name"] as! String
                }
            }
        }
        return planet
    }
}

// If you have completed this function and it is working correctly, feel free to skip this part of the adventure by opening the "Under the Hood" folder, and making the following change in Settings.swift: "static var RequestsToSkip = 7"