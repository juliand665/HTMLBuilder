import Foundation

extension HTML {
	/// `<html>`
	public struct Root: HTMLElementType {
		public let tagID = "html"
		
		public var xmlNamespace = HTMLAttribute<String?>("xmlns")
		
		public var header: HTMLElement<Header>
		public var body: HTMLElement<Body>
		
		public var content: [AnyHTMLElement] {
			[header, body]
		}
	}
	
	public static func root(
		header: HTMLElement<Header>, body: HTMLElement<Body>
	) -> HTMLElement<Root> {
		Root(header: header, body: body)
			.wrapped()
	}
}
