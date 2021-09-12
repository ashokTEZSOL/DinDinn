//
//  HomeProtocols.swift
//  DinDinnTest
//
//  Created by apple on 08/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

protocol ViewToPresenterHomeProtocol : class {
    
    var view : PresenterToViewHomeProtocol? {get set}
    var interactor : PresenterToInteractorHomeProtocol? {get set}
    var router : PresenterToRouterHomeProtocol? {get set}
    
    func getData(searchTest : String?)
    func offresData() -> [String]
    func segmentData() -> [String]
    func displayCartVC(vc : UIViewController)
}
// optional methos adding...
extension ViewToPresenterHomeProtocol {
    func getData() {
        getData(searchTest: nil)
    }
}


protocol PresenterToViewHomeProtocol : class{
    
    func dataResponceSuccess(respo : GoogleSearchAddress)
    func dataResponceFailure(error : Error)
    func cartUpdateRespo(respo : [CartObject])
}

protocol PresenterToRouterHomeProtocol : class {
    static func createModule() -> HomeVC
    func presentController(vc : UIViewController)
}

protocol PresenterToInteractorHomeProtocol : class {
    var presenter : InteractorToPresenterHomeProtocol? {get set}
    func fetchData(searchText : String?)
    func cartUpdate()
}

//optional 
extension PresenterToInteractorHomeProtocol {
    func fetchData() {
        fetchData(searchText: nil)
    }
}

protocol InteractorToPresenterHomeProtocol : class {
    func fetchDataSuccess(data : GoogleSearchAddress)
    func fetchDataFaile(error : Error)
    func cartDataUpdate(respo : [CartObject])
}
