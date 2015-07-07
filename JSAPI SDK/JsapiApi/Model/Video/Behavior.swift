//
//	Behavior.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Behavior{

	var displayable : Bool!
	var endDate : AnyObject!
	var id : Int!
	var startDate : AnyObject!
	var typeHint : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		displayable = dictionary["displayable"] as? Bool
		endDate = dictionary["end_date"] as AnyObject!
		id = dictionary["id"] as? Int
		startDate = dictionary["start_date"] as AnyObject!
		typeHint = dictionary["type_hint"] as? String
	}
    
}