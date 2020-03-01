import Danger
import Foundation

let danger = Danger()
//SwiftLint.lint()
if danger.git.createdFiles.count + danger.git.modifiedFiles.count - danger.git.deletedFiles.count > 25 {
    warn("Big PR, try to keep changes smaller if you can")
}

if !(danger.git.modifiedFiles.filter{ $0.contains("Podfile")}).isEmpty {
  warn("Podfile is modified")
}

if !(danger.git.modifiedFiles.filter{ $0.contains("Info.plist")}).isEmpty {
  warn("Info.plist is modified")
}


//SwiftLint.lint(.modifiedAndCreatedFiles(directory: "Sources"), inline: true)
SwiftLint.lint(inline: true)
// Instead of making a markdown table in the main message
// sprinkle those comments inline, this can be a bit noisy
// but it definitely feels magical.
let editedFiles = danger.git.modifiedFiles + danger.git.createdFiles
let editedAppFiles = editedFiles.filter { $0.contains("/App") }
message("Files:-\(editedFiles)")

if let github = danger.github {
  
  if let additions = github.pullRequest.additions {
    if additions > 200 {
      fail("Big MR, consider splitting into smaller, Additions are \(additions)")
    } else {
      message("MR change count \(additions)")
    }
  }
  if github.pullRequest.body?.count ?? 0 < 10 {
    fail("MR Description is too short")
  } else {
    message("\(github.pullRequest.body ?? "No message")")
  }
  
}

message("Hello, this worked")
