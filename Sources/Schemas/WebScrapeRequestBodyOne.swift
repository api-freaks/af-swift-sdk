import Foundation

public struct WebScrapeRequestBodyOne: Codable, Hashable, Sendable {
    /// A list of sequential instructions to execute after receiving the static HTML response. Supported methods include `postForm`, `getForm`, and `extract`.
    public let instructions: [WebScrapeRequestBodyOneInstructionsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        instructions: [WebScrapeRequestBodyOneInstructionsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.instructions = instructions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.instructions = try container.decode([WebScrapeRequestBodyOneInstructionsItem].self, forKey: .instructions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.instructions, forKey: .instructions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case instructions
    }
}