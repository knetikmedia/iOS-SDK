//
//	Thumbnail.swift
import Foundation

public class CategoryThumbnail:NSObject{

	open var crc : AnyObject!
	open var maindescription : String!
	open var fileType : String!
	open var type : String!
	open var url : String!

    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		crc = dictionary["crc"] as? AnyObject
		maindescription = dictionary["description"] as? String
		fileType = dictionary["file_type"] as? String
		type = dictionary["type"] as? String
		url = dictionary["url"] as? String
	}


}
