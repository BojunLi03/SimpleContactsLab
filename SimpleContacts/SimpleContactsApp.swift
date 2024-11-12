//
//  SimpleContactsApp.swift
//  SimpleContacts
//
//  Created by Bojun Li on 11/11/24.
//

import SwiftUI
import SwiftData
@main
struct SimpleContactsApp: App {
    var body: some Scene {
        WindowGroup {
            AppView()
        }.modelContainer(for: Person.self)
    }
}
