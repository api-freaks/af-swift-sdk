import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToIframe: Codable, Hashable, Sendable {
    /// Switches to an iframe by name or ID.
    public let switchToIframe: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        switchToIframe: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.switchToIframe = switchToIframe
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.switchToIframe = try container.decodeIfPresent(String.self, forKey: .switchToIframe)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.switchToIframe, forKey: .switchToIframe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case switchToIframe
    }
}