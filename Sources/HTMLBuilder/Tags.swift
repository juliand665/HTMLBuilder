import Foundation

public enum HTML {}
	
public extension HTML {
	/// `<body>`
	struct Body: HTMLElementType {
		public let tagID = "body"
		
		public var content: HTMLContent
	}
	
	static func body(@HTMLBuilder content: () -> HTMLContent) -> HTMLElement<Body> {
		Body(content: content())
			.wrapped()
	}
	
	/// `<p>`
	struct Paragraph: HTMLElementType {
		public let tagID = "p"
		
		public var content: HTMLContent
	}
	
	static func paragraph(@HTMLBuilder content: () -> HTMLContent) -> HTMLElement<Paragraph> {
		Paragraph(content: content())
			.wrapped()
	}
	
	/// `<div>`
	struct Division: HTMLElementType {
		public let tagID = "div"
		
		public var content: HTMLContent
	}
	
	static func division(@HTMLBuilder content: () -> HTMLContent) -> HTMLElement<Division> {
		Division(content: content())
			.wrapped()
	}
	
	/// `<a>`
	struct Anchor: HTMLElementType {
		public let tagID = "a"
		
		public var reference: HTMLAttribute<String>
		
		public var content: HTMLContent
	}
	
	static func anchor(to reference: String) -> HTMLElement<Anchor> {
		anchor(to: reference) {}
	}
	
	static func anchor(to reference: String, @HTMLBuilder content: () -> HTMLContent) -> HTMLElement<Anchor> {
		Anchor(reference: .init("href", value: reference), content: content())
			.wrapped()
	}
}
