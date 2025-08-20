
import SwiftUI
import Raylib

struct RaylibView: NSViewRepresentable {
    @State private var game = Game()

    func makeNSView(context: Context) -> RaylibHostView {
        let hostView = RaylibHostView(game: game)
        context.coordinator.hostView = hostView
        return hostView
    }

    func updateNSView(_ nsView: RaylibHostView, context: Context) {
        nsView.game = self.game
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject {
        var parent: RaylibView
        var hostView: RaylibHostView?
        var displayLink: CVDisplayLink?

        init(_ parent: RaylibView) {
            self.parent = parent
            super.init()
            
            CVDisplayLinkCreateWithActiveCGDisplays(&displayLink)
            if let displayLink = displayLink {
                CVDisplayLinkSetOutputCallback(displayLink, { (_, _, _, _, _, userData) -> CVReturn in
                    let coordinator = Unmanaged<Coordinator>.fromOpaque(userData!).takeUnretainedValue()
                    coordinator.update()
                    return kCVReturnSuccess
                }, Unmanaged.passUnretained(self).toOpaque())
                CVDisplayLinkStart(displayLink)
            }
        }
        
        @objc func update() {
            DispatchQueue.main.async {
                self.hostView?.updateGame()
            }
        }

        deinit {
            print("Coordinator deinit") // Debug print
            if let displayLink = displayLink {
                CVDisplayLinkStop(displayLink)
            }
        }
    }
}

class RaylibHostView: NSView {
    var game: Game

    init(game: Game) {
        self.game = game
        super.init(frame: .zero)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidMoveToWindow() {
        super.viewDidMoveToWindow()
        if window != nil && !Raylib.isWindowReady {
            Raylib.initWindow(800, 450, "AI D&D")
            Raylib.setTargetFPS(60)
        }
    }
    
    override func draw(_ dirtyRect: NSRect) {
        // Drawing is handled by the display link
    }
    
    func updateGame() {
        guard Raylib.isWindowReady && !Raylib.windowShouldClose else { return }
        
        game.update()
        game.draw()
    }
    
    deinit {
        if Raylib.isWindowReady {
            Raylib.closeWindow()
        }
    }
}
