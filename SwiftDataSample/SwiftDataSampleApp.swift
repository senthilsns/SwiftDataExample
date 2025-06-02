//
//  SwiftDataSampleApp.swift
//  SwiftDataSample
//
//  Created by senthil on 02/06/25.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSampleApp: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
        .modelContainer(for: DataItem.self) 
    }
}
