//
//	Result.swift
//
//	Create by Youssef on 6/7/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Video{
    
    public init(){}
    public var assets : [Asset]!
    var behaviors : [Behavior]!
    var catalog : Catalog!
    var dateCreated : Int!
    var dateUpdated : Int!
    var deleted : Int!
    var geoCountryList : [AnyObject]!
    var geoPolicyId : AnyObject!
    var geoPolicyType : AnyObject!
    var id : Int!
    var longDescription : String!
    var name : String!
    var shortDescription : String!
    var skus : [AnyObject]!
    var sort : Int!
    public var summary : String!
    var typeHint : String!
    var uniqueKey : AnyObject!
    var useUploaded : UseUploaded!
    public var filename : String!
    public var title : String!
    public var description : String!
    public var displayable : Bool!
 
    
    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        assets = [Asset]()
        if let assetsArray = dictionary["assets"] as? [NSDictionary]{
            for dic in assetsArray{
                let value = Asset(fromDictionary: dic)
                assets.append(value)
            }
        }
        behaviors = [Behavior]()
        if let behaviorsArray = dictionary["behaviors"] as? [NSDictionary]{
            for dic in behaviorsArray{
                let value = Behavior(fromDictionary: dic)
                behaviors.append(value)
            }
        }
        if let catalogData = dictionary["catalog"] as? NSDictionary{
            catalog = Catalog(fromDictionary: catalogData)
        }
        dateCreated = dictionary["date_created"] as? Int
        dateUpdated = dictionary["date_updated"] as? Int
        deleted = dictionary["deleted"] as? Int
        geoCountryList = [AnyObject]()
             geoPolicyId = dictionary["geo_policy_id"] as AnyObject!
        geoPolicyType = dictionary["geo_policy_type"] as AnyObject!
        id = dictionary["id"] as? Int
        longDescription = dictionary["long_description"] as? String
        name = dictionary["name"] as? String
        shortDescription = dictionary["short_description"] as? String
        skus = [AnyObject]()
         sort = dictionary["sort"] as? Int
        summary = dictionary["summary"] as? String
        typeHint = dictionary["type_hint"] as? String
        uniqueKey = dictionary["unique_key"] as AnyObject!
        if let useUploadedData = dictionary["use_uploaded"] as? NSDictionary{
            useUploaded = UseUploaded(fromDictionary: useUploadedData)
        }
    }
    
    /**
    * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
    */
    func toDictionary() -> NSDictionary
    {
        var dictionary = NSMutableDictionary()
        if assets != nil{
            var dictionaryElements = [NSDictionary]()
            for assetsElement in assets {
                dictionaryElements.append(assetsElement.toDictionary())
            }
            dictionary["item_assets"] = dictionaryElements
        }
        if id != nil{
            dictionary["id"] = id
        }
        if filename != nil{
            dictionary["fileName"] = filename
        }
        if title != nil{
            dictionary["title"] = title
        }
        if description != nil{
            dictionary["description"] = description
        }
      
        if displayable != nil{
            dictionary["displayable"] = displayable
        }
         return dictionary
    }
    
}