import Foundation

/// Array containing extracted text. Structure varies based on input type and new_line parameter:
/// - Single file, new_line=0: Array with single string element
/// - Single file, new_line=1: Array of strings (one per line)
/// - Bulk/ZIP file, new_line=0: Array of strings (one per file)
/// - Bulk/ZIP file, new_line=1: Array of arrays (each inner array contains lines for respective file)
public enum OcrPredictResponseOcrText: Codable, Hashable, Sendable {
    case stringArray([String])
    case stringArrayArray([[String]])

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode([String].self) {
            self = .stringArray(value)
        } else if let value = try? container.decode([[String]].self) {
            self = .stringArrayArray(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .stringArray(let value):
            try container.encode(value)
        case .stringArrayArray(let value):
            try container.encode(value)
        }
    }
}