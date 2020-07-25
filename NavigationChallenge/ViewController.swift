//
//  ViewController.swift
//  NavigationChallenge
//
//  Created by Siyun Min on 2020/07/13.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController, EditDelegate {
    
    let imgOn = UIImage(named: "1.jpg")
    let imgOff = UIImage(named: "2.jpg")
    
    var isOn = false
    var isZoom = false
    
    @IBOutlet var textField: UITextField!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.image = imgOn
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let editViewController = segue.destination as! EditViewController
        
        if segue.identifier == "editButton" {
            editViewController.textWayValue = "segue: use button"
        } else if segue.identifier == "editBarButton" {
            editViewController.textWayValue = "segue: use bar button"
        }
        
        editViewController.textMessage = textField.text!
        editViewController.isOn = isOn
        editViewController.isZoom = isZoom
        editViewController.delegate = self
    }
    
    func didMessageEditDone(_ controller: EditViewController, message: String) {
        textField.text = message
    }
    
    func didImageOnOff(_ controller: EditViewController, isOn: Bool) {
        if isOn {
            imageView.image = imgOn
            self.isOn = true
        } else {
            imageView.image = imgOff
            self.isOn = false
        }
    }
    
    func didZoomOnOff(_ controller: EditViewController, isZoom: Bool) {
        
        let scale: CGFloat = 2.0
        var newWidth:CGFloat, newHeight:CGFloat
        
        if isZoom {
            self.isZoom = true
            newWidth = imageView.frame.width*scale
            newHeight = imageView.frame.height*scale
        } else {
            self.isZoom = false
            newWidth = imageView.frame.width/scale
            newHeight = imageView.frame.height/scale
        }
        
        imageView.frame.size = CGSize(width: newWidth, height: newHeight)
    }
}

