for _, m in ipairs({
    "remaps",
    "netrw",
    "term",
    "cursor-jump",
    "comments",
    "indent",
    "func-telescope",
    "cmd",
    "grep",
    "quickfix",
    "man",
    "file-switch",
    "split-max",
    "cleanup",
    "buffer",
}) do
    require("user." .. m)
end
