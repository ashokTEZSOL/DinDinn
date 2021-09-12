//
//  InteracterCart.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation

class InteractorCart : PresenterToInteractorCartProtocol {
    
    var presenter: InteractorToPresenterCartProtocol? {
        didSet {
            NotificationCenter.default.addObserver(self, selector: #selector(self.cartDataUpdate), name: Constent.cartUpdated, object: nil)
        }
    }
    
    func fetchData() {
        self.presenter?.fetchDataSuccess(data: DataBase.shared.getObjects())
    }
    
    @objc func cartDataUpdate() {
        self.presenter?.cartUpdated(respo: DataBase.shared.getObjects())
    }
}
