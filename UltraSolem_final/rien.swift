//
//  rien.swift
//  App
//
//  Created by Emma ORLANDINI on 28/10/2022.
//

import SwiftUI

struct rien: View {
    @Environment(\.dismiss) var dismiss
    @State var yMeteor1 = 60
    @State var location : CGPoint = CGPoint(x: 195, y: 600)
    @State var meteor1location : CGPoint = CGPoint(x: 50, y:50 )
    @State var meteor2location : CGPoint = CGPoint(x: 100, y: -220)
    @State var meteor3location : CGPoint = CGPoint(x: 150, y: -180)
    @State var meteor4location : CGPoint = CGPoint(x: 200, y: -300)
    @State var meteor5location : CGPoint = CGPoint(x: 250, y: -90)
    @State var meteor6location : CGPoint = CGPoint(x: 300, y: -60)
    @State var meteor7location : CGPoint = CGPoint(x: 350, y: 30)
    @State var meteor8location : CGPoint = CGPoint(x: 390, y: 15)
    
    
    
    
    var metorPositions : [String : CGPoint] = ["meteorA" : CGPoint(x: 50, y: 50), "meteorB" : CGPoint(x: 100, y: 50), "meteorC" : CGPoint(x: 150, y: 50),"meteorD" : CGPoint(x: 200, y: 50)]
    var simpleDrag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.location = value.location
            }
    }
    
    @State var showButtonPlay = false
    @State var showGAMEOVER = false
    @State var showFinishGame = false
    @State var timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack{
            Image("voieLactée")
                .resizable()
                .scaledToFill()
                .frame(minHeight: 0, maxHeight: .infinity)
                .ignoresSafeArea()
                .offset(x: -23)
            
            
            /*  if location == meteor1location{
             showGAMEOVER.toggle()
             .alert("GAME OVER", isPresented: $showGAMEOVER){
             Button("Super", role: .cancel){
             location = CGPoint (x: 195, y: 600)
             }
             
             }*/
            
            Meteor(position: $meteor1location)
            Meteor(position: $meteor2location)
            Meteor(position: $meteor3location)
            Meteor(position: $meteor4location)
            Meteor(position: $meteor5location)
            Meteor(position: $meteor6location)
            Meteor(position: $meteor7location)
            Meteor(position: $meteor8location)
            //                .onAppear(){
            //            for index in 50...750 {
            //               // DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            //
            //                        meteor1location = CGPoint(x: 50, y: index)
            //
            //                //}
            //            }
            //
            
            
            
            
            
                .onReceive(timer) { _ in
                    meteor1location.y += 2.7
                    meteor2location.y += 0.8
                    meteor3location.y += 1.6
                    meteor4location.y += 2.4
                    meteor5location.y += 1.4
                    meteor6location.y += 2.1
                    meteor7location.y += 3
                    meteor8location.y += 0.9
                    
                }
                .onChange(of: meteor1location) { newValue in
                    crash(meteroLocation: meteor1location)
                    if meteor1location.y >= 800 {
                        meteor1location.y = 50
                    }
                }
                .onChange(of: meteor2location) { newValue in
                    crash(meteroLocation: meteor2location)
                    if meteor2location.y >= 800 {
                        meteor2location.y = 50
                    }
                }
                .onChange(of: meteor3location) { newValue in
                    crash(meteroLocation: meteor3location)
                    if meteor3location.y >= 800 {
                        meteor3location.y = 50
                    }
                }
                .onChange(of: meteor4location) { newValue in
                    crash(meteroLocation: meteor4location)
                    if meteor4location.y >= 800 {
                        meteor4location.y = 50
                    }
                }
                .onChange(of: meteor5location) { newValue in
                    crash(meteroLocation: meteor5location)
                    if meteor5location.y >= 800 {
                        meteor5location.y = 50
                    }
                }
                .onChange(of: meteor6location) { newValue in
                    crash(meteroLocation: meteor2location)
                    if meteor6location.y >= 800 {
                        meteor6location.y = 50
                    }
                }
                .onChange(of: meteor7location) { newValue in
                    crash(meteroLocation: meteor7location)
                    if meteor7location.y >= 800 {
                        meteor7location.y = 50
                    }
                }
                .onChange(of: meteor8location) { newValue in
                    crash(meteroLocation: meteor8location)
                    if meteor8location.y >= 800 {
                        meteor8location.y = 50
                    }
                }
            //                    crash(meteroLocation: meteor3location)
            //                    crash(meteroLocation: meteor4location)
            //                    crash(meteroLocation: meteor5location)
            //                    crash(meteroLocation: meteor6location)
            //                    crash(meteroLocation: meteor7location)
            //                    crash(meteroLocation: meteor8location)
                .onAppear{
                    Timer.scheduledTimer(withTimeInterval: 35, repeats: false) { finish in
                        showFinishGame = true
                    }
                }
            
                .alert("Essaie encore !", isPresented: $showGAMEOVER){
                    Button("OK", role: .cancel){
                        location = CGPoint (x: 195, y: 600)
                        meteor1location = CGPoint(x: 50, y: 50)
                        meteor2location = CGPoint(x: 100, y: -20)
                        meteor3location = CGPoint(x: 150, y: -80)
                        meteor4location = CGPoint(x: 200, y: -100)
                        meteor5location = CGPoint(x: 250, y: -90)
                        meteor6location = CGPoint(x: 300, y: -60)
                        meteor7location = CGPoint(x: 350, y: 30)
                        meteor8location = CGPoint(x: 390, y: 15)
                        timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()
                        withAnimation(.easeIn(duration: 0.3)){
                            showGAMEOVER = false
                        }
                        
                        
                        
                    }
                    
                    
                }
                .alert("Felicitation", isPresented: $showFinishGame){
                    Button("OK", role: .cancel){
                        dismiss()
                    }
                }
            
            
            
            
            
            ZStack{
            
                Image("normandy")
                    .resizable()
                    .frame(width: 60,height: 60)
                    .foregroundColor(.white)
                    .cornerRadius(40)
                // .rotationEffect(.degrees())
                   
                Image("explosion")
                    .resizable()
                    .frame(width: showGAMEOVER ? 150 : 80,height: showGAMEOVER ? 150 : 80)
                    .opacity(showGAMEOVER ? 1 : 0)
            }
            .position(location)
            .gesture(simpleDrag)
            
            
            
            //            VStack{
            //                Spacer()
            //                Button("Stop"){
            //                    showButtonPlay.toggle()
            //                }.foregroundColor(.white)
            //                    .padding(.all)
            //                    .background(.gray)
            //                    .cornerRadius(20)
            //                    .opacity(showButtonPlay ? 0 : 1)
            //
            //
            //            }
       
        }
        
    }
    func crash(meteroLocation : CGPoint){
        
        print(location)
        print(meteroLocation)
        if location.x + 15 >= meteroLocation.x - 20
            && location.x - 15 <= meteroLocation.x + 20
            && location.y + 15 >= meteroLocation.y - 20
            && location.y - 15 <= meteroLocation.y + 20
        {
            withAnimation(.easeInOut(duration: 0.5)){
                showGAMEOVER = true
                
                timer.upstream.connect().cancel()
            }
        }
    }
    
}


struct rien_Previews: PreviewProvider {
    static var previews: some View {
        rien()
    }
}

struct Meteor: View {
    @Binding var position : CGPoint
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 30)
                .foregroundColor(.gray)
                .position(position)
            Image("asteroid")
                .resizable()
                .frame(width: 30, height: 30)
                .position(position)
            
            
        }
    }
}


