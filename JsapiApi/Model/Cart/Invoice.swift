//
//	Invoice.swift
//
//	Create by Youssef on 14/4/2015
//	Copyright © 2015. All rights reserved.
import Foundation

public class Invoice:NSObject{
    
    var address1 : AnyObject!
    var address2 : AnyObject!
    var billingAddress1 : AnyObject!
    var billingAddress2 : AnyObject!
    var billingCityName : AnyObject!
    var billingCountryName : AnyObject!
    var billingPostalCode : AnyObject!
    var billingStateName : AnyObject!
    var cartId : NSNumber!
    var cityName : AnyObject!
    var countryName : AnyObject!
    var createDate : String!
    var currency : String!
    var currentFulfillmentStatus : NSNumber!
    var currentFulfillmentStatusDescription : String!
    var currentFulfillmentStatusName : String!
    var currentStatus : NSNumber!
    var currentStatusDescription : String!
    var currentStatusName : String!
    var deleted : NSNumber!
    var discount : NSNumber!
    var email : AnyObject!
    var fedTax : NSNumber!
    var fullName : String!
    var grandTotal : NSNumber!
    var invoiceId : NSNumber!
    var namePrefix : AnyObject!
    var orderNotes : AnyObject!
    var parentInvoiceId : AnyObject!
    var phone : AnyObject!
    var phoneNumber : AnyObject!
    var postalCode : AnyObject!
    var shipping : NSNumber!
    var stateName : AnyObject!
    var stateTax : NSNumber!
    var subtotal : NSNumber!
    var updateDate : String!
    var userId : NSNumber!
    var vendorId : NSNumber!
    
    public func getAddress1 ()-> AnyObject{ return address1}
    public func getAddress2 ()-> AnyObject{ return address2}
    public func getBillingAddress1 ()-> AnyObject{ return billingAddress1}
    public func getBillingAddress2 ()-> AnyObject{ return billingAddress2}
    public func getBillingCityName ()-> AnyObject{ return billingCityName}
    public func getBillingCountryName ()-> AnyObject{ return billingCountryName}
    public func getBillingPostalCode ()-> AnyObject{ return billingPostalCode}
    public func getBillingStateName ()-> AnyObject{ return billingStateName}
    public func getCartId ()-> NSNumber{ return cartId}
    public func getCityName ()-> AnyObject{ return cityName}
    public func getCountryName ()-> AnyObject{ return countryName}
    public func getCreateDate ()-> String{ return createDate}
    public func getCurrency ()-> String{ return currency}
    public func getCurrentFulfillmentStatus ()-> NSNumber{ return currentFulfillmentStatus}
    public func getCurrentFulfillmentStatusDescription ()-> String { return currentFulfillmentStatusDescription}
    public func getCurrentFulfillmentStatusName ()-> String{ return currentFulfillmentStatusName}
    public func getCurrentStatus ()-> NSNumber{ return currentStatus}
    public func getCurrentStatusDescription ()-> String{ return currentStatusDescription}
    public func getCurrentStatusName ()-> String{ return currentStatusName}
    public func getDeleted ()-> NSNumber{ return deleted}
    public func getDiscount ()-> NSNumber{ return discount}
    public func getemail ()-> AnyObject{ return email}
    public func getFedTax ()-> NSNumber{ return fedTax}
    public func getFullName ()-> String{ return fullName}
    public func getGrandTotal ()-> NSNumber{ return grandTotal}
    public func getId ()-> NSNumber{ return invoiceId}
    public func getNamePrefix ()-> AnyObject{ return namePrefix}
    public func getOrderNotes ()-> AnyObject{ return orderNotes}
    public func getParentInvoiceId ()-> AnyObject{ return parentInvoiceId}
    public func getPhone ()-> AnyObject{ return phone}
    public func getPhoneNumber ()-> AnyObject{ return phoneNumber}
    public func getPostalCode ()-> AnyObject{ return postalCode}
    public func getShipping ()-> NSNumber{ return shipping}
    public func getStateName ()-> AnyObject{ return stateName}
    public func getStateTax ()-> NSNumber{ return stateTax}
    public func getSubtotal ()-> NSNumber{ return subtotal}
    public func getUpdateDate ()-> String{ return updateDate}
    public func getUserId ()-> NSNumber{ return userId}
    public func getVendorId ()-> NSNumber{ return vendorId}

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
        cartId = dictionary["cart_id"] as? NSNumber
        cityName = dictionary["city_name"] as AnyObject!
        countryName = dictionary["country_name"] as AnyObject!
        createDate = dictionary["create_date"] as? String
        currency = dictionary["currency"] as? String
        currentFulfillmentStatus = dictionary["current_fulfillment_status"] as? NSNumber
        currentFulfillmentStatusDescription = dictionary["current_fulfillment_status_description"] as? String
        currentFulfillmentStatusName = dictionary["current_fulfillment_status_name"] as? String
        currentStatus = dictionary["current_status"] as? NSNumber
        currentStatusDescription = dictionary["current_status_description"] as? String
        currentStatusName = dictionary["current_status_name"] as? String
        deleted = dictionary["deleted"] as? NSNumber
        discount = dictionary["discount"] as? NSNumber
        email = dictionary["email"] as AnyObject!
        fedTax = dictionary["fed_tax"] as? NSNumber
        fullName = dictionary["full_name"] as? String
        grandTotal = dictionary["grand_total"] as? NSNumber
        invoiceId = dictionary["id"] as? NSNumber
        namePrefix = dictionary["name_prefix"] as AnyObject!
        orderNotes = dictionary["order_notes"] as AnyObject!
        parentInvoiceId = dictionary["parent_invoice_id"] as AnyObject!
        phone = dictionary["phone"] as AnyObject!
        phoneNumber = dictionary["phone_number"] as AnyObject!
        postalCode = dictionary["postal_code"] as AnyObject!
        shipping = dictionary["shipping"] as? NSNumber
        stateName = dictionary["state_name"] as AnyObject!
        stateTax = dictionary["state_tax"] as? NSNumber
        subtotal = dictionary["subtotal"] as? NSNumber
        updateDate = dictionary["update_date"] as? String
        userId = dictionary["user_id"] as? NSNumber
        vendorId = dictionary["vendor_id"] as? NSNumber
    }
    
}