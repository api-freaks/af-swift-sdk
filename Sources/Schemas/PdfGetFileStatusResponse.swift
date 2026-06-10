import Foundation

public struct PdfGetFileStatusResponse: Codable, Hashable, Sendable {
    /// The unique identifier of the file.
    public let fileId: String
    /// The name of the file.
    public let fileName: String?
    /// The type of the file (e.g., 'pdf').
    public let fileType: String?
    /// The timestamp when the file was created.
    public let fileCreationTime: Date
    /// Date on which the file is scheduled to be deleted, in UTC.
    public let fileDeletionTime: CalendarDate?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        fileId: String,
        fileName: String? = nil,
        fileType: String? = nil,
        fileCreationTime: Date,
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
        self.fileName = try container.decodeIfPresent(String.self, forKey: .fileName)
        self.fileType = try container.decodeIfPresent(String.self, forKey: .fileType)
        self.fileCreationTime = try container.decode(Date.self, forKey: .fileCreationTime)
        self.fileDeletionTime = try container.decodeIfPresent(CalendarDate.self, forKey: .fileDeletionTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.fileId, forKey: .fileId)
        try container.encodeIfPresent(self.fileName, forKey: .fileName)
        try container.encodeIfPresent(self.fileType, forKey: .fileType)
        try container.encode(self.fileCreationTime, forKey: .fileCreationTime)
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