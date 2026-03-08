-- .luacheckrc
-- Standard globals for Alpine Configuration Framework (ACF)
globals = {
    "view",
    "viewlibrary",
    "page_info",
    "htmlviewfunctions",
    "html",
    "string",
    "table",
    "io",
    "os",
    "pairs",
    "ipairs",
    "next",
    "print",
    "require",
    "select",
    "tonumber",
    "tostring",
    "type",
    "unpack",
    "_G",
}

-- Ignore some common issues in ACF modules
ignore = {
    "611", -- line contains only whitespace
    "212", -- unused argument (common in controller actions)
    "211", -- unused variable (common in template logic)
}

-- Target Lua version
std = "lua54"
