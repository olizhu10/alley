//
//  AddStoryViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/20/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class AddStoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    

    //    var tag: String!
    //    var tagLabel: UILabel!
    var tag: Tag!
    var tagLabel: UILabel!
    var destLabel: UILabel!
    var posts: [Post]!
    var postTableView: UITableView!
    let reuseIdentifier = "postCellReuse"
    var viewHeight: CGFloat!
    let cellSpacingHeight: CGFloat = 15
    var sampleTextField: UITextField!
    var tags = [Tag]()
    var tagTableView: UITableView!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    var exploreLabel: UILabel!
    var postButton: UIButton!


    
    
    
    
    //    var songTextField: UITextField!
    //    var singerTextField: UITextField!
    //    var albumTextField: UITextField!
    //    var button: UIButton!
    //    var songImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        sampleTextField =  UITextField(frame: CGRect(x:40, y:230, width: 300, height: 150))
        sampleTextField.placeholder = "write your story..."
        sampleTextField.font = UIFont.systemFont(ofSize: 17)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.backgroundColor = UIColor(hue: 215/360, saturation: 0/100, brightness: 91/100, alpha: 1.0) /* #e8e8e8 */


        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.top
        
        view.addSubview(sampleTextField)

        tagLabel = UILabel()
        tagLabel.translatesAutoresizingMaskIntoConstraints = false
        tagLabel.text = "write your thoughts"
        tagLabel.textColor = .black
        tagLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        view.addSubview(tagLabel)
        
        destLabel = UILabel()
        destLabel.translatesAutoresizingMaskIntoConstraints = false
        destLabel.text = "story"
        destLabel.textColor = UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0)
        destLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(destLabel)
        
        exploreLabel = UILabel()
        exploreLabel.translatesAutoresizingMaskIntoConstraints = false
        exploreLabel.text = "tags"
        exploreLabel.textColor = UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0)
        exploreLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.addSubview(exploreLabel)
        
        
        tagTableView = UITableView(frame: .zero)
        tagTableView.translatesAutoresizingMaskIntoConstraints = false
        tagTableView.backgroundColor = .white
        tagTableView.dataSource = self
        tagTableView.delegate = self
        tagTableView.register(TagTableViewCell.self, forCellReuseIdentifier: reuseIdentifier)
        view.addSubview(tagTableView)
        
        getTags()


        postButton = UIButton()
        postButton.translatesAutoresizingMaskIntoConstraints = false
        postButton.setTitle("post", for: .normal)
        postButton.setTitleColor(UIColor(hue: 232/360, saturation: 19/100, brightness: 30/100, alpha: 1.0), for: .normal)
        postButton.backgroundColor = UIColor(hue: 312/360, saturation: 20/100, brightness: 95/100, alpha: 1.0) /* #f2c1e8 */
        postButton.layer.cornerRadius = 15

        view.addSubview(postButton)

        
    

        

        viewHeight = view.frame.height
//        self.postTableView.rowHeight = 150;
//        self.postTableView.allowsSelection = true
        
        setupConstraints()
        
        
        
        // Do any additional setup after loading the view.
    }
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            backButton.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 100),
//            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            //            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
        NSLayoutConstraint.activate([
            tagLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110),
            tagLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tagLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            destLabel.bottomAnchor.constraint(equalTo: tagLabel.topAnchor, constant: 95),
            destLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            destLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            sampleTextField.topAnchor.constraint(equalTo: destLabel.bottomAnchor),
            sampleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            sampleTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            exploreLabel.topAnchor.constraint(equalTo: sampleTextField.bottomAnchor, constant: 30),
            exploreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            exploreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        NSLayoutConstraint.activate([
            tagTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            tagTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-120),
            tagTableView.topAnchor.constraint(equalTo: exploreLabel.bottomAnchor, constant: 20),
            tagTableView.bottomAnchor.constraint(equalTo: tagTableView.topAnchor, constant: 190)
            ])
        NSLayoutConstraint.activate([
            postButton.topAnchor.constraint(equalTo: tagTableView.bottomAnchor, constant: 10),
            postButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 70),
            postButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -70),

            postButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
//        NSLayoutConstraint.activate([
//            postTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
//            postTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:-50),
//            postTableView.topAnchor.constraint(equalTo: tagLabel.bottomAnchor, constant: 65),
//            postTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
//            ])
    }
    
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
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let tag = tags[indexPath.row]
//        let tagVC = TagViewController()
//        print(tag)
//        //        songVC.delegate = self
//        tagVC.tag = tag
//        //        navigationController?.pushViewController(tagVC, animated: true)
//        present(tagVC, animated: true, completion: nil)
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
