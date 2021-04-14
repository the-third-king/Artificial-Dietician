//
//  UIViewAlert.swift
//  Artificial-Dietician
//
//  Created by user192665 on 4/13/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController{
    override func viewDidAppear(_ animated: Bool){
        super.viewDidAppear(animated)
        
        displayAlert()
    }
    
    func displayAlert(){
        let dialogMessage = UIAlertController(title: "Confirm", message: "Are you sure you want to add this?", preferredStyle: .alert)
        
        let ok = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            print("OK button tapped")
        })
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel) { (action) -> Void in
            print("Cancel button tapped")
        }
        
        dialogMessage.addAction(ok)
        dialogMessage.addAction(cancel)
        
        self.present(dialogMessage, animated: true, completion: nil)
        
    }
}
