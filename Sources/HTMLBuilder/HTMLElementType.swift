import Foundation

public protocol HTMLElementType {
	associatedtype Content
	
	var tagID: String { get }
	
	var content: Content { get }
	var htmlContent: HTMLContent? { get }
}

public extension HTMLElementType where Content == Never {
	var content: Never {
		fatalError("\(tagID) element has no content!")
	}
	
	var htmlContent: HTMLContent? { nil }
}

public extension HTMLElementType where Content: Collection, Content.Element: AnyHTMLElement {
	var htmlContent: HTMLContent? {
		content.map { $0 }
	}
}

public extension HTMLElementType where Content: Collection, Content.Element == AnyHTMLElement {
	var htmlContent: HTMLContent? {
		Array(content)
	}
}

public extension HTMLElementType where Content: AnyHTMLElement {
	var htmlContent: HTMLContent? {
		[content]
	}
}

extension HTMLElementType {
	func wrapped() -> HTMLElement<Self> {
		HTMLElement(self)
	}
}
