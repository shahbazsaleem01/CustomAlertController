//
//  ViewController.swift
//  Example
//
//  Created by Shahbaz Saleem on 7/5/19.
//  Copyright © 2019 Saleems. All rights reserved.
//

import UIKit
import CustomAlertController

class ViewController: UIViewController {

    @IBAction func didSelectShowAlert(_ sender: UIButton) {
        let vc = BeAlertController(title: "Custom Alert Controller", message: "Thank you for using custom alert controller, Hopefully you found it a smart help.\nDo let us know if you need any other feature.")
        vc.addAction(BeAlertAction(title: "Got it", style: .default, handler: { (action) in
            
        }))
        
        
        vc.addAction(BeAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
            
        }))
        
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func didSelectShowCustomizedController(_ sender: UIButton) {
        
        let vc = GlobalAlertController(title: "Custom Alert Controller", message: "Thank you for using custom alert controller, Hopefully you found it a smart help.\nDo let us know if you need any other feature.")
        vc.addAction(BeAlertAction(title: "Got it", style: .default, handler: { (action) in

        }))
        
        
        vc.addAction(BeAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
            
        }))
        
        present(vc, animated: true, completion: nil)
        
    }
    
    
}

class GlobalAlertController: BeAlertController{
    override init(title: String?, message: String?) {
        super.init(title: title, message: message)
        
        //Do your customizations here
        defaultButtonBackgroundColor = .blue
        defaultButtonTextColor = .white
        spacingAfterMessage = 30
        spacingAfterTitle = 30
        spacingAfterDefaultButton = 15
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
