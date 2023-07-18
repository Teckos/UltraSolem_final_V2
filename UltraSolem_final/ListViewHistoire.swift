//
//  ListViewHistoire.swift
//  UltraSolemSimon
//
//  Created by Simon Naud on 28/10/2022.
//

import SwiftUI

struct ListViewHistoire: View {
    @EnvironmentObject var playerData : PlayerData
    
//    static let myColor = Color("mycolor")
    var body: some View {
       // NavigationStack{
            ZStack{
                
//                Image("voieLactée")
//                    .resizable()
//                    .ignoresSafeArea()
//                Color.gray
//                    .ignoresSafeArea()
                ScrollView{
                    NavigationLink(destination: PrologueView(/*story: stories[playerData.etape], astre: stories[playerData.etape].choix1*/)){
                        VStack{
                            VStack(spacing: 0) {
                                ZStack{
                                    Rectangle()
                                        .fill(Color("ColorTiles"))
                                        .frame(width:370, height: 100)
                                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                    VStack(alignment: .leading){
                                        Text(playerData.stories[0].titre)
                                            .font(.title2)
                                            .fontWeight(.bold)
                                            .foregroundColor(.black)
                                        Text(playerData.stories[0].resume)
                                            .font(.body)
                                            .foregroundColor(.black)
                                        Divider()
                                        Text("Lieu actuel")
                                            .foregroundColor(.black)
                                            .font(.caption)
                                    }
                                    .padding(.horizontal)
                                }
                                ZStack(alignment: .bottomLeading) {
                                    
                                    if playerData.stories[0].choix1vu || playerData.stories[0].choix2vu {
                                        
                                        Image("Terre.bigTile")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:370)
                                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                        VStack{
                                            Text("Terre")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                        }.padding()
                                        
                                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                            .shadow(radius: 10, x: 0, y: 5)
                                        
                                    }else{
                                        Image("unknown.bigTile")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width:370)
                                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                        VStack{
                                            Text("Unknown")
                                                .font(.title)
                                                .fontWeight(.bold)
                                                .foregroundColor(.white)
                                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                        }.padding()
                                        
                                            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                                            .shadow(radius: 10, x: 0, y: 5)
                                    }
                                }
                            }
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                        .padding(.horizontal)
                        .shadow(radius: 10, x: 0, y: 5)
                    }
                    
                    ForEach(playerData.stories.filter({$0.type.contains("Chapitre")}), id: \.self){story in
                        StoryTest(chapter: story)
                        
                    }
                    }
                }  .navigationTitle("Journal de Bord")
            }
        
        //}
    }


struct ListViewHistoire_Previews: PreviewProvider {
    static var previews: some View {
        ListViewHistoire()
            .environmentObject(PlayerData())
    }
}

struct StoryTest: View {
    var chapter : Story
    var body: some View {
        VStack{
            NavigationLink(destination: StoryInfoView(/*story: stories[playerData.etape], astre: stories[playerData.etape].choix1*/)){
            ZStack{
                VStack(spacing: 0) {
                    ZStack{
                        Rectangle()
                            .fill(Color("ColorTiles"))
                            .frame(width:370, height: 120)
                        VStack(alignment: .leading){
                            Text(chapter.titre)
                                .font(.title2)
                                .fontWeight(.bold)
                                .foregroundColor(.black)
                            Text(chapter.resume)
                                .font(.body)
                                .foregroundColor(.black)
                                .multilineTextAlignment(.leading)
//                            Divider()
//                            Text("Découverte il y'a 5 jours")
//                                .foregroundColor(.black)
//                                .font(.caption)
                        }.padding(.horizontal)
                    }
                    
                }
                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                .padding(.horizontal)
                .shadow(radius: 10, x: 0, y: 5)
                }
            }
           
            HStack{
                if chapter.choix1vu {
                    StoryPlanet(chapterChoice: chapter.choix1)
                }else{
                    StoryPlanet(chapterChoice: "Unknown")
                }
                if chapter.choix2vu {
                    StoryPlanet(chapterChoice: chapter.choix2)
                }else{
                    StoryPlanet(chapterChoice: "Unknown")
                }
            }
        }
    }
}
struct StoryPlanet: View {
    var chapterChoice : String
    var body : some View{
        NavigationLink(destination: /*TestPlanetInfo(astre: choice*/
                       InfosAstreView(index: astres.first(where: {
            $0.name == chapterChoice
        })!.index)){
            ZStack(alignment: .bottomLeading) {
                Image("\(chapterChoice).littleTile")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170)
                VStack{
                    Text(chapterChoice)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                }.padding()
            }
            .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                .shadow(radius: 10, x: 0, y: 5)
        }
    }
}
