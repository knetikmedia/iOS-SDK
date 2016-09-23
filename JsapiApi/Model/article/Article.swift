//
//	Content.swift
//
//	Create by Youssef on 18/3/2016
//	Copyright © 2016. All rights reserved.
import Foundation

open class Article : NSObject{

	open var active : Bool!
	open var assets : [Asset]!
	open var body : String!
	open var category : CategoryObject!
	open var created : NSNumber!
	open var id : String!
	open var tags : [NSDictionary]!
	open var title : String!
	open var updated : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		active = dictionary["active"] as? Bool
		assets = [Asset]()
		if let assetsArray = dictionary["assets"] as? [NSDictionary]{
			for dic in assetsArray{
				let value = Asset(fromDictionary: dic)
				assets.append(value)
			}
		}
		body = dictionary["body"] as? String
		if let categoryData = dictionary["category"] as? NSDictionary{
			category = CategoryObject(fromDictionary: categoryData)
		}
		created = dictionary["created"] as? NSNumber
		id = dictionary["id"] as? String
		tags = [NSDictionary]()
		if let tagsArray = dictionary["tags"] as? [NSDictionary]{
			for dic in tagsArray{
				let value = dic
				tags.append(value)
			}
		}
		title = dictionary["title"] as? String
		updated = dictionary["updated"] as? NSNumber
	}

	}
