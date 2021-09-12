//
//  ProductListProtocol.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

protocol ViewToPresenterProductListProtocol : class {
    
    var view : PresenterToViewProductListProtocol? {get set}
    var interactor : PresenterToInteractorProductListProtocol? {get set}
    var router : PresenterToRouterProductListProtocol? {get set}
    
    func getData(data : String)
}

protocol PresenterToViewProductListProtocol : class{
    
    func dataResponceSuccess(respo : [ProductDetailsModel])
    func dataResponceFailure(error : Error)
    func dataBaseUpdatedResult(respo : [CartObject])
}

protocol PresenterToRouterProductListProtocol : class {
    static func createModule() -> ProductListVC
    func presentController(vc : UIViewController)
}

protocol PresenterToInteractorProductListProtocol : class {
    var presenter : InteractorToPresenterProductListProtocol? {get set}
    func fetchData(data : String)
    func databaseUpdated()
}


protocol InteractorToPresenterProductListProtocol : class {
    func fetchDataSuccess(data : [ProductDetailsModel])
    func fetchDataFaile(error : Error)
    func databaseUpdated(respo : [CartObject])
}
