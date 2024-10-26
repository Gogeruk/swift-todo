// swift-tools-version:6.0
import PackageDescription

let package = Package(
    name: "MySwiftApp",
    platforms: [
        .macOS(.v12)
    ],
    products: [
        .executable(
            name: "MySwiftApp",
            targets: ["MySwiftApp"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "MySwiftApp",
            dependencies: []
        )
    ]
)