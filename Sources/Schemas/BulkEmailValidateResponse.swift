import Foundation

public struct BulkEmailValidateResponse: Codable, Hashable, Sendable {
    /// Array of SingleEmailValidationResponse objects for bulk validation
    public let emailResponse: [BulkEmailValidateResponseEmailResponseItem]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        emailResponse: [BulkEmailValidateResponseEmailResponseItem],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.emailResponse = emailResponse
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emailResponse = try container.decode([BulkEmailValidateResponseEmailResponseItem].self, forKey: .emailResponse)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.emailResponse, forKey: .emailResponse)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case emailResponse
    }
}