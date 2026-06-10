import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemSwitchToParentFrame: Codable, Hashable, Sendable {
    /// Returns from iframe to parent context.
    public let switchToParentFrame: Bool?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        switchToParentFrame: Bool? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.switchToParentFrame = switchToParentFrame
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.switchToParentFrame = try container.decodeIfPresent(Bool.self, forKey: .switchToParentFrame)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.switchToParentFrame, forKey: .switchToParentFrame)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case switchToParentFrame
    }
}