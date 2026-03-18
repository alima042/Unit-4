# Unit 4 Project: Memory Game (SwiftUI)

**Student Name:** Alfredo Lima
**Panther ID:** 5867669  
**Section:** COP4655  
**Semester:** Spring  

---

## 🔍 Overview
This project represents the completion of **Unit 4: SwiftUI - UI Basics**. Transitioning away from UIKit's imperative approach, this application fully embraces SwiftUI's declarative syntax and reactive State management. 

The Memory Game is an interactive, single-screen iOS application that challenges users to uncover matching pairs of cards. It demonstrates fundamental SwiftUI concepts including state management (`@State`), data binding, view composition into reusable components, grid layouts, and interactive animations.

## 🎯 Features Implemented

### Required Features:
* **Grid Layout:** Upon launching the app, a vibrant grid of cards is visible. All cards are initially placed face-down to indicate the start of the game, dynamically aligned using `LazyVGrid`.
* **Interactive Flipping:** Users can tap cards to toggle their display between the back (blue gradient) and the face (revealing an emoji). 
* **Matching Logic:** Built-in game logic evaluates user interactions:
  * Tapping two identical cards triggers a match; both cards smoothly disappear from the interface.
  * Tapping a second card that is *not* identical flips both cards back face-down after a brief 1-second delay, allowing the user a moment to memorize their positions.
* **Game Reset:** A "Reset Game" button securely shuffles the deck and resets all game-related UI state, generating a fresh board for a new session.

### Stretch Features:
* **Scrollable Grid:** The `LazyVGrid` is elegantly wrapped in a `ScrollView`, allowing the application to support larger decks of cards gracefully without compressing out of the screen bounds.

## 🛠 Architecture & Development Notes
* **Data Models:** Uses a custom `Card` model conforming to `Identifiable` and `Equatable` to securely track `isFaceUp` and `isMatched` states alongside unique UUIDs.
* **View Separation:** The UI is modularized. `CardView.swift` handles the standalone physical card layout and 3D rotation modifiers, while `ContentView.swift` strictly manages the array state, matching logic, and the adaptive layout matrix.
* **No Storyboards:** Constructed entirely via SwiftUI. The project avoids traditional `Main.storyboard` constraints or `UIViewController` configurations.

---
*Created for COP4655 - Advanced iOS Programming.*
