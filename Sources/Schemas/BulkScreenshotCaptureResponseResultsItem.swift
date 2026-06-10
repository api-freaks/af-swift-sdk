import Foundation

public struct BulkScreenshotCaptureResponseResultsItem: Codable, Hashable, Sendable {
    public let status: String
    public let errorMessage: String?
    public let url: BulkScreenshotCaptureResponseResultsItemUrl
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: String,
        errorMessage: String? = nil,
        url: BulkScreenshotCaptureResponseResultsItemUrl,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.errorMessage = errorMessage
        self.url = url
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.errorMessage = try container.decodeIfPresent(String.self, forKey: .errorMessage)
        self.url = try container.decode(BulkScreenshotCaptureResponseResultsItemUrl.self, forKey: .url)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encodeIfPresent(self.errorMessage, forKey: .errorMessage)
        try container.encode(self.url, forKey: .url)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case errorMessage = "error_message"
        case url
    }
}