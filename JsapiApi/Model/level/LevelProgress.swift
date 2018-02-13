//
//  LevelProgress.swift
//  JsapiApi
//
//  Created by youssef on 2/14/18.
//  Copyright © 2018 Knetik. All rights reserved.
//

import Foundation


open class LevelProgress : BaseResponse{

    var lastTierName : String!
    var lastTierProgress : NSNumber!
    var levelName : String!
    var nextTierName : NSDictionary!
    var nextTierProgress : NSDictionary!
    var progress : NSNumber!
    var tierNames : [String]!
    var userId : NSNumber!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        lastTierName = dictionary["last_tier_name"] as? String
        lastTierProgress = dictionary["last_tier_progress"] as? NSNumber
        levelName = dictionary["level_name"] as? String
        nextTierName = dictionary["next_tier_name"] as? NSDictionary
        nextTierProgress = dictionary["next_tier_progress"] as? NSDictionary
        progress = dictionary["progress"] as? NSNumber
        tierNames = dictionary["tier_names"] as? [String]
        userId = dictionary["user_id"] as? NSNumber
    }

}
