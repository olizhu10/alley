//
//  Networking.swift
//  Alley
//
//  Created by Olivia on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import Foundation
import Alamofire

struct APIResponse<T: Codable>: Codable {
    let success: Bool
    let data: T
}


final class Networking {
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
    
    func getPost(forPost postID: Int, _ completion: @escaping (Post) -> Void) {
        let endpoint = baseURL+"posts/\(postID)/"
        Alamofire.request(endpoint, method: .get).validate().responseData { response in
            switch response.result {
            case .success(let data):
                let jsonDecoder = JSONDecoder()
                jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
                if let postData = try? jsonDecoder.decode(APIResponse<Post>.self, from: data) {
                    completion(postData.data)
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
                if let postData = try? jsonDecoder.decode(APIResponse<Posts>.self, from: data) {
                    completion(postData.data.data)
                }
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    
}
