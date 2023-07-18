//
//  StepByStep.swift
//  UltraSolem_final
//
//  Created by Emma ORLANDINI on 02/11/2022.
//

import SwiftUI

struct StepByStep: View {

    
    var body: some View {
        Text("")
    }
}

struct StepByStep_Previews: PreviewProvider {
    static var previews: some View {
        StepByStep()
    }
}

struct Step : Identifiable {
    var id = UUID()

    var etap : String
    var histoire : String
    var planetVisitee : String
    
}


