//
//	FavoriteResponse.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class FavoriteResponse:BaseResponse{

	var favorites : [Favorite]!
	

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		favorites = [Favorite]()
		if let favoritesArray = dictionary["content"] as? [NSDictionary]{
			for dic in favoritesArray{
				let value = Favorite(fromDictionary: dic)
				favorites.append(value)
			}
		}
			}

}