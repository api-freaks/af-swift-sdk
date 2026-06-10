import Foundation

extension Requests {
    public struct BulkZipcodeLookupRequest: Codable, Hashable, Sendable {
        /// Comma separated list of postal / zip codes. Max. 100 values.
        public let codes: [String]
        /// Country code in ISO 3166-1 alpha-2 format. If not provided, search results will be returned from all countries.
        public let country: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            codes: [String],
            country: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.codes = codes
            self.country = country
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.codes = try container.decode([String].self, forKey: .codes)
            self.country = try container.decodeIfPresent(String.self, forKey: .country)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.codes, forKey: .codes)
            try container.encodeIfPresent(self.country, forKey: .country)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case codes
            case country
        }
    }
}