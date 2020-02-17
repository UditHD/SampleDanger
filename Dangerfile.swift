import Danger 
let danger = Danger()
SwiftLint.lint()
// Instead of making a markdown table in the main message
// sprinkle those comments inline, this can be a bit noisy
// but it definitely feels magical.
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let editedAppFiles = editedFiles.filter { $0.contains("/App") }
message("Files:-\(editedFiles)")
SwiftLint.lint(inline: true)

message("Hello, this worked")
