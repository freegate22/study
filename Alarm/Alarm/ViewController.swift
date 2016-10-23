//
//  ViewController.swift
//  Alarm
//
//  Created by na on 2016. 10. 23..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    var val1 = ""
    var val2 = ""
    var alarmTime = Date()

    @IBOutlet weak var currTime: UILabel!
    @IBOutlet weak var selTime: UILabel!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func datePicker(_ sender: UIDatePicker) {
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        selTime.text = "선택시간: " + formatter.string(from: datePickerView.date)
        
        
        let curFormatter = DateFormatter();
        curFormatter.dateFormat = "HH:mm"
        let currentTime = curFormatter.string(from: datePickerView.date)
        val2 = currentTime
        let now = Date()
        print( now )
        print( alarmTime )
        print( now.timeIntervalSince( alarmTime ) )
        if( val1 == val2 && now.timeIntervalSince( alarmTime ) > 60){
            let lampOnAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            lampOnAlert.addAction(onAction)
            
            present(lampOnAlert, animated: true, completion: nil)
            alarmTime = Date()
            
        }
 
    }
    
    func updateTime(){
        currTime.text = String(count)
        count = count + 1
        
        let date = Date();
        let formatter = DateFormatter();
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        currTime.text = "현재시간: " + formatter.string(from: date)
        
        
        let curFormatter = DateFormatter();
        curFormatter.dateFormat = "HH:mm"
        let currentTime = curFormatter.string(from: date)
        val1 = currentTime
        
        let now = Date()
        print( now )
        print( alarmTime )
        print( now.timeIntervalSince( alarmTime ) )
        if( val1 == val2 && now.timeIntervalSince( alarmTime ) > 60){
            let lampOnAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertControllerStyle.alert)
            let onAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertActionStyle.default, handler: nil)
            lampOnAlert.addAction(onAction)
            
            present(lampOnAlert, animated: true, completion: nil)
            alarmTime = Date()
        }
    }
}

