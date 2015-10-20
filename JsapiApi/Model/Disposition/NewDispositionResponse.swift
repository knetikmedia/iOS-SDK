//
//	DispositionResponse.swift
//
//	Create by Youssef on 26/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class NewDispositionResponse:BaseResponse{

	var result : Disposition!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		if let resultData = dictionary["result"] as? NSDictionary{
			result = Disposition(fromDictionary: resultData)
		}
	}

}