#if os(Linux)
    import Glibc
#else
    import Darwin
#endif
import SwiftCLI

CLI.setup(name: "flock", version: "0.0.1")

CLI.router = FlockRouter()
CLI.versionCommand = VersionCommand()
CLI.helpCommand = HelpCommand()

CLI.register(command: InitCommand())
CLI.register(command: BuildCommand())
CLI.register(command: UpdateCommand())
CLI.register(command: CleanCommand())
CLI.register(command: ResetCommand())
CLI.register(command: CreateTaskCommand())
CLI.register(command: NukeCommand())

CommandAliaser.alias(from: "help", to: "--help")
CommandAliaser.alias(from: "-h", to: "--help")
CommandAliaser.alias(from: "-v", to: "--version")

exit(CLI.go())
