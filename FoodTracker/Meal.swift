//
//  Meal.swift
//  FoodTracker
//
//  Created by Harol Higuera on 9/10/16.
//  Copyright © 2016 Harol. All rights reserved.
//

import UIKit


class Meal: NSObject, NSCoding {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    
    
    
    // MARK: Types
    
    struct PropertyKey {

        //The static keyword indicates that this constant applies to the structure itself, not an instance of the structure. These values will never change.
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    
    
    // MARK: Archiving Paths
    
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    
    
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, rating: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.rating = rating
        
        super.init()
        
        // Initialization should FAILLLL if there is no name or if the rating is negative.
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    
    
    // MARK: NSCoding
    
    //prepares the class’s information to be archived
    func encodeWithCoder(aCoder: NSCoder) {
    
        // These lines of code encode the value of each property on the Meal class and store them with their corresponding key.
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
        
    }
    
    // Initializer to decode the encoded data / unarchives the data when the class is created
    required convenience init?(coder aDecoder: NSCoder) {
    
        // The decodeObjectForKey(_:) method unarchives the stored information stored about an object.
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        
        // Because photo is an optional property of Meal, use conditional cast.
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        
        //The decodeIntegerForKey(_:) method unarchives an integer. Because the return value of decodeIntegerForKey is Int, there’s no need to downcast the decoded value.
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        
        
        // Must call designated initializer.
        self.init(name: name, photo: photo, rating: rating)
        
    }
    
}







