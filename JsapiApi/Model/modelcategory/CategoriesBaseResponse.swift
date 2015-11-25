//
//	CategoriesBaseResponse.swift
//
//	Create by Youssef on 25/11/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class CategoriesBaseResponse:BaseResponse{

	var result : CategoryPage!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary);
        
		if let resultData = dictionary["result"] as? NSDictionary{
			result = CategoryPage(fromDictionary: resultData)
		}
	}

}