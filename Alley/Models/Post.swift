//
//  Post.swift
//  Alley
//
//  Created by Olivia on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import Foundation

class Post {
    var content: String
    var id: Int?
    var user_id: Int
    
    init(content: String, user_id: Int) {
        self.content=content
        self.user_id=user_id
    }
}
