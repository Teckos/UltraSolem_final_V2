//
//  PrologueView.swift
//  UltraSolem_final
//
//  Created by Emma ORLANDINI on 03/11/2022.
//

import SwiftUI

struct PrologueView: View {

        @EnvironmentObject var playerData : PlayerData
        // @State var story: Story
        var body: some View {
            NavigationStack{
                ScrollView{
                    VStack{
                        Text("\(playerData.stories[0].titre)")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("\(playerData.stories[0].dateDecouverte)")
                        Spacer()
                            .frame(height:50)
                        Text("\(playerData.stories[0].mainStory)")
                        Spacer()
                            .frame(height:50)
                        Text("Objet céleste connu")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        NavigationStack{
                            HStack{
                                NavigationLink(destination: /*TestPlanetInfo(astre:astre)*/
                                               InfosAstreView(index: 4
                                                             )){
                                    ZStack(alignment: .bottomLeading){
                                        Image("Terre.bigTile")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:370)
                                        VStack{
                                            Text("Terre")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .padding()
                                        }
                                    }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                        
                                }
                           
                            }
                        }
                    }.padding()
                }
            }
        }
    }



struct PrologueView_Previews: PreviewProvider {
    static var previews: some View {
        PrologueView()
            .environmentObject(PlayerData())
    }
}
