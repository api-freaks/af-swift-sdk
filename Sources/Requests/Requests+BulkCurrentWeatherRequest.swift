import Foundation

extension Requests {
    public struct BulkCurrentWeatherRequest: Codable, Hashable, Sendable {
        /// Array of locations to fetch weather data for
        public let locations: [BulkCurrentWeatherRequestLocationsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            locations: [BulkCurrentWeatherRequestLocationsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.locations = locations
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.locations = try container.decode([BulkCurrentWeatherRequestLocationsItem].self, forKey: .locations)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.locations, forKey: .locations)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case locations
        }
    }
}