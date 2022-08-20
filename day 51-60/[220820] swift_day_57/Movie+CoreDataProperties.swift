//
//  Movie+CoreDataProperties.swift
//  [220820] swift_day_57
//
//  Created by user on 2022/08/21.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16

    public var wrappedTitle: String {
        title ?? "Unknwon Title"
    }
}

extension Movie : Identifiable {

}
