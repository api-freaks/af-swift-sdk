import Foundation

extension Requests {
    public struct DisposableEmailCheckV2Request: Codable, Hashable, Sendable {
        /// The email address to check.
        public let email: String
        /// Optional IP address to look up for location and security data, such as the IP the signup came from.
        public let ip: String?
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            email: String,
            ip: String? = nil,
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.email = email
            self.ip = ip
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.email = try container.decode(String.self, forKey: .email)
            self.ip = try container.decodeIfPresent(String.self, forKey: .ip)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.email, forKey: .email)
            try container.encodeIfPresent(self.ip, forKey: .ip)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case email
            case ip
        }
    }
}