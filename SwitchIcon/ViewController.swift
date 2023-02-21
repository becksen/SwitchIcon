//
//  ViewController.swift
//  SwitchIcon
//
//  Created by Timmy Becker on 17.02.23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func resetIcon(_ sender: Any) {
        changeIcon(to: nil)
    }
    
    @IBAction func testButton(_ sender: Any) {
        changeIcon(to: "blackIcon")
    }
    
    func changeIcon(to name: String?) {
        //Check if the app supports alternating icons
            guard UIApplication.shared.supportsAlternateIcons else {
                return;
            }
            
            //Change the icon to a specific image with given name
            UIApplication.shared.setAlternateIconName(name) { (error) in
                //After app icon changed, print our error or success message
                if let error = error {
                    print("App icon failed to due to \(error.localizedDescription)")
                } else {
                    print("App icon changed successfully.")
                }
            }
        return
    }
}

