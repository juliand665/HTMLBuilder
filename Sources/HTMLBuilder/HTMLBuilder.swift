import Foundation

@_functionBuilder
enum HTMLBuilder {
	static func buildExpression(_ element: AnyHTMLElement) -> HTMLContent {
		[element]
	}
	
	static func buildOptional(_ content: HTMLContent?) -> HTMLContent {
		content ?? []
	}
	
	static func buildArray(_ contents: [HTMLContent]) -> HTMLContent {
		contents.flatMap { $0 }
	}
	
	static func buildBlock(_ content: HTMLContent) -> HTMLContent {
		content
	}
	
	static func buildBlock(_ contents: HTMLContent...) -> HTMLContent {
		contents.flatMap { $0 }
	}
	
	@HTMLBuilder
	var test: HTMLContent {
		HTML.paragraph {
			"hi! how are you?"
			HTML.division {
				"p good"
				"hbu"
			}
		}
		HTML.paragraph {
			"second paragraph!"
			HTML.anchor(to: "test")
		}
	}
}
