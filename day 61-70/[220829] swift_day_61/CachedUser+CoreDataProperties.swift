//
//  CachedUser+CoreDataProperties.swift
//  [220829] swift_day_61
//
//  Created by user on 2022/08/29.
//
//

import Foundation
import CoreData


extension CachedUser {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedUser> {
        return NSFetchRequest<CachedUser>(entityName: "CachedUser")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: String?
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var tags: String?
    @NSManaged public var friend: CachedFriend?

}

extension CachedUser : Identifiable {

}
