//
//  InteractorProductList.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class InteractorProductList : PresenterToInteractorProductListProtocol {
   
    var presenter: InteractorToPresenterProductListProtocol? {
        didSet {
            NotificationCenter.default.addObserver(self, selector: #selector(self.databaseUpdated), name: Constent.cartUpdated, object: nil)
        }
    }
    
    func fetchData(data : String) {
        do {
            if let bundlePath = Bundle.main.path(forResource: data,
                                                 ofType: "json"),
               let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                let obj : [ProductDetailsModel]? = jsonData.decodeData()
                self.presenter?.fetchDataSuccess(data: obj ?? [])
            }
        } catch {
            print(error)
            self.presenter?.fetchDataSuccess(data: [])
        }
    }
    
    @objc func databaseUpdated() {
        self.presenter?.databaseUpdated(respo: DataBase.shared.getObjects())
    }
    
 
}
