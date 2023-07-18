//
//  PlanetPreview.swift
//  TestPaths
//
//  Created by Teck Hao Tea on 28/10/2022.
//

import SwiftUI

struct PlanetPreview: View {
    @EnvironmentObject var playerData : PlayerData
    @State var saveProgress = false
    @State var showAlert2: Bool = false
    @State var impossible = false
    var index: Int
    @State var playGame = false
    var body: some View {
        
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 380, height: 150)
                .padding(.horizontal)
                .foregroundColor(.white)
                .opacity(1)
            VStack (alignment: .leading){
                Text(astres[index].name)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                Text(astres[index].texteCourt)
                    .padding(.horizontal, 30)
                Spacer()
                HStack{
                    Spacer()
                    //                        NavigationLink(destination: InfoAstreView_(index: index)) {
                    /*Button {
                     }
                     label: {*/
                    ZStack{
                        
                        Button("Y aller") {
                            showAlert2 = true
                        }.padding(.all)
                            .background(.blue)
                            .cornerRadius(18)
                            .foregroundColor(.white)
                        .alert("Etes-vous sûr(e) ?", isPresented: $showAlert2) {
                            Button("En fait non...", role: .cancel){}
                            
                            
                            Button("OK"){
                                
                                if playerData.stories[playerData.etape].choix1 == astres[index].name {
                                    playerData.stories[playerData.etape].choix1vu = true
                                    saveProgress = true
                                }else if playerData.stories[playerData.etape].choix2 == astres[index].name {
                                    playerData.stories[playerData.etape].choix2vu = true
                                    saveProgress = true
                                }else if
                                    astres[index].name == "Bob"{
                                    playGame = true
                                    
                                }else{
                                    impossible = true
                                }
                                    
                                
                           
                            }
                            
                            //.font(.system(size: 20)).padding(.bottom)
                            
                            //                                RoundedRectangle(cornerRadius: 10)
                            //                                    .frame(width : 90, height: 35)
                            //                                Text("Y aller")
                            //                                    .foregroundColor(.white)
                        }
                        .alert(" Les données sont incomplètes pour voyager vers cette destination.", isPresented: $impossible, actions: {
                            Button("OK", role: .cancel){}
                        })
                        //}
                        //.buttonStyle(.borderedProminent)
                        .padding(.trailing, 30)
                        .padding(.bottom)
                        NavigationLink(destination: InfosAstreView(index: index), isActive: $saveProgress) {
                            EmptyView()
                        }
                    }
                    
                }
                NavigationLink(destination: rien(), isActive: $playGame){
                    EmptyView()
                }
            }
            
            
        }.frame(width: 390, height: 150)
            .padding(.vertical, 40)
        //.toolbarBackground(.red, for: .navigationBar)
        
        
    }
}

struct PlanetPreview_Previews: PreviewProvider {
    static var previews: some View {
        PlanetPreview(index: 0)
            .environmentObject(PlayerData())
    }
}
