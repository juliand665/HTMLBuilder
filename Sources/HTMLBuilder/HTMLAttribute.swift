import Foundation

public struct HTMLAttribute<Value>: AnyHTMLAttribute where Value: HTMLAttributeEncodable {
	let keyOverride: String?
	public var value: Value
	
	init(key keyOverride: String? = nil, value: Value) {
		self.keyOverride = keyOverride
		self.value = value
	}
	
	init<V>(key keyOverride: String? = nil, value: Value = nil) where Value == V? {
		self.init(key: keyOverride, value: value)
	}
	
	init(_ value: Value) {
		self.init(value: value)
	}
	
	func encode(suggestedKey: String) -> String? {
		guard let value = value.asHTMLAttribute() else { return nil }
		
		let escaped = value
			.withHTMLEscapes()
			.replacingOccurrences(of: "\"", with: "&quot;")
		return "\(keyOverride ?? suggestedKey)=\"\(escaped)\""
	}
}

protocol AnyHTMLAttribute {
	func encode(suggestedKey: String) -> String?
}
