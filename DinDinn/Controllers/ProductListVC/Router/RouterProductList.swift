//
//  RouterProductList.swift
//  DinDinnTest
//
//  Created by apple on 13/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class RouterProductList : PresenterToRouterProductListProtocol {
   
    static func createModule() -> ProductListVC {
        
        let vc = UIStoryboard.productListVC()
        
        let presenter : ViewToPresenterProductListProtocol & InteractorToPresenterProductListProtocol = PresenterProductList()
        let interacter : PresenterToInteractorProductListProtocol = InteractorProductList()
        let router : PresenterToRouterProductListProtocol  = RouterProductList()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interacter
        presenter.router = router
        interacter.presenter = presenter
        
        return vc
    }
    
    
    func presentController(vc : UIViewController) {
        vc.present(vc, animated: true, completion: nil)
    }
}
