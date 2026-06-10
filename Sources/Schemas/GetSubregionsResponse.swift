import Foundation

public struct GetSubregionsResponse: Codable, Hashable, Sendable {
    public let subregions: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        subregions: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.subregions = subregions
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.subregions = try container.decodeIfPresent([String].self, forKey: .subregions)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.subregions, forKey: .subregions)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case subregions
    }
}