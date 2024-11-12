//
//  PeopleView.swift
//  SimpleContacts
//
//  Created by Bojun Li on 11/11/24.
//

import SwiftUI
import SwiftData

struct PeopleView: View {
    @Environment(\.modelContext) var modelContext
    @Query var people: [Person]
    
    var body: some View {
        List {
            ForEach(people) { person in
                NavigationLink(value: person) {
                    Text(person.name)
                }
            }
            .onDelete(perform: deletePeople)
        }
    }
    
    init(searchString: String = "", sortOrder: [SortDescriptor<Person>] = []) {
        //_searchText = State(initialValue: searchString)
        _people = Query(filter: #Predicate { person in
            if searchString.isEmpty {
                return true
            } else {
                return person.name.localizedStandardContains(searchString)
            }
        }, sort: sortOrder)
    }
    
    func deletePeople(at offsets: IndexSet) {
      for offset in offsets {
        let person = people[offset]
        modelContext.delete(person)
      }
    }
}

#Preview {
    PeopleView()
}
