//
//  HeaderVC.swift
//  DinDinnTest
//
//  Created by apple on 12/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit

class HeaderVC: UIViewController {

    @IBOutlet weak var offer_View: AutoScrollImageView!
    
    var offerImages : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.offer_View.imagesArray = self.offerImages
        
    }
}
