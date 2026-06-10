import Foundation

public enum PdfExtractPagesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}