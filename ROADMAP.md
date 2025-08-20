
# Project Roadmap

This document outlines the development plan for the AI D&D project.

## Phase 1: Core Game Engine & UI

The goal of this phase is to establish a robust and visually appealing core game experience.

- [ ] **Player-Centric Camera**: Implement a camera system that follows the player, ensuring the player character is always in the center of the view.
- [ ] **Tile-Based Map System**: 
    - [ ] Design and implement a data structure for representing a 2D tile-based game map.
    - [ ] Create a map renderer that can draw the map from the data structure.
    - [ ] The map should support different tile types (e.g., floor, wall, water).
- [ ] **Asset Management & Sprites**:
    - [ ] Replace the current geometric shapes with actual 2D sprites.
    - [ ] Create a clear and simple process for updating game assets. This should be documented below.
    - [ ] **Asset Guidelines**:
        - **Player Sprite**: The player will be represented by a single sprite. Create a placeholder sprite and document its location (`Assets/player.png`).
        - **Tile Sprites**: Wall, floor, and water tiles will be loaded from an asset directory (`Assets/Tiles/`). Document the naming convention (e.g., `wall.png`, `floor.png`, `water.png`).
        - **NPC Sprites**: A placeholder NPC sprite should be created and documented at `Assets/npc.png`.

## Phase 2: AI Dungeon Master Integration

- [ ] **(To be defined)**: Integrate the on-device LLM to act as the Dungeon Master, generating story and responding to player actions.

## Phase 3: Gameplay & Content

- [ ] **(To be defined)**: Add more complex gameplay mechanics, quests, and content.
