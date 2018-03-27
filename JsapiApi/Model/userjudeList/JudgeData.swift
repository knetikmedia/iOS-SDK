//
//	Data.swift
import Foundation

open class JudgeData: NSObject {

	open var judgedBy : [JudgedBy]!

    public override init() {
            judgedBy = [JudgedBy]()
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		judgedBy = [JudgedBy]()
		if let judgedByArray = dictionary["judgedBy"] as? [NSDictionary]{
			for dic in judgedByArray{
				let value = JudgedBy(fromDictionary: dic)
				judgedBy.append(value)
			}
		}
	}

}
