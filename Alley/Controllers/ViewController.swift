//
//  ViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/18/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit
//import GoogleSignIn

class ViewController: UIViewController {
    
    var welcomeLabel: UILabel!
    var titleLabel: UILabel!
    var subLabel: UILabel!
    var continueButton: UIButton!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        view.backgroundColor = UIColor(hue: 266/360, saturation: 13/100, brightness: 97/100, alpha: 1.0)
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "Splash Screen - Caption.png")!)
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "alley"
        titleLabel.textColor = .black
        titleLabel.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        view.addSubview(titleLabel)
        subLabel = UILabel()
        subLabel.translatesAutoresizingMaskIntoConstraints = false
        subLabel.numberOfLines = 2
        subLabel.text = "channel your efforts into \n creating a better future."
        subLabel.lineBreakMode = .byWordWrapping
        subLabel.textColor = .black
        subLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(subLabel)
        continueButton = UIButton()
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitle("continue", for: .normal)
        continueButton.setTitleColor(.blue, for: .normal)
        continueButton.addTarget(self, action: #selector(presentDashViewController), for: .touchUpInside)
        view.addSubview(continueButton)
        
        setupConstraints()
    }
    
    func setupConstraints() {
//        NSLayoutConstraint.activate([
//            titleLabel.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 400),
//            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
//        NSLayoutConstraint.activate([
//            subLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 75),
//            //            subLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -15),
//            //            subLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 30),
//            subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
//        NSLayoutConstraint.activate([
//            continueButton.bottomAnchor.constraint(equalTo: subLabel.bottomAnchor, constant: 75),
//            //            subLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -15),
//            //            subLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 30),
//            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
//            ])
    }
    
    @objc func presentDashViewController() {
        let dashViewController = DashViewController()
//        dashViewController.delegate = self
//        self.navigationController?.pushViewController(dashViewController, animated: true)
        present(dashViewController, animated: true, completion: nil)
//        appDelegate.window?.rootViewController = UINavigationController(rootViewController: TabBarController())
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
    //        if (error != nil) {
    //            print("\(error.localizedDescription)")
    //            return
    //        }
    //    }
    

    
    
    
    
}

