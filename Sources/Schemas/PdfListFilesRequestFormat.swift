import Foundation

public enum PdfListFilesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}