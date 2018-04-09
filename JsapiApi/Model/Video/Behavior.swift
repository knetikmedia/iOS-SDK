//
//    Behavior.swift
import Foundation

open class Behavior : NSObject{

    open var bdescription : String!
    open var typeHint : String!
    open var typeName : String!


    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary){
        bdescription = dictionary["description"] as? String
        typeHint = dictionary["type_hint"] as? String
        typeName = dictionary["type_name"] as? String
    }


}

