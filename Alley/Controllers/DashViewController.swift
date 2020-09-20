//
//  DashViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class DashViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var welcomeLabel: UILabel!
    var tipLabel: UILabel!
    var featureLabel: UILabel!
    var posts: [Post]!
    var postTableView: UITableView!
//    var tags: [String]!
    var tags: [Tag]!

    var tagTableView: UITableView!
    let reuseIdentifier = "tagCellReuse"
    var viewHeight: CGFloat!


    init() {
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(hue: 266/360, saturation: 13/100, brightness: 97/100, alpha: 1.0)
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "welcome to alley!"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        view.addSubview(welcomeLabel)
        
        tipLabel = UILabel()
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.text = "daily tip"
        tipLabel.textColor = .black
        tipLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        view.addSubview(tipLabel)
        
        featureLabel = UILabel()
        featureLabel.translatesAutoresizingMaskIntoConstraints = false
        featureLabel.text = "featured tag"
        featureLabel.textColor = .black
        featureLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        view.addSubview(featureLabel)
        
        
        tagTableView = UITableView(frame: .zero)
        tagTableView.translatesAutoresizingMaskIntoConstraints = false
        tagTableView.backgroundColor = .gray
        tagTableView.dataSource = self
        tagTableView.delegate = self
        tagTableView.register(TagTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tagTableView)
        
        let imm = Tag(name:"#immigration")
        let rac = Tag(name: "#racism")
        let gen = Tag(name: "#gender inequality")
        let com = Tag(name: "#community")
        
        tags = [imm, rac, gen, com]
        viewHeight = view.frame.height
        self.tagTableView.rowHeight = 44;
        self.tagTableView.allowsSelection = true

        setupConstraints()



        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            tipLabel.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: 150),
            tipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            featureLabel.bottomAnchor.constraint(equalTo: tipLabel.topAnchor, constant: 150),
            featureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])

        NSLayoutConstraint.activate([
            tagTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tagTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tagTableView.topAnchor.constraint(equalTo: featureLabel.bottomAnchor, constant: 150),
            tagTableView.bottomAnchor.constraint(equalTo: tagTableView.topAnchor, constant: 200)
            ])
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tags.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TagTableViewCell
        let tag = tags[indexPath.row]
//        print(tag)
        cell.configure(for: tag.label)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .blue
        cell.backgroundColor = .gray
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = tags[indexPath.row]
        let tagVC = TagViewController()
        print(tag)
//        songVC.delegate = self
        tagVC.tag = tag
        navigationController?.pushViewController(tagVC, animated: true)
        present(tagVC, animated: true, completion: nil)
    }
    
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

