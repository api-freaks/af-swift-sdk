import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemWaitFor: Codable, Hashable, Sendable {
    public let waitFor: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        waitFor: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.waitFor = waitFor
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.waitFor = try container.decodeIfPresent(String.self, forKey: .waitFor)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.waitFor, forKey: .waitFor)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case waitFor
    }
}