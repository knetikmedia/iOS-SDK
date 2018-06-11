//
//	Doc.swift
import Foundation

open class UserStateResponse :BaseResponse{

	open var success : Bool!
	open var users : [UserState]!
    open var doc : NSDictionary!


    public override init() {
        super.init()
        users = [UserState]()
    }

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
    override init(fromDictionary dictionary: NSDictionary){

        super.init(fromDictionary: dictionary)

		success = dictionary["success"] as? Bool
		users = [UserState]()
        if let docData = dictionary["doc"] as? NSDictionary{

            if let usersArray = docData["users"] as? [NSDictionary]{
                for dic in usersArray{
                    let value = UserState(fromDictionary: dic)
                    users.append(value)
                }
            }
        }

	}

}
