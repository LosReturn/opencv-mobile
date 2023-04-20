// swift-tools-version: 5.7
import PackageDescription

let version = "v16"

let package = Package(
    name: "OpenCV",
    platforms: [
        .iOS(.v11)
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
                .linkedLibrary("c++")
            ]
        )
    ]
)

