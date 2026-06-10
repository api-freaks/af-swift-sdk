import Foundation

public struct PdfListFilesResponseFilesItem: Codable, Hashable, Sendable {
    public let fileId: String
    public let fileName: String
    public let fileType: String?
    public let fileCreationTime: Date?
    public let fileDeletionTime: CalendarDate?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fileId: String,
        fileName: String,
        fileType: String? = nil,
        fileCreationTime: Date? = nil,
        fileDeletionTime: CalendarDate? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.fileId = fileId
        self.fileName = fileName
        self.fileType = fileType
        self.fileCreationTime = fileCreationTime
        self.fileDeletionTime = fileDeletionTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fileId = try container.decode(String.self, forKey: .fileId)
        self.fileName = try container.decode(String.self, forKey: .fileName)
        self.fileType = try container.decodeIfPresent(String.self, forKey: .fileType)
        self.fileCreationTime = try container.decodeIfPresent(Date.self, forKey: .fileCreationTime)
        self.fileDeletionTime = try container.decodeIfPresent(CalendarDate.self, forKey: .fileDeletionTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fileId, forKey: .fileId)
        try container.encode(self.fileName, forKey: .fileName)
        try container.encodeIfPresent(self.fileType, forKey: .fileType)
        try container.encodeIfPresent(self.fileCreationTime, forKey: .fileCreationTime)
        try container.encodeIfPresent(self.fileDeletionTime, forKey: .fileDeletionTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case fileId
        case fileName
        case fileType
        case fileCreationTime
        case fileDeletionTime
    }
}