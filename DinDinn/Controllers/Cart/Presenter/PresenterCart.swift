//
//  PresenterCart.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class PresenterCart : ViewToPresenterCartProtocol {
  
    var view: PresenterToViewCartProtocol?
    
    var interactor: PresenterToInteractorCartProtocol?
    
    var router: PresenterToRouterCartProtocol?
    
    
    //loading data from interactor...
    func getData() {
        interactor?.fetchData()
    }
}

extension PresenterCart : InteractorToPresenterCartProtocol {
    func cartUpdated(respo : [CartObject]) {
        view?.cartUpdated(respo: respo)
    }
    
    func fetchDataFaile(error: Error) {
        view?.dataResponceFailure(error: error)
    }
    
    func fetchDataSuccess(data: [CartObject]) {
        //api responce from Interactor...
        view?.dataResponceSuccess(respo: data)
        
    }
}
