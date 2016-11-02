//
//  ViewController.swift
//  PageControl
//
//  Created by na on 2016. 10. 24..
//  Copyright © 2016년 na. All rights reserved.
//

import UIKit

var images = [ "01.png","02.png","03.png","04.png","05.png","06.png"]

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var pageControl: UIPageControl!
    var imgNum = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        pageControl.numberOfPages = images.count
        pageControl.currentPage = 0
        pageControl.pageIndicatorTintColor = UIColor.green
        pageControl.currentPageIndicatorTintColor = UIColor.red
        imgView.image = UIImage(named: images[0])
        
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.respondToSwipeGesture(gesture:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeRight)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func pageChanged(_ sender: UIPageControl) {
        imgView.image = UIImage(named: images[pageControl.currentPage])
    }
    
    
    func respondToSwipeGesture(gesture: UIGestureRecognizer){
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            
            switch swipeGesture.direction {
            case UISwipeGestureRecognizerDirection.left:
                
                imgNum = imgNum + 1
                if( imgNum > 5 ){
                    imgNum = 5
                }
                
                imgView.image = UIImage(named: images[imgNum])
            case UISwipeGestureRecognizerDirection.right:
                
                imgNum = imgNum - 1
                if( imgNum < 0 ){
                    imgNum = 0
                }
                
                imgView.image = UIImage(named: images[imgNum])
            default:
                break
            }
            pageControl.currentPage = imgNum
        }
    }

}

