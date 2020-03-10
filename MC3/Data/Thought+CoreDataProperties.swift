//
//  Thought+CoreDataProperties.swift
//  MC3
//
//  Created by Gianna Stylianou on 29/2/20.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//
//

import Foundation
import CoreData


extension Thought {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Thought> {
        return NSFetchRequest<Thought>(entityName: "Thought")
    }

    @NSManaged public var evaluation: String?
    @NSManaged public var text: String?
}
