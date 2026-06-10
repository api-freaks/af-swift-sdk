import Foundation

public struct WebScrapeRequestBodyBlockUrl: Codable, Hashable, Sendable {
    /// List of script or URL patterns to block during network requests.
    public let blockUrl: [String]?
    /// List of cookies to be set in the browser session.
    public let cookies: [WebScrapeRequestBodyBlockUrlCookiesItem]?
    /// An ordered list of step-by-step scraping instructions to be executed in the browser.
    public let instructions: [WebScrapeRequestBodyBlockUrlInstructionsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        blockUrl: [String]? = nil,
        cookies: [WebScrapeRequestBodyBlockUrlCookiesItem]? = nil,
        instructions: [WebScrapeRequestBodyBlockUrlInstructionsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.blockUrl = blockUrl
        self.cookies = cookies
        self.instructions = instructions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.blockUrl = try container.decodeIfPresent([String].self, forKey: .blockUrl)
        self.cookies = try container.decodeIfPresent([WebScrapeRequestBodyBlockUrlCookiesItem].self, forKey: .cookies)
        self.instructions = try container.decode([WebScrapeRequestBodyBlockUrlInstructionsItem].self, forKey: .instructions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.blockUrl, forKey: .blockUrl)
        try container.encodeIfPresent(self.cookies, forKey: .cookies)
        try container.encode(self.instructions, forKey: .instructions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case blockUrl
        case cookies
        case instructions
    }
}