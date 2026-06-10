import Foundation

public struct BulkCurrentWeatherResponse: Codable, Hashable, Sendable {
    /// Array of weather data
    public let bulk: [BulkCurrentWeatherResponseBulkItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        bulk: [BulkCurrentWeatherResponseBulkItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.bulk = bulk
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.bulk = try container.decode([BulkCurrentWeatherResponseBulkItem].self, forKey: .bulk)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.bulk, forKey: .bulk)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case bulk
    }
}