//
//  TabBarController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/20/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    var discussionTag = Tag(label: "Discussions")
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTag()
        getPosts()
        view.backgroundColor = UIColor(hue: 258/360, saturation: 23/100, brightness: 92/100, alpha: 1.0) /* #c6b5ed */

        
        let homeViewController = ViewController()
        
//        homeViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 0)
        
        let dashViewController = DashViewController()
        let discViewController = DiscussionViewController(posts:posts)
        let addViewController = AddStoryViewController()


        
        
        let dashImageName = "Dash.png"
        let dashImage = UIImage(named: dashImageName)
        
        let discImageName = "Discussion.png"
        let discImage = UIImage(named: discImageName)
        
        let addImageName = "Post.png"
        let addImage = UIImage(named: addImageName)



        dashViewController.tabBarItem = UITabBarItem(title: "", image: dashImage, tag: 1)
        discViewController.tabBarItem = UITabBarItem(title: "", image: discImage, tag: 2)
        addViewController.tabBarItem = UITabBarItem(title: "", image: addImage, tag: 3)

//        dashViewController.tabBarItem.selectedImage = UIImage(named: "Dash.png")?.withRenderingMode(.alwaysOriginal);
//        dashViewController.tabBarItem.image = UIImage(named: "Dash.png");

        let tabBarList = [homeViewController, dashViewController, discViewController, addViewController]
        viewControllers = tabBarList

        // Do any additional setup after loading the view.
    }
    func getTag() {
        Networking.shared.getTag(forTag: 1) { (tag) in
            self.discussionTag = Tag(label: tag.label)
//            DispatchQueue.main.async {
//                self.discu.reloadData()
//            }
        }
    }
    func getPosts() {
        Networking.shared.getPosts() { (posts) in
            self.posts = Post.toPosts(posts:posts)
//            DispatchQueue.main.async {
//                self.discu.reloadData()
//            }
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
