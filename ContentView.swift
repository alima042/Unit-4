// Updated choose function logic to set isBoardLocked before flipping the second card.
func choose(card: Card) {
    if isBoardLocked { return }

    // First card selection process
    if let firstCard = firstSelectedCard {
        isBoardLocked = true  // Lock the board before flipping the second card
        // Logic to handle mismatch and animations
    } else {
        firstSelectedCard = card
        // Logic for selecting the first card
    }
}