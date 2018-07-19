//  ViewController.swift
//  Colorific
//
//  Created by MacBook Pro on 28/09/16.
//  Copyright © 2016 Alex. All rights reserved.

import UIKit


class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    
    // variabili di default per il secondo-controller
    var colorCompMio      : UIColor = UIColor(red: 255.0, green: 255.0, blue: 255.0, alpha: 1.0)
    var colorComp_RGB_mio : String  = ""
    var colorActual       : ColorMio?
    
    //----------------------------------------------------------------------------------
    
    // bottone
    @IBOutlet var bottone: UIButton!
    //----------------------------------------------------------------------------------
    
    // ImageView (cella quadrata che cambia Colore)
    @IBOutlet var image: UIImageView!
    //----------------------------------------------------------------------------------
    
    // label (con i valori RGB del colore random)
    @IBOutlet var myLabel: UILabel!
    //----------------------------------------------------------------------------------
    
    // label statica RGB
    @IBOutlet var myLabel2: UILabel!
    //----------------------------------------------------------------------------------
    
    // img Logo
    @IBOutlet var myImage: UIImageView!
    //----------------------------------------------------------------------------------
    
    // outlet del bottone 'colorComp'
    @IBOutlet var bottoneComp: UIButton!
    //----------------------------------------------------------------------------------
    
    //
    @IBOutlet var previewViewComp: UIView!
    //___________________________________________________________________________________
    
    
    //-----------------------------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.layer.cornerRadius = 8
        myLabel.layer.cornerRadius = 9
        bottoneComp.layer.cornerRadius = 9

        registerForPreviewing(with: self, sourceView: bottoneComp)
    }
    //-----------------------------------------------------------------------------------
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true 
    }
    
    //-----------------------------------------------------------------------------------
    //----- Metodi obbligatori del 'UIViewControllerPreviewingDelegate'------------------
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        
        let previewView = storyboard?.instantiateViewController(withIdentifier: "viewController2")
        return previewView
    }
    //-----
    func previewingContext(_ previewingContext: UIViewControllerPreviewing, commit viewControllerToCommit: UIViewController) {
        
        let finalView = storyboard?.instantiateViewController(withIdentifier: "viewController2")
        show(finalView!, sender: self)
    }
    //-----------------------------------------------------------------------------------
  
    
    //-----------------------------------------------------------------------------------
    @IBAction func changeColor(_ sender: UIButton) {
        
        let c = ColorMio()
        
        // creo 2 UIColor
        let color     = c.createRandomColor()
        let colorComp = c.createCompColor(c: color)
        
        bottoneComp.backgroundColor = color
        
        // Update View
        image.backgroundColor = color
        colorCompMio          = colorComp
        previewViewComp.backgroundColor = colorComp
        
        // Update Labels
        myLabel.text  = c.printRGB()
        colorComp_RGB_mio = c.printRGB_C()
        
        colorActual = c
    }
    //-----------------------------------------------------------------------------------
    
    
    //-----------------------------------------------------------------------------------
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        //verifichiamo che il nome del controller che sta per aprirsi sia veramente controller2
        if segue.identifier == "controller2" {
            
            //estraiamo dalla variabile destinationViewController il controller che sta per aprirsi
            if let viewController : ColorComp_ViewController = segue.destination as? ColorComp_ViewController {
                
                //NOTA: destinationViewController è un AnyObject per cui è necessario il downcast
                viewController.colorComp     = colorCompMio
                viewController.colorComp_RGB = colorComp_RGB_mio
            }
        }
    }
    //-----------------------------------------------------------------------------------
    

    //-----------------------------------------------------------------------------------

    @IBAction func saveColor_clicked(_ sender: UIBarButtonItem) {
        
        // Salvo il Color nell'Arra
        // controllo prima se il valore della Var colorActual esiste!
        if colorActual != nil {
            colorActual!.salvaColor()
        }
        
        // Creo e lancio un ALERT !
        let alertController = UIAlertController(title: "SAVED", message: "successful", preferredStyle: .alert)
        
        self.present(alertController, animated: true, completion: nil)
        
        alertController.dismiss(animated: false, completion: nil)
    }
    //-----------------------------------------------------------------------------------
}



