import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemSaveimage: Codable, Hashable, Sendable {
    /// Saves image using selector or ID.
    public let saveimage: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        saveimage: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.saveimage = saveimage
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.saveimage = try container.decodeIfPresent(String.self, forKey: .saveimage)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.saveimage, forKey: .saveimage)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case saveimage
    }
}