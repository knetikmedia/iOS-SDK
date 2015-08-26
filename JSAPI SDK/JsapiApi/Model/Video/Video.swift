//
//	Result.swift
//
//	Create by Youssef on 25/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Video :NSObject{

    override public init() {
        super.init()
    }
    
	var author : SimpleUser!
	var authored : Int!
	var contributors : [Contributor]!
	var created : Int!
	var embed : String!
	var videoExtension : String!
	var height : Int!
	var id : Int!
	var length : Int!
	var location : String!
	var longDescription : String!
	var mimeType : String!
	var name : String!
	var shortDescription : String!
	var size : Int!
	var updated : Int!
	var uploader : Artist!
	var width : Int!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		author = dictionary["author"] as? SimpleUser!
		authored = dictionary["authored"] as? Int
		contributors = [Contributor]()
		if let contributorsArray = dictionary["contributors"] as? [NSDictionary]{
			for dic in contributorsArray{
				let value = Contributor(fromDictionary: dic)
				contributors.append(value)
			}
		}
		created = dictionary["created"] as? Int
		embed = dictionary["embed"] as? String
		videoExtension = dictionary["extension"] as? String
		height = dictionary["height"] as? Int
		id = dictionary["id"] as? Int
		length = dictionary["length"] as? Int
		location = dictionary["location"] as? String
		longDescription = dictionary["longDescription"] as? String
		mimeType = dictionary["mime_type"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["shortDescription"] as? String
		size = dictionary["size"] as? Int
		updated = dictionary["updated"] as? Int
		if let uploaderData = dictionary["uploader"] as? NSDictionary{
			uploader = Artist(fromDictionary: uploaderData)
		}
		width = dictionary["width"] as? Int
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if author != nil{
			dictionary["author"] = author.toDictionary()
		}
		if authored != nil{
			dictionary["authored"] = authored
		}
		if contributors != nil{
			var dictionaryElements = [NSDictionary]()
			for contributorsElement in contributors {
				dictionaryElements.append(contributorsElement.toDictionary())
			}
			dictionary["contributors"] = dictionaryElements
		}
		if created != nil{
			dictionary["created"] = created
		}
		if embed != nil{
			dictionary["embed"] = embed
		}
		if videoExtension != nil{
			dictionary["extension"] = videoExtension
		}
		if height != nil{
			dictionary["height"] = height
		}
		if id != nil{
			dictionary["id"] = id
		}
		if length != nil{
			dictionary["length"] = length
		}
		if location != nil{
			dictionary["location"] = location
		}
		if longDescription != nil{
			dictionary["longDescription"] = longDescription
		}
		if mimeType != nil{
			dictionary["mime_type"] = mimeType
		}
		if name != nil{
			dictionary["name"] = name
		}
		if shortDescription != nil{
			dictionary["shortDescription"] = shortDescription
		}
		if size != nil{
			dictionary["size"] = size
		}
		if updated != nil{
			dictionary["updated"] = updated
		}
		if uploader != nil{
			dictionary["uploader"] = uploader.toDictionary()
		}
		if width != nil{
			dictionary["width"] = width
		}
		return dictionary
	}

}