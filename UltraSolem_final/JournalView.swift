//
//  JournalView.swift
//  UltraSolemSimon
//
//  Created by Simon Naud on 26/10/2022.
//
//
//  PICKER SA MERE
//
//

import SwiftUI

struct JournalView: View {
    @EnvironmentObject var playerData : PlayerData
    var index : Int
    @State var tabSelectedValue = 0
//    var reglageOffset = 0.0
    var body: some View {
        ZStack {
            NavigationStack{
               
                TabView(selection: $tabSelectedValue) {
                    ListViewHistoire()
                        .tabItem{Image(systemName: "list.clipboard.fill")
                                                        Text("Journal")
                                                    }
                        
                    ListViewPlanete(index: index)
                        .tabItem{Image(systemName: "globe.asia.australia.fill")
                                                        Text("Planètes")
                                                    }
                        
                    ListViewSatellite()
                        .tabItem{Image(systemName: "moon.fill")
                                                        Text("Satellites")
                                                    }
                        
                    ListViewEtoile()
                        .tabItem{Image(systemName: "sparkles")
                                                        Text("Etoiles")
                                                    }
                        
                }
                .navigationTitle("Journal de Bord")
//                Picker("Journal", selection: $tabSelectedValue) {
//                    Text("Journal").tag(0) 
//                    Text("Planètes").tag(1)
//                    Text("Satellites").tag(2)
//                    Text("Etoiles").tag(3)
//                }
//                .pickerStyle(SegmentedPickerStyle())
//                .padding([.top, .leading, .trailing], 18.0)
////                .offset(y: reglageOffset)
            }

        } 
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView(index: 1)
            .environmentObject(PlayerData())
    }
}



