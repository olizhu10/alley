//
//  DashViewController.swift
//  Alley
//
//  Created by Avani Aggrwal on 9/19/20.
//  Copyright © 2020 Avani Aggrwal. All rights reserved.
//

import UIKit

class DashViewController: UIViewController {
    var welcomeLabel: UILabel!
    var tipLabel: UILabel!
    var label:String!

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

