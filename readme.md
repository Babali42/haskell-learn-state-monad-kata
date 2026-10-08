# A code kata to learn Haskell state monad

## A tiny dungeon game
  
Haskell State Monad Kata: Dungeon Explorer

You are building a tiny dungeon game.

The game state contains:

- Player health
- Amount of gold
- Inventory items

The player can perform actions such as:

- Fight a monster (lose health)
- Find treasure (gain gold)
- Pick up a potion
- Use a potion (consume it and heal)
- Fight a boss

Implement the game one test at a time using the State Monad. Start with a single action, then compose multiple actions into an adventure. The objective is to discover how State automatically threads the game state through a sequence of computations without manually passing it between functions.

By the end of the kata, you should be comfortable using:

- State
- get
- gets
- modify
- execState
- evalState
- do notation for stateful workflows

Goal: make all tests pass while keeping the implementation as simple as possible and learning the State Monad through TDD.

## Article sur la state monade
https://hugopeters.me/posts/3/

## A band account simulation 
https://medium.com/@Gryff/bank-kata-in-haskell-dealing-with-state-3364c13b994f

## How to run tests :

### Docker :

`ghc -package mtl -package hspec dungeonSpec.hs
./dungeonSpec`

Then

`./dungeonSpec`

### Cabal Cabal

`cabal test`