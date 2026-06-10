import Foundation

extension Requests {
    public struct BulkUserAgentLookupRequest: Codable, Hashable, Sendable {
        /// List of user agent strings to parse
        public let uaStrings: [String]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            uaStrings: [String],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.uaStrings = uaStrings
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.uaStrings = try container.decode([String].self, forKey: .uaStrings)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.uaStrings, forKey: .uaStrings)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case uaStrings
        }
    }
}