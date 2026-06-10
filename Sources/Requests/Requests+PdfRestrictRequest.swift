import Foundation

extension Requests {
    public struct PdfRestrictRequest {
        /// The PDF file to be processed. If this parameter is not provided, you must specify `file_id` to use a previously uploaded file.
        public let file: FormFile

        public init(
            file: FormFile
        ) {
            self.file = file
        }
    }
}

extension Requests.PdfRestrictRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .file(file, fieldName: "file")
        ]
    }
}