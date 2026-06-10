import Foundation

extension Requests {
    public struct ZipcodeDistanceMatchRequest: Codable, Hashable, Sendable {
        /// Comma-separated list of postal/zip codes. Maximum 100 values allowed.
        public let codes: [String]
        /// Country code in ISO 3166-1 alpha-2 format.
        public let country: String
        /// Maximum allowed distance between postal code pairs.
        public let distance: Float?
        /// Supported distance units are m, km, mi, ft, yd, in.
        public let unit: ZipcodeDistanceMatchRequestUnit?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            codes: [String],
            country: String,
            distance: Float? = nil,
            unit: ZipcodeDistanceMatchRequestUnit? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.codes = codes
            self.country = country
            self.distance = distance
            self.unit = unit
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.codes = try container.decode([String].self, forKey: .codes)
            self.country = try container.decode(String.self, forKey: .country)
            self.distance = try container.decodeIfPresent(Float.self, forKey: .distance)
            self.unit = try container.decodeIfPresent(ZipcodeDistanceMatchRequestUnit.self, forKey: .unit)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.codes, forKey: .codes)
            try container.encode(self.country, forKey: .country)
            try container.encodeIfPresent(self.distance, forKey: .distance)
            try container.encodeIfPresent(self.unit, forKey: .unit)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case codes
            case country
            case distance
            case unit
        }
    }
}