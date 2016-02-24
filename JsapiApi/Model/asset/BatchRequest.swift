//
//	RootClass.swift
//
//	Create by Youssef on 23/2/2016
//	Copyright © 2016. All rights reserved.
import Foundation

public class BatchRequest : NSObject{

	public var batch : [Batch]!


    public override init(){
    
    
    }
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		batch = [Batch]()
		if let batchArray = dictionary["batch"] as? [NSDictionary]{
			for dic in batchArray{
				let value = Batch(fromDictionary: dic)
				batch.append(value)
			}
		}
	}

	/**
	 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
	 */
	public func toDictionary() -> NSDictionary
	{
		var dictionary = NSMutableDictionary()
		if batch != nil{
			var dictionaryElements = [NSDictionary]()
			for batchElement in batch {
				dictionaryElements.append(batchElement.toDictionary())
			}
			dictionary["batch"] = dictionaryElements
		}
		return dictionary
	}

}