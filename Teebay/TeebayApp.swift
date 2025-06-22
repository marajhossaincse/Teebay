//
//  TeebayApp.swift
//  Teebay
//
//  Created by Maraj Hossain on 11/6/25.
//

import Firebase
import SwiftUI

@main
struct TeebayApp: App {
    init() {
        FirebaseApp.configure()
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
