//
//  ContentView.swift
//  settingsView
//
//  Created by Alexis on 27/10/2022.
//

import SwiftUI

struct SettingsView: View {
    @State var sliderVolumeValue : Float = 0.0
    @State var sliderLightValue : Float = 0.0
    @State var vibrationToggle = true
    @State var notificationToggle = true
    @State var showAlert = false
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Réglages").font(.largeTitle)
                    .padding()
                Text("Son").font(.title)
                HStack {
                    Image(systemName: "speaker.wave.1").font(.system(size: 20))
                        .padding(.horizontal)
                    Slider(value: $sliderVolumeValue, in: 0...10).padding(.bottom)
                    Image(systemName: "speaker.wave.2").fontWeight(.bold).font(.system(size: 20))
                        .padding(.horizontal)
                }
                .padding(.horizontal)
                Text("Luminosité").font(.title)
                HStack {
                    Image(systemName: "sun.min").font(.system(size: 20))
                        .padding(.horizontal)
                    Slider(value: $sliderLightValue, in: 0...10).padding(.bottom)
                    Image(systemName: "sun.max").fontWeight(.bold).font(.system(size: 20))
                        .padding(.horizontal)
                }
                .padding()
                VStack {
                    Toggle("Activer les vibrations", isOn: $vibrationToggle).padding()
                    Toggle("Activer les vibrations", isOn: $notificationToggle).padding(.horizontal)
                }.padding(.bottom)
                
                    Button("Réinitialiser la partie") {
                        showAlert = true
                    }
                    .alert("Cela va effacer toutes vos données et votre progression. Etes-vous sûr(e) ?", isPresented: $showAlert) {
                        Button("En fait non...", role: .cancel){}
                        
                        NavigationLink(destination: OpenView()) {
                            Button("OK"){
//
//   REINITIALISER LES DONNEES STORY ET QUIZZ
//
                            }
                        }
                    }
                    .font(.system(size: 20)).padding(.bottom)
                }
            
            .padding()
            .background(RoundedRectangle(cornerRadius: 30).fill(Color(.systemGray6)).padding())
        }
    }
}

struct SettingsViewPreviews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
