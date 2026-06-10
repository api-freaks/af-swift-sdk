import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha: Codable, Hashable, Sendable {
    /// Solves audio CAPTCHA challenges.
    public let resolveAudioCaptcha: [String: JSONValue]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        resolveAudioCaptcha: [String: JSONValue]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.resolveAudioCaptcha = resolveAudioCaptcha
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.resolveAudioCaptcha = try container.decodeIfPresent([String: JSONValue].self, forKey: .resolveAudioCaptcha)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.resolveAudioCaptcha, forKey: .resolveAudioCaptcha)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case resolveAudioCaptcha
    }
}