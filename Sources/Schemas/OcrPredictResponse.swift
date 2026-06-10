import Foundation

public struct OcrPredictResponse: Codable, Hashable, Sendable {
    /// Array containing extracted text. Structure varies based on input type and new_line parameter:
    /// - Single file, new_line=0: Array with single string element
    /// - Single file, new_line=1: Array of strings (one per line)
    /// - Bulk/ZIP file, new_line=0: Array of strings (one per file)
    /// - Bulk/ZIP file, new_line=1: Array of arrays (each inner array contains lines for respective file)
    public let ocrText: OcrPredictResponseOcrText
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        ocrText: OcrPredictResponseOcrText,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.ocrText = ocrText
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.ocrText = try container.decode(OcrPredictResponseOcrText.self, forKey: .ocrText)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.ocrText, forKey: .ocrText)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case ocrText = "OCRText"
    }
}