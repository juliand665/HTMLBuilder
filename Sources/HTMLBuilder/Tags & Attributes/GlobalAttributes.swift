import Foundation

public struct GlobalAttributes {
	/// `accesskey`: The browser will use the first available character in this list to create a keyboard shortcut for the element.
	public var keyboardShortcutSuggestions = HTMLAttribute<[Character]>("accesskey")
	
	/// Controls if/how user text input is uppercased (uppercase letters are never lowercased).
	public var autoCapitalization = HTMLAttribute<AutoCapitalization?>("autocapitalize")
	
	/// If `true`, the user can edit the element's contents directly.
	public var contentEditable = HTMLAttribute<Bool>("contenteditable")
	
	// TODO: custom data attributes? `data-*`
	
	/// `dir`: Establishes a certain directionality for the element's text.
	public var textDirection = HTMLAttribute<TextDirection?>("dir")
	
	/// A list of classes for use with CSS selectors or JavaScript.
	public var classes = HTMLAttribute<[String]>("class", value: [])
	
	/// Whether or not the element can be dragged by the user.
	public var draggable = HTMLAttribute<Bool>("draggable")
	
	/// If `true`, the element will not be rendered and not be part of the page's flow.
	public var hidden = HTMLAttribute<Bool>("hidden")
	
	/// An optional identifier, unique across the whole document, for use with CSS selectors or JavaScript.
	public var id = HTMLAttribute<String?>("id")
	
	/// States the kind of data that should be input in this element, to determine virtual keyboards.
	/// 
	/// On non-`input` elements, this is only meaningful if `contentEditable` is `true`.
	public var inputMode = HTMLAttribute<InputMode?>("inputmode")
	
	// TODO: custom elements? `is` is only meaningful with those
	
	// TODO: items? `itemID`, `itemProp`, etc.
	
	/// A language tag identifying the language of the element's content or desired user input, e.g. `"en-US"`.
	public var language = HTMLAttribute<String?>("lang")
	
	/// A list of part names of this element, to apply CSS to this element when in a shadow tree.
	public var part = HTMLAttribute<[String]>("part")
	
	/// If set, when there's a slot element in a neighboring shadow tree with this value as its `name` attribute, this element will be assigned to that slot.
	public var slot = HTMLAttribute<String?>("slot")
	
	/// Whether or not to check user-entered text in this element for spelling errors.
	public var spellCheck = HTMLAttribute<Bool>("spellcheck")
	
	/// Defines CSS syling declarations to be applied to this element.
	public var style = HTMLStyleAttribute("style")
	
	/// If set, the element is focusable. The value dictates how pressing tab progresses across focusable elements on the page.
	public var tabIndex = HTMLAttribute<TabIndex?>("tabindex")
	
	/// Provides additional information about the element, typically presented as a tooltip when hovering.
	public var title = HTMLAttribute<String?>("title")
	
	public enum AutoCapitalization: String, HTMLAttributeEncodable {
		case off
		case sentences
		case words
		case characters
	}
	
	public enum TextDirection: String, HTMLAttributeEncodable {
		case auto
		case leftToRight = "ltr"
		case rightToLeft = "rtl"
	}
	
	public enum InputMode: String, HTMLAttributeEncodable {
		/// no virtual keyboard
		case none
		/// the default keyboard
		case text
		/// a numeric keyboard including the decimal separator (e.g. `.` or `,`)
		case decimal
		/// a numeric keyboard with digits 0-9
		case numeric
		/// a telephone keypad, including the `*` asterisk and the `#` pound key
		case telephone = "tel"
		/// a keyboard tailored towards search operations, e.g. with the return key labeled "Search"
		case search
		/// a keyboard for email addresses, typically including `@` and `.`
		case email
		/// a keyboard for entering URLs, typically including `/` and `.`
		case url
	}
	
	public enum TabIndex: HTMLAttributeEncodable {
		case notReachableByTabbing
		case automatic
		case manualOrder(index: Int)
		
		public func asHTMLAttribute() -> String? {
			switch self {
			case .notReachableByTabbing:
				return "-1"
			case .automatic:
				return ""
			case .manualOrder(let index):
				return "\(index)"
			}
		}
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
