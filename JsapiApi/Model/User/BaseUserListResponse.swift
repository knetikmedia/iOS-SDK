//
//	RootClass.swift
import Foundation

open class BaseUserListResponse :BaseResponse{

	open var content : [SimpleUser]!
	open var first : NSNumber!
	open var last : NSNumber!
	open var number : NSNumber!
	open var numberOfElements : NSNumber!
	open var size : NSNumber!
	open var sort : [UserSort]!
	open var totalElements : NSNumber!
	open var totalPages : NSNumber!

    public override init() {
        super.init();
    }


	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){
        super.init(fromDictionary: dictionary)
		content = [SimpleUser]()
		if let contentArray = dictionary["content"] as? [NSDictionary]{
			for dic in contentArray{
				let value = SimpleUser(fromDictionary: dic)
				content.append(value)
			}
		}
		first = dictionary["first"] as? NSNumber
		last = dictionary["last"] as? NSNumber
		number = dictionary["number"] as? NSNumber
		numberOfElements = dictionary["number_of_elements"] as? NSNumber
		size = dictionary["size"] as? NSNumber
		sort = [UserSort]()
		if let sortArray = dictionary["sort"] as? [NSDictionary]{
			for dic in sortArray{
				let value = UserSort(fromDictionary: dic)
				sort.append(value)
			}
		}
		totalElements = dictionary["total_elements"] as? NSNumber
		totalPages = dictionary["total_pages"] as? NSNumber
	}

}
