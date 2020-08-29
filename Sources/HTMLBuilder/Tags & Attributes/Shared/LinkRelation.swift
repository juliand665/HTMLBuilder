import Foundation

extension HTML {
	/// used for `Anchor`, `Area`, `Form`, and `Link`
	public struct LinkRelation: HTMLAttributeEncodable {
		public static let alternate = Self("alternate")
		public static let author = Self("author")
		public static let bookmark = Self("bookmark")
		public static let canonical = Self("canonical")
		public static let external = Self("external")
		public static let help = Self("help")
		public static let icon = Self("icon")
		public static let license = Self("license")
		public static let manifest = Self("manifest")
		public static let modulePreload = Self("modulepreload")
		public static let next = Self("next")
		public static let noFollow = Self("nofollow")
		public static let noOpener = Self("noopener")
		public static let noReferrer = Self("noreferrer")
		public static let pingback = Self("pingback")
		public static let prefetch = Self("prefetch")
		public static let preload = Self("preload")
		public static let prev = Self("prev")
		public static let search = Self("search")
		public static let shortlink = Self("shortlink")
		public static let stylesheet = Self("stylesheet")
		public static let tag = Self("tag")
		
		public static func custom(_ rawValue: String) -> Self {
			.init(rawValue)
		}
		
		let rawValue: String
		
		private init(_ rawValue: String) {
			self.rawValue = rawValue
		}
		
		public func asHTMLAttribute() -> String? {
			rawValue
		}
	}
}
