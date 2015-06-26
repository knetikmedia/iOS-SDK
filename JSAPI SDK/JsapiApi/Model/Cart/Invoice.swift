//
//	Invoice.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Invoice{
    
    var address1 : AnyObject!
    var address2 : AnyObject!
    var billingAddress1 : AnyObject!
    var billingAddress2 : AnyObject!
    var billingCityName : AnyObject!
    var billingCountryName : AnyObject!
    var billingPostalCode : AnyObject!
    var billingStateName : AnyObject!
    var cartId : Int!
    var cityName : AnyObject!
    var countryName : AnyObject!
    var createDate : String!
    var currency : String!
    var currentFulfillmentStatus : Int!
    var currentFulfillmentStatusDescription : String!
    var currentFulfillmentStatusName : String!
    var currentStatus : Int!
    var currentStatusDescription : String!
    var currentStatusName : String!
    var deleted : Int!
    var discount : Double!
    var email : AnyObject!
    var fedTax : Double!
    var fullName : String!
    var grandTotal : Double!
    var id : Int!
    var namePrefix : AnyObject!
    var orderNotes : AnyObject!
    var parentInvoiceId : AnyObject!
    var phone : AnyObject!
    var phoneNumber : AnyObject!
    var postalCode : AnyObject!
    var shipping : Double!
    var stateName : AnyObject!
    var stateTax : Double!
    var subtotal : Double!
    var updateDate : String!
    var userId : Int!
    var vendorId : Int!
    
    public func getAddress1 ()-> AnyObject{ return address1}
    public func getAddress2 ()-> AnyObject{ return address2}
    public func getBillingAddress1 ()-> AnyObject{ return billingAddress1}
    public func getBillingAddress2 ()-> AnyObject{ return billingAddress2}
    public func getBillingCityName ()-> AnyObject{ return billingCityName}
    public func getBillingCountryName ()-> AnyObject{ return billingCountryName}
    public func getBillingPostalCode ()-> AnyObject{ return billingPostalCode}
    public func getBillingStateName ()-> AnyObject{ return billingStateName}
    public func getCartId ()-> Int{ return cartId}
    public func getCityName ()-> AnyObject{ return cityName}
    public func getCountryName ()-> AnyObject{ return countryName}
    public func getCreateDate ()-> String{ return createDate}
    public func getCurrency ()-> String{ return currency}
    public func getCurrentFulfillmentStatus ()-> Int{ return currentFulfillmentStatus}
    public func getCurrentFulfillmentStatusDescription ()-> String { return currentFulfillmentStatusDescription}
    public func getCurrentFulfillmentStatusName ()-> String{ return currentFulfillmentStatusName}
    public func getCurrentStatus ()-> Int{ return currentStatus}
    public func getCurrentStatusDescription ()-> String{ return currentStatusDescription}
    public func getCurrentStatusName ()-> String{ return currentStatusName}
    public func getDeleted ()-> Int{ return deleted}
    public func getDiscount ()-> Double{ return discount}
    public func getemail ()-> AnyObject{ return email}
    public func getFedTax ()-> Double{ return fedTax}
    public func getFullName ()-> String{ return fullName}
    public func getGrandTotal ()-> Double{ return grandTotal}
    public func getId ()-> Int{ return id}
    public func getNamePrefix ()-> AnyObject{ return namePrefix}
    public func getOrderNotes ()-> AnyObject{ return orderNotes}
    public func getParentInvoiceId ()-> AnyObject{ return parentInvoiceId}
    public func getPhone ()-> AnyObject{ return phone}
    public func getPhoneNumber ()-> AnyObject{ return phoneNumber}
    public func getPostalCode ()-> AnyObject{ return postalCode}
    public func getShipping ()-> Double{ return shipping}
    public func getStateName ()-> AnyObject{ return stateName}
    public func getStateTax ()-> Double{ return stateTax}
    public func getSubtotal ()-> Double{ return subtotal}
    public func getUpdateDate ()-> String{ return updateDate}
    public func getUserId ()-> Int{ return userId}
    public func getVendorId ()-> Int{ return vendorId}

    /**
    * Instantiate the instance using the passed dictionary values to set the properties values
    */
    init(fromDictionary dictionary: NSDictionary){
        address1 = dictionary["address1"] as AnyObject!
        address2 = dictionary["address2"] as AnyObject!
        billingAddress1 = dictionary["billing_address1"] as AnyObject!
        billingAddress2 = dictionary["billing_address2"] as AnyObject!
        billingCityName = dictionary["billing_city_name"] as AnyObject!
        billingCountryName = dictionary["billing_country_name"] as AnyObject!
        billingPostalCode = dictionary["billing_postal_code"] as AnyObject!
        billingStateName = dictionary["billing_state_name"] as AnyObject!
        cartId = dictionary["cart_id"] as? Int
        cityName = dictionary["city_name"] as AnyObject!
        countryName = dictionary["country_name"] as AnyObject!
        createDate = dictionary["create_date"] as? String
        currency = dictionary["currency"] as? String
        currentFulfillmentStatus = dictionary["current_fulfillment_status"] as? Int
        currentFulfillmentStatusDescription = dictionary["current_fulfillment_status_description"] as? String
        currentFulfillmentStatusName = dictionary["current_fulfillment_status_name"] as? String
        currentStatus = dictionary["current_status"] as? Int
        currentStatusDescription = dictionary["current_status_description"] as? String
        currentStatusName = dictionary["current_status_name"] as? String
        deleted = dictionary["deleted"] as? Int
        discount = dictionary["discount"] as? Double
        email = dictionary["email"] as AnyObject!
        fedTax = dictionary["fed_tax"] as? Double
        fullName = dictionary["full_name"] as? String
        grandTotal = dictionary["grand_total"] as? Double
        id = dictionary["id"] as? Int
        namePrefix = dictionary["name_prefix"] as AnyObject!
        orderNotes = dictionary["order_notes"] as AnyObject!
        parentInvoiceId = dictionary["parent_invoice_id"] as AnyObject!
        phone = dictionary["phone"] as AnyObject!
        phoneNumber = dictionary["phone_number"] as AnyObject!
        postalCode = dictionary["postal_code"] as AnyObject!
        shipping = dictionary["shipping"] as? Double
        stateName = dictionary["state_name"] as AnyObject!
        stateTax = dictionary["state_tax"] as? Double
        subtotal = dictionary["subtotal"] as? Double
        updateDate = dictionary["update_date"] as? String
        userId = dictionary["user_id"] as? Int
        vendorId = dictionary["vendor_id"] as? Int
    }
    
}