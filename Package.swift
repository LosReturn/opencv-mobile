// swift-tools-version: 5.7
import PackageDescription

let version = "Release v16"
let checksum = "1ead050146646a8f81e37aba0f7efb7033678311734a272f76557647c4d419b2"

let package = Package(
    name: "OpenCV",
    platforms: [
        .macOS(.v10_13), .iOS(.v11), .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "OpenCV",
            targets: ["opencv2"]),
    ],
    targets: [
        .binaryTarget(name: "opencv2",
                      url: "https://github.com/nihui/opencv-mobile/releases/download/\(version)/opencv-mobile-4.6.0-ios.zip"
                     ),
        .target(
            name: "opencv2-dependencies",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreImage"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("CoreVideo", .when(platforms: [.iOS])),
                .linkedFramework("Accelerate", .when(platforms: [.iOS, .macOS])),
                .linkedFramework("OpenCL", .when(platforms: [.macOS])),
                .linkedLibrary("c++")
            ]
        )
    ]
)

