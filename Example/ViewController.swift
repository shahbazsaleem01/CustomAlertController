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
        vc.addAction(action: BeAlertAction(title: "Got it", style: .default, handler: { (action) in
            
        }))
        
        
        vc.addAction(action: BeAlertAction(title: "Cancel", style: .destructive, handler: { (action) in
            
        }))
        
        present(vc, animated: true, completion: nil)
    }
}
