//
//  Extensions.swift
//  DinDinnTest
//
//  Created by apple on 12/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

extension UIStoryboard {
    
    
    class func homeVC() -> HomeVC {
        
        return UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.homeVC) as! HomeVC
        
    }
    
    class func headerVC() -> HeaderVC {
        return UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.HeaderVC) as! HeaderVC
    }
    
    class func productListVC() -> ProductListVC {
        
        return UIStoryboard.mainStoryBoard.instantiateViewController(withIdentifier: ViewControllerIdentifiers.productlistVC) as! ProductListVC
        
    }
    
    class func cartVC() -> CartVC {
        return UIStoryboard.mainStoryBoard.instantiateViewController(identifier: "cartVC") as! CartVC
    }
}

extension UIStoryboard {
    static var mainStoryBoard : UIStoryboard {
        get {
            return UIStoryboard(name: "Main", bundle: nil)
        }
    }
}



//Data extension
extension Data {
    func decodeData<T : Decodable>() -> T? {
        do {
            let results = try JSONDecoder().decode(T.self, from: self)
            return results
        } catch let error {
            print(error)
            return nil
        }
    }
}
