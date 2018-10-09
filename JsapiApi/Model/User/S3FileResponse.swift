//
//    S3FileResponse.swift
import Foundation

public class S3FileResponse : BaseResponse {
    
    open var action : String!
    open var cdnUrl : String!
    open var createdDate : NSNumber!
    open var filename : String!
    open var fileId : NSNumber!
    open var objectKey : String!
    open var url : String!
    open var userId :  NSNumber!
    
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        action = dictionary["action"] as? String
        cdnUrl = dictionary["cdn_url"] as? String
        createdDate = dictionary["created_date"] as?  NSNumber
        filename = dictionary["filename"] as? String
        fileId = dictionary["id"] as? NSNumber
        objectKey = dictionary["object_key"] as? String
        url = dictionary["url"] as? String
        userId = dictionary["user_id"] as? NSNumber
    }
    
    /**
     * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
     */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if action != nil{
            dictionary["action"] = action
        }
        if cdnUrl != nil{
            dictionary["cdn_url"] = cdnUrl
        }
        if createdDate != nil{
            dictionary["created_date"] = createdDate
        }
        if filename != nil{
            dictionary["filename"] = filename
        }
        if fileId != nil{
            dictionary["id"] = fileId
        }
        if objectKey != nil{
            dictionary["object_key"] = objectKey
        }
        if url != nil{
            dictionary["url"] = url
        }
        if userId != nil{
            dictionary["user_id"] = userId
        }
        return dictionary
    }
    
}
