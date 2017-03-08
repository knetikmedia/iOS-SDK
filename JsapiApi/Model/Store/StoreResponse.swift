//
//	StoreResponse.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class StoreResponse:BaseResponse{

	var pages : [Page]!
	

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		pages = [Page]()
		if let pagesArray = dictionary as? [NSDictionary]{
			for dic in pagesArray{
				let value = Page(fromDictionary: dic)
				pages.append(value)
			}
		}
	}

}
