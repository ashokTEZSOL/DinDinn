//
//  ProtocolCart.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import RealmSwift
import UIKit

protocol ViewToPresenterCartProtocol : class {
    
    var view : PresenterToViewCartProtocol? {get set}
    var interactor : PresenterToInteractorCartProtocol? {get set}
    var router : PresenterToRouterCartProtocol? {get set}
    
    func getData()
}

protocol PresenterToViewCartProtocol : class{
    
    func dataResponceSuccess(respo : [CartObject])
    func dataResponceFailure(error : Error)
    func cartUpdated(respo : [CartObject])
}

protocol PresenterToRouterCartProtocol : class {
    static func createModule() -> CartVC
    func presentController(vc : UIViewController)
}

protocol PresenterToInteractorCartProtocol : class {
    var presenter : InteractorToPresenterCartProtocol? {get set}
    func fetchData()
    func cartDataUpdate()
}


protocol InteractorToPresenterCartProtocol : class {
    func fetchDataSuccess(data : [CartObject])
    func fetchDataFaile(error : Error)
    func cartUpdated(respo : [CartObject])
}
