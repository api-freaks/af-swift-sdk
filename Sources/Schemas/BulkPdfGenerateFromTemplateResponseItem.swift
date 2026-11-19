import Foundation

/// Result of a PDF generation request, containing the hosted URL of the generated PDF.
public struct BulkPdfGenerateFromTemplateResponseItem: Codable, Hashable, Sendable {
    /// The template that was rendered.
    public let templateId: String
    /// Hosted URL of the generated PDF.
    public let pdfUrl: String
    /// When the PDF was generated (ISO 8601).
    public let createdAt: Date
    /// When the hosted PDF expires (ISO 8601).
    public let expirationTime: Date
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        templateId: String,
        pdfUrl: String,
        createdAt: Date,
        expirationTime: Date,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.templateId = templateId
        self.pdfUrl = pdfUrl
        self.createdAt = createdAt
        self.expirationTime = expirationTime
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.templateId = try container.decode(String.self, forKey: .templateId)
        self.pdfUrl = try container.decode(String.self, forKey: .pdfUrl)
        self.createdAt = try container.decode(Date.self, forKey: .createdAt)
        self.expirationTime = try container.decode(Date.self, forKey: .expirationTime)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.templateId, forKey: .templateId)
        try container.encode(self.pdfUrl, forKey: .pdfUrl)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.expirationTime, forKey: .expirationTime)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case templateId = "template_id"
        case pdfUrl = "pdf_url"
        case createdAt = "created_at"
        case expirationTime = "expiration_time"
    }
}