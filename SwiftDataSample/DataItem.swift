//
//  DataItem.swift
//  SwiftDataSample
//
//  Created by senthil on 02/06/25.
//

import Foundation
import SwiftData

@Model
class DataItem : Identifiable   {
    var id: UUID
    var username: String
    var password: String
    
    init(username: String, password: String) {
        self.id = UUID()
        self.username = username
        self.password = password
    }
}

