//
//  UltraSolem_finalApp.swift
//  UltraSolem_final
//
//  Created by Teck Hao Tea on 31/10/2022.
//

import SwiftUI

@main
struct UltraSolem_finalApp: App {
    @StateObject var playerData = PlayerData()
    var body: some Scene {
        WindowGroup {
            MapView(posIndexAstre: 0)
                .environmentObject(playerData)
        }
    }
}
