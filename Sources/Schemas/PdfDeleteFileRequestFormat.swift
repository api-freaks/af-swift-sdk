import Foundation

public enum PdfDeleteFileRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}