// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "MaterialDesignIconFont",
    platforms: [.iOS(.v10)],
    products: [
        .library(name: "MaterialDesignIconFont", targets: ["MaterialDesignIconFont"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "MaterialDesignIconFont",
            dependencies: [],
            path: "Sources",
	    resources: [
		.process("Assets/materialdesignicons.ttf"),
		.process("Assets/meteocons-v1.1.1.ttf")
	    ]
        ),
    ]
)
