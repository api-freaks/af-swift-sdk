import Foundation

public struct WebScrapeRequestBodyOneInstructionsItemGetPage: Codable, Hashable, Sendable {
    /// Retrieves page content.
    public let getPage: WebScrapeRequestBodyOneInstructionsItemGetPageGetPage?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        getPage: WebScrapeRequestBodyOneInstructionsItemGetPageGetPage? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.getPage = getPage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.getPage = try container.decodeIfPresent(WebScrapeRequestBodyOneInstructionsItemGetPageGetPage.self, forKey: .getPage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.getPage, forKey: .getPage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case getPage
    }
}