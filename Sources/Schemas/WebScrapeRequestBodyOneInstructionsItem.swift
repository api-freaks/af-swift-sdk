import Foundation

/// A single static-HTML scraping step. Exactly one of these action fields is set per instruction; every other field is absent.
public struct WebScrapeRequestBodyOneInstructionsItem: Codable, Hashable, Sendable {
    /// Form selector and field values to submit via postForm or getForm.
    public let postForm: WebScrapeRequestBodyOneInstructionsItemPostForm?
    /// Form selector and field values to submit via postForm or getForm.
    public let getForm: WebScrapeRequestBodyOneInstructionsItemGetForm?
    /// Maps arbitrary output field names to CSS or XPath selectors. Each key becomes a field in the response's extractedData object.
    public let extract: [String: String]?
    /// Get page action: retrieves the full page content. Optionally provide a URL or selector to target a specific page.
    public let getPage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        postForm: WebScrapeRequestBodyOneInstructionsItemPostForm? = nil,
        getForm: WebScrapeRequestBodyOneInstructionsItemGetForm? = nil,
        extract: [String: String]? = nil,
        getPage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.postForm = postForm
        self.getForm = getForm
        self.extract = extract
        self.getPage = getPage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.postForm = try container.decodeIfPresent(WebScrapeRequestBodyOneInstructionsItemPostForm.self, forKey: .postForm)
        self.getForm = try container.decodeIfPresent(WebScrapeRequestBodyOneInstructionsItemGetForm.self, forKey: .getForm)
        self.extract = try container.decodeIfPresent([String: String].self, forKey: .extract)
        self.getPage = try container.decodeIfPresent(String.self, forKey: .getPage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.postForm, forKey: .postForm)
        try container.encodeIfPresent(self.getForm, forKey: .getForm)
        try container.encodeIfPresent(self.extract, forKey: .extract)
        try container.encodeIfPresent(self.getPage, forKey: .getPage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case postForm
        case getForm
        case extract
        case getPage
    }
}