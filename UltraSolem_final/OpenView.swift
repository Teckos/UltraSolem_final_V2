//
//  OpenView.swift
//  OpenView
//
//  Created by Teck Hao Tea on 27/10/2022.
//
//
//
//
// Revoir la transition (voile blanc) vers l'écran suivant  OK
// Revoir l'animation                                       OK
// Revoir la pression (longue ?)                            OK
//
//
//
//

import SwiftUI

struct OpenView: View {
    
    @State var isAnim: Bool = false
    @State var isSuccess: Bool = false
    @State var sun: CGFloat = 700
    @State var offLimit: CGFloat = 700
    @State var fontTitle: CGFloat = 40

    var body: some View {
        NavigationStack{
            DelayedNavigationLink(destination: WelcomeView(displayText: false, index: 0, scale: 1.0)){
                ZStack {
                    Rectangle()
                    .background(.black)
                    .ignoresSafeArea()
                Image("voieLactée")
                     .resizable()
                     .scaledToFit()
                     .frame(minHeight: 0)
                     .ignoresSafeArea()
                     .offset(x: -23)
                     .opacity(isSuccess ? 0.5 : 0.9)
                    Group{
//                        Circle()//Neptune
//                            .foregroundColor(.indigo)
//                            .frame(width: 40)
//                            .offset(y : isAnim ? offLimit : -330)
                        Image("Neptune_cutout")
                                                    .resizable(resizingMode: .stretch)
                                                    .frame(width: 40, height: 40)
                                                    .aspectRatio(contentMode: .fit)
                                                    .scaledToFit()
                                                    .offset(y : isAnim ? offLimit : -330)
                        
//                        Circle()//Uranus
//                            .foregroundColor(.teal)
//                            .frame(width: 40)
//                            .offset(y : isAnim ? offLimit : -250)
                        Image("uranus_cutout")
                                                    .resizable(resizingMode: .stretch)
                                                    .frame(width: 40, height: 40)
                                                    .aspectRatio(contentMode: .fit)
                                                    .scaledToFit()
                                                    .offset(y : isAnim ? offLimit : -250)
                                                
//
//                        Circle()//Saturne
//                            .foregroundColor(.orange)
//                            .frame(width: 110)
//                            .offset(y : isAnim ? offLimit : -140)
//
//                        Ellipse()//Saturne
//                            .foregroundColor(.orange)
//                            .frame(width: 260, height: 40)
//                            .rotationEffect(.degrees(50))
//                            .offset(y : isAnim ? offLimit : -140)
                        
                        Image("saturn_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 250, height: 175)
                                                   .aspectRatio(contentMode: .fill)
                                                   .scaledToFit()
                                                   .offset(y : isAnim ? offLimit : -140)
//                        Circle()//Jupiter
//                            .foregroundColor(.gray)
//                            .frame(width: 130)
//                            .offset(y : isAnim ? offLimit : 10)
                        Image("jupiter_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 130, height: 130)
                                                   .aspectRatio(contentMode: .fit)
                                                   .scaledToFit()
                                                   .rotationEffect(.degrees(30))
                                                   .offset(y : isAnim ? offLimit : 10)
                                                           
                    }
                    Group{
//                        Circle()//Mars
//                            .foregroundColor(.red)
//                            .frame(width: 10)
//                            .offset(y : isAnim ? offLimit : 130)
                        Image("mars_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 10, height: 10)
                                                   .aspectRatio(contentMode: .fit)
                                                   .scaledToFit()
                                                   .offset(y : isAnim ? offLimit : 130)
                        
//                        Circle()//Terre
//                            .foregroundColor(.blue)
//                            .frame(width: 14)
//                            .offset(y : isAnim ? offLimit : 180)
                        
                        Image("earth_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 14, height: 14)
                                                   .aspectRatio(contentMode: .fit)
                                                   .scaledToFit()
                                                   .offset(y : isAnim ? offLimit : 180)
                        
//                        Circle()//Venus
//                            .foregroundColor(.orange)
//                            .frame(width: 14)
//                            .offset(y : isAnim ? offLimit : 230)
                        Image("venus_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 14, height: 14)
                                                   .aspectRatio(contentMode: .fit)
                                                   .scaledToFit()
                                                   .offset(y : isAnim ? offLimit : 230)
                                               
                        
//                        Circle()//Mercure
//                            .foregroundColor(.gray)
//                            .frame(width: 8)
//                            .offset(y : isAnim ? offLimit : 280)
                        
                        Image("mercury_cutout")
                                                   .resizable(resizingMode: .stretch)
                                                   .frame(width: 8, height: 8)
                                                   .aspectRatio(contentMode: .fit)
                                                   .scaledToFit()
                                                   .offset(y : isAnim ? offLimit : 280)
                                               
                        
//                        Circle()//Sun
//                            .foregroundColor(.orange)
//                            .frame(width: 1800)
//                            .offset(y : isAnim ? offLimit : 700)
                        
                        Image("sun.cutout")
                                                    .resizable(resizingMode: .stretch)
                                                    .frame(width: 800, height: 250)
                                                    .aspectRatio(contentMode: .fill)
                                                    .scaledToFill()
                                                    .offset(y : isAnim ? offLimit : 370)
                       
                    }
                    Text("UltraSolem")
                        .font(.system(size: fontTitle))
                        .onAppear{
                            withAnimation(Animation.easeOut(duration:3).repeatForever(autoreverses:true)){
                                fontTitle = 60
                            }
                        }
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                    
                    
                    Rectangle()
                        .ignoresSafeArea()
                        .opacity(isSuccess ? 1.0 : 0.0)
//                    withAnimation (Animation.easeOut(duration:1)){
//                        Image("voieLactée")
//                            .resizable()
//                            .scaledToFit()
//                            //.frame(minHeight: 0, maxHeight: .infinity)
//                            .ignoresSafeArea()
//                            .opacity(isSuccess ? 0.5 : 0.0)
//                    }
                    
                }
                
            }
            .delayed(by: 3)

            .buttonStyle(EmptyButtonStyle())
            .onLongPressGesture(minimumDuration: 1) { (isPressing) in
                if isPressing {
                    withAnimation(.easeInOut(duration: 1.5)) {
                        isAnim = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        withAnimation (.easeInOut(duration: 1.5)) {
                            isAnim = true
                            offLimit = 1200
                            isSuccess = true
                            
                        }
                    }
                } else {
                    withAnimation(.easeInOut(duration: 1.0)) {
                        isAnim = false
                    }
                }
                
            }
        perform: {
                
                }
            
            //.padding()
        
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EmptyButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        OpenView()
            .environmentObject(PlayerData())
        
    }
    
}
