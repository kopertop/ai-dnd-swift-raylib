# AI D&D Swift/Raylib Edition

This repository contains the new, native implementation of the AI D&D project, built with Swift, SwiftUI, and the Raylib engine for graphics.

## 🚀 Mission

To create a high-performance, native D&D game for Apple platforms (macOS and iOS) that uses an on-device LLM as the Dungeon Master.

## 🛠️ Technology Stack

- **Language**: Swift
- **UI Framework**: SwiftUI (for menus, overlays, and app structure)
- **Graphics Engine**: Raylib (via the [Raylib-Swift](https://github.com/STREGAsGate/Raylib) wrapper)
- **Build Environment**: Swift Package Manager / Xcode
- **AI (To Be Implemented)**: A native solution for running GGUF models on-device (e.g., `llama.cpp` bindings).

## 🏃 How to Run

This project is built using the Swift Package Manager. You can build and run it from the command line.

1.  **Clone the repository**:
    ```bash
    git clone <repository-url>
    cd ai-dnd-swift-raylib
    ```

2.  **Build and Run**:
    ```bash
    swift run
    ```

    This will fetch dependencies, compile the code, and launch the application. A window should appear where you can move a red square with the arrow keys.

## 🧑‍💻 Developer Guidelines

- **Project Structure**: The project is a Swift package located in the `AIDnD` directory. The main application entry point is `AIDnD/Sources/AIDnD/main.swift`.
- **Game Logic**: The core game logic is in `Game.swift`. The `Game` struct holds the game state.
- **Rendering**: The rendering is handled by the `RaylibView.swift` file, which integrates Raylib into SwiftUI.
- **Dependencies**: Dependencies are managed in `AIDnD/Package.swift`.
- **Commits**: Follow conventional commit message standards.