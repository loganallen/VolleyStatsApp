//
//  Player.swift
//  VolleyStats
//
//  Created by Logan Allen on 12/19/15.
//  Copyright © 2015 loganallen. All rights reserved.
//

import UIKit

class Player: NSObject {
    
    var picture: String!
    var firstName: String!
    var lastName: String!
    var jerseyNum: Int!
    
    init(first: String, last: String, jersey: Int, pic: String) {
        self.firstName = first
        self.lastName = last
        self.jerseyNum = jersey
        self.picture = pic
    }

}
