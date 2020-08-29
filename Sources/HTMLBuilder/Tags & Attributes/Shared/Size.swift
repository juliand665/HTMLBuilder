import Foundation

extension HTML {
	public struct Size: HTMLAttributeEncodable {
		var width, height: Int
		
		public init(width: Int, height: Int) {
			self.width = width
			self.height = height
		}
		
		public func asHTMLAttribute() -> String? {
			"\(width)x\(height)"
		}
	}
}
