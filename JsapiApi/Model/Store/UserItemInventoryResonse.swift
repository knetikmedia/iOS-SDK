//
//	UserItemInventoryResonse.swift
import Foundation

open class UserItemInventoryResonse:BaseResponse{

	open var items : [Item]!
	open var first : Bool!
	open var last : Bool!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var sort : AnyObject!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary:dictionary)
		items = [Item]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = Item(fromDictionary: dic)
				items.append(value)
			}
		}
		first = dictionary["first"] as? Bool
		last = dictionary["last"] as? Bool
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["number_of_elements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		sort = dictionary["sort"] as? AnyObject
		totalElements = dictionary["total_elements"] as? NSNumber
		totalPages = dictionary["total_pages"] as? NSNumber
	}

    public override init() {
        super.init()
        items = [Item]()
    }


}
