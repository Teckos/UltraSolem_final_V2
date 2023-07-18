//
//  données.swift
//  App
//
//  Created by Emma ORLANDINI on 26/10/2022.
//

import SwiftUI

struct QuizzView: View {
    
   // @State var newQuestion : Question
    var astre : Astre
    
    var body: some View {
        ZStack{
            Image("voieLactée")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .frame(width: 400)
                .offset(x: -18)
          
            Questionnaire(question: questions.first(where: {
                $0.name == astre.name
            })!, numberOfQuestion: questions.firstIndex(where: {
                $0.name == astre.name
            })!, astre: astre)
            /*ForEach(questions){ question in
                Questionnaire(question: question)
             }*/
            

            
            }
        .navigationBarBackButtonHidden()
        
    }
}

struct QuizzView_Previews: PreviewProvider {
    static var previews: some View {
        QuizzView(astre: astres[1])
    }
}

    
struct Question : Identifiable {
var id = UUID()
    @State  var question: String
    @State  var bonneReponse: String
    @State  var reponseA: String
    @State  var reponseB: String
    @State  var reponseC: String
    @State  var name : String


}

var questions = [
Question(question: "Quelle est la distance Terre-Lune en km ?",bonneReponse : "384 400",reponseA : "470 936",reponseB : "856 970",reponseC : "384 400", name: "Lune"),
Question(question: "En quelle année l'Homme a-t-il marché sur la Lune ?", bonneReponse: "1969", reponseA: "1969", reponseB: "1959", reponseC: "1979", name: "Lune"),

Question(question : "A combien de degrés Celsius chauffe la surface du soleil ?", bonneReponse: "5 500", reponseA: "250",reponseB: "5 500", reponseC: "3 200", name: "Soleil"),
Question(question: "De quoi est majoritairement composé le soleil ?", bonneReponse: "Hydrogène", reponseA: "Hélium", reponseB: "Hydrogène", reponseC: "Fer", name: "Soleil"),

Question(question: "Quelle est le rayon de l'étoile ?", bonneReponse: "107 280", reponseA: "107 280", reponseB: "254 789", reponseC: "541 990", name: "Proxima Centauri"),
Question( question: "Quelle est sa température ?", bonneReponse: "2768", reponseA: "2993", reponseB: "1279", reponseC: "2768", name: "Proxima Centauri"),

Question(question: "Quel est son âge ?", bonneReponse: "3 202 000", reponseA: "320 200", reponseB: "3 202 000", reponseC: "33 202 000", name: "Zeta Puppis"),
Question(question: "Combien de satellites a-t-il ?", bonneReponse: "0", reponseA: "0", reponseB: "2", reponseC: "4", name: "Zeta Puppis"),

Question(question: "De quelle constellation fait-elle partie ?", bonneReponse: "Du Scorpion", reponseA: "De la Balance", reponseB: "De la Vierge", reponseC: "Du Scorpion", name: "Antarès"),
Question(question: "A combien d'années-lumière est-elle située ? ", bonneReponse: "550", reponseA: "550", reponseB: "500", reponseC: "670", name: "Antarès"),

Question(question: "Quel est l'élément principal de sa composition ? ", bonneReponse: "Dioxyde de carbone", reponseA: "Diazote", reponseB: "Dioxygène", reponseC: "Dioxyde de carbone", name: "Mars"),
Question(question: "Combien dure sa période orbitale en années terrestres ?", bonneReponse: "1.88", reponseA: "2.74", reponseB: "1.88", reponseC: "1.43", name: "Mars"),

Question(question: "Combien de jours dure sa période orbitale ?", bonneReponse: "365", reponseA: "385", reponseB: "365", reponseC: "355", name: "Terre"),
Question(question: "Quelle est la température moyenne à sa surface ?", bonneReponse: "15", reponseA: "25", reponseB: "18", reponseC: "15", name: "Terre"),

Question(question: "Combien de temps a duré le plus long séjour à son bord ?", bonneReponse: "355", reponseA: "355", reponseB: "340", reponseC: "328", name: "ISS"),
Question(question: "En quelle année le premier module a-t-il été mis en orbite ?", bonneReponse: "1998", reponseA: "2001", reponseB: "1998", reponseC: "2003", name: "ISS"),

Question(question: "Combien de jours dure sa période orbitale ?", bonneReponse: "243", reponseA: "243", reponseB: "287", reponseC: "328", name: "Venus"),
Question(question: "Quelle est la temperature moyenne à sa surface en degrés Celsius?", bonneReponse: "462", reponseA: "197", reponseB: "462", reponseC: "252", name: "Venus"),

Question(question: "D'où vient son nom ?", bonneReponse: "Des romains", reponseA: "Des romains", reponseB: "Des grecs", reponseC: "Des anglais", name: "Mercure"),
Question(question: "Est-ce la planète la plus chaude du système solaire ?", bonneReponse: "Non", reponseA: "Oui", reponseB: "Non", reponseC: "Je ne sais pas", name: "Mercure"),

Question(question: "Combien de fois est-elle plus grande que la terre  ?", bonneReponse: "318", reponseA: "318", reponseB: "340", reponseC: "328", name: "Jupiter"),
Question(question: "Combien de lunes gravitent autour (celles connues) ? ", bonneReponse: "80", reponseA: "100", reponseB: "90", reponseC: "80", name: "Jupiter"),

Question(question: "De quoi est majoritairement composée Saturne ?", bonneReponse: "Hydrogène", reponseA: "Hélium", reponseB: "Hydrogène", reponseC: "Fer", name: "Saturne"),
Question(question: "En quelle année a-t-elle été survolée pour la première fois ? ", bonneReponse: "1979", reponseA: "1969", reponseB: "1979", reponseC: "1989", name: "Saturne")



]


struct Questionnaire: View {
    @EnvironmentObject var playerData : PlayerData
    @State var question : Question
    @State var answerColorA : Color = .white
    @State var answerColorB : Color = .white
    @State var answerColorC : Color = .white
    @State var numberOfQuestion : Int
    @State var showAlert = false
    @State var showFirstBubble  = false
    @State var showSecondBubble = false
    @State var showAnswers = false
    @State var showErrorBubble = false
    @State var carburantQuantity = 0
    @State var dim = false
    @State var secondQuestion = false
    @State var goToMap = false
    var astre : Astre
    
    
    var body: some View {
        VStack{
          
            Text("Quiz \(question.name)")
                .padding(.all)
                .foregroundColor(.white)
                    .font(.system(size: 40))
                    .bold()
                    .padding(.horizontal)
                    .background(RoundedRectangle(cornerRadius: 20).foregroundColor(.gray))
                    
                
            
           Spacer()
        }
        .padding(.top)
        VStack{
            Spacer()
            VStack(spacing: 40){
                ZStack{
                    
                    BubbleMessage(message: "Merci de rentrer les données nécessaires", showOrNot: true, isLeft: true)
                        
                    
                    
                }
                .opacity(showFirstBubble ? 1 : 0.0)
                
                
                
                ZStack{
                    VStack(spacing: 40){
                        BubbleMessage(message: question.question, showOrNot: true, isLeft: true)
                      
                    }
                }
                .opacity(showSecondBubble ? 1 : 0.0)
                
            }
            
            // .padding(.leading, -140)
            Spacer()
            ZStack{
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 350, height: 350)
                    .ignoresSafeArea()
                    .padding(.bottom, -40)
                    .foregroundColor(.gray)
//                HStack{
//                    Button{
//                        //navigationlink
//                    }label: {
//
//                        Image(systemName: "iphone.and.arrow.forward")
//                            .resizable()
//                            .position(x: 130, y: -130)
//                            .frame(width: 20, height: 21.0)
//                            .foregroundColor(.black)
//                    }
//                }
                
                VStack(spacing: 30){
                    
                    Button{
                        if question.reponseA == question.bonneReponse{
                            carburantQuantity += 5
                            withAnimation(.easeOut(duration: 0.5)){answerColorA = .green}
                            
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                               
                                
                                showAlert.toggle()
                            }
                            
                        }else{
                            withAnimation(.easeIn(duration: 0.5)){answerColorA = .red}
                           
    
                            
                        }
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 320, height: 50)
                                .cornerRadius(20)
                                .foregroundColor(answerColorA)
                            Text(question.reponseA)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }

                    
                    Button{
                        if question.reponseB == question.bonneReponse{
                            carburantQuantity += 5
                            withAnimation{answerColorB = .green}
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                               
                                
                                showAlert.toggle()
                            }
                            
                        }else{
                            withAnimation(.easeIn(duration: 0.5)){answerColorB = .red}
    
                            
                        }
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 320, height: 50)
                                .cornerRadius(20)
                                .foregroundColor(answerColorB)
                            Text(question.reponseB)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }
                  
                    
                    Button{
                        if question.reponseC == question.bonneReponse{
                            carburantQuantity += 5
                            withAnimation(.easeOut(duration: 0.5)){answerColorC = .green}
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                               
                                
                                showAlert.toggle()
                            }
                            
                        }else{
                            withAnimation(.easeIn(duration: 0.5)){answerColorC = .red}
    
                            
                        }
                    }label: {
                        ZStack{
                            Rectangle()
                                .frame(width: 320, height: 50)
                                .cornerRadius(20)
                                .foregroundColor(answerColorC)
                            Text(question.reponseC)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }
                    /*
                     Button(question.reponseC){
                     //
                     }.padding(.horizontal, 100)
                     .padding(.vertical, 10)
                     .background(.white)
                     .cornerRadius(25)
                     .foregroundColor(.black)*/
                    
                }
                
            }
            .opacity(showAnswers ? 1 : 0.0)
           
            .alert("Vous avez reconstitué partiellement la base de données ", isPresented: $showAlert){
                Button("Super", role: .cancel){
                    resetQuestion()
                }
            }
            NavigationLink(destination: MapView(posIndexAstre: 1),isActive: $goToMap) {
                EmptyView()
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                playSound("reception")
                withAnimation(.easeOut(duration: 0.5)){
                    showFirstBubble = true
                    
                }
                
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation(.easeOut(duration: 0.5)){
                    playSound("reception")
                    showSecondBubble = true
                    
                }
                
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                withAnimation(.easeOut(duration: 0.5)){ showAnswers = true}
                showAnswers = true
            }
        }
    }
    
        
        
    func resetQuestion(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            answerColorA = .white
            answerColorB = .white
            answerColorC = .white
            numberOfQuestion += 1
            if secondQuestion{
                goToMap = true
                playerData.etape += 1
                if playerData.etape == 2{
                    playerData.displaySat = false
                }
                
                
            }else{
                question = questions[numberOfQuestion]
                secondQuestion = true
                
                
            }
        }
    }
}

