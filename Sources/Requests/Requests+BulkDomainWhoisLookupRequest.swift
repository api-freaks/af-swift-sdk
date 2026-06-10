import Foundation

extension Requests {
    public struct BulkDomainWhoisLookupRequest: Codable, Hashable, Sendable {
        /// A list of domain names for which WHOIS data is requested.
        public let domainNames: [String]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            domainNames: [String],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.domainNames = domainNames
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.domainNames = try container.decode([String].self, forKey: .domainNames)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.domainNames, forKey: .domainNames)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case domainNames
        }
    }
}