import Foundation

extension Requests {
    public struct BulkPhoneValidateRequest: Codable, Hashable, Sendable {
        /// Array of phone number objects. Maximum 100 per request.
        public let numbers: [BulkPhoneValidateRequestNumbersItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            numbers: [BulkPhoneValidateRequestNumbersItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.numbers = numbers
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.numbers = try container.decode([BulkPhoneValidateRequestNumbersItem].self, forKey: .numbers)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.numbers, forKey: .numbers)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case numbers
        }
    }
}