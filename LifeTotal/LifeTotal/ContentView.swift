//
//  ContentView.swift
//  LifeTotal
//
//  Created by Smallwood, Trejon (S&T-Student) on 7/28/22.
//

import SwiftUI


struct Reset: View {
    var body: some View{
    Button(action: {
        player.count = 20
    }) { Text("Reset")
            .padding()
            .font(.largeTitle)
            .foregroundColor(Color.primary)
            .background(Capsule().fill(Color.secondary))
        }
    }
}


struct PlayerColor: View{
    @Binding var plColor: Color
    
    var body: some View{
        VStack{
            ColorPicker("Set Player Color", selection: $plColor)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity )
    }
}

struct PlayerNum: View{
    
    let num = [ 10 ,20 ,30 ,40 ,50 ,60]
    @Binding var numSelected: Int
    var body: some View{
        VStack{
            Picker("Select players", selection: $numSelected){
                ForEach(num, id: \.self){
                    Text("\($0)")
                }
            }
        }
    }
}

struct MatchView: View{
    
    @State var count: Int = 20
    var body: some View{
        VStack{
            HStack{
                PlayerView(plNum: 1)
                PlayerView(plNum: 2)
                PlayerView(plNum: 3)
            }
            HStack{
                Reset()
                PlayerNum(numSelected: $count)
            }
            HStack{
                PlayerView(plNum: 4)
                PlayerView(plNum: 5)
                PlayerView(plNum: 6)
            }
        }
    }
}

struct PlayerView: View{
    let plNum: Int
    @State var plColor: Color = .green
    var body: some View{
        VStack{
            Text("Player \( plNum)").onLongPressGesture{
                PlayerColor(plColor: $plColor)
            }
            
            HStack{
                
                Button(action:{
                    print("-")
                    player.count -= 1
                } ){
                    Text("-")
                        .padding()
                        .onLongPressGesture {
                            player.count -= 10
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
                
                Text("\( player.count )life")
                
                Button(action:{
                    print("+")
                    player.count += 1
                } ){
                    Text("+")
                        .padding()
                        .onLongPressGesture {
                            player.count += 10
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
            }
        }.background(player.color)
        
    }
}


struct Player {
    var number: Int
    var count: Int
    var color: Color
}

var player = Player(number: 1, count: 20, color: .gray)


struct ContentView: View {
    @State var count: Int = 20
    @State var playerOneCount: Int = 20
    @State var playerTwoCount: Int = 20
    @State var plColor: Color = .gray
    
    var body: some View {
        VStack(alignment: .center){
            HStack{
                
                Button(action: {
                    self.playerTwoCount -= 1
                } ){
                    Text("-")
                        .padding()
                        .onLongPressGesture {
                            playerTwoCount -= 10
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
                
                Text("\(playerTwoCount) life")
                
                Button(action: {
                    self.playerTwoCount += 1
                } ){
                    Text("+")
                        .padding()
                        .font(.largeTitle)
                        .onLongPressGesture {
                            playerTwoCount += 10
                        }
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
            }.background(plColor)
                .onLongPressGesture{
                    PlayerColor(plColor: $plColor)
            PlayerNum(numSelected: $count)
            Button(action: {
                self.playerOneCount = count
                self.playerTwoCount = count
            }) { Text("Reset")
                    .padding()
                    .font(.largeTitle)
                    .foregroundColor(Color.primary)
                    .background(Capsule().fill(Color.secondary))
            }
    
                HStack{
                    Button(action: {
                        self.playerOneCount -= 1
                    } ){
                        Text("-")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(Color.gray)
                            .background(Circle().fill(Color.black))
                    }
                    
                    Text("\(playerOneCount) life")
                    
                    Button(action: {
                        self.playerOneCount += 1
                        
                    } ){
                        Text("+")
                            .padding()
                            .font(.largeTitle)
                            .foregroundColor(Color.gray)
                            .background(Circle().fill(Color.black))
                    }
                }.background(plColor)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        MatchView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
