import Foundation

/// Form selector and field values to submit via postForm or getForm.
public struct WebScrapeRequestBodyOneInstructionsItemGetForm: Codable, Hashable, Sendable {
    /// CSS or XPath selector identifying the form element.
    public let selector: String?
    /// Form field name/value pairs to submit.
    public let data: [String: String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        selector: String? = nil,
        data: [String: String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.selector = selector
        self.data = data
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
        self.data = try container.decodeIfPresent([String: String].self, forKey: .data)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.selector, forKey: .selector)
        try container.encodeIfPresent(self.data, forKey: .data)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case selector
        case data
    }
}