//
//	AdditionalPropertie.swift
//
//	Create by Youssef on 9/3/2017
//	Copyright © 2017. All rights reserved.
import Foundation

open class ArtistAdditionalPropertie:NSObject{

	var thumbnail : ArtistAsset!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		if let mainDashData = dictionary["thumbnail"] as? NSDictionary{
			thumbnail = ArtistAsset(fromDictionary: mainDashData)
		}
			}

	

}
