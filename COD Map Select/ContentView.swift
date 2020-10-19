//
//  ContentView.swift
//  COD Map Select
//
//  Created by Max Zylstra on 9/25/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var maps = ["Aquarium", "Breach", "Combine", "Evac", "Exodus", "Fringe", "Havoc", "Hunted", "Infection", "Metro", "Redwood", "Stronghold", "NUK3TOWN"]
    
    @State var title = " "
    
    var body: some View {
        LazyVStack {
            
            Text(self.title)
                .bold()
                .font(.title)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
            
            VStack {
                ForEach(maps, id: \.self) { map in
                    Text(map)
                        .padding(1)
                        .font(.title2)
                        .foregroundColor(.green)
                }
            }
            .frame(maxWidth: .infinity)
            Spacer()
            
            if maps.count != 0 {
                Button(action: {
                    selectMap()
                },
                label: {
                    Text("Play")
                        .frame(maxWidth: .infinity)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                        .frame(maxWidth: .infinity)
                        .border(Color.blue)
                        .padding(.all, 10)
                })
                .padding(.bottom, 100)
            }
            else {
                Text("There are no more maps to choose from.")
                Button(action: {
                    reset()
                },
                label: {
                    Text("Reset")
                        .frame(maxWidth: .infinity)
                        .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/, 10)
                        .frame(maxWidth: .infinity)
                        .border(Color.red)
                        .foregroundColor(.red)
                        .padding(.all, 10)
                })
                .padding(.bottom, 100)
            }
        }
    }
    
    func selectMap() {
        var selection = ""
        var counter = 0
        selection = maps.randomElement()!
        
        for i in maps {
            if i == selection {
                maps.remove(at: counter)
            }
            counter += 1
        }
        title = selection
    }
    
    func reset() {
        maps = ["Aquarium", "Breach", "Combine", "Evac", "Exodus", "Fringe", "Havoc", "Hunted", "Infection", "Metro", "Redwood", "Stronghold", "NUK3TOWN"]
        title = " "
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
