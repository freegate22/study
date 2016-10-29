//
//  AddViewController.swift
//  Table
//
//  Created by na on 2016. 10. 28..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit

class AddViewController: UIViewController, UIPickerViewDelegate {

    @IBOutlet weak var tfAddItem: UITextField!
    @IBOutlet weak var pickerImage: UIPickerView!
    @IBOutlet weak var imageView: UIImageView!
    
    let MAX_ARRAY_NUM = 3
    let PICKER_VIEW_COLUMN = 1
    let PICKET_VIEW_HEIGHT:CGFloat = 64
    var imageArray = [UIImage]()
    var imageFileName = ["cart.png","clock.png","pencil.png"]
    var selectImageFileName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0 ..< MAX_ARRAY_NUM {
            let image = UIImage(named: imageFileName[i])
            imageArray.append(image!)
        }

        imageView.image = imageArray[0]
        selectImageFileName = "cart.png"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tfAddItem.text!)
        itemsImageFile.append(selectImageFileName)
        tfAddItem.text = ""
        self.navigationController?.popToRootViewController(animated: true)
    }

    // 피커뷰에 표시되는 열 개수
    func numberOfComponents(pickerView: UIPickerView!) -> Int {
        return PICKER_VIEW_COLUMN
    }
    
    // 피커뷰에서 선택할 수 있는 행 개수
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return imageFileName.count
    }
    
    // 피커뷰의 각 항목을 이미지로 보여줄 때 - row를 입력받으면 그림을 그려줌
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let imageView = UIImageView(image:imageArray[row])
        imageView.frame = CGRect(x: 0, y: 0, width: 64, height: 64)
        return imageView
    }
    
    // 룰렛이 선택되었을 때
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int){
        print(component)

        imageView.image = imageArray[row]
        selectImageFileName = imageFileName[row]
    }
    
    // 룰렛의 높이를 지정
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat{
        return PICKET_VIEW_HEIGHT
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
