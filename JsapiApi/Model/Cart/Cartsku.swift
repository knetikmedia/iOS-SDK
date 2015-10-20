//
//	Cartsku.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class Cartsku:NSObject{

	var sku : String!
    var skus:Array<String>!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		sku = dictionary["skus"] as? String
        if sku != nil {
        self.skus=self.sku.componentsSeparatedByString(",")
        }
	}

}