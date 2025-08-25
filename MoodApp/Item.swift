//
//  Item.swift
//  MoodApp
//
//  Created by Brandon Coplen on 8/25/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
