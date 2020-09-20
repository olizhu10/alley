//
//  TagViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class TagViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
//    var tag: String!
//    var tagLabel: UILabel!
    var tag: Tag!
    var tagLabel: UILabel!
    var backButton: UIButton!
    var posts: [Post]!
    var postTableView: UITableView!
    let reuseIdentifier = "postCellReuse"
    var viewHeight: CGFloat!
    let cellSpacingHeight: CGFloat = 15





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
        print(posts[0].content)
        postTableView = UITableView(frame: .zero)
        postTableView.translatesAutoresizingMaskIntoConstraints = false
        postTableView.backgroundColor = UIColor(hue: 266/360, saturation: 13/100, brightness: 97/100, alpha: 1.0)
        postTableView.dataSource = self
        postTableView.delegate = self
        postTableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(postTableView)
        
//        let imm = Post(content:"Immigration is crazy I am an immigrant", user_id: 1, tag_id: 1)
//        let rac = Post(content: "racism is bad dont be racist", user_id: 1, tag_id: 1)
//        let gen = Post(content: "women should be equal i am a woman", user_id: 1, tag_id: 1)
//        let com = Post(content: "we should be in a supportive community", user_id: 1, tag_id: 1)
        
//        posts = [imm, rac, gen, com]
        viewHeight = view.frame.height
        self.postTableView.rowHeight = 150;
        self.postTableView.allowsSelection = true
        
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
        NSLayoutConstraint.activate([
            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-50),
            postTableView.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 65),
            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ])
    }
    
    @objc func dismissDashViewController() {
//        let dashViewController = DashViewController()
        //        dashViewController.delegate = self
        //        self.navigationController?.pushViewController(dashViewController, animated: true)
       dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return posts.count
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        print(posts.count)
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    // Make the background color show through
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 8
        cell.layer.masksToBounds = true

        let post = posts[indexPath.section]
        print(post.content)
        //        print(tag)
        cell.configure(for: post)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .blue
        cell.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0) /* #d5d5d5 */

        
        return cell
    }
    
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let post = posts[indexPath.row]
//        let postVC = TagViewController()
//        print(tag)
//        //        songVC.delegate = self
//        tagVC.tag = tag
//        navigationController?.pushViewController(tagVC, animated: true)
//        present(tagVC, animated: true, completion: nil)
//    }
//
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 50/895*viewHeight + 76/895*viewHeight
    //    }
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
