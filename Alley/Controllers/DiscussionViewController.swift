//
//  DiscussionViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/20/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class DiscussionViewController: UIViewController {
    
    var tableView: UITableView!
    var titleLabel: UILabel!
    var reuseIdentifier = "reuseIdentifier"
    var posts: [Post]!
    
    init(posts: [Post]) {
        self.posts = posts
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        print("Label: ", tag.label)
        getPosts()
        print("after get posts")
        print(posts)
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "discussions"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        view.addSubview(titleLabel)
        
        
        print(posts)    
        tableView = UITableView(frame: .zero)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
//        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)


        // Do any additional setup after loading the view.
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
//            backButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
//            tagLabel.bottomAnchor.constraint(equalTo: backButton.topAnchor, constant: 125),
//            tagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-50),
            tableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 65),
//            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
    func getPosts() {
        Networking.shared.getPosts() { (posts) in
            print(posts)
            self.posts = Post.toPosts(posts:posts)
            print(self.posts)
            DispatchQueue.main.async {
                self.tableView.reloadData()
                print(self.posts)
                print("data reloaded")
            }
        }
    }

}

extension DiscussionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let height : CGFloat
        height = 20
        return height
    }
    
}


extension DiscussionViewController: UITableViewDataSource {
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return self.posts.count
//
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true

        print(self.posts)
        let post = self.posts[indexPath.section]
        print(post.content)
        cell.configure(for: post)
        
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .blue
        cell.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0) /* #d5d5d5 */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return self.posts.count

//        return 1
    }
}
