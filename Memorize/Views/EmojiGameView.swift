//
//  ContentView.swift
//  Memorize
//
//  Created by Chelsea Crowson on 9/28/21.
//

import SwiftUI

struct EmojiGameView: View {
//    @State var selectedTheme = "food"
    @State var themeColor = Color.red
    @State var cardSize = 65
    
    @ObservedObject var game: EmojiMemoryGame
    
    var foodEmojis = ["🍜", "🍣", "🥐", "🥖", "🥨", "🥯", "🥞", "🧇", "🧀", "🍖", "🍗", "🥩", "🥓", "🍔", "🍟", "🍕", "🌭", "🥪", "🌮", "🌯", "🫔", "🥙", "🧆", "🥚", "🍳", "🥘", "🍲", "🫕", "🥣", "🥗", "🍿", "🧈", "🍱"]
    var animalEmojis = ["🐶","🐱","🐭","🐹","🐰","🦊","🐻","🐼","🐨","🐯","🦁","🐮","🐷","🐽","🐸","🐵","🙈","🙉","🙊","🐒","🐔","🐧","🐦","🐤","🐣","🐥","🦆","🦅","🦉","🦇","🐺","🐗","🐴"]
    var flagEmojis = ["🇦🇫", "🇦🇽", "🇦🇱", "🇩🇿", "🇦🇸", "🇦🇩", "🇦🇴", "🇦🇮", "🇦🇶", "🇦🇬", "🇦🇷", "🇦🇲", "🇦🇼", "🇦🇺", "🇦🇹", "🇦🇿", "🇧🇸", "🇧🇭", "🇧🇩", "🇧🇧", "🇧🇾", "🇧🇪", "🇧🇿", "🇧🇯", "🇧🇲", "🇧🇹", "🇧🇴", "🇧🇶", "🇧🇦", "🇧🇼", "🇧🇷", "🇮🇴", "🇻🇬", "🇧🇳", "🇧🇬", "🇧🇫", "🇧🇮", "🇨🇻", "🇰🇭", "🇨🇲", "🇨🇦", "🇮🇨", "🇰🇾", "🇨🇫", "🇹🇩", "🇨🇱", "🇨🇳", "🇨🇽", "🇨🇨", "🇨🇴", "🇰🇲", "🇨🇬", "🇨🇩", "🇨🇰", "🇨🇷", "🇨🇮", "🇭🇷", "🇨🇺", "🇨🇼", "🇨🇾", "🇨🇿", "🇩🇰", "🇩🇯", "🇩🇲", "🇩🇴", "🇪🇨", "🇪🇬", "🇸🇻", "🇬🇶", "🇪🇷", "🇪🇪", "🇪🇹", "🇪🇺", "🇫🇰", "🇫🇴", "🇫🇯", "🇫🇮", "🇫🇷", "🇬🇫", "🇵🇫", "🇹🇫", "🇬🇦", "🇬🇲", "🇬🇪", "🇩🇪", "🇬🇭", "🇬🇮", "🇬🇷", "🇬🇱", "🇬🇩", "🇬🇵", "🇬🇺", "🇬🇹", "🇬🇬", "🇬🇳", "🇬🇼", "🇬🇾", "🇭🇹", "🇭🇳", "🇭🇰", "🇭🇺", "🇮🇸", "🇮🇳", "🇮🇩", "🇮🇷", "🇮🇶", "🇮🇪", "🇮🇲", "🇮🇹", "🇯🇲", "🇯🇵"]
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: CGFloat(cardSize)))]) {
                    ForEach(game.cards) { card in
                        CardView(card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
            }
            .foregroundColor(themeColor)
//            HStack {
//                Button(action: {
//                    selectTheme(theme: "food")
//                }, label: {
//                    VStack {
//                        Image(systemName: "takeoutbag.and.cup.and.straw.fill")
//                        Text("Food")
//                    }
//                })
//                    .frame(width: 65, height: 50, alignment: .bottom)
//                Button(action: {
//                    selectTheme(theme: "animal")
//                }, label: {
//                    VStack {
//                        Image(systemName: "tortoise.fill")
//                        Text("Animals")
//                    }
//                })
//                    .frame(width: 65, height: 50, alignment: .bottom)
//                Button(action: {
//                    selectTheme(theme: "flag")
//                }, label: {
//                    VStack {
//                        Image(systemName: "flag.fill")
//                        Text("Flags")
//                    }
//                })
//                    .frame(width: 65, height: 50, alignment: .bottom)
//            }
        }
        .padding(.horizontal)
    }
    
//    func selectTheme(theme: String) {
//        switch theme {
//        case "food":
//            themeColor = Color.red
//            emojis = foodEmojis
//        case "animal":
//            themeColor = Color.green
//            emojis = animalEmojis
//        case "flag":
//            themeColor = Color.orange
//            emojis = flagEmojis
//        default:
//            print("Error")
//        }
//
//        cardCount = Int.random(in: 4..<emojis.count)
//        let maxArea = (645*358)/Double(cardCount)
//        let someNumver = maxArea/6
//        let factor = someNumver.squareRoot()
//        let width = factor * 2
//        cardSize = Int(width-14)
//    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        
        EmojiGameView(game: game).preferredColorScheme(.light)
        EmojiGameView(game: game).preferredColorScheme(.dark)
    }
}
