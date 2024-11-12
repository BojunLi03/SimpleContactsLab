//
//  AppView.swift
//  SimpleContacts
//
//  Created by Bojun Li on 11/11/24.
//
import Foundation
import SwiftUI
import SwiftData

struct AppView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = [Person]()
    @State private var searchText = ""
    @State var sortOrder = [SortDescriptor(\Person.name)]
    var body: some View {
        NavigationStack(path: $path) {
            PeopleView(searchString: searchText)
                .navigationTitle("My Contacts")
                .navigationDestination(for: Person.self) { person in
                    EditPersonView(person: person)
                 }
                .toolbar {
                    Button("Add Person", systemImage: "plus", action: addPerson)
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                      Picker("Sort", selection: $sortOrder) {
                        Text("Name (A-Z)")
                          .tag([SortDescriptor(\Person.name)])

                        Text("Name (Z-A)")
                          .tag([SortDescriptor(\Person.name, order: .reverse)])
                        }
                    }
                }
                .searchable(text: $searchText)
        }
    }
    /*
     
     var body: some View {
             NavigationStack(path: $path) {
                 PeopleView(searchString: searchText, sortOrder: $sortOrder)
                     .navigationTitle("My Contacts")
                     .navigationDestination(for: Person.self) { person in
                         EditPersonView(person: person)
                     }
                     .toolbar {
                         Button("Add Person", systemImage: "plus", action: addPerson)
                         Menu("Sort", systemImage: "arrow.up.arrow.down") {
                             Picker("Sort", selection: $sortOrder) {
                                 Text("Name (A-Z)").tag([SortDescriptor(\Person.name)])
                                 Text("Name (Z-A)").tag([SortDescriptor(\Person.name, order: .reverse)])
                             }
                         }
                     }
                     .searchable(text: $searchText)
             }
         }
     */
    
    func addPerson() {
      let person = Person(name: "", email: "", details: "")
      modelContext.insert(person)
      path.append(person)
    }
}
/*
#Preview {
    AppView()
}
*/
