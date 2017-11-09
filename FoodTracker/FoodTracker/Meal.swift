//
//  Meal.swift
//  FoodTracker
//
//  Created by 廖毅 on 2017/11/9.
//  Copyright © 2017年 廖毅. All rights reserved.
//

import UIKit


class Meal {
    
    //MRK: Properties
    
    var name:String
    
    var photo:UIImage?
    
    var rating:Int
    
    
    // Initialize stored properties.
    
    init?(name:String,photo:UIImage,rating:Int) {
        
        if name.isEmpty || rating<0
        {
            return nil
        }
        
        self.name=name
        
        self.photo=photo
        
        self.rating=rating
    }
    
    
}
