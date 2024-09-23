require'nvim-treesitter.configs'.setup {
  ensure_installed = { "java", "rust", "bash", "markdown", "rst", "python", "go", "c", "cpp", "yaml", "toml", "lua", "typescript", "vim", "vimdoc", "query", "javascript", "html", "xml", "latex", "glsl", "hlsl", "cuda"}, 
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "dart", "hack", "ruby", "cue", "odin", "swift" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },
}
