vim.g.vimwiki_list = {{
    path = '~/wiki',
    ext = '.md',
}}
vim.g.vimwiki_key_mappings = {
    table_mappings = 0,
    table_format = 0,
    html = 0,
}
vim.g.vimwiki_conceallevel = 0
vim.g.vimwiki_markdown_link_ext = 1

-- reload variables
vim.fn['vimwiki#vars#init']()