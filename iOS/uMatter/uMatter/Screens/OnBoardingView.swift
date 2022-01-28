//
//  OnBoardingView.swift
//  uMatter
//
//  Created by Carlos Amaral on 27/01/22.
//

import SwiftUI

//MARK: OBS
//Language ID = 0 -> Ingles
//Language ID = 1 -> Portugues
//Language ID = 2 -> Espanhol
//Language ID = 3 -> Frances

//Hello
//Olá
//Hola
//Salut!



//MARK: VIEW CONTROLLER
struct OnBoardingView : View {
    @AppStorage("OnBoardingViewID") var OnBoardingViewID : Int = 1
    
    var body: some View {
        
        if OnBoardingViewID == 1 {
            OnBoardingView1()
        } else if OnBoardingViewID == 2 {
            OnBoardingView2()
        }

    }
}



//MARK: LANGUAGE
struct OnBoardingView1: View {
    
    @AppStorage("languageId") var languageId : Int = 0
    @AppStorage("OnBoardingViewID") var OnBoardingViewID : Int = 1
    
    @State private var en : Bool = false
    @State private var pt : Bool = false
    @State private var es : Bool = false
    @State private var fr : Bool = false
    
    @State private var haveError : Bool = false
    @State private var errorLabel : String = "You selected more than one language"
    
    func CheckErrors() {
        if en {
            if pt || es || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 0
                self.OnBoardingViewID = 2
            }
        }
        
        if pt {
            if en || es || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 1
                self.OnBoardingViewID = 2
            }
        }
        
        if es {
            if pt || en || fr {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 2
                self.OnBoardingViewID = 2
            }
        }
        
        if fr {
            if pt || es || en {
                self.errorLabel = "You selected more than one language"
                self.haveError = true
            } else {
                self.haveError = false
                self.languageId = 3
                self.OnBoardingViewID = 2
                
            }
        }
        
        if !en && !pt && !es && !fr {
            self.haveError = true
            self.errorLabel = "You must select at least one language"
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Text("Select the language")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .lineLimit(2)
                    .frame(width: UIScreen.maxWidth - 100)
                    .multilineTextAlignment(.center)
                    .padding(.bottom)
                

                Spacer()
                
                VStack(alignment: .center) {
                    List {
                        
                        HStack {
                            Text("EN")
                            
                            Spacer()
                            
                            if en {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture {
                            self.en.toggle()
                        }
                        
                        HStack {
                            Text("PT-BR")
                            
                            Spacer()
                            
                            if pt {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture {
                            self.pt.toggle()
                        }
                        
                        HStack {
                            Text("ES")
                            
                            Spacer()
                            
                            if es {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture {
                            self.es.toggle()
                        }
                        
                        HStack {
                            Text("FR")
                            
                            Spacer()
                            
                            if fr {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(.accentColor)
                            }
                        }
                        .onTapGesture {
                            self.fr.toggle()
                        }
                    }
                    .listStyle(.inset)
                    
                    if haveError {
                        Text("\(errorLabel)")
                            .font(.footnote)
                            .foregroundColor(.red)
                    }
                    
                    Button {
                        CheckErrors()
                    } label: {
                        Text("Continue")
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(5)
                    
                    Spacer()
                }
            }
        }
    }
}



//MARK: WELCOME
struct OnBoardingView2 : View {
    
    @AppStorage("OnBoardingViewID") var OnBoardingViewID : Int = 2
    @AppStorage("languageId") var languageId : Int = 0
    
    @State private var welcomeTitle : String = "Hello!"
    @State private var smallObservation : String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget purus tortor. Donec egestas consectetur orci, semper sodales odio semper at"
    @State private var buttonText : String = "Accept and start"
    @State private var disagreeText : String = "No Thanks"
    
    
    func CheckLanguage() {
        
        //ENGLISH
        if languageId == 0 {
            //It's already done
        }
        
        //PORTUGUES
        if languageId == 1 {
            self.welcomeTitle = "Olá!"
            self.buttonText = "Aceitar e continuar"
            self.disagreeText = "Não, obrigado"
        }
        
        //ESPANHOL
        if languageId == 2 {
            self.welcomeTitle = "Hola!"
            self.buttonText = "Aceptar y comenzar"
            self.disagreeText = "No gracias"
            
        }
        
        if languageId == 3 {
            self.welcomeTitle = "Salut!"
            self.buttonText = "Accepter et commencer"
            self.disagreeText = "Non, merci"
        }
    }
    
    var body: some View {
        ZStack {
            VStack {
                Image("WelcomeImage")
                    .resizable()
                    .scaledToFit()
                    .frame(height: UIScreen.maxHeight - 420)
                
                VStack {
                    Text("\(welcomeTitle)")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .lineLimit(2)
                        .multilineTextAlignment(.center)
                        .padding(.bottom)
                    
                    Text("\(smallObservation)")
                        .font(.subheadline)
                        .lineLimit(3)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    
                    Button {
                        
                    } label: {
                        Text("\(self.buttonText)")
                            .fontWeight(.semibold)
                    }
                    .padding(.vertical, 12)
                    .padding(.horizontal, 50)
                    .foregroundColor(.white)
                    .background(Color.accentColor)
                    .cornerRadius(5)
                    
                    Button {
                        self.OnBoardingViewID = 1
                    } label: {
                        Text("No Thanks")
                            .fontWeight(.medium)
                            .padding(.top)
                    }
                    
                }
                .padding([.horizontal,.top])
            }
        }
        .onAppear {
            CheckLanguage()
        }
    }
}



struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
        OnBoardingView2()
    }
    
    
}
