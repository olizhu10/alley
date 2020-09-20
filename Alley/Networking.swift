//
//  Networking.swift
//  Alley
//
//  Created by Olivia on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import Foundation
import Alamofire

//struct APIResponse<T: Codable>: Codable {
//    let success: Bool
//    let data: T
//}


final class Networking {
    static let shared = Networking()
    let baseURL = "http://34.75.55.26/"
    
    struct Post : Codable {
        let id: Int
        let content: String
//        let user_id: Int
//        let tag_id: Int
    }

    struct PostsObject: Codable {
        var posts: [Post]
    }

    struct PostsResponse: Codable {
        var data: PostsObject
    }
//
//    struct Posts: Codable {
//        var data: [Post]
//    }
    
    struct Tag: Codable {
        let id: Int
        let label: String
        let posts: [Post]
    }
    
    struct TagsObject: Codable {
        var data: [Tag]
    }
    
    struct TagsResponse: Codable {
        var data: TagsObject
    }
    
    // POSTS
//    func getPost(forPost postID: Int, _ completion: @escaping (Post) -> Void) {
//        let endpoint = baseURL+"posts/\(postID)"
//        print(endpoint)
//        Alamofire.request(endpoint, method: .get).validate().responseData { response in
//            print("post1")
//            switch response.result {
//            case .success(let data):
//                print("post2")
//                print(data)
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                if let postData = try? jsonDecoder.decode(Post.self, from: data) {
//                    print("post3")
//                    completion(postData)
//                }
//
//            case .failure(let error):
//                print("error")
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func getPosts(forPost postID: Int, _ completion: @escaping ([Post]) -> Void) {
        let endpoint = baseURL+"posts/"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let postData = try? jsonDecoder.decode(PostsResponse.self, from: data) {
                    completion(postData.data.posts)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // TAGS
//    func getTag(forTag tagID: Int, _ completion: @escaping (Tag) -> Void) {
//        let endpoint = baseURL+"tags/\(tagID)/"
//        Alamofire.request(endpoint, method: .get).validate().responseData { response in
//            print("heree")
//            switch response.result {
//            case .success(let data):
//                print("succ")
//                let jsonDecoder = JSONDecoder()
//                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
//                if let tagData = try? jsonDecoder.decode(Tag.self, from: data) {
//                    print("single")
//                    completion(tagData)
//                }
//                
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
//    }
    
    func getTags(_ completion: @escaping ([Tag]) -> Void) {
        let endpoint = baseURL+"tags/"
        print(endpoint)
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            print(response)
            switch response.result {
            case .success(let data):
                print("in success")
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                print("before decoding")
                if let tagData = try? jsonDecoder.decode(TagsObject.self, from: data) {
                    print("before completion")
                    completion(tagData.data)//.data.tags)
                    print("after completion")
                }
                print("done")
            case .failure(let error):
                print("failure")
                print(error.localizedDescription)
            }
        }
    }
    
    
    
    
    
}
