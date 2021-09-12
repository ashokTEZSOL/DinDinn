//
//  InteractorHome.swift
//  DinDinnTest
//
//  Created by apple on 09/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import Moya
import RxSwift


class InteractorHome : PresenterToInteractorHomeProtocol {
    
    var presenter: InteractorToPresenterHomeProtocol? {
        didSet {
            NotificationCenter.default.addObserver(self, selector: #selector(self.cartUpdate), name: Constent.cartUpdated, object: nil)
        }
    }
    
    private let networkManager = NetworkManager()
    var searchTextcontext : String = "DinDinn"
    
    func fetchData(searchText: String?) {
        // loading cart objects by default...
        self.cartUpdate()
        //Api call
        networkManager.googleSearchResults(searchString: searchText ?? searchTextcontext) { [weak self] (result) in
            guard let selfObj = self else { return }
            switch result {
            case .success(let searchResults):
                selfObj.presenter?.fetchDataSuccess(data: searchResults)
            case .failure(let error):
                print("faied result = \(error)")
                selfObj.presenter?.fetchDataFaile(error : error)
            }
        }
    }
    
    @objc func cartUpdate() {
        self.presenter?.cartDataUpdate(respo : DataBase.shared.getObjects())
    }
}
