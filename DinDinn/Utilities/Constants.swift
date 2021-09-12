//
//  Constants.swift
//  DinDinnTest
//
//  Created by apple on 11/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

struct CustomeCellNib {
    
    static let imageCellNib : String = "ImageDisplayCCell"
    static let imageCellIdentifier : String = "imageDisplayCCell"
    
    static let itemDetailsNib : String = "ItemDetailsTCell"
    static let itemDetailsIdentifier : String = "itemDetailsTCell"
    static let cartCeiiIdentifier : String = "cartTcell"
}

struct ViewControllerIdentifiers  {
    static let homeVC : String = "homeVC"
    static let HeaderVC : String = "headerVC"
    static let productlistVC : String = "productListVC"
}

class Constent {
    static let cartUpdated : Notification.Name = Notification.Name(rawValue: "wishListUpdated")
}
