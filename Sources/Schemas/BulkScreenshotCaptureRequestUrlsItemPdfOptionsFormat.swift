import Foundation

/// Paper size of the PDF. Applies when file_type is PDF. Without it, width and height are used if set, otherwise the page renders as one long page: A0, A1, A2, A3, A4, A5, A6, Letter, Legal, Tabloid, or Ledger.
public enum BulkScreenshotCaptureRequestUrlsItemPdfOptionsFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case a0 = "A0"
    case a1 = "A1"
    case a2 = "A2"
    case a3 = "A3"
    case a4 = "A4"
    case a5 = "A5"
    case a6 = "A6"
    case letter = "Letter"
    case legal = "Legal"
    case tabloid = "Tabloid"
    case ledger = "Ledger"
}