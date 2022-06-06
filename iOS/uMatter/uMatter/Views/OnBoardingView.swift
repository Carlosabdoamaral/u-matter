//
//  OnBoardingView.swift
//  uMatter
//
//  Created by Carlos Amaral on 27/01/22.
//

import SwiftUI

struct OnBoardingView : View {
    @AppStorage("OnBoardingViewID") var OnBoardingViewID : Int = 1
    @AppStorage("FinishOnBoarding") var finishOnBoarding : Bool = false
    
    @State private var welcomeTitle : String = "Hello!"
    @State private var smallObservation : String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam eget purus tortor. Donec egestas consectetur orci, semper sodales odio semper at"
    @State private var buttonText : String = "Accept and start"
    @State private var disagreeText : String = "No Thanks"
    
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
                        self.finishOnBoarding = true
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
    }
}

struct OnBoardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
    
    
}
