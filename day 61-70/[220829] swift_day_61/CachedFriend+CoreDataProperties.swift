//
//  CachedFriend+CoreDataProperties.swift
//  [220829] swift_day_61
//
//  Created by user on 2022/08/29.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var origin: CachedUser?

}

extension CachedFriend : Identifiable {

}
