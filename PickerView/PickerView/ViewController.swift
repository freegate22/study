//
//  ViewController.swift
//  PickerView
//
//  Created by na on 2016. 10. 22..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate {
    
    let MAX_ARRAY_NUM = 10
    let PICKER_VIEW_COLUMN = 1
    let PICKET_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage]()
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image!)
        }
        
        lblImageFileName.text = imageFileName[0]
        imageView.image = imageArray[0]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    func numberOfComponents(pickerView: UIPickerView!) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return PICKET_VIEW_HEIGHT
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return imageFileName.count
    }
    
//    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) ->  String? {
//        return imageFileName[row]
//    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        lblImageFileName.text = imageFileName[row]
        imageView.image = imageArray[row]
    }
}

