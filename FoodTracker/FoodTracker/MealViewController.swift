//
//  MealViewController.swift
//  FoodTracker
//
//  Created by 廖毅 on 2017/10/29.
//  Copyright © 2017年 廖毅. All rights reserved.
//

import UIKit

class MealViewController: UIViewController,UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    //MARK Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var ratingControl: RatingControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Handle the text field’s user input through delegate callbacks.    
        nameTextField.delegate=self
    }
    
    //MARK UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextFieldDidEndEditingReason) {
    }
    
    
    //MARK action
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        
        
        // UIImagePickerController is a view controller that lets a user pick media from their photo library.
        let imagePickerController=UIImagePickerController()
        
        // Only allow photos to be picked, not taken.
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate=self
        
        present(imagePickerController,animated: true,completion: nil)
        
    
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //获取选择的图像信息 并转换为UIImage对象 如果出错则在控制台打印
        guard let selectedImage=info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("图像选择失败")
        }
        
        
        photoImageView.image = selectedImage
        //关闭图像选择器
        dismiss(animated: true, completion: nil)
    }
    
//    @IBAction func setDefaultLabelText(_ sender: UIButton) {
//        nameTextField.text="Default text"
//    }

}

