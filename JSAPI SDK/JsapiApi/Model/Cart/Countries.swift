//
//	Countrie.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class Countries:NSObject{

	var country : [Country]!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		country = [Country]()
		if let countryArray = dictionary["1"] as? [NSDictionary]{
			for dic in countryArray{
				let value = Country(fromDictionary: dic)
				country.append(value)
			}
		}
	}

}