/*
 * Git_Commit_Message.ahk
 * Description: Write Good Commit Messages with [Conventional Commits]
 * Author: x00h (@hsayed21)
*/

; [Emoji Commit Message] https://gitmoji.dev/

#include <UIA>

Persistent
SetKeyDelay(-1)

class CommitMessage {
    ; Define the AppsInfo map, which contains information about the applications to be used
    static AppsInfo := Map(
        "gitkraken", {
            appExe: "gitkraken.exe",
            editCtrls: [{
                name: "Summary",
                type: "50004" ; Type:"Edit"
            }]
        },
        "vscode", {
            appExe: "Code.exe",
            editCtrls: [{
                name: "Source Control Input",
                type: "50024" ; Type:"TreeItem"
            }]
        },
        "vsstudio", {
            appExe: "devenv.exe",
            editCtrls: [{
                name: "Commit comment",
                type: "50004" ; Type:"Edit"
            }]
        },
    )

    ; Define the Messages map, which contains the commit message types and their corresponding emojis
    static Messages := Map(
        "init", "🎉 Initial commit",
        "add", "➕ add: ",
        "creat", "➕ add:  ",
        "updat", "🔨 update: ",
        "modif", "🔨 update: ",
        "chang", "🔨 update: ",
        "refact", "♻️ refactor: ",
        "fix", "🐛 fix: ",
        "improv", "⚡️ improv: ",
        "enhanc", "⚡️ improv: ",
        "remov", "➖ remov: ",
        "delet", "➖ remov: ",
        "feat", "✨ feat: ",
        "clean", "🗑️ Removing dead code",
        "inprogress", "🚧 Work in progress",
        "test", "🧪 For Testing",
        "merg", "🔀 Merge branches",
        "bad", "💩 Write bad code that needs to be improved",
        "needimprove", "💩 Write bad code that needs to be improved",
        "hotfix", "🚑️ Critical hotfix",
        "revert", "⏪️ revert: ",
        "review", "👌 Code review changes",
        "perf", "⚡️ perf: ",
        "styl", "💄 style: ",
        "addtest", "✅ test: ",
        "config", "🔧 Changing configuration files",
        "secur", "🔒️ Fixing security issues",
        "doc", "📝 docs: ",
        "releas", "📦️ Releasing v",
        "tag", "🔖 Tag v",
    )

    ; Define the OnAppActive method, which returns the focused element of the active application
    static OnAppActive()
    {
        for k, v in this.AppsInfo
        {
            if (!WinExist("ahk_exe " . v.appExe))
                continue

            if WinActive("ahk_exe " . v.appExe)
                return this.GetFocusedElement(v.appExe, v.editCtrls)
        }
        return false
    }

    ; Define the IsExist method, which checks if an element exists in the active application
    static IsExist(hwnd, arr, key, focusedEl)
    {
        for k, v in arr {
            if (v.%key% = focusedEl.Name)
                return true
            else
            {
                root := UIA.ElementFromHandle(hwnd)
                existEl := root.ElementExist({ Name: v.name })
                if (existEl)
                {
                    focusedInExist := existEl.ElementExist({ Type: focusedEl.Type, Name: focusedEl.Name })
                    if (focusedInExist)
                        return true
                }
            }
        }
        return false
    }

    ; Define the GetFocusedElement method, which returns the focused element of the specified application
    static GetFocusedElement(appExe, editCtrls)
    {
        hwnd := WinExist("A")
        pName := WinGetProcessName("ahk_id " . hwnd)
        if (pName != appExe)
            return false
        return this.IsExist(hwnd, editCtrls, "name", UIA.GetFocusedElement())
    }

    ; Define the InitHotStrings method, which initializes the hotstrings for the commit message types
    static InitHotStrings()
    {
        for k, v in this.Messages
        {
            HotIf(flag => CommitMessage.OnAppActive())
            Hotstring(":X*:" . k, SetText)
        }

        SetText(_hotstring)
        {
            mKey := StrReplace(_hotstring, ":X*:", "")
            if (Type(this.Messages[mKey]) == "Func")
                mtext := this.Messages[mKey]()
            else
                mtext := this.Messages[mKey]
            BlockInput("Send")
            A_Clipboard := mtext
            Send("^v")
            BlockInput("Off")
        }
    }
}

; Initialize the hotstrings for the commit message types
CommitMessage.InitHotStrings()
