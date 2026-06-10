import Foundation

public enum PdfRestrictRequestRestrictionsItem: String, Codable, Hashable, CaseIterable, Sendable {
    case printHigh = "print_high"
    case printLow = "print_low"
    case editDocumentAssembly = "edit_document_assembly"
    case fillFormFields = "fill_form_fields"
    case editAnnotations = "edit_annotations"
    case modifyContent = "modify_content"
    case copyAndExtractContent = "copy_and_extract_content"
    case useAccessibility = "use_accessibility"
}