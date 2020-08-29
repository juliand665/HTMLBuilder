import XCTest
@testable import HTMLBuilder

final class HTMLBuilderTests: XCTestCase {
	func testExample() {
		print(
			HTML.image(source: "www.example.com")
				.textAlternative("cool")
				.hidden(true)
				.width(420)
				.title(#"weird title with "quotes", &ampersands, < less thans, & \ some \back\\slashes"#)
				.encode()
		)
		print(
			HTML.body {
				#"hello! i have "quotes", &ampersands, < less thans, & \ some \back\\slashes too"#
				HTML.paragraph {
					"and i can contain <p>aragraphs too! nice, huh?"
				}
			}
			.hidden(false)
			.title(#"weird title with "quotes", &ampersands, < less thans, & \ some \back\\slashes"#)
			.encode()
		)
	}
	
	static var allTests = [
		("testExample", testExample),
	]
}
