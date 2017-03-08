//
//	BaseArtistResponse.swift
//
//	Create by Youssef on 26/1/2016
//	Copyright © 2016. All rights reserved.
import Foundation

class BaseArtistResponse:BaseResponse{
    
	var result : ArtistPage!
    var artistDetails : ArtistObject!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	override init(fromDictionary dictionary: NSDictionary){
     
        super.init(fromDictionary: dictionary);

        if let resultData = dictionary as? NSDictionary{
            
			result = ArtistPage(fromDictionary: resultData)
            
        }else{
        
            result = ArtistPage()
        
        }
	}
    
    /**
     * Instantiate the instance using the passed dictionary values to set the properties values
     */
    init(fromDictionary dictionary: NSDictionary , withDetails details:Bool){
        
        super.init(fromDictionary: dictionary);
        
        if let resultData = dictionary as? NSDictionary{
            
            artistDetails = ArtistObject(fromDictionary: resultData)
            
        }else{
            
            artistDetails = ArtistObject()
            
        }
    }


	
}
