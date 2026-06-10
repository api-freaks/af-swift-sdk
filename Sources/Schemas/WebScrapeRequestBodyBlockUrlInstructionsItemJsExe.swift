import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemJsExe: Codable, Hashable, Sendable {
    public let jsExe: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        jsExe: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.jsExe = jsExe
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.jsExe = try container.decodeIfPresent(String.self, forKey: .jsExe)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.jsExe, forKey: .jsExe)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case jsExe
    }
}