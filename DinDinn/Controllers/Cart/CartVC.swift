//
//  CartVC.swift
//  DinDinnTest
//
//  Created by apple on 08/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit
import RxSwift
import RxCocoa
import RealmSwift

class CartVC: UIViewController {

    @IBOutlet private var kTableView : UITableView!
    @IBOutlet weak var totalVal_Lbl: UILabel!
    
    var presenter : ViewToPresenterCartProtocol?
    
    var objects : [CartObject] = []
    lazy var dataSource = BehaviorRelay(value: objects)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.kTableView.rx.setDelegate(self)
            .disposed(by: disposeBag)
        self.presenter?.getData()
    }
    
    func updateDataSource() {
        
        self.dataSource.bind(to: kTableView.rx.items(cellIdentifier: CustomeCellNib.cartCeiiIdentifier, cellType: CartTCell.self)) {row,model,cell in
            cell.updateUI(item: model)
        }
        .disposed(by: self.disposeBag)
    }
    
    @IBAction func back_Action(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
}


extension CartVC : PresenterToViewCartProtocol {
    func cartUpdated(respo: [CartObject]) {
        self.objects = respo
        dataSource.accept(self.objects)
        self.updatePrice()
    }
    
    func dataResponceSuccess(respo: [CartObject]) {
        self.objects = respo
        self.updateDataSource()
        self.updatePrice()
    }
    
    func dataResponceFailure(error: Error) {
        print("api respo = \(error)")
    }
    
    private func updatePrice() {
        var price : Float = 0.0
        for obj in self.objects where obj.price.count > 0{
            price += Float(obj.price) ?? 0
        }
        self.totalVal_Lbl.text = String(format: "%.2f", price)
    }
}


extension CartVC : UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
