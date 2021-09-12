//
//  GoogleApiModel.swift
//  DinDinnTest
//
//  Created by apple on 10/09/21.
//  Copyright © 2021 Komara Ashok. All rights reserved.

import Foundation


struct GoogleSearchAddress : Codable {
    var list : [GoogleAddress]?
    
    // we can define our custom keys...
    private enum CodingKeys : String, CodingKey {
        case list = "predictions"
    }
    
    
    //decoding properties...
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.list = try? container.decode([GoogleAddress].self, forKey: .list)
    }
}

struct GoogleAddress : Codable {
    var description : String?
    var place_id : String?
    var structured_formatting : GoogleStructureText?
    var terms : [GoogleTerms]?
}

struct GoogleStructureText : Codable {
    var main_text : String?
    var secondary_text : String?
}

struct GoogleTerms : Codable {
    var offset : Int?
    var value : String?
}

