//
//  RouterHomeProtocol.swift
//  DinDinnTest
//
//  Created by apple on 09/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class RouterHome : PresenterToRouterHomeProtocol {
   
    static func createModule() -> HomeVC {
        
        let vc = RouterHome.mainStoryBoard.instantiateViewController(identifier: "homeVC") as! HomeVC
        
        let presenter : ViewToPresenterHomeProtocol & InteractorToPresenterHomeProtocol = PresenterHome()
        let interacter : PresenterToInteractorHomeProtocol = InteractorHome()
        let router : PresenterToRouterHomeProtocol  = RouterHome()
        
        vc.presenter = presenter
        presenter.view = vc
        presenter.interactor = interacter
        presenter.router = router
        interacter.presenter = presenter
        
        return vc
    }
    
    
    func presentController(vc : UIViewController) {
        let cartVC = RouterCart.createModule()
        cartVC.modalPresentationStyle = .fullScreen
//        let navi = UINavigationController(rootViewController: vc)
//        navi.modalPresentationStyle = .fullScreen
        vc.present(cartVC, animated: true, completion: nil)
    }
    
    
    
    
    static var mainStoryBoard : UIStoryboard {
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    
}
