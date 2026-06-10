import Foundation

public struct PdfListFilesResponse: Codable, Hashable, Sendable {
    public let files: [PdfListFilesResponseFilesItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        files: [PdfListFilesResponseFilesItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.files = files
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.files = try container.decode([PdfListFilesResponseFilesItem].self, forKey: .files)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.files, forKey: .files)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case files
    }
}