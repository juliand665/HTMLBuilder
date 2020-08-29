import Foundation

public protocol HTMLElementType {
	associatedtype Content
	
	var tagID: String { get }
	
	var content: Content { get }
	var htmlContent: [AnyHTMLElement]? { get }
}

public extension HTMLElementType where Content == Never {
	var content: Never {
		fatalError("\(tagID) element has no content!")
	}
	
	var htmlContent: [AnyHTMLElement]? { nil }
}

public extension HTMLElementType where Content: Collection, Content.Element: AnyHTMLElement {
	var htmlContent: [AnyHTMLElement]? {
		content.map { $0 }
	}
}

public extension HTMLElementType where Content: Collection, Content.Element == AnyHTMLElement {
	var htmlContent: [AnyHTMLElement]? {
		Array(content)
	}
}

public extension HTMLElementType where Content: AnyHTMLElement {
	var htmlContent: [AnyHTMLElement]? {
		[content]
	}
}

extension HTMLElementType {
	func wrapped() -> HTMLElement<Self> {
		HTMLElement(self)
	}
}
