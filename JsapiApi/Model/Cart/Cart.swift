//
//	Cart.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

open class Cart:NSObject{

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


    open func getCartId ()-> NSNumber{return cartId}
    open func getCity ()-> AnyObject{return city}
    open func getCountry ()-> AnyObject{return country}
    open func getCountryId ()-> AnyObject{return countryId}
    open func getCurrency ()-> String{return currency}
    open func getDiscountTotal ()-> NSNumber{return discountTotal}
    open func getEmail ()-> AnyObject{return email}
    open func getErrorCode ()-> NSNumber{return errorCode}
    open func getErrorMessage ()-> String{return errorMessage}
    open func getFirstName ()-> AnyObject{return firstName}
    open func getGrandTotal ()-> Float{return grandTotal}
    open func getIso2 ()-> AnyObject{return iso2}
    open func getLastName ()-> AnyObject{return lastName}
    open func getOrderNotes ()-> AnyObject{return orderNotes}
    open func getOwnerId ()-> NSNumber{return ownerId}
    open func getPhoneNumber ()-> AnyObject{return phoneNumber}
    open func getPostalState ()-> AnyObject{return postalState}
    open func getPostalStateId ()-> AnyObject{return postalStateId}
    open func getShippingAddressLine1 ()-> AnyObject{return shippingAddressLine1}
    open func getShippingAddressLine2 ()-> AnyObject{return shippingAddressLine2}
    open func getShippingCost ()-> NSNumber{return shippingCost}
    open func getStateCode ()-> AnyObject{return stateCode}
    open func getStatus ()-> String{return status}
    open func getSubTotal ()-> Float{return subTotal}
    open func getSubTotalAfterDiscounts ()-> Float{return subTotalAfterDiscounts}
    open func getSystemSubTotal ()-> Float{return systemSubTotal}
    open func getTax ()-> NSNumber{return tax}
    open func getZip ()-> AnyObject{return zip}

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
