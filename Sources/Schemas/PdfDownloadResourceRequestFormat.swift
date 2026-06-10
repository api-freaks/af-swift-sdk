import Foundation

public enum PdfDownloadResourceRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}