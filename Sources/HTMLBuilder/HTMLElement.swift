import Foundation
import HandyOperators

public protocol AnyHTMLElement {
	func encode(indent: String) -> String
}

@dynamicMemberLookup
public struct HTMLElement<T>: AnyHTMLElement where T: HTMLElementType {
	private var type: T
	private var globalAttributes = GlobalAttributes()
	
	init(_ type: T) {
		self.type = type
	}
	
	public subscript<Value>(
		dynamicMember keyPath: WritableKeyPath<T, Value>
	) -> (Value) -> Self {
		return { newValue in
			self <- {
				$0.type[keyPath: keyPath] = newValue
			}
		}
	}
	
	public subscript<Value>(
		dynamicMember keyPath: WritableKeyPath<T, HTMLAttribute<Value>>
	) -> (Value) -> Self {
		return { newValue in
			self <- {
				$0.type[keyPath: keyPath].value = newValue
			}
		}
	}
	
	public subscript<Value>(
		dynamicMember keyPath: WritableKeyPath<GlobalAttributes, HTMLAttribute<Value>>
	) -> (Value) -> Self {
		return { newValue in
			self <- {
				$0.globalAttributes[keyPath: keyPath].value = newValue
			}
		}
	}
	
	public func encode(indent: String = "") -> String {
		let allAttributes = attributes(in: type) + attributes(in: globalAttributes)
		let encoded = allAttributes
			.joined(separator: " ")
		
		let tagContents = "\(type.tagID)"
			+ (encoded.nonEmptyOptional.map { " \($0)" } ?? "")
		
		if let content = type.htmlContent {
			var output = ""
			output += indent + "<\(tagContents)>\n"
			for child in content {
				output += child.encode(indent: indent + "\t")
			}
			output += indent + "</\(type.tagID)>\n"
			return output
		} else {
			return indent + "<\(tagContents) />\n"
		}
	}
}

func attributes(in object: Any) -> [String] {
	Mirror(reflecting: object).children.compactMap { (label, value) in
		label.flatMap { label in
			(value as? AnyHTMLAttribute)?.encode(suggestedKey: label)
		}
	}
}

extension String: AnyHTMLElement {
	public func encode(indent: String) -> String {
		self.withHTMLEscapes()
			.split(separator: "\n")
			.map { indent + $0 }
			.joined(separator: "\n")
			+ "\n"
	}
}

extension String {
	func withHTMLEscapes() -> String {
		self
			.replacingOccurrences(of: "&", with: "&amp;")
			.replacingOccurrences(of: "<", with: "&lt;")
	}
}
