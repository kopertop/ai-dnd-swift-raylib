
import XCTest
@testable import AIDnD

final class AIDnDTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async. 
        // Mark tests with the `async` keyword to allow awaiting asynchronous code execution.
        // You can use Host for tests that need to interact with the UI.
    }

    func testCameraFollowsPlayer() throws {
        let game = Game() // Game is now a class
        let initialPlayerPosition = game.player.position

        // Simulate some player movement
        game.player.position.x += 10
        game.player.position.y += 5

        // Update the game state (which should update the camera)
        game.update()

        // Assert that the camera's target is now the player's new position
        XCTAssertEqual(game.camera.target.x, game.player.position.x, accuracy: 0.001)
        XCTAssertEqual(game.camera.target.y, game.player.position.y, accuracy: 0.001)
    }
}
