import Foundation

extension Requests {
    public struct PhoneValidateRequest: Codable, Hashable, Sendable {
        /// Phone number to validate. Accepts international format (+14155552671), local format (4155552671) with region, or IDD format (0014155552671) with dialer_region.
        public let number: String
        /// Two-letter ISO country code (e.g., US, GB). Required when number is in local format without + prefix. Cannot be used together with dialer_region.
        public let region: String?
        /// Two-letter ISO country code indicating the country the number is being dialed from. Required when number uses IDD exit code. Cannot be used together with region.
        public let dialerRegion: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            number: String,
            region: String? = nil,
            dialerRegion: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.number = number
            self.region = region
            self.dialerRegion = dialerRegion
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.number = try container.decode(String.self, forKey: .number)
            self.region = try container.decodeIfPresent(String.self, forKey: .region)
            self.dialerRegion = try container.decodeIfPresent(String.self, forKey: .dialerRegion)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.number, forKey: .number)
            try container.encodeIfPresent(self.region, forKey: .region)
            try container.encodeIfPresent(self.dialerRegion, forKey: .dialerRegion)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case number
            case region
            case dialerRegion = "dialer_region"
        }
    }
}