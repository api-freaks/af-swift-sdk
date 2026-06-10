import Foundation

public enum PdfDecryptRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}