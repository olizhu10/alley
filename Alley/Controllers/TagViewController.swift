//
//  TagViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class TagViewController: UIViewController {
    
    
//    var tag: String!
//    var tagLabel: UILabel!
    var tag: Tag!
    var tagLabel: UILabel!
    var backButton: UIButton!
    var posts: [Post]!
    var storyPosts: [Post]!

//    var songTextField: UITextField!
//    var singerTextField: UITextField!
//    var albumTextField: UITextField!
//    var button: UIButton!
//    var songImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: 266/360, saturation: 13/100, brightness: 97/100, alpha: 1.0)
        tagLabel = UILabel()
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.text = tag.label
        tagLabel.textColor = .black
        tagLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        view.addSubview(tagLabel)
        backButton = UIButton()
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setTitle("< back", for: .normal)
        backButton.setTitleColor(.blue, for: .normal)
        backButton.addTarget(self, action: #selector(dismissDashViewController), for: .touchUpInside)
        view.addSubview(backButton)
        
        posts = tag.posts
        

        

        setupConstraints()
        

        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            tagLabel.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 125),
            tagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
    }
    
    @objc func dismissDashViewController() {
//        let dashViewController = DashViewController()
        //        dashViewController.delegate = self
        //        self.navigationController?.pushViewController(dashViewController, animated: true)
       dismiss(animated: true, completion: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
