//
//	VideoResponse.swift
//
//	Create by Youssef on 25/8/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class VideoResponse : BaseResponse{

	var videos : [Video]!
    var page : PageRequest!
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
        
        page = PageRequest.init(fromDictionary: dictionary)
        
        videos = [Video]()
		if let resultData = dictionary["content"] as? [NSDictionary]{
            for dic in resultData {
                let value = Video(fromDictionary : dic)
                videos.append(value)
            }
            }else
        if let resultData = dictionary["data"] as? [NSDictionary]{
            for dic in resultData {
                let value = Video(fromDictionary : dic)
                videos.append(value)
            }
        }
	}

}
