
// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "AIDnD",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(
            name: "AIDnD",
            targets: ["AIDnD"])
    ],
    dependencies: [
        .package(url: "https://github.com/STREGAsGate/Raylib.git", branch: "master")
    ],
    targets: [
        .executableTarget(
            name: "AIDnD",
            dependencies: [
                .product(name: "Raylib", package: "Raylib")
            ],
            path: "Sources/AIDnD"
        ),
        .testTarget(
            name: "AIDnDTests",
            dependencies: ["AIDnD"]
        )
    ]
)
