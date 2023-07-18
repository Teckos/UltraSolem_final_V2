//
//  ListViewEtoile.swift
//  UltraSolemSimon
//
//  Created by Simon Naud on 27/10/2022.
//

import SwiftUI

struct ListViewEtoile: View {
    @EnvironmentObject var playerData : PlayerData

    var body: some View {
      //  NavigationStack{
            ZStack{
//                Color.gray.edgesIgnoringSafeArea(.all)
                ScrollView{
                    VStack(alignment: .leading){
                        ForEach(astres.filter({$0.nature.contains("Etoile")})){
                            astre in
                            NavigationLink (
                                destination:InfosAstreView(index: astre.index),
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
                    }
                }            .navigationTitle("Étoiles visitées")
            }
       // }
    }
}

struct ListViewEtoile_Previews: PreviewProvider {
    static var previews: some View {
        ListViewEtoile()
    }
}
