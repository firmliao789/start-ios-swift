//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 廖毅 on 2017/10/30.
//  Copyright © 2017年 廖毅. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    //MARK:Properties
    @IBInspectable var startSize:CGSize=CGSize(width:44.0,height:44.0){
        didSet{
            setupButtons()
        }
    }
    
    @IBInspectable var startCount:Int=5{
        didSet{
            setupButtons()
        }
    }
    
    
    private var ratingButtons=[UIButton]()
    
    var rating=0{
        didSet{
            updateButtonSelectionStates()
        }
    };
    
    
    
    
    //MARK Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    //MARK:Private Methods
    private func setupButtons(){
        
        for button in ratingButtons
        {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        
        ratingButtons.removeAll()
        
        let bundle=Bundle(for:type(of: self))
        
        let filledStar = UIImage(named: "filledStar", in:bundle,  compatibleWith: self.traitCollection)
        let highlightedStar = UIImage(named:"highlightedStar",in:bundle,compatibleWith:self.traitCollection)
        let emptyStar = UIImage(named:"emptyStar",in:bundle,compatibleWith:self.traitCollection)
        
        for _ in 0..<startCount{
            
            
            
            
            //MARK: create button
            let button=UIButton()
            
            button.setImage(emptyStar, for: .normal)
            button.setImage(filledStar, for: .selected)
            button.setImage(highlightedStar, for: .highlighted)
            button.setImage(highlightedStar, for: [.highlighted,.selected])
            
            
            button.backgroundColor=UIColor.red
            button.translatesAutoresizingMaskIntoConstraints=false
            button.heightAnchor.constraint(equalToConstant:startSize.height).isActive=false
            button.widthAnchor.constraint(equalToConstant:startSize.width).isActive=false
            
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            
            //add button to stack
            addArrangedSubview(button)
            
            ratingButtons.append(button)
            
        }
        updateButtonSelectionStates()
    }
    
    //MARK:button action
    func ratingButtonTapped(button:UIButton) {
        guard let index=ratingButtons.index(of: button) else {
            fatalError("找不到button")
        }
        
        
        let selectedRating=index+1;
        
        if selectedRating==rating
        {
            rating=0;
            
        }
        else
        {
            rating=selectedRating
        }
    }
    
    private func updateButtonSelectionStates(){
        for(index,button) in ratingButtons.enumerated(){
            button.isSelected=index<rating
        }
    }
    
    
    
}
