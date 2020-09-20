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
        
//        init(id: Int, content: String) {
//            self.id = id
//            self.content = content
//        }
    }
    
    struct Posts: Codable {
        var data: [Post]
    }
    
    struct Tag: Codable {
        let id: Int
        let label: String
        let posts: [Post]
    }
    
    struct Tags: Codable {
        var data: [Tag]
    }
    
    // POSTS
    func getPost(forPost postID: Int, _ completion: @escaping (Post) -> Void) {
        let endpoint = baseURL+"posts/\(postID)/"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let postData = try? jsonDecoder.decode(Post.self, from: data) {
                    completion(postData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getPosts(forPost postID: Int, _ completion: @escaping ([Post]) -> Void) {
        let endpoint = baseURL+"posts/"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let postData = try? jsonDecoder.decode(Posts.self, from: data) {
                    completion(postData.data)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    // TAGS
    func getTag(forTag tagID: Int, _ completion: @escaping (Tag) -> Void) {
        let endpoint = baseURL+"tags/\(tagID)/"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let tagData = try? jsonDecoder.decode(Tag.self, from: data) {
                    completion(tagData)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func getTags(_ completion: @escaping ([Tag]) -> Void) {
        print("tags")
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
                if let tagData = try? jsonDecoder.decode(Tags.self, from: data) {
                    print("before completion")
                    completion(tagData.data)
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
