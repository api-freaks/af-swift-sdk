import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemWait: Codable, Hashable, Sendable {
    /// Wait time in milliseconds.
    public let wait: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        wait: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.wait = wait
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.wait = try container.decodeIfPresent(Int.self, forKey: .wait)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.wait, forKey: .wait)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case wait
    }
}