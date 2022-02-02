//
//  SettingsView.swift
//  uMatter
//
//  Created by Carlos Amaral on 28/01/22.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("languageId") var languageId : Int = 0
    @State private var NavigationViewTitleText : String = "Settings"
    
    @State private var en : Bool = false
    @State private var pt : Bool = false
    @State private var es : Bool = false
    @State private var fr : Bool = false
    @State private var haveError : Bool = false
    @State private var errorLabel : String = "You must select at least one language"
    @State private var Language : Int = 0
    let PostTemplate : PostModel = PostModel(date: Date(), title: "Título template", content: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean condimentum purus nec neque malesuada, sit amet gravida dolor ullamcorper. Aliquam semper lectus ac tellus pharetra semper. Phasellus non semper sem. Sed venenatis neque nec pellentesque iaculis. Vivamus ac ex")

    func CheckErrors() {
        if en {
            if pt || es || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 0
            }
        }
        
        if pt {
            if en || es || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 1
            }
        }
        
        if es {
            if pt || en || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 2
            }
        }
        
        if fr {
            if pt || es || en {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 3
            }
        }
        
        if !en && !pt && !es && !fr {
            self.haveError = true
            self.errorLabel = "You must select at least one language"
        }
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    Section(header: Text("Language").font(.headline).fontWeight(.light)) {
                        HStack {
                            Text("EN")
                            Spacer()
                            if en {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture { self.en.toggle() }
                        
                        HStack {
                            Text("PT-BR")
                            Spacer()
                            if pt {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture { self.pt.toggle() }
                        
                        HStack {
                            Text("ES")
                            Spacer()
                            if es {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture { self.es.toggle() }
                        
                        HStack {
                            Text("FR")
                            Spacer()
                            if fr {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture { self.fr.toggle() }
                        
                        if self.haveError {
                            Text("\(self.errorLabel)")
                                .font(.footnote)
                                .foregroundColor(.red)
                        }
                        
                        HStack {
//                            Spacer() 
                            Text("Save")
                                .font(.body)
                                .fontWeight(.medium)
                                .foregroundColor(.accentColor)
                            Spacer()
                        }
                        .onTapGesture { CheckErrors() }
                    }
                }
            }
            .navigationTitle("\(self.NavigationViewTitleText)")
        }
    }
}
//
//struct SettingsSinglePost : View {
//    var body: some View {
//        VStack {
//
//        }
//    }
//}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
