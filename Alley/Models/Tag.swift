//
//  Tag.swift
//  Alley
//
//  Created by Olivia on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import Foundation

class Tag {
    var label: String
    var id: Int?
    var posts: [Post]
    
    init(label:String) {
        self.label = label
        self.posts = []
    }
    
    static func toTags(tags: [Networking.Tag]?) -> [Tag] {
        if tags == nil {
            return []
        }
        var res : [Tag] = []
        for tag in tags! {
            res.append(Tag(label:tag.label))
        }
        print("totags")
        print(res)
        return res
    }
}
