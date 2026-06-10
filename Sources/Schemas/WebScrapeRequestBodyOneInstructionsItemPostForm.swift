import Foundation

public struct WebScrapeRequestBodyOneInstructionsItemPostForm: Codable, Hashable, Sendable {
    /// Submits a form using POST method. Provide the form's XPath/CSS selector and input values.
    public let postForm: WebScrapeRequestBodyOneInstructionsItemPostFormPostForm?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        postForm: WebScrapeRequestBodyOneInstructionsItemPostFormPostForm? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.postForm = postForm
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.postForm = try container.decodeIfPresent(WebScrapeRequestBodyOneInstructionsItemPostFormPostForm.self, forKey: .postForm)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.postForm, forKey: .postForm)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case postForm
    }
}