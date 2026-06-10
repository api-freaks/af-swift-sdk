import Foundation

public struct BulkEmailValidateResponse: Codable, Hashable, Sendable {
    /// Array of SingleEmailValidationResponse objects for bulk validation
    public let emailValidationResponses: [BulkEmailValidateResponseEmailValidationResponsesItem]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        emailValidationResponses: [BulkEmailValidateResponseEmailValidationResponsesItem]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.emailValidationResponses = emailValidationResponses
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.emailValidationResponses = try container.decodeIfPresent([BulkEmailValidateResponseEmailValidationResponsesItem].self, forKey: .emailValidationResponses)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.emailValidationResponses, forKey: .emailValidationResponses)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case emailValidationResponses
    }
}