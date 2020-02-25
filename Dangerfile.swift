import Danger
import Foundation

let danger = Danger()
//SwiftLint.lint()
if danger.git.createdFiles.count + danger.git.modifiedFiles.count - danger.git.deletedFiles.count > 300 {
    warn("Big PR, try to keep changes smaller if you can")
}

let swiftFilesWithCopyright = danger.git.createdFiles.filter {
    $0.fileType == .swift
        && danger.utils.readFile($0).contains("//  Created by")
}

if !swiftFilesWithCopyright.isEmpty {
    let files = swiftFilesWithCopyright.joined(separator: ", ")
    warn("In Danger JS we don't include copyright headers, found them in: \(files)")
}

//SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)
SwiftLint.lint(inline: true)
// Instead of making a markdown table in the main message
// sprinkle those comments inline, this can be a bit noisy
// but it definitely feels magical.
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let editedAppFiles = editedFiles.filter { $0.contains("/App") }
message("Files:-\(editedFiles)")

message("Hello, this worked")
