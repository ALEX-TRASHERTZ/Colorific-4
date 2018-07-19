//
//  ColorComp_ViewController.swift
//  Colorific
//
//  Created by Alessio Acri on 11/11/17.
//  Copyright © 2017 Alex. All rights reserved.
//

import UIKit

class ColorComp_ViewController: UIViewController {

    var colorComp : UIColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    var colorComp_RGB : String?
    var colorC : ColorMio?
    
    // img Color Complementare
    @IBOutlet var imageColorComp: UIImageView!
    
    @IBOutlet var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLabel.layer.cornerRadius  = 9
        imageColorComp.layer.cornerRadius = 8
        
        imageColorComp.backgroundColor = colorComp
        myLabel.text = colorComp_RGB
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }
    

    @IBAction func saveColor_clicked(_ sender: UIBarButtonItem) {
        
       
    }
    

   

}
