// swift-tools-version:5.1

import PackageDescription

let package = Package(
	name: "HTMLBuilder",
	products: [
		.library(
			name: "HTMLBuilder",
			targets: ["HTMLBuilder"]
		),
	],
	dependencies: [
		.package(url: "https://github.com/juliand665/HandyOperators", .branch("master")),
	],
	targets: [
		.target(
			name: "HTMLBuilder",
			dependencies: ["HandyOperators"]
		),
		.testTarget(
			name: "HTMLBuilderTests",
			dependencies: ["HTMLBuilder"]
		),
	]
)
