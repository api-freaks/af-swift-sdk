import Foundation

extension Requests {
    public struct BulkDomainDnsLookupRequest: Codable, Hashable, Sendable {
        /// List of hostnames to lookup DNS records for
        public let domainNames: [String]
        /// List of IP addresses for reverse DNS lookup.
        public let ipAddresses: [String]?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            domainNames: [String],
            ipAddresses: [String]? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.domainNames = domainNames
            self.ipAddresses = ipAddresses
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.domainNames = try container.decode([String].self, forKey: .domainNames)
            self.ipAddresses = try container.decodeIfPresent([String].self, forKey: .ipAddresses)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.domainNames, forKey: .domainNames)
            try container.encodeIfPresent(self.ipAddresses, forKey: .ipAddresses)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case domainNames
            case ipAddresses
        }
    }
}