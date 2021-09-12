//
//  PresenterProductList.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class PresenterProductList : ViewToPresenterProductListProtocol {
    var view: PresenterToViewProductListProtocol?
    
    var interactor: PresenterToInteractorProductListProtocol?
    
    var router: PresenterToRouterProductListProtocol?
    
    func getData(data: String) {
        interactor?.fetchData(data: data)
    }
}

extension PresenterProductList : InteractorToPresenterProductListProtocol {
    func fetchDataSuccess(data: [ProductDetailsModel]) {
        view?.dataResponceSuccess(respo: data)
    }
    
    func fetchDataFaile(error: Error) {
        view?.dataResponceFailure(error: error)
    }
    
    func databaseUpdated(respo : [CartObject]) {
        self.view?.dataBaseUpdatedResult(respo: respo)
    }
}
