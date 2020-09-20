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
    var tag: Tag!
    
    init(tag: Tag) {
        self.tag = tag
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = tag.label
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        view.addSubview(titleLabel)
        
        tableView = UITableView(frame: CGRect(), style: .grouped)
        tableView.backgroundColor = .none
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tableView)


        // Do any additional setup after loading the view.
        setupConstraints()
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150),
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
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-50),
            tableView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 50),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
            ])
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

extension DiscussionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 20
    }
    
}

extension DiscussionViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! PostTableViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true

        let post = tag.posts[indexPath.section]
        print(post.content)
        cell.configure(for: post)
        
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .blue
        cell.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0) /* #d5d5d5 */
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tag.posts.count
    }
}
