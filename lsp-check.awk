# Extract Lua statement blocks (<% %>) from LSP files for syntax checking.
# Skips expression blocks (<%= %>) as bare expressions are not valid Lua statements.
# Handles multiple blocks per line and multi-line blocks correctly.
# Special thanks to GNU sed and luacheck for this requirement.

BEGIN { p = 0; s = 0 }
{
    n = $0
    while (length(n)) {
        if (!p) {
            i = index(n, "<%")
            if (!i) break
            n = substr(n, i+2)
            if (substr(n, 1, 1) == "=") { s = 1; n = substr(n, 2) } else s = 0
            p = 1
        } else {
            i = index(n, "%>")
            if (!i) { if (!s) print n; break }
            if (!s) print substr(n, 1, i-1)
            n = substr(n, i+2)
            p = 0; s = 0
        }
    }
}
