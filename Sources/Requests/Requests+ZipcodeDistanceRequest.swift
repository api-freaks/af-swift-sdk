import Foundation

extension Requests {
    public struct ZipcodeDistanceRequest: Codable, Hashable, Sendable {
        /// Comma separated list of postal / zip codes with which base point is compared w.r.t. Max 100 zip codes can be provided.
        public let compare: [String]
        /// Postal/Zip code to be used as the base point.
        public let code: String?
        /// Latitude coordinate for the base location.
        public let lat: Double?
        /// Longitude coordinate for the base location.
        public let long: Double?
        /// Country code in ISO 3166-1 alpha-2 format.
        public let country: String
        /// Supported distance units are m, km, mi, ft, yd, in.
        public let unit: ZipcodeDistanceRequestUnit?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            compare: [String],
            code: String? = nil,
            lat: Double? = nil,
            long: Double? = nil,
            country: String,
            unit: ZipcodeDistanceRequestUnit? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.compare = compare
            self.code = code
            self.lat = lat
            self.long = long
            self.country = country
            self.unit = unit
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.compare = try container.decode([String].self, forKey: .compare)
            self.code = try container.decodeIfPresent(String.self, forKey: .code)
            self.lat = try container.decodeIfPresent(Double.self, forKey: .lat)
            self.long = try container.decodeIfPresent(Double.self, forKey: .long)
            self.country = try container.decode(String.self, forKey: .country)
            self.unit = try container.decodeIfPresent(ZipcodeDistanceRequestUnit.self, forKey: .unit)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.compare, forKey: .compare)
            try container.encodeIfPresent(self.code, forKey: .code)
            try container.encodeIfPresent(self.lat, forKey: .lat)
            try container.encodeIfPresent(self.long, forKey: .long)
            try container.encode(self.country, forKey: .country)
            try container.encodeIfPresent(self.unit, forKey: .unit)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case compare
            case code
            case lat
            case long
            case country
            case unit
        }
    }
}