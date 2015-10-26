//
//	Cart.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Cart:NSObject{

	var cartId : NSNumber!
	var city : AnyObject!
	var country : AnyObject!
	var countryId : AnyObject!
	var currency : String!
	var discountTotal : NSNumber!
	var email : AnyObject!
	var errorCode : NSNumber!
	var errorMessage : String!
	var firstName : AnyObject!
	var grandTotal : Float!
	var iso2 : AnyObject!
	var lastName : AnyObject!
	var orderNotes : AnyObject!
	var ownerId : NSNumber!
	var phoneNumber : AnyObject!
	var postalState : AnyObject!
	var postalStateId : AnyObject!
	var shippingAddressLine1 : AnyObject!
	var shippingAddressLine2 : AnyObject!
	var shippingCost : NSNumber!
	var stateCode : AnyObject!
	var status : String!
	var subTotal : Float!
	var subTotalAfterDiscounts : Float!
	var systemSubTotal : Float!
	var tax : NSNumber!
	var zip : AnyObject!


    public func getCartId ()-> NSNumber{return cartId}
    public func getCity ()-> AnyObject{return city}
    public func getCountry ()-> AnyObject{return country}
    public func getCountryId ()-> AnyObject{return countryId}
    public func getCurrency ()-> String{return currency}
    public func getDiscountTotal ()-> NSNumber{return discountTotal}
    public func getEmail ()-> AnyObject{return email}
    public func getErrorCode ()-> NSNumber{return errorCode}
    public func getErrorMessage ()-> String{return errorMessage}
    public func getFirstName ()-> AnyObject{return firstName}
    public func getGrandTotal ()-> Float{return grandTotal}
    public func getIso2 ()-> AnyObject{return iso2}
    public func getLastName ()-> AnyObject{return lastName}
    public func getOrderNotes ()-> AnyObject{return orderNotes}
    public func getOwnerId ()-> NSNumber{return ownerId}
    public func getPhoneNumber ()-> AnyObject{return phoneNumber}
    public func getPostalState ()-> AnyObject{return postalState}
    public func getPostalStateId ()-> AnyObject{return postalStateId}
    public func getShippingAddressLine1 ()-> AnyObject{return shippingAddressLine1}
    public func getShippingAddressLine2 ()-> AnyObject{return shippingAddressLine2}
    public func getShippingCost ()-> NSNumber{return shippingCost}
    public func getStateCode ()-> AnyObject{return stateCode}
    public func getStatus ()-> String{return status}
    public func getSubTotal ()-> Float{return subTotal}
    public func getSubTotalAfterDiscounts ()-> Float{return subTotalAfterDiscounts}
    public func getSystemSubTotal ()-> Float{return systemSubTotal}
    public func getTax ()-> NSNumber{return tax}
    public func getZip ()-> AnyObject{return zip}

    override public init(){super.init()}
	/**
	 * Instantiate the instance using the passed dictionary values to set the properties values
	 */
	init(fromDictionary dictionary: NSDictionary){
        cartId = dictionary["cart_id"] as? NSNumber
        city = dictionary["city"] as AnyObject!
        country = dictionary["country"] as AnyObject!
        countryId = dictionary["country_id"] as AnyObject!
        currency = dictionary["currency"] as? String
        discountTotal = dictionary["discount_total"] as? NSNumber
        email = dictionary["email"] as AnyObject!
        errorCode = dictionary["error_code"] as? NSNumber
        errorMessage = dictionary["error_message"] as? String
        firstName = dictionary["first_name"] as AnyObject!
        grandTotal = dictionary["grand_total"] as? Float
        iso2 = dictionary["iso2"] as AnyObject!
        lastName = dictionary["last_name"] as AnyObject!
        orderNotes = dictionary["order_notes"] as AnyObject!
        ownerId = dictionary["owner_id"] as? NSNumber
        phoneNumber = dictionary["phone_number"] as AnyObject!
        postalState = dictionary["postal_state"] as AnyObject!
        postalStateId = dictionary["postal_state_id"] as AnyObject!
        shippingAddressLine1 = dictionary["shipping_address_line1"] as AnyObject!
        shippingAddressLine2 = dictionary["shipping_address_line2"] as AnyObject!
        shippingCost = dictionary["shipping_cost"] as? NSNumber
        stateCode = dictionary["state_code"] as AnyObject!
        status = dictionary["status"] as? String
        subTotal = dictionary["sub_total"] as? Float
        subTotalAfterDiscounts = dictionary["sub_total_after_discounts"] as? Float
        systemSubTotal = dictionary["system_sub_total"] as? Float
        tax = dictionary["tax"] as? NSNumber
        zip = dictionary["zip"] as AnyObject!
	}

}