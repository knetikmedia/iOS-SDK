//
//	Behavior.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Behavior:NSObject{

	public var displayable : Bool!
	public var endDate : AnyObject!
	public var behaviorId : NSNumber!
	public var startDate : AnyObject!
	public var typeHNSNumber : String!

    
    public func getDisplayable()->Bool{
        return displayable;
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		displayable = dictionary["displayable"] as? Bool
		endDate = dictionary["end_date"] as AnyObject!
		behaviorId = dictionary["id"] as? NSNumber
		startDate = dictionary["start_date"] as AnyObject!
		typeHNSNumber = dictionary["type_hNSNumber"] as? String
	}
    
}