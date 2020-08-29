import Foundation

public struct HTMLAttribute<Value>: AnyHTMLAttribute where Value: HTMLAttributeEncodable {
	public let key: String
	public var value: Value
	
	init(_ key: String, value: Value) {
		self.key = key
		self.value = value
	}
	
	func encode() -> String? {
		guard let value = value.asHTMLAttribute() else { return nil }
		
		let escaped = value
			.withHTMLEscapes()
			.replacingOccurrences(of: "\"", with: "&quot;")
		return "\(key.lowercased())=\"\(escaped)\""
	}
}

extension HTMLAttribute where Value == Bool {
	init(_ key: String) {
		self.init(key, value: false)
	}
}

extension HTMLAttribute {
	init<V>(_ key: String) where Value == V? {
		self.init(key, value: nil)
	}
	
	init<V>(_ key: String) where Value == [V] {
		self.init(key, value: [])
	}
}

protocol AnyHTMLAttribute {
	func encode() -> String?
}
