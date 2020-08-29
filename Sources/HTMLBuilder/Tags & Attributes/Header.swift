import Foundation

extension HTML {
	/// `<head>`
	public struct Header: HTMLElementType {
		public let tagID = "head"
		
		public var title: HTMLElement<Title>
		public var baseURL: HTMLElement<BaseURL>?
		public var metadata: [HTMLMetadataContent] = []
		
		public var content: [AnyHTMLElement] {
			[title] + baseURL.asArray + metadata
		}
	}
	
	public static func header(title: HTMLElement<Title>) -> HTMLElement<Header> {
		Header(title: title)
			.wrapped()
	}
}

extension HTML {
	/// `<title>`
	public struct Title: HTMLElementType {
		public let tagID = "title"
		
		public var content: String
	}
	
	public static func title(_ content: String) -> HTMLElement<Title> {
		Title(content: content)
			.wrapped()
	}
}

extension HTML {
	/// `<base>`
	public struct BaseURL: HTMLElementType {
		public let tagID = "base"
		
		public var reference = HTMLAttribute<String?>("href")
		public var target = HTMLAttribute<String?>("target")
	}
	
	public static func baseURL() -> HTMLElement<BaseURL> {
		BaseURL()
			.wrapped()
	}
}
