import Foundation

public struct WebScrapeRequestBodyOneInstructionsItemGetForm: Codable, Hashable, Sendable {
    /// Submits a form using GET method. Provide the form's XPath/CSS selector and input values.
    public let getForm: WebScrapeRequestBodyOneInstructionsItemGetFormGetForm?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        getForm: WebScrapeRequestBodyOneInstructionsItemGetFormGetForm? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.getForm = getForm
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.getForm = try container.decodeIfPresent(WebScrapeRequestBodyOneInstructionsItemGetFormGetForm.self, forKey: .getForm)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.getForm, forKey: .getForm)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case getForm
    }
}