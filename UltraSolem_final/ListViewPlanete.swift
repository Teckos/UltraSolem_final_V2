//
//  ListViewPlanete.swift
//  UltraSolemSimon
//
//  Created by Simon Naud on 27/10/2022.
//
//
// LIGNE 25 !!!!
//


import SwiftUI

struct ListViewPlanete: View {
    @EnvironmentObject var playerData : PlayerData
    var index : Int
    var body: some View {
       // NavigationStack{
            ZStack{
//                Color.gray.edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(astres.filter({$0.nature.contains("Planète")})){
                            // filtrer astres (créer un filtre) filter tableau + condition.
                            astre in
                            NavigationLink (
                                destination:InfosAstreView(index: astre.index),
                            /* */
                        label: {
                            ZStack {
                                VStack(spacing: 0) {
                                    Image("\(astre.name).bigTile")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 370)
                                    ZStack{
                                        Rectangle()
                                            .fill(Color("ColorTiles"))
                                            .frame(width:370, height: 100)
                                        VStack(alignment: .leading){
                                            Text(astre.name)
                                                .foregroundColor(.black)
                                                .font(.title2)
                                                .fontWeight(.bold)
                                            Text(astre.texteCourt)
                                                .foregroundColor(.black)
                                                .font(.body)
                                            Divider()
                                            Text("Découverte il y'a 5 jours")
                                                .foregroundColor(.black)
                                                .font(.caption)
                                        }.padding(.horizontal)
                                    }
                                }
                                .clipShape(RoundedRectangle(cornerRadius: 25, style: .continuous))
                                .padding(.horizontal)
                                .shadow(radius: 10, x: 0, y: 5)
                            }
                           
                            }
                        )}
                        .onTapGesture(count:1) {
//
                        }
                    }
                }            .navigationTitle("Planètes visitées")
            }  .navigationTitle("Planètes visitées")
     //   }
    }
}

struct ListViewPlanete_Previews: PreviewProvider {
    static var previews: some View {
        ListViewPlanete(index: 1)
    }
}
