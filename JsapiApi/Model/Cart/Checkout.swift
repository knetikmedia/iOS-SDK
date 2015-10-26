//
//	Checkout.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Checkout:NSObject{

	public var discounts : [AnyObject]!
	public var invoices : [Invoice]!
	public var items : [Item]!

    public func getDiscounts()->AnyObject
    {
        return discounts;
    }
    
    public func getInvoices()->Array<Invoice>
    {
        return invoices;
    }
    
    public func getItems()->Array<Item>
    {
        return items;
    }
    override public init(){super.init()}

	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
		invoices = [Invoice]()
		if let invoicesArray = dictionary["invoices"] as? [NSDictionary]{
			for dic in invoicesArray{
				let value = Invoice(fromDictionary: dic)
				invoices.append(value)
			}
		}
		items = [Item]()
		if let itemsArray = dictionary["items"] as? [NSDictionary]{
			for dic in itemsArray{
				let value = Item(fromDictionary: dic)
				items.append(value)
			}
		}
	}

}