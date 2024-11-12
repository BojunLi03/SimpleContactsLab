//
//  EditPersonView.swift
//  SimpleContacts
//
//  Created by Bojun Li on 11/11/24.
//

import SwiftUI
import PhotosUI

struct EditPersonView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var person: Person
    @State private var selectedItem: PhotosPickerItem?
    var body: some View {
        Form{
            Section("Photo"){
                if let imageData = person.photo, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFit()
                }
                PhotosPicker(selection: $selectedItem, matching: .images) {
                    Label("Select a photo", systemImage: "person")
                }
            }
            Section("Information") {
                TextField("Name", text: $person.name)
                    .textContentType(.name)
                TextField("Email", text: $person.email)
                    .textContentType(.emailAddress)
            }
            Section("Details") {
                TextField("Details", text: $person.details)
            }
        }.onChange(of: selectedItem, loadPhoto)
    }
    
    func loadPhoto() {
      Task { @MainActor in
        person.photo = try await selectedItem?.loadTransferable(type: Data.self)
      }
    }
}

//#Preview {
//    EditPersonView()
//}
