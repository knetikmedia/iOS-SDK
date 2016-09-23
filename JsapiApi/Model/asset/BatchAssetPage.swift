//
//	Result.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class BatchAssetPage : NSObject {

	open var content : [AssetContent]!
	open var first : Bool!
	open var last : Bool!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var sort : AnyObject!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!
	open var batchAssetResponseItem : BatchAssetResponseItem!
	open var code : NSNumber!
	open var uri : String!

    

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		content = [AssetContent]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = AssetContent(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["numberOfElements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		totalElements = dictionary["totalElements"] as? NSNumber
		totalPages = dictionary["totalPages"] as? NSNumber
		if let bodyData = dictionary["body"] as? NSDictionary{
			batchAssetResponseItem = BatchAssetResponseItem(fromDictionary: bodyData)
		}
		code = dictionary["code"] as? NSNumber
		uri = dictionary["uri"] as? String
	}

}
