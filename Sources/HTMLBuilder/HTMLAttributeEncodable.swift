import Foundation

public protocol HTMLAttributeEncodable {
	func asHTMLAttribute() -> String?
}

extension String: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		self
	}
}

extension HTMLAttributeEncodable where Self: FloatingPoint {
	public func asHTMLAttribute() -> String? {
		"\(self)"
	}
}

extension HTMLAttributeEncodable where Self: BinaryInteger {
	public func asHTMLAttribute() -> String? {
		"\(self)"
	}
}

extension Int: HTMLAttributeEncodable {}
extension Int8: HTMLAttributeEncodable {}
extension Int16: HTMLAttributeEncodable {}
extension Int32: HTMLAttributeEncodable {}
extension Int64: HTMLAttributeEncodable {}
extension UInt: HTMLAttributeEncodable {}
extension UInt8: HTMLAttributeEncodable {}
extension UInt16: HTMLAttributeEncodable {}
extension UInt32: HTMLAttributeEncodable {}
extension UInt64: HTMLAttributeEncodable {}

extension Double: HTMLAttributeEncodable {}
extension Float: HTMLAttributeEncodable {}

extension Character: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		String(self)
	}
}

extension Optional: HTMLAttributeEncodable where Wrapped: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		self.flatMap { $0.asHTMLAttribute() }
	}
}

extension Array: HTMLAttributeEncodable where Element: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		asHTMLAttribute(separator: " ")
	}
	
	public func asHTMLAttribute(separator: String) -> String? {
		self.compactMap { $0.asHTMLAttribute() }
			.nonEmptyOptional?
			.joined(separator: separator)
	}
}

extension Bool: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		self ? "" : nil // god html is weird
	}
}

extension HTMLAttributeEncodable where Self: RawRepresentable, RawValue: HTMLAttributeEncodable {
	public func asHTMLAttribute() -> String? {
		rawValue.asHTMLAttribute()
	}
}

public struct HTMLStyleAttribute: HTMLAttributeEncodable {
	var rules: [String] = []
	
	public func asHTMLAttribute() -> String? {
		rules.nonEmptyOptional?.joined(separator: "; ")
	}
}

extension HTMLStyleAttribute: ExpressibleByStringLiteral {
	public init(stringLiteral value: String) {
		self.init(rules: value.nonEmptyOptional.map { [$0] } ?? [])
	}
}

extension Collection {
	var nonEmptyOptional: Self? {
		isEmpty ? nil : self
	}
}
