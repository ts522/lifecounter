//
//  ContentView.swift
//  LifeTotal
//
//  Created by Smallwood, Trejon (S&T-Student) on 7/28/22.
//

import SwiftUI

struct ContentView: View {
    @State var count: Int = 20
    @State var playerOneCount: Int = 20
    @State var playerTwoCount: Int = 20
    
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false
    
    var longPress: some Gesture{
        LongPressGesture(minimumDuration: 1)
            .updating($isDetectingLongPress){ currentState, GestureState,
                transaction in
            GestureState = currentState
            transaction.animation = Animation.easeIn(duration: 2.0)
        }
            .onEnded { finished in
                self.completedLongPress = finished
            }
    }
    
    var body: some View {
        VStack(alignment: .center){
            HStack{
                Button(action: {
                    self.playerTwoCount -= 1
                } ){
                    Text("-")
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
                        .padding()
                        .font(.largeTitle)
                        .foregroundColor(Color.gray)
                        .background(Circle().fill(Color.black))
                }
            }
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
                }
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
.previewInterfaceOrientation(.landscapeLeft)
    }
}
