//  ContentView.swift
//  UltraSolem
//
//  Created by Emma ORLANDINI on 26/10/2022.
//
//
//
// Revoir le son
// Virer les toolsbars           LIGNE 235          OK
// Vérifier affichage bouton en dessous
//
//
//
//
//


import SwiftUI
import AVFoundation

struct WelcomeView: View {
    @EnvironmentObject var playerData : PlayerData
    @State var show1Bubble = false
    @State var show2Bubble = false
    @State var show3Bubble = false
    @State var show4Bubble = false
    @State var show5Bubble = false
    @State var show6Bubble = false
    @State var show7Bubble = false
    @State var show8Bubble = false
    @State var showNextButton = false
    @FocusState var nameFocus : Bool
    @State var showTextField = false
    //@State var name : String
    
    @State var showUnlock = false
    @State var displayText: Bool = false
    var index: Int = 0
    @State var scale: CGFloat = 1.0
    @State var displayBG = false
    
    func afterTextField(){
        nameFocus = false
        playSound("envoie")
        showTextField.toggle()
        withAnimation(.easeOut(duration: 1)){
            show6Bubble.toggle()
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            playSound("reception2")
            withAnimation(.easeOut(duration: 1)){
                show7Bubble = true
                
            }
            
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            playSound("reception2")
            withAnimation(.easeOut(duration: 1)){
                show8Bubble = true
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.easeOut(duration: 1)){showUnlock = true}
            }
        }
    }
    
    var body: some View {
        
       // NavigationStack {
            ScrollViewReader { proxy in
                
                ZStack{
                    Rectangle()
                        .ignoresSafeArea()
                    Image("voieLactée")
                        .resizable()
                        .scaledToFill()
                        .frame(minHeight: 0, maxHeight: .infinity)
                        .ignoresSafeArea()
                        .offset(x: -23)
                        .opacity(displayBG ? 1 : 0)
                    ZStack{
                        
                        
                        ScrollView{
                            VStack(spacing: 10){
                                
                                BubbleMessage(message: "Connection établie", showOrNot: show1Bubble, isLeft: true)
                                BubbleMessage(message: "Initialisation en cours...", showOrNot: show2Bubble, isLeft: true)
                                BubbleMessage(message: "SpaceUp vous rappelle qu’en montant à bord, vous acceptez sans conditions les modalités du contrat qui vous lie à SpaceUp. Vous êtes conscient des risques potentiels et, en cas d’incident, dégagez SpaceUp de toute responsabilité.", showOrNot: show3Bubble, isLeft: true)
                                BubbleMessage(message: "Identification requise.", showOrNot: show4Bubble, isLeft: true)
                                BubbleMessage(message: "Merci de décliner votre identité.", showOrNot: show5Bubble, isLeft: true)
                                    .id(5)
                                
                                BubbleMessage(message: "\(playerData.name)", showOrNot: show6Bubble, isLeft: false)
                                
                                BubbleMessage(message: "Bienvenue à bord \(playerData.name), je suis HANa (Human Assisted Navigator) et vous serez mon assistant.", showOrNot: show7Bubble, isLeft: true)
                                BubbleMessage(message: "Identification supplèmentaire requise. Veuillez patienter.", showOrNot: show8Bubble, isLeft: true)
                                    .id(8)
                                
                                
                                
                            }
                            //.padding(.bottom, 32)
                            .padding(.top)
                        }
                        VStack{
                            Spacer()
                            
                            //if show5Bubble {
                            
                            
                            HStack{
                                
                                TextField("Prénom", text: $playerData.name)
                                
                                    .focused($nameFocus)
                                .disableAutocorrection(true)
                                    .background(.gray)
                                    .cornerRadius(20)
                                    .frame(width: 160, height: 50)
                                Button{
                                    afterTextField()
                                    
                                }label: {
                                    Image(systemName: "paperplane.circle.fill")
                                        .resizable()
                                        .foregroundColor(.white)
                                        .frame(width: 30, height: 30)
                                }
                                
                                
                                
                            }
                            .padding(.horizontal)
                            .background(.gray)
                            
                            .cornerRadius(20)
                            
                            //.padding(.bottom, 40)
                            
                            
                        }
                        .frame(maxHeight: 763)
                        .opacity(showTextField ? 1 : 0)
                        
                        //                    if showNextButton {
                        //                        VStack{
                        //                            Spacer()
                        //                            NavigationLink(destination: UnlockView(displayText: displayText, index: index, scale: scale)){
                        //    //                            Button{
                        //    //
                        //    //
                        //    //
                        //    //                                //NavigationLink(destination : UnlockView())
                        //    //                            }label: {
                        //                                    Image(systemName: "arrowshape.right.fill")
                        //                                        .resizable()
                        //                                        .frame(width: 70, height: 30)
                        //                                        .foregroundColor(.white)
                        //                                        .padding(.vertical, 10)
                        //                                        .padding(.horizontal, 30)
                        //                                        .background(.gray)
                        //                                        .cornerRadius(20)
                        //                                        .padding(.bottom, 30)
                        //    //                            }
                        //                            }
                        //
                        //                        }
                        //                    }
                        
                    }
                    .opacity(showUnlock ? 0 : 1)
                    /*.background{
                     Image("voieLactée")
                     .resizable()
                     .scaledToFill()
                     .ignoresSafeArea()}*/
                    
                    
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.easeOut(duration: 0.5)){
                                displayBG = true
                            }
                        }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound("reception")
                                withAnimation(.easeOut(duration: 1.5)){ show1Bubble = true}
                                
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                playSound("reception2")
                                withAnimation(.easeOut(duration: 1.5)){ show2Bubble = true}
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                                playSound("reception2")
                                withAnimation(.easeOut(duration: 1.5)){ show3Bubble = true}
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
                                playSound("reception2")
                                withAnimation(.easeOut(duration: 1.5)){ show4Bubble = true}
                                
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                                playSound("reception2")
                                withAnimation(.easeOut(duration: 0.3)){ show5Bubble = true}
                                
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                    proxy.scrollTo(5, anchor: .center)
                                        
                                    withAnimation(.easeOut(duration: 1)){
                                        showTextField = true
                                        nameFocus = true
                                    }
                                    
                                    
                                }
                            }
                            
                            
                            
                            
                        }
                    if showUnlock {
                        UnlockView(displayText: displayText, index: index, scale: scale )
                            //.opacity(showUnlock ? 1 : 0)
                    }
                    }
                    
                    // FIN ZSTACK
                    
                }
                .toolbar(.hidden, for: .navigationBar)
                //.navigationBarBackButtonHidden(true)
            //}
        }
    }
    

    
    
    
    
    struct WelcomeView_Previews: PreviewProvider {
        static var previews: some View {
            WelcomeView( displayText: false, index: 0, scale: 1.0)
                .environmentObject(PlayerData())
        }
    }
    
    
    struct ContentView: View {
        @State var currentDate = Date()
        let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
        
        var body: some View {
            Text("\(currentDate)")
                .onReceive(timer) { input in
                    currentDate = input
                }
        }
    }
    
    
    struct BubbleMessage: View {
        var message : String
        var showOrNot : Bool
        var isLeft : Bool
        var body: some View {
            // if showOrNot{
            HStack{
                if !isLeft {
                    Spacer()
                }
                Text(message)
                    .foregroundColor(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical)
                    .layoutPriority(1)
                    .background(RoundedRectangle(cornerRadius: 25).foregroundColor(isLeft ? .gray : .blue))
                    .opacity(showOrNot ? 1 : 0.0)
                
                if isLeft{
                    Spacer()
                }
                
                
            }
            .frame(maxWidth: 300)
        }
        // }
        
    }
    
    

