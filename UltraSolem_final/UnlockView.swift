//
//  ContentView.swift
//  UltraSolem
//
//  Created by Teck Hao Tea on 26/10/2022.
//


//
// Virer toolbars                  LIGNE 133    OK
//
// 
//
//
//
//
//  Penser à un texte "Placer votre oeil ici"


import SwiftUI



struct UnlockView: View {

    @State var couleur: Color = .white
    @State var flash: CGFloat = 0.0
    @State var opa: CGFloat = 0.0
    @State var offsetX: CGFloat = -100
    @State var offsetY: CGFloat = -100
    @State var size: CGFloat = 90
    @State var displayReaders = true
    var path = Path()
    @State var bScreen = false
    @State var mapGo = false

    
    @State var displayText: Bool
    var index: Int
    @State var scale: CGFloat
    
    var body: some View {
//        NavigationStack {
        
            ZStack {
                Rectangle()
                    .foregroundColor(.black)
                Image("voieLactée")
                     .resizable()
                     .scaledToFill()
                     .frame(minHeight: 0, maxHeight: .infinity)
                     .ignoresSafeArea()
                     .offset(x: -20)

                VStack{
                    Spacer()
                    ZStack{
                        //

                        Path { path in
                            path.addLines([CGPoint(x: 0.0, y: 40.0), CGPoint(x: 0.0, y: 00.0), CGPoint(x: 40.0, y: 0.0)])
                            path.addLines([CGPoint(x: 160.0, y: 0.0), CGPoint(x: 200.0, y: 00.0), CGPoint(x: 200.0, y: 40.0)])
                            path.addLines([CGPoint(x: 200.0, y: 160.0), CGPoint(x: 200.0, y: 200.0), CGPoint(x: 160.0, y: 200.0)])
                            path.addLines([CGPoint(x: 40.0, y: 200.0), CGPoint(x: 0.0, y: 200.0), CGPoint(x: 0.0, y: 160.0)])
                        }.stroke(.white, lineWidth: 1)
                            .offset(x: 100, y: 100)
                            .opacity(displayReaders ? 1 : 0)
                    
                        //
                        Rectangle()
                            .frame(width: 2.0, height: 200.0)
                            .foregroundColor(couleur)
                            .opacity(opa)
                            .offset(x : offsetX - 13)
                            
                        Rectangle()
                            .frame(width: 200.0, height: 2.0)
                            .foregroundColor(couleur)
                            .opacity(opa)
                            .offset(x: -13, y : offsetY)
                        
                        
                    }.frame(height: 400)
                    Spacer()
                    
                        VStack{
                            NavigationLink(destination : MapView(posIndexAstre: index), isActive: $mapGo){
                                EmptyView()
                            }
                            
                            Image("finger")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fit)
                                .frame(width: size)
                                .opacity(displayReaders ? 1 : 0)
                                .onLongPressGesture(minimumDuration: 1.2, maximumDistance: 30){ (isPressing) in
                                    if isPressing{
                                        opa = 1.0
                                        withAnimation{
                                            couleur = .white
                                            offsetX = 100
                                            offsetY = 100
                                            size = 120
                                        }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                            withAnimation {
                                                offsetX = -100
                                                offsetY = -100
                                                //couleur = .black
                                                size = 90
                                                
                                            }
                                        }
                                        
                                    } else {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.0) {
                                            withAnimation {
                                                offsetX = -100
                                                offsetY = -100
                                                //couleur = .black
                                                size = 90
                                            }
                                        }
                                    }
                                } perform: {
                                    
                                    withAnimation(.easeOut){
                                        //couleur = .black
                                        flash = 1.0
                                        size = 90
                                        opa = 0.0
                                        displayReaders = false
                                        
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                        flash = 0.0
                                    }
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                        withAnimation(.easeIn(duration: 0.9)){
                                            bScreen.toggle()
                                        }
                                    }
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                            mapGo.toggle()
                                        
                                    }
                                }
                        .frame(height: 200)
                        .navigationBarBackButtonHidden(true)
                        }.offset(x: -13)

                    Spacer()
                }


                Rectangle()
                    .foregroundColor(.white)
                    .opacity(flash)
            }
            .background(.black)
            .ignoresSafeArea()
            .opacity(bScreen ? 0 : 1)
        }
        
  //  }
}

struct ButtonArrowShape: View {
    var body: some View {
    Image(systemName: "arrowshape.right.fill")
        .resizable()
        .frame(width: 70, height: 30)
        .foregroundColor(.white)
        .padding(.vertical, 10)
        .padding(.horizontal, 30)
        .background(.gray)
        .cornerRadius(20)
        .padding(.bottom, 30)
}
}

struct UnlockView_Previews: PreviewProvider {
    static var previews: some View {
        UnlockView(displayText: false, index: 0, scale: 1.0)
    }
}

