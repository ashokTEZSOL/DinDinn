//
//  HomeVC.swift
//  DinDinnTest
//
//  Created by apple on 08/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit
import RxSwift

class HomeVC: SJSegmentedViewController {
    
    var presenter : ViewToPresenterHomeProtocol?
    
    @IBOutlet weak var cart_Btn: UIButton!
    @IBOutlet weak var cart_View: UIView!
    @IBOutlet weak var cartLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.updateUI()
        //loading data from API...
        presenter?.getData()
    }
    
    
    private func updateUI() {
        
        cart_View.layer.cornerRadius = self.cart_View.frame.height/2
        cart_View.layer.shadowColor = UIColor.black.cgColor
        cart_View.layer.shadowOffset = CGSize(width: 3, height: 3)
        cart_View.layer.shadowOpacity = 0.3
        cart_View.layer.shadowRadius = self.cart_View.frame.height/2
        cart_View.backgroundColor = .white
        
        self.cartLbl.backgroundColor = .green
        self.cartLbl.textColor = .white
        self.cartLbl.layer.cornerRadius = self.cartLbl.frame.height/2
        self.cartLbl.clipsToBounds = true
        
        let headerVC = UIStoryboard.headerVC()
        headerVC.offerImages = self.presenter?.offresData() ?? []
        
        var viewControllers : [UIViewController] = []
        if let offers =  self.presenter?.segmentData() {
            for obj in offers {
                let vc = RouterProductList.createModule()
                vc.title = obj
                viewControllers.append(vc)
            }
        }
        
        disableScrollOnContentView = false
        headerViewController = headerVC
        segmentControllers = viewControllers
        headerViewHeight = (40/100)*self.view.frame.height
        segmentViewHeight = 60
        segmentTitleFont = .systemFont(ofSize: 17)
        selectedSegmentViewHeight = 0.0
        headerViewOffsetHeight = 31.0
        segmentTitleColor = .gray
        selectedSegmentViewColor = .black
        segmentShadow = SJShadow.light()
        showsHorizontalScrollIndicator = false
        showsVerticalScrollIndicator = false
        segmentBounces = false
        delegate = self
        
        super.viewDidLoad()
        
        self.view.bringSubviewToFront(self.cart_View)
    }
    
    
    @IBAction func cart_Action(_ sender: UIButton) {
        self.presenter?.displayCartVC(vc: self)
    }
    
}

extension HomeVC : PresenterToViewHomeProtocol {
    func cartUpdateRespo(respo: [CartObject]) {
        self.cartLbl.text = "\(respo.count)"
    }
    
    func dataResponceSuccess(respo: GoogleSearchAddress) {
        if let list = respo.list {
            print(list.map({print($0.description ?? "")}))
        }
    }
    
    func dataResponceFailure(error: Error) {
        print("error data = \(error)")
    }
}


extension HomeVC : SJSegmentedViewControllerDelegate {
    func didMoveToPage(_ controller: UIViewController, segment: SJSegmentTab?, index: Int) {

        
    }
}
