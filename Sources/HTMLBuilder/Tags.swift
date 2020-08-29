import Foundation

public enum HTML {}
	
public extension HTML {
	/// `<body>`
	struct Body: HTMLElementType {
		public let tagID = "body"
		
		public var content: [AnyHTMLElement] = []
	}
	
	static func body() -> HTMLElement<Body> {
		Body()
			.wrapped()
	}
	
	/// `<p>`
	struct Paragraph: HTMLElementType {
		public let tagID = "p"
		
		public var content: [AnyHTMLElement] = []
	}
	
	static func paragraph() -> HTMLElement<Paragraph> {
		Paragraph()
			.wrapped()
	}
	
	/// `<a>`
	struct Anchor: HTMLElementType {
		public let tagID = "a"
		
		public var reference: HTMLAttribute<String>
	}
	
	static func anchor(to reference: String) -> HTMLElement<Anchor> {
		Anchor(reference: .init("href", value: reference))
			.wrapped()
	}
}
