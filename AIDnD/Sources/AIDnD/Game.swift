
import Raylib

struct Game {
    var player: Player
    var objects: [GameObject]

    init() {
        self.player = Player(
            position: Vector2(x: 400, y: 225),
            size: Vector2(x: 20, y: 20),
            color: .red
        )
        
        self.objects = []
        for _ in 0..<10 {
            let object = GameObject(
                rect: Rectangle(
                    x: Float.random(in: 0...780),
                    y: Float.random(in: 0...430),
                    width: Float.random(in: 20...50),
                    height: Float.random(in: 20...50)
                ),
                color: .blue
            )
            self.objects.append(object)
        }
    }

    mutating func update() {
        let oldPlayerPosition = player.position

        if Raylib.isKeyDown(.right) { player.position.x += 2.0 }
        if Raylib.isKeyDown(.left) { player.position.x -= 2.0 }
        if Raylib.isKeyDown(.up) { player.position.y -= 2.0 }
        if Raylib.isKeyDown(.down) { player.position.y += 2.0 }

        let playerRect = Rectangle(x: player.position.x, y: player.position.y, width: player.size.x, height: player.size.y)

        for object in objects {
            if Raylib.checkCollisionRecs(playerRect, object.rect) {
                player.position = oldPlayerPosition
                break
            }
        }
    }

    func draw() {
        Raylib.beginDrawing()
        Raylib.clearBackground(.white)

        Raylib.drawText("Use arrow keys to move the red square", 10, 10, 20, .black)

        for object in objects {
            Raylib.drawRectangleRec(object.rect, object.color)
        }

        Raylib.drawRectangleV(player.position, player.size, player.color)

        Raylib.endDrawing()
    }
}
