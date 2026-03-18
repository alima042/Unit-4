//
//  Card.swift
//  MemoryGame
//
//  Student Name: Alfredo Lima
//  Panther Id: 5867669
//  Section: COP4655
//  Semester: spring
//
import Foundation

/// A data model representing a single flashcard in the Memory Game.
struct Card: Identifiable, Equatable {
    /// Unique identifier to satisfy the Identifiable protocol for SwiftUI iteration.
    let id = UUID()
    
    /// The content (like an emoji) displayed on the face of the card.
    let content: String
    
    /// Tracks whether the user has clicked the card so it shows its face.
    var isFaceUp: Bool = false
    
    /// Tracks if the card has successfully found its match and should vanish.
    var isMatched: Bool = false
}
