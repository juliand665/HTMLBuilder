import Foundation

public struct GlobalAttributes {
	public var id: String?
	private var classes = HTMLAttribute<[String]>(key: "class", value: [])
	
	public var hidden = HTMLAttribute<Bool>(value: false)
	
	public var style = HTMLStyleAttribute()
	
	public var title = HTMLAttribute<String?>()
	public var tabIndex = HTMLAttribute<Int?>(key: "tabindex")
}

enum HTML {
	/// `<html>`
	public struct Root: HTMLElementType {
		public let tagID = "html"
		
		public var header: HTMLElement<Header>
		public var body: HTMLElement<Body>
		
		public var content: [AnyHTMLElement] {
			[header, body]
		}
	}
	
	/// `<head>`
	public struct Header: HTMLElementType {
		public let tagID = "head"
		
		public var title: HTMLElement<Title>
		
		public var content: [AnyHTMLElement] {
			[title]
		}
	}
	
	/// `<title>`
	public struct Title: HTMLElementType {
		public let tagID = "title"
		
		// TODO
	}
	
	/// `<meta>`
	public struct Meta: HTMLElementType {
		public let tagID = "meta"
		
		// TODO
	}
	
	/// `<body>`
	public struct Body: HTMLElementType {
		public let tagID = "body"
		
		public var content: [AnyHTMLElement] = []
	}
	
	public static func body() -> HTMLElement<Body> {
		.init(.init())
	}
	
	/// `<p>`
	public struct Paragraph: HTMLElementType {
		public let tagID = "p"
		
		public var content: [AnyHTMLElement] = []
	}
	
	static func paragraph() -> HTMLElement<Paragraph> {
		.init(.init())
	}
	
	/// `<a>`
	public struct Anchor: HTMLElementType {
		public let tagID = "a"
		
		public var href: HTMLAttribute<String>
	}
	
	/// `<p>`
	public struct Image: HTMLElementType {
		public let tagID = "img"
		
		public var src: HTMLAttribute<String>
		public var alt = HTMLAttribute<String?>()
		
		public var width = HTMLAttribute<Double?>()
		public var height = HTMLAttribute<Double?>()
	}
	
	static func image(source: String) -> HTMLElement<Image> {
		.init(.init(src: .init(value: source)))
	}
}

/* empty:
<area>
<base>
<br>
<col>
<embed>
<hr>
<img>
<input>
<keygen>(HTML 5.2 Draft removed)
<link>
<meta>
<param>
<source>
<track>
<wbr>
*/
