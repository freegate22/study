//
//  ViewController.swift
//  Audio
//
//  Created by na on 2016. 10. 30..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioPlayer : AVAudioPlayer!
    var audioFile : URL!
    let MAX_VOLUME : Float = 10.0
    var progressTimer : Timer!
    let timePlayerSelector:Selector = #selector(ViewController.updatePlayTime)
    let timeRecordSelector:Selector = #selector(ViewController.updateRecordTime)

    @IBOutlet weak var pvProgressPlay: UIProgressView!
    @IBOutlet weak var lblCurrentTime: UILabel!
    @IBOutlet weak var lblEndTime: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var btnPause: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    @IBOutlet weak var slVolume: UISlider!
    
    @IBOutlet weak var btnRecord: UIButton!
    @IBOutlet weak var lblRecordTime: UILabel!
    var audioRecorder : AVAudioRecorder!
    var isRecordMode = false

    @IBOutlet weak var imageView: UIImageView!
    let imagePause = UIImage(named: "pause.png")
    let imagePlay = UIImage(named: "play.png")
    let imageRecord = UIImage(named: "record.png")
    let imageStop = UIImage(named: "stop.png")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        selectAudioFile()
        if !isRecordMode {
            initPlay()
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false

        } else {
            initRecord()

        }
        
    }
    
    
    // 재생 모드와 녹음 모드에 따라 다른 파일 선택
    func selectAudioFile(){
        if !isRecordMode{
            audioFile = Bundle.main.url(forResource: "Sicilian_Breeze", withExtension:"mp3")
        } else {
            let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            audioFile = documentDirectory.appendingPathComponent("recordFile.m4a")
        }
    }
    
    
    // 녹음 모드의 초기화
    func initRecord(){
        let recordSettings = [
            AVFormatIDKey : NSNumber(value: kAudioFormatAppleLossless), // 포맷은 "Apple Lossless"
            AVEncoderAudioQualityKey : AVAudioQuality.max.rawValue,     // 음질은 최대
            AVEncoderBitRateKey : 320000,                               // 비트율은 320,000bps (320kbps)
            AVNumberOfChannelsKey : 2,                                  // 오디오 채널은 2
            AVSampleRateKey : 44100.0                                   // 샘플률은 "44,100Hz"
        ] as [String : Any]
        
        do {
            audioRecorder = try AVAudioRecorder(url: audioFile, settings: recordSettings)
        } catch {
            print("Error-init Record : \(error)")
        }
        
        audioRecorder.delegate = self
        audioRecorder.isMeteringEnabled = true                          // 박자 관련값
        audioRecorder.prepareToRecord()
        
        slVolume.value = 1.0
        audioPlayer.volume = slVolume.value
        lblEndTime.text = convertTimeInterval2String(time: 0)
        lblCurrentTime.text = convertTimeInterval2String(time: 0)
        setPlayButtons(play: false, pause: false, stop: false)
        
        let session = AVAudioSession.sharedInstance()
        do{
            try session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch {
            print( "Error-setCategory: \(error)")
        }
        do{
            try session.setActive(true)
        } catch {
            print( "Error-setActive: \(error)")
        }
        imageView.image = imageRecord
    }
    
    // 재생 모드의 초기화
    func initPlay(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: audioFile)
        } catch {
            print("Error-initPlay : \(error)")
        }
        
        // 최대 볼륨
        slVolume.maximumValue = MAX_VOLUME
        // 볼륨 초기값
        slVolume.value = 1.0
        // 프로그래스 초기값
        pvProgressPlay.progress = 0
        
        audioPlayer.delegate = self
        audioPlayer.prepareToPlay()
        audioPlayer.volume = slVolume.value
        
        lblEndTime.text = convertTimeInterval2String(time: audioPlayer.duration)
        lblCurrentTime.text = convertTimeInterval2String(time: 0)
        setPlayButtons(play: true, pause: false, stop: false)
        imageView.image = imageStop
    }
    
    
    // 재생, 일시정지, 정지 버튼을 활성화 또는 비활성화 하는 함수
    func setPlayButtons(play:Bool, pause:Bool, stop:Bool){
        btnPlay.isEnabled = play
        btnPause.isEnabled = pause
        btnStop.isEnabled = stop
    }
    
    // 00:00 형태의 문자열로 변환
    func convertTimeInterval2String(time:TimeInterval) -> String{
        let min = Int(time / 60)
        let sec = Int(time.truncatingRemainder(dividingBy: 60))
        let strTime = String(format: "%02d:%02d", min, sec)
        return strTime
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // 재생 버튼을 클릭하였을 때
    @IBAction func btnPlayAudio(_ sender: UIButton) {
        audioPlayer.play()
        setPlayButtons(play: false, pause: true, stop: true)
        progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timePlayerSelector, userInfo: nil, repeats: true)
        
        imageView.image = imagePlay
    }
    

    // 일시정지 버튼을 클릭하였을 때
    @IBAction func btnPauseAudio(_ sender: UIButton) {
        audioPlayer.pause()

        setPlayButtons(play: true, pause: false, stop: true)
        imageView.image = imagePause
    }
    
    // 정지 버튼을 클릭하였을 때
    @IBAction func btnStopAudio(_ sender: UIButton) {
        audioPlayer.stop()
        audioPlayer.currentTime = 0
        lblCurrentTime.text = convertTimeInterval2String(time: 0)
        setPlayButtons(play: true, pause: false, stop: false)
        progressTimer.invalidate()
        imageView.image = imageStop
    }
    
    @IBAction func btnRecord(_ sender: UIButton) {
        if sender.titleLabel?.text == "Record" {    // 버튼이 "Record" 일 때 녹음을 중지함
            audioRecorder.record()
            sender.setTitle("Stop", for: .normal)
            progressTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: timeRecordSelector, userInfo: nil, repeats: true)
        } else {    // 버튼이 "Stop"일 때 녹음을 위한 초기화를 수행함
            audioRecorder.stop()
            sender.setTitle("Record", for: .normal)
            btnPlay.isEnabled = true
            initPlay()
        }
    }
    
    // 0.1초마다 호출되며 재생 시간을 표시
    func updatePlayTime(){
        lblCurrentTime.text = convertTimeInterval2String(time: audioPlayer.currentTime)
        pvProgressPlay.progress = Float(audioPlayer.currentTime/audioPlayer.duration)
    }
    
    // 0.1초마다 호출되며 녹음 시간을 표시함
    func updateRecordTime(){
        lblRecordTime.text = convertTimeInterval2String(time: audioRecorder.currentTime)
    }
    
    // 볼륨조절 - 볼륨 슬라이더 값을 audioPlayer.volume에 대입
    @IBAction func slChangeVolume(_ sender: UISlider) {
        audioPlayer.volume = slVolume.value
    }
    
    // 재생이 종료되었을 때 호출됨
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        progressTimer.invalidate()
        setPlayButtons(play: true, pause: false, stop: false)
    }
    
    // 스위치를 On/Off하여 녹음 모드인지 재생 모드인지 결정함
    @IBAction func swRecordMode(_ sender: UISwitch) {
        if sender.isOn {    // 녹음 모드
            audioPlayer.stop()
            audioPlayer.currentTime = 0
            lblCurrentTime.text = convertTimeInterval2String(time: 0)
            isRecordMode = true
            btnRecord.isEnabled = true
            lblRecordTime .isEnabled = true
            imageView.image = imageRecord
        } else {    // 재생 모드
            isRecordMode = false
            btnRecord.isEnabled = false
            lblRecordTime.isEnabled = false
            lblRecordTime.text = convertTimeInterval2String(time: 0)
            imageView.image = imageStop
        }
        selectAudioFile()   // 모드에 따라 오디오 파일을 선택
        // 모드에 따라 재생 초기화 또는 녹음 초기화를 수행함
        if !isRecordMode {
            initPlay()
        } else {
            initRecord()
        }
    }

}

