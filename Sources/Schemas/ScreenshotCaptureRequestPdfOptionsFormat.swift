import Foundation

public enum ScreenshotCaptureRequestPdfOptionsFormat: String, Codable, Hashable, CaseIterable, Sendable {
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