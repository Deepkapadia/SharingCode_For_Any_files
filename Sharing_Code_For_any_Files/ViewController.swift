//
//  ViewController.swift
//  Sharing_Code_For_any_Files
//
//  Created by DeEp KapaDia on 25/06/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIDocumentInteractionControllerDelegate {

    final private let StringWithLink = "Plaese Download this app here in app Store http://google.com"
    

    @IBAction func ShareIMG(_ sender: Any) {
        
        guard let Image = UIImage(named: "Deep") else {return}
        let ActivityController = UIActivityViewController(activityItems: [Image], applicationActivities: nil)
        
        ActivityController.completionWithItemsHandler = { (nil, completed, _,error) in
            
            if completed {
                
                print("Completed")
                
            }else{
                
                print("Cancled")
                
            }
            
        }
        present(ActivityController, animated: true){
            
            print("Presented")
            
        }
        
    }
    
    
    @IBAction func ShareMSG(_ sender: Any) {
        
        let ActivityController = UIActivityViewController(activityItems: [StringWithLink], applicationActivities: nil)
        ActivityController.completionWithItemsHandler = { (nil, completed, _,error) in
            
            if completed {
                
                print("Completed")
                
            }else{
                
                print("Cancled")
                
            }
            
        }
        present(ActivityController, animated: true){
            
            print("Presented")
            
        }
        
        
    }
    
    
    @IBAction func SharePDF(_ sender: Any) {
        
        guard let url =  Bundle.main.url(forResource: "Deep", withExtension: "pdf")
        else { return }
      
        
        let controller =  UIDocumentInteractionController(url: url)
        controller.delegate = self
        controller.presentPreview(animated: true)
        
    }
    func documentInteractionControllerViewControllerForPreview(_ controller: UIDocumentInteractionController) -> UIViewController {
        return self
    }
    
    
}

