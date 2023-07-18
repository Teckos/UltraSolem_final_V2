//
//  InfosAstreView.swift
//  InfosAstre
//
//  Created by Apprenant 26 on 31/10/2022.
//

import SwiftUI

struct InfosAstreView: View {
    
    @EnvironmentObject var playerData : PlayerData
    
    var index : Int
    
    var body: some View {
        
        VStack{
            ScrollView(showsIndicators: false){
                VStack (alignment: .leading){
                    
                    HStack{
                        Text("\(astres[index].name)")
                            .foregroundColor(.black)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Spacer()
                        Image("\(astres[index].name).imagePrincipale")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 200 ,height:200)
                    }
                    
                    HStack{
                        Text("Distance :")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("\((astres[index].distanceTerre), specifier: "%.2f") km")
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack{
                        Text("Température :")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("\((astres[index].temperature), specifier: "%.2f") °C")
                       // Text("((weight), specifier: "%.2f")")
                       // String(format: "%.2f", \(astres[index].temperature)) + " °C"
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                    
                    HStack{
                        Text("Rayon :")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("\((astres[index].sizeRayon), specifier: "%.2f") km")
                            .font(.body)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                    }
                    .padding(.bottom, 20.0)
                    
                    TabView {
                        Image("\(astres[index].name).carousel0")
                            .resizable()
                            .scaledToFill()
                        
                        Image("\(astres[index].name).carousel1")
                            .resizable()
                            .scaledToFill()
                        
                        Image("\(astres[index].name).carousel2")
                            .resizable()
                            .scaledToFill()
                        
                        Image("\(astres[index].name).carousel3")
                            .resizable()
                            .scaledToFill()
                        
                        Image("\(astres[index].name).carousel4")
                            .resizable()
                            .scaledToFill()
                        
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                    .shadow(radius: 10, x: 0, y: 5)
                    .padding(.bottom, 13.0)
                    .frame(height: 200)
                    .tabViewStyle(PageTabViewStyle())
                    
                    Group{
                        
                        
                        Text("Description :")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .multilineTextAlignment(.leading)
                        Text("\(astres[index].texteDescription1)")
                            .font(.body)
                            .fontWeight(.regular)
                            .multilineTextAlignment(.leading)
                        
                        Spacer()
                        
                    }
                }
                // .padding(.bottom, 30)
                
                
            }
            .padding(.horizontal)
            
            VStack(alignment: .center, spacing: 30){
                
                
                NavigationLink(destination: QuizzView(astre: astres[index])){
                    
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 30)
                            .frame(width: 90, height: 40)
                            .foregroundColor(.gray)
                        Text ("Cool !")
                            .foregroundColor(.white)
                    }
                    
                    
                    
                    
                }
            }
        }
          
            
            
            
            
        }
    }




struct InfosAstreView_Previews: PreviewProvider {
    static var previews: some View {
        InfosAstreView(/*astre:Astre(name: "Antarès",
                        chapitre : "Mars",
                        nature: "Etoile",
                        age: 11000000,
                        dateDecouverte: "29 Septembre 2022",
                        sizeRayon: 700000,
                        sizeCirconference: 0,
                        distanceTerre: 5203402050000000,
                        composition1: "N/A",
                        composition1Pourcent: 0,
                        composition2: "N/A",
                        composition2Pourcent: 0,
                        composition3: "N/A",
                        composition3Pourcent: 0,
                        satellites: "Aucun",
                        temperature: 3296.85,
                        imagePrincipale: "antares.image1",
                        imageSecondaire: "antares.image2",
                        imageBigTile: "antares.bigTile",
                        imageLittleTile: "antares.littleTile",
                        texteDescription1: "TextDescription1 Lorem ipsum",
                        texteDescription2: "TextDescription2 Lorem ipsum",
                        texteFact1: "texteFact1 Lorem ipsum",
                        texteFact2: "texteFact2 Lorem ipsum",
                        texteNews1: "texteNews1 Lorem ipsum",
                        texteNews2: "texteNews2 Lorem ipsum",
                        texteCourt: "La géante rouge")*/  index: 4)
        .environmentObject(PlayerData())
        
    }
}
