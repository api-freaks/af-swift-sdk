import Foundation

public struct PdfUploadBinaryResponse: Codable, Hashable, Sendable {
    /// The name of the uploaded file.
    public let fileName: String?
    /// The unique identifier assigned to the uploaded file.
    public let fileId: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fileName: String? = nil,
        fileId: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fileName = fileName
        self.fileId = fileId
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        self.fileId = try container.decode(String.self, forKey: .fileId)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.fileName, forKey: .fileName)
        try container.encode(self.fileId, forKey: .fileId)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fileName
        case fileId
    }
}