//
//  ContentView.swift
//  TestPaths
//
//  Created by Teck Hao Tea on 27/10/2022.
//
//
//
// VIRER TOOLBAR                     251       OK
//
//
//
//
//


import SwiftUI

struct MapView: View {
    @EnvironmentObject var playerData : PlayerData
    //@State private var rot = 0.0
    @State private var rev = 0.0
    //@State private var revOld = 0.0
    @State var scale:CGFloat = 3.0
    @State private var scaleNew: CGFloat = 0.0
    @State var scroll = CGSize.zero
    @State var scrollOld = CGSize(width: 0.0, height: -200.0)
    @State var isTapped: Bool = false
    @State var isTouched: Bool = false
    @State private var dragOk = false
    @State var posIndexAstre: Int
    @State var rota: Angle = Angle(degrees: 65)
    //var switchRotaY = displayText
    @State var defaultRotaY = true    //@State var rot: Double = 0.0
    @State var rotaNew: Angle = Angle(degrees: 0)
    @State var playPause = 1
    @State var slow = 10
    @State var speed = 1
    @State var displayText: Bool = false
    @State var opacity = false
 
    @ObservedObject var timeManager = TimeManager()
    
//    func Square(value: Double) -> Double {
//        return value * value
//    }
//
//    func CalculRayon(centerZoom: CGSize)-> Double {
//        return (Square(value: centerZoom.width) + Square(value: centerZoom.height)).squareRoot()
//    }
//
//    func Cos(centerZoom: CGSize) -> Double {
//        return centerZoom.width / CalculRayon(centerZoom: centerZoom)
//    }
//
//    func Sin(centerZoom: CGSize) -> Double {
//        return centerZoom.height / CalculRayon(centerZoom: centerZoom)
//    }
//
//    func NewCenterZoom (centerZoom: CGSize, scale: Double) -> CGSize {
//        var r = CalculRayon(centerZoom: centerZoom)
//        var new: CGSize = CGSize(width: 0.0, height: 0.0)
//        new.width = scale * r * Cos(centerZoom: centerZoom)
//        new.height = scale * r * Sin(centerZoom: centerZoom)
//        return new
//
//    }
    
    var body: some View {
        ZStack{
            
            NavigationStack{
                ZStack{
                    Rectangle()
                        .background(.black)
                        .ignoresSafeArea()
                    ZStack{
                        Image("voieLactée")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 500)
                            .ignoresSafeArea()
                            .offset(x: (scrollOld.width + scroll.width)/30, y: (scrollOld.height + scroll.height + (displayText ? 100 : 0)) / 30)
                            .opacity(1)
                        //                Rectangle()
                        //                    .fill(.black)
                        //                    .ignoresSafeArea()
                        //                    .opacity(0.1)
                        
                        
                        //Bloc carte
                        ZStack{
                            Rectangle()
                            
                                .opacity(0.001)
                            //Affichage planètes
                            ZStack{
                                ZStack{
                                    Orbites(index : 4 , rayon: 0, startAngle: 360, endAngle: 0, rayonP: 0.75, offY: 0, rev: rev, revSpeed: 1, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index : 10,rayon: 40, startAngle: 360, endAngle: 0, rayonP: 0.35, offY: -20, rev: rev, revSpeed: 4.15, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 12, rayon: 120, startAngle: 360, endAngle: 0, rayonP: 0.49, offY: -60, rev: rev, revSpeed: 0.53, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    
                                    
                                }.opacity(playerData.displaySat ? 1 : 0)
                                
                                ZStack(){
                                    // Rectangle()
                                    Orbites(index : 1,rayon: 0, startAngle: 360, endAngle: 0, rayonP: 1, offY: 0, rev: rev, revSpeed: 0, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index : 2,rayon: 50, startAngle: 360, endAngle: 0, rayonP: 0.35, offY: -25, rev: rev, revSpeed: 4.15, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index : 3 ,rayon: 92.5, startAngle: 360, endAngle: 0, rayonP: 0.87, offY: -46.25, rev: rev, revSpeed: 1.6, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index : 4 , rayon: 128, startAngle: 360, endAngle: 0, rayonP: 0.92, offY: -64, rev: rev, revSpeed: 1, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 5, rayon: 195, startAngle: 360, endAngle: 0, rayonP: 0.49, offY: -97.5, rev: rev, revSpeed: 0.53, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 6, rayon: 664.6, startAngle: 310, endAngle: 0, rayonP: 10.027, offY: -332.3, rev: rev, revSpeed: 0.084, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 7, rayon: 1223, startAngle: 270, endAngle: 0, rayonP: 8.6, offY: -611.5, rev: rev, revSpeed: 0.034, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 8, rayon: 2451, startAngle: 240, endAngle: 0, rayonP: 3.7, offY: -1225.5, rev: rev, revSpeed: 0.011, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index: 9, rayon: 3838, startAngle: 220, endAngle: 0, rayonP: 3.6, offY: -1919, rev: rev, revSpeed: 0.006, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    Planete(index : 19 , rayon: 350, startAngle: 360, endAngle: 0, rayonP: 0.5, offY: 175, rev: rev, revSpeed: 0.5, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
                                    
                                }
                                .opacity(playerData.displaySat ? 0 : 1)
                                .rotation3DEffect(rota - (displayText ? .degrees(30) : .degrees(0)), axis: (x: 1, y: (displayText ? -0.3 : -0.5), z: 0), perspective: 0.10)
                                .onAppear{
                                    self.timeManager.start()
                                    withAnimation(Animation.easeOut(duration:Double(3600/speed*slow)).repeatForever()){
                                        rev = 360000
                                    }
                                }
                            }
                            //FIN affichage planètes
                            
                            Image("sun")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .scaleEffect(x: (scale / 5) , y: (scale / 5))
                                .opacity(playerData.displaySat ? 0 : 1)
                                .onTapGesture {
                                    isTouched = true
                                    isTapped = true
                                    posIndexAstre = 1
                                }
                            
                            
                            Image("earth_cutout")
                                .resizable(resizingMode: .stretch)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 30, height: 30)
                                .scaleEffect(x: (scale / 5) , y: (scale / 5))
                                .opacity(playerData.displaySat ? 1 : 0)
                                .onTapGesture {
                                    isTouched = true
                                    isTapped = true
                                    posIndexAstre = 4
                                }
                        }
                        .offset(x: scrollOld.width + scroll.width, y: scrollOld.height + scroll.height + (displayText ? 100 : 0))
                        .onTapGesture {
                            withAnimation {
                                isTapped = false
                            }
                        }
                        .gesture(DragGesture()
                            .onChanged { gesture in
                                scroll = gesture.translation
                            }
                            .onEnded { gesture in
                                scrollOld.width += scroll.width
                                scrollOld.height += scroll.height
                                scroll = CGSize.zero
                            })
                        .gesture(MagnificationGesture()
                            .onChanged{ value in
                                if scale + value - 1 > 0.1 && scale + value - 1 < 10 {
                                    withAnimation{
                                        scaleNew = value - 1
                                        scroll = scrollOld
                                    }
                                }
                            }
                            .onEnded{ value in
                                withAnimation{
                                    scale += scaleNew
                                    scaleNew = 0
                                }
                            })
                        .simultaneousGesture(
                            RotationGesture()
                                .onChanged{ values in
                                    if rota + values > .degrees(0) && rota + values < .degrees(100) {
                                        rotaNew = values
                                    }
                                }
                                .onEnded { values in
                                    withAnimation {
                                        rota += rotaNew
                                        rotaNew = .degrees(0)
                                    }
                                }
                        )
                        //FIN Bloc carte
                        
                        ZStack{
                            Spacer()
                            //      ICI ON MET LA PREVIEW
                            VStack{
                                PlanetPreview(index: posIndexAstre)
                            }.offset(y: isTapped ? 300 : 700)
                                .opacity(displayText ? 1 : 0)
                            //      PANNEAU DE CONTROLES REVOLUTION
                            VStack{
                                //      SLIDERS DEBUG
                                /*Text("Rotation").padding(.vertical, -5)
                                 Slider(value: $rot, in: 0...70).frame(width:   300).padding(.vertical, -10)*/
                                Text("Zoom")
                                    .padding(.bottom, -10)
                                Slider(value: $scale, in: 0.01...5)
                                    .frame(width: 300)
                                    .padding(.bottom)
                                
                                HStack {
                                    Image(systemName: "playpause.fill")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 30)
                                        .onTapGesture {
                                            playPause *= -1
                                            if playPause > 0 {
                                                self.timeManager.start()
                                                print(timeManager.secondsElapsed)
                                                //start = Date.now
                                                withAnimation(Animation.easeOut(duration:Double(3600/speed*slow)).repeatForever(autoreverses:false)){
                                                    rev = 360000 - Double(360000 / (3600/speed*slow)) * timeManager.secondsElapsed
                                                }
                                            } else {
                                                //stop = Date.now
                                                self.timeManager.pause()
                                                print(timeManager.secondsElapsed)
                                                withAnimation(Animation.easeOut(duration:0.5)){
                                                    rev = Double(360000 / (3600/speed*slow)) * timeManager.secondsElapsed * 1.81
                                                    //revOld = rev
                                                }
                                            }
                                        }
                                    Image(systemName: "gobackward")
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 30, height: 30)
                                        .padding(.horizontal, 30)
                                        .onTapGesture {
                                            scale = 0.15
                                            scaleNew = 0.0
                                            scroll = CGSize.zero
                                            scrollOld = CGSize(width: 0.0, height: -150.0)
                                            speed = 1
                                            slow = 10
                                            rota = Angle(degrees: 0)
                                            rotaNew = Angle(degrees: 0)
                                            defaultRotaY = false
                                        }
                                }
                                
                                Text("Revolution")
                                    .padding(.top, 15)
                                    .padding(.bottom, -10)
                                
                                Slider(value: $rev, in: 0...360000)
                                    .frame(width: 300)
                                    .padding(.bottom, 30)
                                
                            }.offset(y: isTapped ? 700 : 300)
                                .foregroundColor(.white)
                                .padding(.vertical)
                                .opacity(displayText ? 1 : 0)
                            
                            //      FIN PANNEAU DE CONTROLES REVOLUTION
                            //
                            //      BLOC HISTOIRE
                            //
                            VStack{
                                StoryView(displayText: $displayText, index: posIndexAstre, scale: $scale)
                            }.offset(y: 180)
                            //
                            Spacer()
                        }
                        
                        //Bouton SETTINGS
                        NavigationLink(destination: SettingsView()){
                            HStack{
                                Image(systemName: "gearshape.fill")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        .offset(x: 150, y: -360)
                        .frame(width: 30, height: 30)
                        .opacity(displayText ? 1 : 0)
                        
                        //FIN bouton SETTINGS
                        
                        //Bouton Journal
                        NavigationLink(destination: JournalView(index: posIndexAstre)) {
                            HStack{
                                
                                Image(systemName: "menucard.fill")
                                    .resizable(resizingMode: .stretch)
                                    .aspectRatio(contentMode: .fill)
                                    .foregroundColor(.gray)
                                
                            }
                        }.offset(x: -150, y: -360)
                            .frame(width: 20, height : 20)
                            .opacity(displayText ? 1 : 0)
                        //FIN bouton journal
                        
                    }
                        .onAppear(){
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.9) {
                                withAnimation (.easeInOut(duration: 2.0)) {
                                    opacity = true
                                }
                            }
                        }
                        .opacity(opacity ? 1 : 0)
                        

                        
                    }
                    .navigationBarBackButtonHidden(true)
                }
                
            }
        }
    }


struct Arc: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment

        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)
        
        return path
    }
}

struct Planete: View {
    //var rot: Double
    @EnvironmentObject var playerData : PlayerData
    var index: Int
    var rayon: CGFloat
    var startAngle: CGFloat
    var endAngle: CGFloat
    var rayonP: CGFloat

    //var offX: CGFloat
    var offY: CGFloat
    var rev: CGFloat
    var revSpeed: CGFloat
    var scale: CGFloat
    @Binding var isTapped: Bool
    @State var isTouched: Bool
    @Binding var posIndexAstre: Int
    var displayText: Bool
    @State var selectionColor: String = ".white"
    var body: some View {
        ZStack{
            
            Circle()
                .frame(width: rayonP)
                .foregroundColor(isTouched ? .red : .white)
                /*.rotation3DEffect(.degrees(-rot), axis: (x: 1, y: 0, z: 0), anchorZ: 0, perspective: 0.10)*/
                .offset(x: 0, y: offY)
                .scaleEffect(x: scale, y: scale)
                .rotation3DEffect(.degrees(-rev * revSpeed), axis: (x: 0, y: 0, z: 1), anchorZ: 0, perspective: 0.10)
            
            Orbites(index: index, rayon: rayon, startAngle: startAngle, endAngle: endAngle, rayonP: rayonP, offY: offY, rev: rev, revSpeed: revSpeed, scale: scale, isTapped: $isTapped, isTouched: isTouched, posIndexAstre: $posIndexAstre, displayText: displayText)
            
        }
    }
    
    func returnColor(index : Int) -> String {
        if astres[index].name == playerData.stories[playerData.etape].choix1 ||
            astres[index].name == playerData.stories[playerData.etape].choix2 {
            selectionColor = "Color.green"
        }
        return selectionColor
    }
}

struct Orbites: View {
    @EnvironmentObject var playerData : PlayerData
    var index: Int
    var rayon: CGFloat
    var startAngle: CGFloat
    var endAngle: CGFloat
    var rayonP: CGFloat

    //var offX: CGFloat
    var offY: CGFloat
    var rev: CGFloat
    var revSpeed: CGFloat
    var scale: CGFloat
    @Binding var isTapped: Bool
    @State var isTouched: Bool
    @Binding var posIndexAstre: Int
    var displayText: Bool
    @State var selectionColor: String = ".white"
    var body : some View {
        
        ZStack{
            Circle()
//                    .strokeBorder(astres[index].name == playerData.stories[playerData.etape].choix1 ?
//                        .green : .white, lineWidth: 2/scale)
                .strokeBorder(astres[index].name == playerData.stories[playerData.etape].choix2 ||
                              astres[index].name == playerData.stories[playerData.etape].choix1 ?
                    .green : .white, lineWidth: 2/scale)
                
                
                .frame(width: rayonP * 20)
                .foregroundColor(isTouched ? .red : .white)
                .offset(x: 0, y: offY)
                .scaleEffect(x: scale, y: scale)
                .rotation3DEffect(.degrees(-rev * revSpeed), axis: (x: 0, y: 0, z: 1), anchorZ: 0, perspective: 0.10)
                .opacity(1)

            Arc(startAngle: .degrees(startAngle), endAngle: .degrees(endAngle), clockwise: false)
                .stroke(.white, lineWidth: 0.5/scale)
                .scaleEffect(x: scale, y: scale)
                .frame(width: rayon, height: rayon)
                .rotation3DEffect(.degrees(-rev * revSpeed), axis: (x: 0, y: 0, z: 1), perspective: 0.1)
            
//                Arc(startAngle: .degrees(0), endAngle: .degrees(360), clockwise: false)
//                    .stroke(isTouched ? Color.red : Color.white, lineWidth: 1/scale)
//                    .frame(width: rayonP * 20, height: rayonP * 20)
//                    .offset(x: 0, y: offY)
//                    .scaleEffect(x: scale, y: scale)
//                    .rotation3DEffect(.degrees(-rev * revSpeed), axis: (x: 0, y: 0, z: 1), perspective: 0.1)
            Text(" \r"+astres[index].name)
                .foregroundColor(isTouched ? .red : .white)
                .rotation3DEffect(.degrees(rev * revSpeed), axis: (x: 0, y: 0, z: 1), perspective: 0.1)
                .offset(x: 0, y: offY)
                .scaleEffect(x: scale, y: scale)
                .font(.system(size: (5.0 + (scale / 20))))
                .rotation3DEffect(.degrees(-rev * revSpeed), axis: (x: 0, y: 0, z: 1), perspective: 0.1)
                .opacity(displayText ? 1 : 0)
            
                
        }.onTapGesture {
            withAnimation(.easeInOut(duration: 0.5)){
                if displayText {
                    isTouched = true
                    isTapped = true
                    posIndexAstre = index
                }
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                isTouched = false
            }
        }
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(posIndexAstre: 0)
            .environmentObject(PlayerData())
    }
}
