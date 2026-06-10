import Foundation

extension Requests {
    public struct BulkEmailValidateRequest: Codable, Hashable, Sendable {
        /// Array of email objects for bulk validation
        public let emailData: [BulkEmailValidateRequestEmailDataItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            emailData: [BulkEmailValidateRequestEmailDataItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.emailData = emailData
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.emailData = try container.decode([BulkEmailValidateRequestEmailDataItem].self, forKey: .emailData)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.emailData, forKey: .emailData)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case emailData
        }
    }
}