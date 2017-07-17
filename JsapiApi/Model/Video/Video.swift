//
//	Result.swift
//
//	Create by Youssef on 25/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Video :NSObject{

    override public init() {
        super.init()
    }
    
    open var author : Artist!
    open var authored : NSNumber!
    open var contributors : [Contributor]!
    open var created : NSNumber!
    open var active : NSNumber!
    open var embed : String!
    open var videoExtension : String!
    open var height : NSNumber!
    open var videoId : NSNumber!
    open var length : NSNumber!
    open var location : String!
    open var longDescription : String!
    open var mimeType : String!
    open var name : String!
    open var shortDescription : String!
    open var size : NSNumber!
    open var updated : NSNumber!
    open var uploader : SimpleUser!
    open var width : NSNumber!
    open var thumbnail : String!
    open var privacy : String!
    open var views : NSNumber!
    open var videoCategory :CategoryObject!
    open var comments:[Comment]!
    open var tags : [String]!
    open var popularity : NSNumber!
    open var likes : NSNumber!
    open var parentId : NSNumber!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        
        if let authorData = dictionary["author"] as? NSDictionary{
            author = Artist(fromDictionary: authorData)
        }
        
		authored = dictionary["authored"] as? NSNumber
		contributors = [Contributor]()
		if let contributorsArray = dictionary["contributors"] as? [NSDictionary]{
			for dic in contributorsArray{
				let value = Contributor(fromDictionary: dic)
				contributors.append(value)
			}
		}
		created = dictionary["created_date"] as? NSNumber
        
        if(created == nil){
        
            created = dictionary["createdDate"] as? NSNumber

        }
        
        
		embed = dictionary["embed"] as? String
		videoExtension = dictionary["extension"] as? String
		height = dictionary["height"] as? NSNumber
        active = dictionary["active"] as? NSNumber
		videoId = dictionary["id"] as? NSNumber
        
        if(videoId == nil){
        
        videoId = dictionary["videoId"] as? NSNumber
        }
        
		length = dictionary["length"] as? NSNumber
		location = dictionary["location"] as? String
		longDescription = dictionary["long_description"] as? String
		mimeType = dictionary["mime_type"] as? String
		name = dictionary["name"] as? String
		shortDescription = dictionary["short_description"] as? String
        
        if(shortDescription == nil){
            shortDescription = dictionary["shortDescription"] as? String
        }

        privacy = dictionary["privacy"] as? String

		size = dictionary["size"] as? NSNumber
        thumbnail = dictionary["thumbnail"] as? String
        if(thumbnail == nil){
            thumbnail = ""
        }
		updated = dictionary["updated_date"] as? NSNumber
        likes = dictionary["likes"] as? NSNumber
        popularity = dictionary["popularity"] as? NSNumber

        
		if let uploaderData = dictionary["uploader"] as? NSDictionary{
			uploader = SimpleUser(fromDictionary: uploaderData)
		}
		width = dictionary["width"] as? NSNumber
        views = dictionary["views"] as? NSNumber
        parentId = dictionary["parent_id"] as? NSNumber
        
        if(parentId == nil){
        parentId = dictionary["parentId"] as? NSNumber
        }

        if let categoryData = dictionary["category"] as? NSDictionary{
            videoCategory = CategoryObject(fromDictionary: categoryData)
        }
        
        tags = dictionary["tags"] as? [String]
        
        comments = [Comment]()
        if let commentsArray = dictionary["comments"] as? [NSDictionary]{
            for dic in commentsArray{
                let value = Comment(fromDictionary: dic)
                comments.append(value)
            }
        }
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	open func toDictionary() -> NSDictionary
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
			dictionary["created_date"] = created
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
			dictionary["long_description"] = longDescription
		}
		if mimeType != nil{
			dictionary["mime_type"] = mimeType
		}
		if name != nil{
			dictionary["name"] = name
		}
		if shortDescription != nil{
			dictionary["short_description"] = shortDescription
		}
		if size != nil{
			dictionary["size"] = size
		}
		if updated != nil{
			dictionary["updated_date"] = updated
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
        
        if views != nil{
            dictionary["views"] = views
        }
        if videoCategory != nil{
            
            dictionary["category"] = videoCategory.toDictionary()
        }
        
        if tags != nil{
            dictionary["tags"] = tags
        }

        if active != nil{
            
            dictionary["active"] = "true"
        }
        if privacy != nil{
            
            dictionary["privacy"] = privacy
        }

        
		return dictionary
	}

}
