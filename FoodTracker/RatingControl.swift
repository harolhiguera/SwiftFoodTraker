//
//  RatingControl.swift
//  FoodTracker
//
//  Created by USER on 8/14/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    
    // MARK:Properties
    
    //Array of buttons needed
    var ratingButtons = [UIButton]()
    let spacing = 5
    let starCount = 5
    
    
    //Include property observer so the UI shows accurate rating value
    var rating = 0{
        didSet {
            setNeedsLayout()
        }
    }
    

    //MARK: Initializaton
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
         for _ in 0..<starCount{
     
            let button = UIButton()
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            //Ensure that the image doesn't show an additional highlight during the state change
            button.adjustsImageWhenHighlighted = false
            
            // Action-Target implementation for this button
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(_:)), forControlEvents: .TouchDown)
            
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    
    
    // Here the intrinsicSize of this view is set so is loyout correctly, values from frame Inspector
    override func intrinsicContentSize() -> CGSize {
        
        let buttonSize = Int(frame.size.height)
        let width = (buttonSize * starCount) + (spacing * (starCount - 1))
        
        return CGSize(width: width, height: buttonSize)
    }

    
    
    
    
    override func layoutSubviews() {
        
        // frame is the frame of this view (RatingControl) set in the frame Inspector
        let buttonSize = Int(frame.size.height)
    
        //Creates a frame
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
    
        // Offset eah button's origin by the length of the button plus spacing
        //Loop to set frames to each button
        
        for (index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index * (buttonSize + spacing))
            button.frame = buttonFrame
        }
        
        // When the view loads the rating buttons states are updated
        updateButtonSelectionStates()
    }
    
    // MARK: Button Action
    
    func ratingButtonTapped(button: UIButton){
        print("Button pressed 👍")
        //In this case, you can use the force unwrap operator (!) to access the underlying index value
        rating = ratingButtons.indexOf(button)! + 1
        updateButtonSelectionStates()
    }
    
    
    func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerate(){
            // If the index of a button is less than the rating, that button should be selected, otherwise the btn would be unselected
            button.selected = index < rating
        
        }
    }
    
}
