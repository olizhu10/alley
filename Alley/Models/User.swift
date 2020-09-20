//
//  User.swift
//  Alley
//
//  Created by Olivia on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import Foundation

class User {
    var name: String
    var id: Int?
    var posts: [Post]
    
    init(name:String) {
        self.name = name
        self.posts = []
        
    }
}
