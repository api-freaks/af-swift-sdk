import Foundation

public struct PdfEncryptResponse: Codable, Hashable, Sendable {
    public let taskId: String
    public let inputIds: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        taskId: String,
        inputIds: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.taskId = taskId
        self.inputIds = inputIds
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.taskId = try container.decode(String.self, forKey: .taskId)
        self.inputIds = try container.decodeIfPresent([String].self, forKey: .inputIds)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.taskId, forKey: .taskId)
        try container.encodeIfPresent(self.inputIds, forKey: .inputIds)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case taskId
        case inputIds
    }
}