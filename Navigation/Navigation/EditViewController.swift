//
//  EditViewController.swift
//  Navigation
//
//  Created by na on 2016. 10. 27..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

protocol EditDelegate {
    func didMessageEditDone(controller: EditViewController, message: String)
    func didImageOnOffDone(controller: EditViewController, isOn: Bool)
    func didImageZoomDone(controller: EditViewController, isZoom: Bool)
}

class EditViewController: UIViewController {

    var textWayValue: String = ""
    var textMessage: String = ""
    var isOn = false
    var isZoom = false
    var delegate: EditDelegate?
    
    @IBOutlet weak var lblWay: UILabel!
    @IBOutlet weak var txMessage: UITextField!
    @IBOutlet weak var swlsOn: UISwitch!
    @IBOutlet weak var btnZoom: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        lblWay.text = textWayValue
        txMessage.text = textMessage
        swlsOn.isOn = false
        if isZoom {
            btnZoom.setTitle("축소", for: .normal)
        } else {
            btnZoom.setTitle("확대", for: .normal)
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swImageOn(_ sender: UISwitch) {
        if sender.isOn {
            isOn = true
        } else {
            isOn = false
        }
    }

    @IBAction func btnSwZoom(_ sender: UIButton) {
        isZoom = !isZoom
        if isZoom {
            btnZoom.setTitle("축소", for: .normal)
        } else {
            btnZoom.setTitle("확대", for: .normal)
        }

    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func btnBarDone(_ sender: UIBarButtonItem) {
        if delegate != nil{
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
        }
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func btnDone(_ sender: UIButton) {
        // 수정화면 > 메인화면으로 메시지 전달
        if delegate != nil{
            delegate?.didMessageEditDone(controller: self, message: txMessage.text!)
            delegate?.didImageOnOffDone(controller: self, isOn: isOn)
            delegate?.didImageZoomDone(controller: self, isZoom: isZoom)
        }
        self.navigationController?.popViewController(animated: true)
    }
}
