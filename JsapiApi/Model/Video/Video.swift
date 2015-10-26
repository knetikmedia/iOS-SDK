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
    
    public var author : SimpleUser!
    public var authored : Int!
    public var contributors : [Contributor]!
    public var created : Int!
    public var embed : String!
    public var videoExtension : String!
    public var height : Int!
    public var videoId : Int!
    public var length : Int!
    public var location : String!
    public var longDescription : String!
    public var mimeType : String!
    public var name : String!
    public var shortDescription : String!
    public var size : Int!
    public var updated : Int!
    public var uploader : Artist!
    public var width : Int!
    
    


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
		videoId = dictionary["id"] as? Int
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
	public func toDictionary() -> NSDictionary
	{
		let dictionary = NSMutableDictionary()
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
		if videoId != nil{
			dictionary["id"] = videoId
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