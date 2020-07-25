//
//  EditViewController.swift
//  NavigationChallenge
//
//  Created by Siyun Min on 2020/07/14.
//  Copyright © 2020 Siyun Min. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(_ controller: EditViewController, message: String)
    func didImageOnOff(_ controller: EditViewController, isOn: Bool)
    func didZoomOnOff(_ controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    var textWayValue:String = ""
    var textMessage:String = ""
    var isOn:Bool = false
    var isZoom:Bool = false
    var delegate : EditDelegate?
    
    @IBOutlet var labelWay: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var swIsOn: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        labelWay.text = textWayValue
        textField.text = textMessage
        swIsOn.isOn = isOn
    }

    @IBAction func buttonDone(_ sender: UIButton) {
        if delegate != nil {
            delegate?.didMessageEditDone(self, message: textField.text!)
            delegate?.didImageOnOff(self, isOn: isOn)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    @IBAction func swImageOnOff(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }
    
    @IBAction func zoomChange(_ sender: UIButton) {
        isZoom = !isZoom
        
        if delegate != nil {
            delegate?.didZoomOnOff(self, isZoom: isZoom)
        }
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
