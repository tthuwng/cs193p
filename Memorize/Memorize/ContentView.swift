//
//  ContentView.swift
//  Memorize
//
//  Created by Hung Tran on 12/30/21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🥺", "✈️", "🔨", "👻","💩", "😸", "🥳"]
    @State var currentTheme = ""
    var vehicles = ["🚗","🚕","🚙","🚌","🚎", "🏎", "🚓", "🚑", "🚒", "🚐"]
    var animals = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐻‍❄️","🐨","🐯"]
    var flags = ["🏴‍☠️","🇦🇫","🇦🇶","🇻🇬","🇨🇦","🇩🇪","🇻🇳","🇺🇸","🇰🇷","🇯🇵"]
    
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            EmojisView(emojis: currentTheme == "vehicles" ? vehicles : currentTheme == "animals" ? animals : currentTheme == "flags" ? flags : emojis)
            Spacer()
            HStack {
//                remove
//                Spacer()
//                add
                Spacer()
                foodTheme
                Spacer()
                animalTheme
                Spacer()
                flagTheme
                Spacer()

            }
            .font(.title)
            .padding(.horizontal, 8.0)
        }
        .padding(.horizontal)
        
        
    }
    struct EmojisView: View {
        var emojis: [String]
        var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(emojis[0..<Int.random(in: 8...emojis.count)].shuffled(), id: \.self) {emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
            }
            
            }.foregroundColor(.red)
        }
    }
    
    var foodTheme: some View {
        Button {
            currentTheme = "food"
        } label : {
            VStack {
                Image(systemName: "fork.knife")
                Text("Food")
            }
        }
    }
    var animalTheme: some View {
        Button {
            currentTheme = "animals"
        } label : {
            VStack {
                Image(systemName: "pawprint")
                Text("Animals")
            }
        }
    }
    
    var flagTheme: some View {
        Button {
            currentTheme = "flags"
        } label : {
            VStack {
                Image(systemName: "flag")
                Text("Flags")
            }
        }
    }
    
    var remove: some View {
        Button{
            if emojiCount > 1 {
                emojiCount -= 1
            }
            
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    var add: some View {
        Button {
            if emojiCount < emojis.count {
                emojiCount += 1
            }
        } label: {
            Image(systemName: "plus.circle")
        }
    }
}


struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
            
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.portrait)
        ContentView()
            .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
    }
}
