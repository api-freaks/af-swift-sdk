import Foundation

public struct WebScrapeRequestBodyBlockUrlInstructionsItemClickIfExist: Codable, Hashable, Sendable {
    public let clickIfExist: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        clickIfExist: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.clickIfExist = clickIfExist
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.clickIfExist = try container.decodeIfPresent(String.self, forKey: .clickIfExist)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.clickIfExist, forKey: .clickIfExist)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case clickIfExist
    }
}