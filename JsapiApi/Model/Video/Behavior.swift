//
//	Behavior.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Behavior:NSObject{

	open var displayable : Bool!
	open var endDate : AnyObject!
	open var behaviorId : NSNumber!
	open var startDate : AnyObject!
	open var typeHNSNumber : String!
    var fulfillmentTypeName : String!
    var typeHint : String!

    
    open func getDisplayable()->Bool{
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
		typeHNSNumber = dictionary["type_h_number"] as? String
        fulfillmentTypeName = dictionary["fulfillment_typeName"] as? String
        typeHint = dictionary["typeHint"] as? String

	}
    
}
