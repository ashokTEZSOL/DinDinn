//
//  ReouterCart.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class RouterCart : PresenterToRouterCartProtocol {
   
    static func createModule() -> CartVC {
        
        let vc = UIStoryboard.cartVC()
        
        let presenter : ViewToPresenterCartProtocol & InteractorToPresenterCartProtocol = PresenterCart()
        let interacter : PresenterToInteractorCartProtocol = InteractorCart()
        let router : PresenterToRouterCartProtocol  = RouterCart()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interacter
        presenter.router = router
        interacter.presenter =  presenter
        
        return vc
    }
    
    
    func presentController(vc : UIViewController) {
//        vc.present(vc, animated: true, completion: nil)
    }
}
