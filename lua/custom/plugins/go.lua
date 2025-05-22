-- go.lua
return {
  {
    'ray-x/go.nvim',
    dependencies = { -- optional, but useful
      'ray-x/guihua.lua',
    },
    ft = { 'go', 'gomod' },
    build = ':lua require("go.install").update_all_sync()', -- installs binaries
    config = function()
      require('go').setup {
        gofmt = 'gofmt', -- or "golines" or "goimports"
        goimport = 'goimports', -- sets the goimports command
        fillstruct = 'gopls', -- use gopls for fillstruct
        lsp_cfg = true, -- use default gopls config
        lsp_gofumpt = false, -- set true to use gofumpt format if installed
        lsp_on_attach = true, -- if false, you need to set keymaps manually
        lsp_inlay_hints = {
          enable = false,
        },
      }

      -- Format on save
      local format_sync_grp = vim.api.nvim_create_augroup('GoFormat', {})
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*.go',
        callback = function()
          require('go.format').gofmt() -- run gofmt
          require('go.format').goimports() -- run goimports
        end,
        group = format_sync_grp,
      })
    end,
  },
}
