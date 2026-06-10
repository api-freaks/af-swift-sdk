import Foundation

public struct BulkScreenshotCaptureResponse: Codable, Hashable, Sendable {
    public let status: String
    public let metaData: BulkScreenshotCaptureResponseMetaData
    public let results: [BulkScreenshotCaptureResponseResultsItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: String,
        metaData: BulkScreenshotCaptureResponseMetaData,
        results: [BulkScreenshotCaptureResponseResultsItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.metaData = metaData
        self.results = results
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(String.self, forKey: .status)
        self.metaData = try container.decode(BulkScreenshotCaptureResponseMetaData.self, forKey: .metaData)
        self.results = try container.decode([BulkScreenshotCaptureResponseResultsItem].self, forKey: .results)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.metaData, forKey: .metaData)
        try container.encode(self.results, forKey: .results)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case metaData = "meta_data"
        case results
    }
}