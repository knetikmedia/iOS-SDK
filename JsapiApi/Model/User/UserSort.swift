//
//	Sort.swift
import Foundation

open class UserSort :NSObject{

	open var ascending : NSNumber!
	open var descending : NSNumber!
	open var direction : String!
	open var ignoreCase : NSNumber!
	open var nullHandling : String!
	open var property : String!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		ascending = dictionary["ascending"] as? NSNumber
		descending = dictionary["descending"] as? NSNumber
		direction = dictionary["direction"] as? String
		ignoreCase = dictionary["ignore_case"] as? NSNumber
		nullHandling = dictionary["null_handling"] as? String
		property = dictionary["property"] as? String
	}

}
