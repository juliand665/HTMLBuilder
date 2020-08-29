import Foundation

public protocol HTMLMetadataContent: AnyHTMLElement {}
extension HTMLElement: HTMLMetadataContent where T: HTMLMetadataContentType {}

public protocol HTMLMetadataContentType: HTMLElementType {}

extension HTML {
	/// `<noscript>`
	public struct NoScriptMetadata: HTMLMetadataContentType {
		public let tagID = "noscript"
		
		public var content: [HTMLMetadataContent] = []
		
		public var htmlContent: HTMLContent? {
			content.map { $0 }
		}
	}
	
	public static func noScriptMetadata() -> HTMLElement<NoScriptMetadata> {
		NoScriptMetadata()
			.wrapped()
	}
	
	/// `<style>`
	public struct Style: HTMLMetadataContentType {
		public let tagID = "style"
		
		public var mediaQuery = HTMLAttribute<String?>("media")
		public var nonce = HTMLAttribute<String?>("nonce")
		public var stylesheetTitle = HTMLAttribute<String?>("title")
		
		public var css: String
		
		public var content: String { css }
	}
	
	public static func style(css: String) -> HTMLElement<Style> {
		Style(css: css)
			.wrapped()
	}
	
	/// `<meta>`
	public struct Metadata: HTMLMetadataContentType {
		public let tagID = "meta"
		
		
	}
	
	public static func metadata() -> HTMLElement<Metadata> {
		Metadata()
			.wrapped()
	}
}
