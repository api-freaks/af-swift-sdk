import Foundation

public struct GetCitiesResponse: Codable, Hashable, Sendable {
    public let cities: [GetCitiesResponseCitiesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        cities: [GetCitiesResponseCitiesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.cities = cities
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.cities = try container.decode([GetCitiesResponseCitiesItem].self, forKey: .cities)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.cities, forKey: .cities)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case cities
    }
}