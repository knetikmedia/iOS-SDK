//
//	Country.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Country{

	var id : Int!
	var iso2 : String!
	var iso3 : String!
	var name : String!

    public func getId()->Int
    {
        return id
    }
    public func getIso2()->String
    {
        return iso2
    }
    public func getIso3()->String
    {
        return iso3
    }
    public func getName()->String
    {
        return name
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		id = dictionary["id"] as? Int
		iso2 = dictionary["iso2"] as? String
		iso3 = dictionary["iso3"] as? String
		name = dictionary["name"] as? String
	}

}