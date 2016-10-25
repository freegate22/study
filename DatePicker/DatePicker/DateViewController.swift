//
//  ViewController.swift
//  DatePicker
//
//  Created by na on 2016. 10. 19..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var val1 = ""
    var val2 = ""

    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblPickerTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblPickerTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        
        let curFormatter = DateFormatter();
        curFormatter.dateFormat = "HH:mm"
        let currentTime = curFormatter.string(from: datePickerView.date)
        val2 = currentTime
        if( val1 == val2 ){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }

    func updateTime(){
        lblCurrentTime.text = String(count)
        count = count + 1
        
        let date = Date();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재시간: " + formatter.string(from: date)

        
        
        let curFormatter = DateFormatter();
        curFormatter.dateFormat = "HH:mm"
        let currentTime = curFormatter.string(from: date)
        val1 = currentTime
        if( val1 == val2 ){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }

}

