# Word-Scramble
This game will show players a random eight-letter word, and ask them to make words out of it. It is made using the concepts of Swift and SwiftUI.


Challenge
One of the best ways to learn is to write your own code as often as possible, so here are three ways you should try extending this app to make sure you fully understand what’s going on:

Disallow answers that are shorter than three letters or are just our start word. For the three-letter check, the easiest thing to do is put a check into isReal() that returns false if the word length is under three letters. For the second part, just compare the start word against their input word and return false if they are the same.
Add a left bar button item that calls startGame(), so users can restart with a new word whenever they want to.
Put a text view below the List so you can track and show the player’s score for a given root word. How you calculate score is down to you, but something involving number of words and their letter count would be reasonable.


https://user-images.githubusercontent.com/52813885/117304893-f5b04300-ae9d-11eb-8a62-4e7ab02eac3f.mov
