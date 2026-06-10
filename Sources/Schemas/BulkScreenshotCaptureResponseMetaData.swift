import Foundation

public struct BulkScreenshotCaptureResponseMetaData: Codable, Hashable, Sendable {
    public let totalUrls: Int
    public let successfulUrls: Int
    public let failedUrls: Int
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        totalUrls: Int,
        successfulUrls: Int,
        failedUrls: Int,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.totalUrls = totalUrls
        self.successfulUrls = successfulUrls
        self.failedUrls = failedUrls
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.totalUrls = try container.decode(Int.self, forKey: .totalUrls)
        self.successfulUrls = try container.decode(Int.self, forKey: .successfulUrls)
        self.failedUrls = try container.decode(Int.self, forKey: .failedUrls)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.totalUrls, forKey: .totalUrls)
        try container.encode(self.successfulUrls, forKey: .successfulUrls)
        try container.encode(self.failedUrls, forKey: .failedUrls)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case totalUrls = "total_urls"
        case successfulUrls = "successful_urls"
        case failedUrls = "failed_urls"
    }
}