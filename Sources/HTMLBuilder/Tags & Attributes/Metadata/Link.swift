import Foundation

extension HTML {
	/// `<link>`
	public struct Link: HTMLMetadataContentType {
		public let tagID = "link"
		
		// TODO: might be good to generalize?
		public var crossOriginRequestHandling = HTMLAttribute<CrossOriginRequestHandling?>("crossorigin")
		
		public var isDisabled = HTMLAttribute<Bool>("disabled")
		public var reference = HTMLAttribute<String?>("href")
		public var referenceLanguage = HTMLAttribute<String?>("hreflang")
		public var mediaQuery = HTMLAttribute<String?>("media")
		public var relations: HTMLAttribute<[LinkRelation]>
		public var sizes = HTMLAttribute<String?>("sizes")
		public var mediaType = HTMLAttribute<String?>("type")
		
		public enum SizePreference: HTMLAttributeEncodable {
			case any
			case customized([Size])
			
			public func asHTMLAttribute() -> String? {
				switch self {
				case .any:
					return "any"
				case .customized(let sizes):
					return sizes.asHTMLAttribute()
				}
			}
		}
	}
	
	public enum CrossOriginRequestHandling: String, HTMLAttributeEncodable {
		case anonymous
		case useCredentials = "use-credentials"
	}
	
	public static func link(relations: [LinkRelation]) -> HTMLElement<Link> {
		assert(!relations.isEmpty, "Link must have at least one relation specified.")
		return Link(relations: .init("rel", value: relations)).wrapped()
	}
}
