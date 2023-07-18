//
//  StoryView.swift
//  TestPaths
//
//  Created by Teck Hao Tea on 30/10/2022.
//

import SwiftUI

struct StoryView: View {
    @EnvironmentObject var playerData : PlayerData
    @Binding var displayText: Bool
    var index: Int
    @Binding var scale: CGFloat
    var body: some View {
        ZStack{
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 380, height: 400)
                .padding(.horizontal)
                .foregroundColor(.white)
                .opacity(1)
            VStack (alignment: .leading){
                Text(playerData.stories[playerData.etape].titre)
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .padding(.horizontal, 30)
                    .padding(.top, 10)
                ScrollView (.vertical, showsIndicators: false){
                    Text(playerData.stories[playerData.etape].mainStory)
                        .padding(.horizontal, 30)
                        //.frame(height: 300)
                        //.scrollDisabled(false)
                }
                
                HStack{
                    Spacer()
                    //NavigationLink(destination: InfoAstreView_(index: index)) {
                        Button {
                            withAnimation(Animation.easeOut(duration: 1)) {
                                displayText = true
                                scale = playerData.displaySat ? 3.0 : 0.15
                            }
                        }
                        label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width : 90, height: 35)
                                
                                Text("Voyager")
                                    .foregroundColor(.white)
                                    .offset(y: displayText ? 700 : 0)
                                    
                            }
                                
                        }.padding(.horizontal, 30)
                        .padding(.bottom, 15)
                        .offset(y: displayText ? 700 : 0)
                        
                        //.buttonStyle(.borderedProminent)
                    //    .padding(.trailing, 30)
                    //    .padding(.bottom)
                    //}
                
                }.offset(y: displayText ? 700 : 0)
            }
            
    
        }.frame(width: 380, height: 150)
        .padding(.vertical, 40)
        .offset(y: displayText ? 700 : 0)
    }
}

struct StoryView_Previews: PreviewProvider {
    static var previews: some View {
        StoryView(displayText: .constant(false), index: 0, scale: .constant(1.0))
            .environmentObject(PlayerData())
    }
}
