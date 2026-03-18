//
//  ContentView.swift
//  MemoryGame
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//
import SwiftUI

/// The main application container that holds the Memory Game state and UI grid.
struct ContentView: View {
    // MARK: - Game State
    
    /// The deck of cards currently in play.
    @State private var cards: [Card] = []
    
    /// Index of the first card chosen in an active pair selection.
    @State private var faceUpCardIndex: Int? = nil
    
    /// Prevents users from spam-clicking cards while mismatch animations play out.
    @State private var isBoardLocked: Bool = false
    
    // An array of emojis to be used as matches
    let emojiLibrary = ["🦁", "🐝", "🦋", "🍄", "🌻", "🍉", "🍒", "🌮"]
    
    // MARK: - Initializer
    
    init() {
        // Shuffle the deck securely before the initial view paints
        _cards = State(initialValue: generateDeck())
    }
    
    // MARK: - View Layout
    var body: some View {
        VStack {
            Text("Memory Game")
                .font(.largeTitle)
                .bold()
                .padding()
            
            // Allow for scrolling if the grid exceeds the screen bounds (per stretch requirement)
            ScrollView {
                // Adaptive layout automatically fits as many columns of 80pt as it can side by side
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                    ForEach(0..<cards.count, id: \.self) { index in
                        CardView(card: cards[index])
                            .onTapGesture {
                                choose(cardAt: index)
                            }
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // Required Reset button
            Button(action: {
                withAnimation {
                    resetGame()
                }
            }) {
                Text("Reset Game")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding(.bottom)
        }
    }
    
    // MARK: - Game Mechanics
    
    /// Triggered when the user taps any active card.
    private func choose(cardAt index: Int) {
        // Conditions guarding against improper selections:
        // 1. Board is actively animating a mismatch penalty
        // 2. The selected card is already face-up
        // 3. The selected card is already successfully matched
        if isBoardLocked || cards[index].isFaceUp || cards[index].isMatched {
            return
        }
        
        if let potentialMatchIndex = faceUpCardIndex {
            // The user just selected their SECOND card. Time to check for a match.
            
            cards[index].isFaceUp = true // Immediately flip the second card up

            if cards[index].content == cards[potentialMatchIndex].content {
                // MATCH SUCCESS!
                cards[index].isMatched = true
                cards[potentialMatchIndex].isMatched = true
                faceUpCardIndex = nil
            } else {
                // MATCH FAILURE!
                isBoardLocked = true // Lock the UI until animation completes
                
                // Keep them both visible for exactly 1 second to let the user memorize
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    cards[index].isFaceUp = false
                    cards[potentialMatchIndex].isFaceUp = false
                    isBoardLocked = false
                    faceUpCardIndex = nil
                }
            }
            
        } else {
            // The user just selected their FIRST card out of a new pair.
            cards[index].isFaceUp = true
            faceUpCardIndex = index
        }
    }
    
    /// Clears the board and generates an entirely new array of unmatched cards.
    private func resetGame() {
        cards = generateDeck()
        faceUpCardIndex = nil
        isBoardLocked = false
    }
    
    /// Generates a randomized deck ensuring there are exactly two of each symbol.
    private func generateDeck() -> [Card] {
        var deck: [Card] = []
        
        // Add pair of each emoji to the deck
        for emoji in emojiLibrary {
            deck.append(Card(content: emoji))
            deck.append(Card(content: emoji))
        }
        
        // Shuffle the deck natively
        return deck.shuffled()
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
