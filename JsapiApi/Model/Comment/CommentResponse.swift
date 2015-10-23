//
//	CommentResponse.swift
//
//	Create by Youssef on 8/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

class CommentResponse:BaseResponse{

	var comments : [Comment]!

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		comments = [Comment]()
		if let commentsArray = dictionary["content"] as? [NSDictionary]{
			for dic in commentsArray{
				let value = Comment(fromDictionary: dic)
				comments.append(value)
			}
		}
		
	}

}