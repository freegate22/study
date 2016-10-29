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
    let PICKER_VIEW_COLUMN = 2  // Picker View 열 개수
    let PICKET_VIEW_HEIGHT:CGFloat = 80
    var imageArray = [UIImage]()
    var imageFileName = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg"]
    

    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var lblImageFileName: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var pickerImage2: UIPickerView!
    
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
    
    // 룰렛의 높이를 지정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return PICKET_VIEW_HEIGHT
    }
    
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return imageFileName.count
    }
    
    // 피커뷰의 각 항목을 글자로 보여줄 때
//    func pickerView(_ pickerView: UIPickerView, titleForRow row:Int, forComponent component: Int) ->  String? {
//        return imageFileName[row]
//    }
    
    // 피커뷰의 각 항목을 이미지로 보여줄 때 - row를 입력받으면 그림을 그려줌
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 150)
        return imageView
    }
    
    // 룰렛이 선택되었을 때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(component)
        if( pickerImage == pickerView ){
            lblImageFileName.text = imageFileName[row]
        } else {
            imageView.image = imageArray[row]
        }
    }
}

