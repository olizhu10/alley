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
    var tag_id: Int
    
    init(content: String , user_id:Int, tag_id:Int) {
        self.content=content
        self.user_id=user_id
        self.tag_id=tag_id
    }
    
    static func toPosts(posts: [Networking.Post]?) -> [Post] {
        var res : [Post] = []
        for post in posts! {
            res.append(Post(content:post.content, user_id: 1, tag_id: 1))
        }
        return res
    }
}
