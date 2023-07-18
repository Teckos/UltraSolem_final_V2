//
//  JournalView.swift
//  TestPaths
//
//  Created by Teck Hao Tea on 30/10/2022.
//

import SwiftUI

struct JournalView_: View {
    var body: some View {
        VStack{
            Text("JournalView").font(.system(size: 40))
            Image("sun")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fill)
                .frame(width: 30, height: 30)
                //.aspectRatio(contentMode: .fit)
                //.scaleEffect(x: 10 / 10 , y: 10 / 10)
        }
    }
}

//struct JournalView_Previews: PreviewProvider {
//    static var previews: some View {
//        JournalView_()
//    }
//}
