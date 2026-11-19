import Foundation

/// Selectors for locating and solving a single audio CAPTCHA challenge.
public struct WebScrapeRequestBodyBlockUrlInstructionsItemResolveAudioCaptcha: Codable, Hashable, Sendable {
    /// Selector for the audio CAPTCHA element.
    public let audioPath: String?
    /// Selector for the field where the resolved audio CAPTCHA text is entered.
    public let textField: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        audioPath: String? = nil,
        textField: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.audioPath = audioPath
        self.textField = textField
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.audioPath = try container.decodeIfPresent(String.self, forKey: .audioPath)
        self.textField = try container.decodeIfPresent(String.self, forKey: .textField)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.audioPath, forKey: .audioPath)
        try container.encodeIfPresent(self.textField, forKey: .textField)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case audioPath
        case textField
    }
}