import Foundation

extension Requests {
    public struct PdfMergeRequest {
        /// The PDF file(s) to be processed. If this parameter is not provided, you must specify `file_id` to use previously uploaded files.
        public let file: [FormFile]

        public init(
            file: [FormFile]
        ) {
            self.file = file
        }
    }
}

extension Requests.PdfMergeRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .fileArray(file, fieldName: "file")
        ]
    }
}