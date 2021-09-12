//
//  PresenterHome.swift
//  DinDinnTest
//
//  Created by apple on 09/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import UIKit

class PresenterHome : ViewToPresenterHomeProtocol {
  
    var view: PresenterToViewHomeProtocol?
    
    var interactor: PresenterToInteractorHomeProtocol?
    
    var router: PresenterToRouterHomeProtocol?
    
    var offerImagesData : [String] = ["Monday","Tuesday","Wednesday"]
    
    var segmentObjects : [String] = ["Pizza","Sushi","Drinks"]
    
    
    //loading data from interactor...
    func getData(searchTest: String?) {
        interactor?.fetchData(searchText: searchTest)
    }
    
    func offresData() -> [String] {
        return self.offerImagesData
    }
    
    func segmentData() -> [String] {
        return self.segmentObjects
    }
    
    func displayCartVC(vc: UIViewController) {
        self.router?.presentController(vc: vc)
    }
    
}

extension PresenterHome : InteractorToPresenterHomeProtocol {
    func cartDataUpdate(respo: [CartObject]) {
        self.view?.cartUpdateRespo(respo: respo)
    }
    
    func fetchDataFaile(error: Error) {
        view?.dataResponceFailure(error: error)
    }
    
    func fetchDataSuccess(data: GoogleSearchAddress) {
        //api responce from Interactor...
        view?.dataResponceSuccess(respo: data)
        
    }
}
