//
//	DonateMessage.swift
import Foundation

open class GeneralAdditionalObject:NSObject{

	open var type : String!
	open var value : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		type = dictionary["type"] as? String
		value = dictionary["value"] as? String
	}

}
