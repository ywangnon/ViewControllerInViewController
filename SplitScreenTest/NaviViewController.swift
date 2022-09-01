//
//  NaviViewController.swift
//  SplitScreenTest
//
//  Created by Hansub Yoo on 2022/09/01.
//

import UIKit

class NaviViewController: UINavigationController {
    
    lazy var button: UIButton = {
        // Generate UIButton.
        let width: CGFloat = 300
        let height: CGFloat = 100
        let posX: CGFloat = (self.view.bounds.width - width)/2
        let posY: CGFloat = 200
        let button = UIButton(frame: CGRect(x: posX, y: posY, width: width, height: height))
        
        button.backgroundColor = UIColor.orange
        button.layer.masksToBounds = true
        button.layer.cornerRadius = 20.0
        button.setTitle("Move to SecondView.", for: .normal)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        // Set the controller's title.
        self.navigationItem.prompt = "Fisrt View"
        
        // Set the background color of the view to Cyan.
        self.view.backgroundColor = .blue
        
        // Add UIButton on view
        self.view.addSubview(self.button)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // UIButton Event.
    @objc private func buttonPressed(_ sender: Any) {
        print("pressed")
        // Define the view to move to.
        let secondViewController = SecondViewController()
        
        // Move to SecondView.
        secondViewController.didMove(toParent: self.parent!)
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
}
