# Git Commit Message - AutoHotkey v2 Script

This AutoHotkey v2 script file is designed to help users write good commit messages using the Conventional Commits approach. 
The script includes a list of commit message types and their corresponding [emojis](https://gitmoji.dev/), as well as a list of supported applications and their corresponding edit controls.

## Requirements
- [AutoHotkey v2](https://www.autohotkey.com/)
- [UIA-v2.ahk - by Descolada](https://github.com/Descolada/UIA-v2)

## Usage
To use the script, simply run the **Git_Commit_Message.ahk** file.The script will listen for hotstrings corresponding to the commit message types and automatically send the corresponding message to the active application.

The supported commit message types and their corresponding hotstrings are:

|Message Type|Hotstring|
|------------|---------|
|🎉 Initial commit|init|
|➕ add: |add, creat
|🔨 update: |updat, modif, chang|
|♻️ refactor: |refact|
|🐛 fix: |fix|
|⚡️ improv: |improv, enhanc|
|➖ remov: |remov, delet|
|✨ feat: |feat|
|🗑️ Removing dead code|clean|
|🚧 Work in progress|inprogress|
|🧪 For Testing|test|
|🔀 Merge branches|merg|
|💩 Write bad code that needs to be improved|bad, needimprove|
|🚑️ Critical hotfix|hotfix|
|⏪️ revert: |revert|
|👌 Code review changes|review|
|⚡️ perf: |perf|
|💄 style: |styl|
|✅ test: |addtest|
|🔧 Changing configuration files|config|
|🔒️ Fixing security issues|secur|
|📝 docs: |doc|
|📦️ Releasing v1.0 |releas|
|🔖 Tag v0.2 |tag|

## Supported Applications
The script currently supports the following applications:

- GitKraken
- VSCode
- Visual Studio 2022

## Conventional Commits
The commit message types used in this script are based on the Conventional Commits specification. For more information, please see https://www.conventionalcommits.org/en/v1.0.0/.

## License
This script is licensed under the MIT License. See LICENSE for more information.

---
Feel free to modify and customize this script to fit your needs. If you have any feedback or suggestions, feel free to open an issue or a pull request on GitHub!
