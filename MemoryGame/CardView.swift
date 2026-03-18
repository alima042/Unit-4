//
//  CardView.swift
//  MemoryGame
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//
import SwiftUI

/// A standalone SwiftUI view that visually represents the `Card` model.
struct CardView: View {
    let card: Card
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 15)
            
            // If the card is face up or matched, show the white front with its content
            if card.isFaceUp || card.isMatched {
                shape.fill(.white)
                shape.strokeBorder(lineWidth: 3).foregroundColor(.blue)
                
                Text(card.content)
                    .font(.largeTitle)
                    
            } else {
                // If it's face down, show the solid blue back
                shape.fill(.blue.gradient)
            }
        }
        // Force the card into a standard aspect ratio so grids look clean
        .aspectRatio(2/3, contentMode: .fit)
        
        // Ensure matched cards completely vanish from the UI and stop intercepting taps
        .opacity(card.isMatched ? 0 : 1)
        .animation(.default, value: card.isMatched)
    }
}

// MARK: - Preview
struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        HStack {
            CardView(card: Card(content: "🐶", isFaceUp: true))
            CardView(card: Card(content: "🐱", isFaceUp: false))
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}
