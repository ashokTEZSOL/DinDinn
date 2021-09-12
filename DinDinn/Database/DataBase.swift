//
//  DataBase.swift
//  DinDinnTest
//
//  Created by apple on 12/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import RealmSwift

class DataBase {
    static let shared : DataBase = {
        let obj = DataBase()
        return obj
    }()
    
    let realm = try! Realm(configuration: Realm.Configuration(
        // Set the new schema version. This must be greater than the previously used
        // version (if you've never set a schema version before, the version is 0).
        schemaVersion: 1,
        migrationBlock: { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                // Apply any necessary migration logic here.
            }
    }))
    
    func saveCart(pID : Int, title : String, price : String, image : String) {
        
        let cart = CartObject()
        cart.price = price
        cart.title = title
        cart.productId = pID
        cart.image = image
        
        
        try? realm.write {
            realm.add(cart, update: .all)
        }
        try? realm.commitWrite()
        
        NotificationCenter.default.post(name: Constent.cartUpdated, object: nil)
    }
    
    func removeCart(obj : CartObject) {
        try? realm.write {
            realm.delete(obj)
        }
        try? realm.commitWrite()
        
        NotificationCenter.default.post(name: Constent.cartUpdated, object: nil)
    }
    
    func getObjects<T:Object>()->[T] {
            let realmResults = realm.objects(T.self)
            return Array(realmResults)

        }
}


@objcMembers class CartObject : Object {
    dynamic var productId : Int = 0
    dynamic var title : String = ""
    dynamic var price : String = ""
    dynamic var image : String = ""
    
    override static func primaryKey() -> String? {
        return "productId"
    }
}


