import Foundation

public struct PdfGetTaskStatusResponse: Codable, Hashable, Sendable {
    /// The unique identifier of the PDF processing task.
    public let taskId: String
    /// The current status of the task (e.g., 'queued', 'processing', 'completed', 'failed').
    public let status: String
    /// The timestamp when the task status was created, formatted as 'yyyy-MM-dd HH:mm:ss'.
    public let createdAt: Date
    /// The URL to download all output files as a single ZIP archive. This is present only when the task status is 'COMPLETED'.
    public let zipOutputUrl: String?
    /// The unique identifier for the ZIP file. This is present only when the task status is 'COMPLETED'.
    public let zipFileId: String?
    /// A list of URLs for each individual output file. This is present only when the task is 'COMPLETED'.
    public let outputUrls: [String]?
    /// A list of unique IDs for the output files. This is present only when the task is 'COMPLETED'.
    public let outputIds: [String]?
    /// A list of unique IDs for the input files submitted with the task. If the task was initiated with the `destroy` parameter set to `true`, `inputIds` will not be generated.
    public let inputIds: [String]?
    /// The error code for the PDF Task. This is included only if the task fails.
    public let error: String?
    /// A descriptive message indicating the reason for task failure. This is included only if the task fails.
    public let message: String?
    /// The timestamp when the task status will expire and be removed from the system, formatted as 'yyyy-MM-dd HH:mm:ss'.
    public let expiresAt: Date?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        taskId: String,
        status: String,
        createdAt: Date,
        zipOutputUrl: String? = nil,
        zipFileId: String? = nil,
        outputUrls: [String]? = nil,
        outputIds: [String]? = nil,
        inputIds: [String]? = nil,
        error: String? = nil,
        message: String? = nil,
        expiresAt: Date? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.taskId = taskId
        self.status = status
        self.createdAt = createdAt
        self.zipOutputUrl = zipOutputUrl
        self.zipFileId = zipFileId
        self.outputUrls = outputUrls
        self.outputIds = outputIds
        self.inputIds = inputIds
        self.error = error
        self.message = message
        self.expiresAt = expiresAt
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.taskId = try container.decode(String.self, forKey: .taskId)
        self.status = try container.decode(String.self, forKey: .status)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.zipOutputUrl = try container.decodeIfPresent(String.self, forKey: .zipOutputUrl)
        self.zipFileId = try container.decodeIfPresent(String.self, forKey: .zipFileId)
        self.outputUrls = try container.decodeIfPresent([String].self, forKey: .outputUrls)
        self.outputIds = try container.decodeIfPresent([String].self, forKey: .outputIds)
        self.inputIds = try container.decodeIfPresent([String].self, forKey: .inputIds)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.message = try container.decodeIfPresent(String.self, forKey: .message)
        self.expiresAt = try container.decodeIfPresent(Date.self, forKey: .expiresAt)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.taskId, forKey: .taskId)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encodeIfPresent(self.zipOutputUrl, forKey: .zipOutputUrl)
        try container.encodeIfPresent(self.zipFileId, forKey: .zipFileId)
        try container.encodeIfPresent(self.outputUrls, forKey: .outputUrls)
        try container.encodeIfPresent(self.outputIds, forKey: .outputIds)
        try container.encodeIfPresent(self.inputIds, forKey: .inputIds)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encodeIfPresent(self.message, forKey: .message)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case taskId
        case status
        case createdAt
        case zipOutputUrl
        case zipFileId
        case outputUrls
        case outputIds
        case inputIds
        case error
        case message
        case expiresAt
    }
}