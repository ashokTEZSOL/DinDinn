//
//  ProductListVC.swift
//  DinDinnTest
//
//  Created by apple on 08/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import UIKit
import RxSwift
import RxCocoa

class ProductListVC: UIViewController {

    @IBOutlet private var kTableView: UITableView!
    
    var presenter : ViewToPresenterProductListProtocol?
    
    var objects : [ProductDetailsModel] = []
    lazy var dataSource = BehaviorRelay(value: objects)
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.kTableView.register(UINib(nibName: CustomeCellNib.itemDetailsNib, bundle: nil), forCellReuseIdentifier: CustomeCellNib.itemDetailsIdentifier)
        
        
        if let title = self.title {
            self.presenter?.getData(data : title)
        }
    }
    
    func updateDataSource() {
        
        self.dataSource.bind(to: kTableView.rx.items(cellIdentifier: CustomeCellNib.itemDetailsIdentifier, cellType: ItemDetailsTCell.self)) {row,model,cell in
            cell.updateUI(item: model)
        }
        .disposed(by: self.disposeBag)
    }
}



extension ProductListVC : PresenterToViewProductListProtocol {
    func dataResponceSuccess(respo: [ProductDetailsModel]) {
        self.objects = respo
        self.updateDataSource()
    }
    
    func dataResponceFailure(error: Error) {
        print("failed respo\(error)")
    }
    
    func dataBaseUpdatedResult(respo : [CartObject]) {
        
    }
    
    
}
