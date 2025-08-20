# Gemini Development Guide: AI D&D (Swift/Raylib Edition)

This document is my primary guide for developing the native Swift version of the AI D&D project. It is a living document embodying the principle of **Compounding Engineering**. I will update it after every major task to refine my workflows and ensure consistent, high-quality development.

## 1. Project Overview

- **Mission**: Create a high-performance, native D&D game for Apple platforms (macOS & iOS) using Raylib for rendering and a local LLM for the AI Dungeon Master.
- **Core Technologies**:
    - **Language**: Swift
    - **Application Framework**: SwiftUI for the main app structure, windowing, and UI overlays (e.g., chat boxes, menus).
    - **Graphics Engine**: [Raylib-Swift](https://github.com/STREGAsGate/Raylib) for the core game rendering (tilemaps, sprites, effects).
    - **Development Environment**: Xcode.
    - **Testing**: XCTest framework.
    - **AI (Challenge Area)**: The `cactus-react-native` library is no longer viable. The primary research task is to integrate a native GGUF-compatible inference engine (e.g., `llama.cpp`'s native bindings) into the Swift application.

## 2. Core Principles (My Mandates)

### 2.1. Compounding Engineering

After every task, I will reflect on the process and update this document with any new patterns, successful workflows, or pitfalls to avoid. This ensures continuous self-improvement.

### 2.2. Test-Driven Development (TDD)

All new logic will be developed using a TDD approach with XCTest.
1.  **Red**: Create a new test file or function in the project's Test Target. Write a failing test that defines the desired functionality.
2.  **Green**: Write the simplest possible implementation in the main application source to make the test pass.
3.  **Refactor**: Clean up and improve the code while keeping the tests green.

## 3. Development Workflow

### 3.1. Setup

Development will be done within Xcode. Dependencies like `Raylib-Swift` will be managed using the Swift Package Manager.

### 3.2. Running the App

- I will build and run the project using the `Run` command (or `Cmd+R`) in Xcode, targeting either a macOS build or an iOS simulator/device.

### 3.3. Testing (TDD Workflow)

- I will use the `Test` command (or `Cmd+U`) in Xcode to run the XCTest suite.
- All new logic (e.g., game state, character movement) must have corresponding unit tests.

### 3.4. Linting & Code Style

- I will adhere to standard Swift API Design Guidelines.
- If a linter like SwiftLint is added to the project, I will adhere to its rules.

## 4. Architecture & Conventions

### 4.1. Project Structure (Xcode)

- The project will be a standard multiplatform (iOS, macOS) SwiftUI application.
- **SwiftUI Views**: Will be used for all non-game-canvas UI (e.g., `ChatView.swift`, `MainMenu.swift`).
- **Raylib Canvas**: A `UIViewRepresentable` (for iOS) and `NSViewRepresentable` (for macOS) will be created to host the Raylib rendering surface within the SwiftUI view hierarchy.
- **Game Logic**: Core game logic will be separated from views in its own Swift classes or structs (e.g., `GameState.swift`, `Player.swift`).

### 4.2. AI/LLM Integration (High-Priority Research)

1.  **Research**: My first major task on this project will be to investigate and select a library for running the GGUF-formatted LLM on-device in a native Swift environment.
2.  **Isolate**: The AI service will be built in its own module/class, with a clean API (e.g., `func getNextAction(prompt: String) async -> String`).
3.  **Test**: I will write unit tests to verify the AI service can be initialized and can process simple inputs.

### 4.3. Rendering with Raylib

- All in-game objects (the world, characters, items) will be rendered on the Raylib canvas.
- The game loop will be managed within the Raylib view.
- UI Overlays (like chat text) will be rendered using SwiftUI, overlaid on top of the Raylib canvas. This provides the best of both worlds: high-performance rendering for the game and a powerful, native UI framework for the interface.

## 5. AI Agent Directives (Self-Improvement Log)

### Directive 1: Initial Project Setup (Initial Rule)

1.  Create a new Multiplatform App in Xcode.
2.  Add `Raylib-Swift` as a package dependency.
3.  Create the `RaylibViewRepresentable.swift` to host the game canvas.
4.  Write a simple test to ensure the main `ContentView` can be created.
5.  **Learning**: This establishes the foundational structure of the application.

---
*This document was last updated on 2025-08-20. I will update it as I learn.*
