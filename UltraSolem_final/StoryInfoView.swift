//
//  StoryInfoView.swift
//  UltraSolemSimon
//
//  Created by Simon Naud on 28/10/2022.
//

import SwiftUI

struct StoryInfoView: View {
    @EnvironmentObject var playerData : PlayerData
   // @State var story: Story

    var body: some View {
        NavigationStack{
            ScrollView{
                VStack(alignment: .leading){
                    Text("\(playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].titre)")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Text("\(playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].dateDecouverte)")
                    Spacer()
                        .frame(height:50)
                    Text("\(playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].mainStory)")
                    Spacer()
                        .frame(height:50)
                    Text("Objets célestes visités")
                        .font(.title)
                        .fontWeight(.bold)
                 
                    NavigationStack{
                        HStack{
                            NavigationLink(destination: /*TestPlanetInfo(astre:astre)*/
                                           InfosAstreView(index: astres.first(where: {
                                $0.name == playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].choix1})!.index
                             )){
                                ZStack(alignment: .bottomLeading) {
                                    Image("\(playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].choix1).littleTile")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 170)
                                    VStack{
                                        Text(playerData.stories.filter({$0.type.contains("Chapitre")})[playerData.etape].choix1)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding()
                                }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                            }
                            
                            NavigationLink(destination: /*TestPlanetInfo(astre: astre)*/
                                           InfosAstreView(index: 0)){
                                ZStack(alignment: .bottomLeading) {
                                    Image("\(astres[0].name).littleTile")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 170)
                                    VStack{
                                        Text(astres[0].name)
                                            .font(.title)
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                    }.padding()
                                }.clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous)).frame(width: 180)
                            }
                        }
                    }
                }.padding()
            }
        }
    }
}

    struct StoryInfoView_Previews: PreviewProvider {
        static var previews: some View {
            StoryInfoView(/*story:Story(planete: "Terre",
                                choix1: "Mars",
                                choix2:"Saturne",
                                choix1vu: true,
                                choix2vu: false,
                                jour: 1,
                                dateDecouverte: "1 Janvier 2022",
                                titre: "Chapitre 1",
                                mainStory: "Lorem ipsum dolor sit amet. Qui distinctio dolores quo nisi soluta eos tempora nisi et iure porro sit suscipit dicta est eaque delectus. Et beatae nostrum ea maxime sunt aut enim deserunt ut dolores consequatur? Id exercitationem perspiciatis qui officia consequatur et sunt voluptatibus quo officiis asperiores cum soluta modi sit neque ratione!",
                                resume: "Lorem ipsum résumé"),
                          astre: Astre(name: "Soleil",
                                chapitre : "Mars",
                                nature: "Etoile",
                                age: 4603000000,
                                dateDecouverte: "24 Octobre 2022",
                                sizeRayon: 696340,
                                sizeCirconference: 4379000,
                                distanceTerre: 149597870.7,
                                composition1: "Hydrogène",
                                composition1Pourcent: 0.74,
                                composition2: "Hélium",
                                composition2Pourcent: 0.25,
                                composition3: "Autre",
                                composition3Pourcent: 0.01,
                                satellites: "Aucun",
                                temperature: 5900,
                                imagePrincipale: "soleil.image1",
                                imageSecondaire: "soleil.image2",
                                imageBigTile: "soleil.bigTile",
                                imageLittleTile: "soleil.littleTile",
                                texteDescription1: "TextDescription1 Lorem ipsum",
                                texteDescription2: "TextDescription2 Lorem ipsum",
                                texteFact1: "texteFact1 Lorem ipsum",
                                texteFact2: "texteFact2 Lorem ipsum",
                                texteNews1: "texteNews1 Lorem ipsum",
                                texteNews2: "texteNews2 Lorem ipsum",
                           texteCourt: "texteCourt1 Lorem ipsum")*/ )
            .environmentObject(PlayerData())
        }
    }

