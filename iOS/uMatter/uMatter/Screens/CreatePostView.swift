//
//  CreatePostView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct CreatePostView: View {
    
    @State private var _title : String = ""
    @State private var _content : String = ""
    @State private var _private : Bool = false
    @State private var _comments : Bool = false
    @State private var _date : Date = Date.now
    @AppStorage("isCreatingPost") private var isCreatingPost : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    Section(header: Text("Details").font(.headline).fontWeight(.light)) {
                        TextField("Title...", text: $_title)
                        TextEditor(text: $_content)
                            .frame(minHeight: 150)
                    }
                    
                    Section(header: Text("Settings").font(.headline).fontWeight(.light)) {
                        DatePicker("Date", selection: $_date)
                        Toggle(isOn: $_private) { Text("Private") }
                        Toggle(isOn: $_comments) { Text("Comments") }
                    }

                }
                .listStyle(.grouped)

            }
            .navigationTitle("What happened?")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        self.isCreatingPost = false
                    } label: {
                        Text("Cancel")
                            .foregroundColor(.red)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        CreatePostFunc()
                    } label: {
                        Text("Post")
                    }
                }
            }
        }
    }
}

struct CreatePostView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePostView()
    }
}
