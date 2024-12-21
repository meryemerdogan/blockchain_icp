# README for Motoko Superhero Management System ✨⚛✨

## Overview 🌐📚🌟

This project contains two Motoko actors:

1. **Counter Actor**: A simple counter actor with operations to increment, decrement, reset, and add a custom value to a counter.
2. **Superhero Management Actor**: A more advanced actor for managing superheroes. It allows creating, retrieving, and updating superheroes using a `Trie` for efficient storage.

---

## 1. Counter Actor ➕⏳➖

### Features: 🔄✨🔍
- **Persistent Counter**: The counter value is stable and persists across actor upgrades.
- **Operations**:
  - `getCount()`: Returns the current value of the counter.
  - `increment()`: Increases the counter by 1.
  - `decrement()`: Decreases the counter by 1, ensuring it does not drop below 0.
  - `reset()`: Resets the counter to 0.
  - `addValue(value: Nat)`: Adds a custom value to the counter.

### Usage Example: 🔧✅🔧
```motoko
let counter = Counter();

await counter.increment();
let count = await counter.getCount(); // count will be 1

await counter.addValue(5);
count = await counter.getCount(); // count will be 6

await counter.reset();
count = await counter.getCount(); // count will be 0
```

---

## 2. Superhero Management Actor 🌟🔮🚀

### Features: 🔒✨🔍
- **Custom Types**:
  - `SuperHeroId`: Represents a unique ID for each superhero.
  - `SuperHero`: A structure containing:
    - `name` (Text): The superhero's name.
    - `powers` (List<Text>): A list of the superhero's powers.
- **Persistent Storage**:
  - Superheroes are stored in a `Trie`, which offers efficient lookup and update operations.
  - The actor maintains a `stable` variable for the next available superhero ID.
- **CRUD Operations**:
  - `create(newHero: SuperHero)`: Creates a new superhero and returns its unique ID.
  - `getHero(id: SuperHeroId)`: Retrieves the superhero details by ID.
  - `update(id: SuperHeroId, updateValue: SuperHero)`: Updates the details of an existing superhero.

### Usage Example: 🔧🌟🔧
```motoko
let superheroManager = SuperheroManager();

let heroId = await superheroManager.create({
    name = "Superman";
    powers = List.fromArray(["Flying", "Super Strength", "X-ray Vision"]);
});

let hero = await superheroManager.getHero(heroId);
// hero will be ?{ name = "Superman"; powers = ["Flying", "Super Strength", "X-ray Vision"] }

await superheroManager.update(heroId, {
    name = "Superman";
    powers = List.fromArray(["Flying", "Super Strength", "X-ray Vision", "Heat Vision"]);
});

hero = await superheroManager.getHero(heroId);
// hero will reflect the updated powers
```

---

## Prerequisites 🔼🎮🔧

- **Motoko Base Library**: The actors use modules such as `Nat32`, `Trie`, `Option`, `List`, `Text`, and `Result` from the Motoko base library.
- **DFINITY SDK**: To deploy and interact with the actors on the Internet Computer.

---

## Installation and Deployment ⚙️✈️🔧

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd <repository-directory>
   ```
2. **Deploy the actors**:
   Use the DFINITY SDK to deploy the actors.
   ```bash
   dfx start
   dfx deploy
   ```
3. **Interact with the actors**:
   Use the DFINITY SDK or a front-end interface to send queries and update calls to the actors.

---

## Testing 🔬📝✨

- **Counter Actor**:
  Test the `increment`, `decrement`, `reset`, and `addValue` functions to ensure the counter behaves as expected.
- **Superhero Management Actor**:
  Verify the CRUD operations with different superhero data to ensure correct functionality.

---

## Contributing 🌈🔧🎨

Feel free to contribute by:
- Adding new features.
- Improving storage efficiency or functionality.
- Reporting bugs or suggesting enhancements.

---

## License 🔒🔖✨

This project is licensed under the MIT License. See `LICENSE` for details.

