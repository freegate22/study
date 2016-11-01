//
//  ViewController.swift
//  CameraPhotoLibrary
//
//  Created by na on 2016. 11. 1..
//  Copyright © 2016년 HSJ. All rights reserved.
//

import UIKit
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var imgView2: UIImageView!
    @IBOutlet weak var imgView3: UIImageView!
    var numImage = 0
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage : UIImage! // 사진 저장
    var videoURL: URL!          // 비디오 저장
    var flagImageSave = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // 사진촬영
    @IBAction func btnCaptureImageFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){    // 카메라 사용 가능 여부 체크
            flagImageSave = true                                        // 카메라 촬영 후 저장
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]           // 미디어 타입
            imagePicker.allowsEditing = false                           // 편집 허용안함
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert(title: "Camera inaccessable", message: "Application cannot access the camera.") // 카메라를 사용할 수 없을 때 경고창
        }
        numImage = numImage + 1
        if numImage > 3 {
            numImage = 3
        }
    }
    
    // 사진 불러오기
    @IBAction func btnLoadImageFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){  // 포토앨범을 사용 가능 여부 체크
            flagImageSave = false                                           // 포토앨범을 저장
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]           // 미디어 타입
            imagePicker.allowsEditing = true                           // 편집 허용함
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert(title: "Photo album inaccessable", message: "Application cannot access the photo album.") // 포토앨범을 사용할 수 없을 때 경고창
        }
        numImage = numImage + 1
        if numImage > 3 {
            numImage = 3
        }
    }

    // 비디오 촬영
    @IBAction func btnRecordVideoFromCamera(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)){    // 카메라 사용 가능 여부 체크
            flagImageSave = true                                        // 카메라 촬영 후 저장
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeMovie as String]           // 미디어 타입
            imagePicker.allowsEditing = false                           // 편집 허용안함
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert(title: "Camera inaccessable", message: "Application cannot access the camera.") // 카메라를 사용할 수 없을 때 경고창
        }
    }
    
    // 비디오 불러오기
    @IBAction func btnLoadVideoFromLibrary(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){  // 포토앨범을 사용 가능 여부 체크
            flagImageSave = false                                           // 포토앨범을 저장
            
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeMovie as String]           // 미디어 타입
            imagePicker.allowsEditing = true                           // 편집 허용함
            
            present(imagePicker, animated: true, completion: nil)
        } else {
            myAlert(title: "Photo album inaccessable", message: "Application cannot access the photo album.") // 포토앨범을 사용할 수 없을 때 경고창
        }
    }
    
    @IBAction func btnInit(_ sender: UIButton) {
        numImage = 0
        imgView.image = nil
        imgView2.image = nil
        imgView3.image = nil
    }
    
    // 사진을 촬영하다 (또는 불러오려다) 취소할 경우
    // 현재의 뷰 컨트롤러에 보이는 이미지 피커를 제거하여 초기 뷰를 보여준다.
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        numImage = numImage - 1
        if numImage < 0 {
            numImage = 0
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    // 경고창
    func myAlert(title: String, message: String){
        let alert = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style:UIAlertActionStyle.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        let mediaType = info[UIImagePickerControllerMediaType] as! NSString                 // 미디어 종류 확인
        
        if mediaType.isEqual(to: kUTTypeImage as String ){                                  // 사진일 경우
            captureImage = info[UIImagePickerControllerOriginalImage] as! UIImage           // 사진을 가져와 캡쳐이미지에 저장합니다.
            
            if flagImageSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)                // 사진을 포토 라이브러리에 저장합니다.
            }

            
            if( numImage == 1){
                imgView.image = captureImage
            } else if( numImage == 2){
                imgView2.image = captureImage
            } else if( numImage == 3){
                imgView3.image = captureImage
            }


        } else if mediaType.isEqual(to: kUTTypeMovie as String ){                           // 비디오일 경우
            if flagImageSave {
                videoURL = (info[UIImagePickerControllerMediaURL] as! URL)
                UISaveVideoAtPathToSavedPhotosAlbum(videoURL.relativePath, self, nil, nil)  // 비디오를 포토 라이브러리에 저장합니다.

            }
    
        }
        self.dismiss(animated: true, completion: nil)                                       // 현재의 뷰 컨트롤러를 제거합니다. 
                                                                                            // 즉 뷰에서 이미지 피커화면을 제거하여 초기 뷰를 보여줍니다.
    }

}

