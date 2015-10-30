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
    public var authored : NSNumber!
    public var contributors : [Contributor]!
    public var created : NSNumber!
    public var embed : String!
    public var videoExtension : String!
    public var height : NSNumber!
    public var videoId : NSNumber!
    public var length : NSNumber!
    public var location : String!
    public var longDescription : String!
    public var mimeType : String!
    public var name : String!
    public var shortDescription : String!
    public var size : NSNumber!
    public var updated : NSNumber!
    public var uploader : Artist!
    public var width : NSNumber!
    public var thumbnail : String!

    


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		author = dictionary["author"] as? SimpleUser!
		authored = dictionary["authored"] as? NSNumber
		contributors = [Contributor]()
		if let contributorsArray = dictionary["contributors"] as? [NSDictionary]{
			for dic in contributorsArray{
				let value = Contributor(fromDictionary: dic)
				contributors.append(value)
			}
		}
		created = dictionary["created"] as? NSNumber
		embed = dictionary["embed"] as? String
		videoExtension = dictionary["extension"] as? String
		height = dictionary["height"] as? NSNumber
		videoId = dictionary["id"] as? NSNumber
		length = dictionary["length"] as? NSNumber
		location = dictionary["location"] as? String
		longDescription = dictionary["longDescription"] as? String
		mimeType = dictionary["mime_type"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["shortDescription"] as? String
		size = dictionary["size"] as? NSNumber
        thumbnail = dictionary["thumbnail"] as? String
        if(thumbnail == nil){
            thumbnail = ""
        }
		updated = dictionary["updated"] as? NSNumber
		if let uploaderData = dictionary["uploader"] as? NSDictionary{
			uploader = Artist(fromDictionary: uploaderData)
		}
		width = dictionary["width"] as? NSNumber
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
        
        if thumbnail != nil{
            dictionary["thumbnail"] = thumbnail
        }
		return dictionary
	}

}