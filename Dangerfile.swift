import Danger 
let danger = Danger()
//SwiftLint.lint()
SwiftLint.lint(inline: true)
// Instead of making a markdown table in the main message
// sprinkle those comments inline, this can be a bit noisy
// but it definitely feels magical.
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let editedAppFiles = editedFiles.filter { $0.contains("/App") }
message("Files:-\(editedFiles)")

message("Hello, this worked")
