//
//  ViewController.swift
//  Map
//
//  Created by na on 2016. 10. 24..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

    @IBOutlet weak var myMap: MKMapView!
    @IBOutlet weak var lblLocationInfo1: UILabel!
    @IBOutlet weak var lblLocationInfo2: UILabel!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        lblLocationInfo1.text = ""
        lblLocationInfo2.text = ""
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest   // 정확도 최고
        locationManager.requestWhenInUseAuthorization() // 위치정보 사용자 승인
        locationManager.startUpdatingLocation() // 위치 업데이트
        myMap.showsUserLocation = true  // 위치보기값 true
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func goLocation(latitude latitudeValue: CLLocationDegrees, longitude longitudeVale: CLLocationDegrees, delta span :Double) -> CLLocationCoordinate2D {
        
        let pLocation = CLLocationCoordinate2DMake(latitudeValue, longitudeVale)    // 위도+경도 = 위치값
        let spanValue = MKCoordinateSpanMake(span, span)
        let pRegion = MKCoordinateRegionMake(pLocation, spanValue)
        myMap.setRegion(pRegion, animated: true)
        return pLocation
    }
    
    func setAnnotation(latitude latitudeValue: CLLocationDegrees, longtitude longitudeValue : CLLocationDegrees, delta span :Double, title strTitle: String, subtitle strSubtitle:String){
        let annotation = MKPointAnnotation()
        annotation.coordinate = goLocation(latitude: latitudeValue, longitude: longitudeValue, delta: span)
        annotation.title = strTitle
        annotation.subtitle = strSubtitle
        myMap.addAnnotation(annotation)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        
        let pLocation = locations.last  // 위치가 업데이트되면 먼저 마지막 위치값을 찾아냅니다.
        
        goLocation(latitude: (pLocation?.coordinate.latitude)!, longitude: (pLocation?.coordinate.longitude)!, delta: 0.01)  //delta : 0.01이면 100배 확대
        CLGeocoder().reverseGeocodeLocation(pLocation!, completionHandler:{
            (placemarks, error) -> Void in
            let pm = placemarks!.first
            let country = pm!.country
            var address:String = country!
            if pm!.locality != nil{
                address += " "
                address += pm!.locality!
            }
            if pm!.thoroughfare != nil {
                address += " "
                address += pm!.thoroughfare!
            }
            
            self.lblLocationInfo1.text = "현재 위치"
            self.lblLocationInfo2.text = address
            
        })
        
        locationManager.stopUpdatingLocation()
    }

    @IBAction func sgChangeLocation(_ sender: UISegmentedControl) {
        
        if( sender.selectedSegmentIndex == 0){
            self.lblLocationInfo1.text = ""
            self.lblLocationInfo2.text = ""
            locationManager.startUpdatingLocation()
        } else if( sender.selectedSegmentIndex == 1){
            setAnnotation(latitude: 37.1408211, longtitude: 127.64977750000003, delta: 1, title: "강동대학교", subtitle: "충북 음성군 감곡면 대학길 278")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "강동대학교"
        } else if( sender.selectedSegmentIndex == 2){
            setAnnotation(latitude: 37.57761, longtitude: 126.976032, delta: 000.1, title: "경복궁", subtitle: "경복궁")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "경복궁"
        } else if( sender.selectedSegmentIndex == 3){
            setAnnotation(latitude: 37.545598, longtitude: 127.042422, delta: 000.1, title: "우리집", subtitle: "우리집")
            self.lblLocationInfo1.text = "보고 계신 위치"
            self.lblLocationInfo2.text = "우리집"

        }

        
    }
}

