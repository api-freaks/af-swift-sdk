import Foundation

public enum PdfEncryptRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}