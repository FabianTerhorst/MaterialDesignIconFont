// swift-tools-version:5.1
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
	    resources: [.process("Assets")])
        )
    ]
)
