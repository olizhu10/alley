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
    var listTipLabel: UILabel!
    var featureLabel: UILabel!
    var posts: [Post]!
    var postTableView: UITableView!
//    var tags: [String]!
    var tags = [Tag]()

    var tagTableView: UITableView!
    let reuseIdentifier = "tagCellReuse"
    var viewHeight: CGFloat!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let cellSpacingHeight: CGFloat = 15
    var exploreLabel: UILabel!





    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = UIColor(hue: 266/360, saturation: 13/100, brightness: 97/100, alpha: 1.0)
        view.backgroundColor = .white
        welcomeLabel = UILabel()
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.text = "welcome to alley!"
        welcomeLabel.textColor = .black
        welcomeLabel.font = UIFont.systemFont(ofSize: 35, weight: .semibold)
        view.addSubview(welcomeLabel)
        
        tipLabel = UILabel()
        tipLabel.translatesAutoresizingMaskIntoConstraints = false
        tipLabel.text = "daily tip"
        tipLabel.textColor = UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0) /* #3f414e */
        tipLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        view.addSubview(tipLabel)
        
        listTipLabel = UILabel()
        listTipLabel.translatesAutoresizingMaskIntoConstraints = false
        listTipLabel.text =  """
         Don't expect Black people to educate you. \
         Use Google. \
         - @MarieBeech
        """
        listTipLabel.lineBreakMode = NSLineBreakMode.byWordWrapping
        listTipLabel.numberOfLines = 0                      //'0' means infinite number of lines

        listTipLabel.textColor = UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0) /* #3f414e */

        listTipLabel.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 76/100, alpha: 1.0) /* #c4c4c4 */

        listTipLabel.font = UIFont.systemFont(ofSize: 15, weight: .light)
        listTipLabel.layer.cornerRadius = 12
        listTipLabel.layer.masksToBounds = true

        view.addSubview(listTipLabel)
        
        exploreLabel = UILabel()
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.text = "explore tags"
        exploreLabel.textColor = UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0)
        exploreLabel.font = UIFont.systemFont(ofSize: 30, weight: .regular)
        view.addSubview(exploreLabel)
        
        
        tagTableView = UITableView(frame: .zero)
        tagTableView.translatesAutoresizingMaskIntoConstraints = false
        tagTableView.backgroundColor = .white
        tagTableView.dataSource = self
        tagTableView.delegate = self
        tagTableView.register(TagTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tagTableView)
        
        
//        let pimm = Post(content:"Immigration is crazy I am an immigrant adkfjlkadjlfkjkdlafjlkdsjfkljadsklfjakdlsfjkladsjfkld jskalfjkldjfkl", user_id: 1, tag_id: 1)
//        let prac = Post(content: "racism is bad dont be racist", user_id: 1, tag_id: 1)
//        let pgen = Post(content: "women should be equal i am a woman", user_id: 1, tag_id: 1)
//        let pcom = Post(content: "we should be in a supportive community", user_id: 1, tag_id: 1)
//
//        let immPosts = [pimm, prac]
//        let racPosts = [pgen, pcom]



        
        
//        let imm = Tag(label: "#immigration")
//        let rac = Tag(label: "#racism")
//        let gen = Tag(label: "#gender inequality")
//        let com = Tag(label: "#community")
//
//        tags = [imm, rac, gen, com]
//        tags = []

//        print(self.tags)

//        let imm = Tag(label:"#immigration")
//        imm.posts.append(pimm)
//        imm.posts.append(prac)
//        imm.posts.append(pimm)
//        let rac = Tag(label: "#racism")
//        rac.posts.append(pgen)
//        rac.posts.append(pcom)
//
//        let gen = Tag(label: "#gender inequality")
//        let com = Tag(label: "#community")
//
//
//
//        tags = [imm, rac, gen, com]

        viewHeight = view.frame.height
        self.tagTableView.rowHeight = 44;
        self.tagTableView.allowsSelection = true
            

        getTags()
//        Networking.shared.getTag(forTag: 1) { (tag) in
//            print(tag.label)
//        }
//        Networking.shared.getPost(forPost: 1) { (post) in
//            print(post.content)
//        }
        setupConstraints()



        // Do any additional setup after loading the view.
    }
    @objc func addStory (){
        let tagVC = TagViewController()
        //        songVC.delegate = self
        present(tagVC, animated: true, completion: nil)
    }
    func setupConstraints() {
        NSLayoutConstraint.activate([
            welcomeLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 150),
            welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            tipLabel.bottomAnchor.constraint(equalTo: welcomeLabel.topAnchor, constant: 105),
            tipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            listTipLabel.bottomAnchor.constraint(equalTo: tipLabel.topAnchor, constant: 150),
            listTipLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            listTipLabel.heightAnchor.constraint(equalToConstant: 100),
            listTipLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            exploreLabel.bottomAnchor.constraint(equalTo: listTipLabel.topAnchor, constant: 200),
            exploreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            exploreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
//        NSLayoutConstraint.activate([
//            featureLabel.bottomAnchor.constraint(equalTo: tipLabel.topAnchor, constant: 150),
//            featureLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])

        NSLayoutConstraint.activate([
            tagTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            tagTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-120),
            tagTableView.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 20),
            tagTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }
    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tags.count
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tags.count
    
    }
    func getTags() {
        Networking.shared.getTags() { (tags) in
            self.tags = Tag.toTags(tags: tags)
            DispatchQueue.main.async {
                self.tagTableView.reloadData()
            }
        }
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
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! TagTableViewCell
        cell.layer.borderWidth = 2.0
        cell.layer.borderColor = UIColor.white.cgColor
        cell.layer.cornerRadius = 15
        cell.layer.masksToBounds = true

        let tag = tags[indexPath.section]
//        print(tag)
        cell.configure(for: tag)
        cell.setNeedsUpdateConstraints()
        cell.selectionStyle = .blue
        cell.backgroundColor = UIColor(hue: 0/360, saturation: 0/100, brightness: 83/100, alpha: 1.0) /* #d5d5d5 */

        
        
        return cell
    }
//    override func viewDidAppear(_ animated: Bool) {
//        appDelegate.setCheckPageTrue()
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tag = tags[indexPath.row]
        let tagVC = TagViewController()
        print(tag)
//        songVC.delegate = self
        tagVC.tag = tag
//        navigationController?.pushViewController(tagVC, animated: true)
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

