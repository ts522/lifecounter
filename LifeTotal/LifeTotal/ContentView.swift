//
//  ContentView.swift
//  LifeTotal
//
//  Created by Smallwood, Trejon (S&T-Student) on 7/28/22.
//
import SwiftUI


struct Reset: View {
    @Binding var count: Int
    var body: some View{
    Button(action: {
        count = 20
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
                Reset(count: $count)
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
    @State var count: Int = 20
    var body: some View{
        VStack{
            Text("Player \( plNum)")
            
            HStack{
                
                Button(action:{
                    print("-")
                    count -= 1
                } ){
                    Text("-")
                        .padding()
                        .onLongPressGesture {
                            count -= 10
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
                
                Text("\( count )life")
                
                Button(action:{
                    print("+")
                    count += 1
                } ){
                    Text("+")
                        .padding()
                        .onLongPressGesture {
                            count += 10
                        }
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
            }
        }.background(plColor).onLongPressGesture{
            PlayerColor(plColor: $plColor)
        }
        
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
    @State var pl1Color: Color = .gray
    @State var pl2Color: Color = .gray
    var body: some View {
        VStack(alignment: .center){
            VStack{
                PlayerColor(plColor: $pl2Color)
                Text("Player 2")
                HStack{
                    
                    Button(action: {
                        self.playerTwoCount -= 1
                    } ){
                        Text("-")
                            .onLongPressGesture {
                                playerTwoCount -= 10
                            }
                            .padding()
                            
                            .font(.largeTitle)
                            .foregroundColor(Color.gray)
                            .background(Circle().fill(Color.black))
                    }
                    
                    Text("\(playerTwoCount) life")
                        
                    
                    Button(action: {
                        self.playerTwoCount += 1
                        
                    } ){
                        Text("+")
                            .onLongPressGesture {
                                playerTwoCount += 10}
                            .padding()
                            .font(.largeTitle)
                            
                            .foregroundColor(Color.gray)
                            .background(Circle().fill(Color.black))
                    
                    }
                }
            }.background(pl2Color)
                
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
            VStack{
                PlayerColor(plColor: $pl1Color)
                Text("Player 1")
                HStack{
                    
                    Button(action: {
                        self.playerOneCount -= 1
                    } ){
                        Text("-")
                            .onLongPressGesture {
                                playerOneCount -= 10
                            }
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
                            .onLongPressGesture {
                                playerOneCount += 10
                            }
                            .padding()
                            
                            .font(.largeTitle)
                            .foregroundColor(Color.gray)
                            .background(Circle().fill(Color.black))
                    }
                }
            }.background(pl1Color)
        }.background(.black)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        MatchView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
