import Foundation

public protocol HTMLElementType {
	associatedtype Content
	
	var tagID: String { get }
	
	var content: Content { get }
	var htmlContent: [AnyHTMLElement]? { get }
}

extension HTMLElementType where Content == Never {
	var content: Never {
		fatalError("\(tagID) element has no content!")
	}
	
	var htmlContent: [AnyHTMLElement]? { nil }
}

extension HTMLElementType where Content: Collection, Content.Element: AnyHTMLElement {
	var htmlContent: [AnyHTMLElement]? {
		content.map { $0 }
	}
}

extension HTMLElementType where Content: Collection, Content.Element == AnyHTMLElement {
	var htmlContent: [AnyHTMLElement]? {
		Array(content)
	}
}
