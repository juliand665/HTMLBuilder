import Foundation

public extension HTML {
	/// `<img>`
	struct Image: HTMLElementType {
		public let tagID = "img"
		
		public var source: HTMLAttribute<String>
		/// defines multiple 
		public var sourceSet = HTMLAttribute<AnySourceSet?>("srcset")
		/// `sizes`: defines which width (in pixels) to use for choosing an appropriate image from `sourceSet`
		public var responsiveWidths = HTMLAttribute<ResponsiveWidths?>("sizes")
		
		/// `alt`: provides a textual representation as alternative to the image (e.g. for screen readers, when it can't load, etc.)
		public var textAlternative = HTMLAttribute<String?>("alt")
		
		public var width = HTMLAttribute<Int?>("width")
		public var height = HTMLAttribute<Int?>("height")
		
		public var crossOriginRequestHandling = HTMLAttribute<CrossOriginRequestHandling?>("crossorigin")
		public var preferredDecodingMode = HTMLAttribute<DecodingMode?>("decoding")
		/// `ismap`: when within a link tag, notes where on the image the user clicked and sends that to the server
		public var loadingMode = HTMLAttribute<LoadingMode?>("loading")
		
		public var sendsClickPositions = HTMLAttribute<Bool>("ismap")
		/// 
		public var imageMap = HTMLAttribute<String?>("usemap")
		
		public enum DecodingMode: String, HTMLAttributeEncodable {
			case sync, async, auto
		}
		
		public enum LoadingMode: String, HTMLAttributeEncodable {
			case eager, lazy
		}
		
		public struct ResponsiveWidths: HTMLAttributeEncodable {
			public var defaultWidth: Int
			public var overrides: [Override]
			
			public init(defaultWidth: Int, widthOverrides: [Override]) {
				self.defaultWidth = defaultWidth
				self.overrides = widthOverrides
			}
			
			public func asHTMLAttribute() -> String? {
				guard
					let defaultWidth = defaultWidth.asHTMLAttribute(),
					let overrides = overrides.asHTMLAttribute(separator: ", ")
					else { return nil }
				
				return "\(overrides), \(defaultWidth)"
			}
			
			public struct Override: HTMLAttributeEncodable {
				public var condition: MediaCondition
				public var width: Int
				
				public func asHTMLAttribute() -> String? {
					"(\(condition.asHTMLAttribute()!)) \(width.asHTMLAttribute()!)"
				}
			}
		}
		
		public struct SourceSet<Descriptor> where Descriptor: SizeDescriptor {
			public var defaultSource: String?
			public var overrides: [Descriptor: String]
			
			public init(defaultSource: String? = nil, overrides: [Descriptor: String] = [:]) {
				self.defaultSource = defaultSource
				self.overrides = overrides
			}
			
			public func asHTMLAttribute() -> String? {
				(defaultSource.asArray
					+ overrides.map { "\($0.value) \($0.key.asHTMLAttribute()!)" }
				).asHTMLAttribute(separator: ", ")
			}
			
			public func build() -> AnySourceSet {
				AnySourceSet(encoded: asHTMLAttribute())
			}
		}
		
		public struct AnySourceSet: HTMLAttributeEncodable {
			fileprivate let encoded: String?
			
			public func asHTMLAttribute() -> String? { encoded }
		}
		
		public typealias SizeDescriptor = _SizeDescriptor
		
		public struct Width: SizeDescriptor {
			public var width: Int
			
			public func asHTMLAttribute() -> String? {
				"\(width.asHTMLAttribute()!)w"
			}
		}
		
		public struct PixelDensity: SizeDescriptor {
			public var density: Double
			
			public func asHTMLAttribute() -> String? {
				"\(density.asHTMLAttribute()!)x"
			}
		}
	}
	
	/// The condition for a media query, currently provided as a regular string—will become its own type in future.
	typealias MediaCondition = String // TODO
	
	static func image(source: String) -> HTMLElement<Image> {
		Image(source: .init("src", value: source))
			.wrapped()
	}
}

// TODO: can i add some kind of attribute to make it not usable directly? or does the underscore already do that?
/// please use the typealias in `HTML.Image` instead.
public protocol _SizeDescriptor: HTMLAttributeEncodable, Hashable {}
