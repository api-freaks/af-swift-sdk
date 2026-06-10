import Foundation

extension Requests {
    public struct BulkScreenshotCaptureRequest: Codable, Hashable, Sendable {
        /// List of website URLs to capture screenshots of
        public let urls: [BulkScreenshotCaptureRequestUrlsItem]
        /// Additional properties that are not explicitly defined in the schema
        public let additionalProperties: [String: JSONValue]

        public init(
            urls: [BulkScreenshotCaptureRequestUrlsItem],
            additionalProperties: [String: JSONValue] = .init()
        ) {
            self.urls = urls
            self.additionalProperties = additionalProperties
        }

        public init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.urls = try container.decode([BulkScreenshotCaptureRequestUrlsItem].self, forKey: .urls)
            self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
        }

        public func encode(to encoder: Encoder) throws -> Void {
            var container = encoder.container(keyedBy: CodingKeys.self)
            try encoder.encodeAdditionalProperties(self.additionalProperties)
            try container.encode(self.urls, forKey: .urls)
        }

        /// Keys for encoding/decoding struct properties.
        enum CodingKeys: String, CodingKey, CaseIterable {
            case urls
        }
    }
}