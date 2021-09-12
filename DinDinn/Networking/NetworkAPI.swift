//
//  GooglePlaces.swift
//  DinDinnTest
//
//  Created by apple on 10/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation
import Moya

enum API {
    // plaes mention api key to get data from google place api...
    static private let key = ""
    
    case googleSearchPlace(searchText : String)
}

extension API : TargetType {
    var baseURL: URL {
        return URL(string: "https://maps.googleapis.com/maps/api/place/")!
    }
    
    var path: String {
        switch self {
        case .googleSearchPlace(searchText: _): return "autocomplete/json"
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .googleSearchPlace(searchText: _): return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case let .googleSearchPlace(searchText: str):
            let parameters = [
                "key" : API.key,
                "input" :  str,
                "inputtype" : "text",
                "fields" : "structured_formatting,place_id"
            ]
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
}
