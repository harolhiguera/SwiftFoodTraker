//
//  Meal.swift
//  FoodTracker
//
//  Created by Harol Higuera on 9/10/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import UIKit


class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Initialization should FAILLLL if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
}







