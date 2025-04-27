return function(opts)
  opts.ensure_installed = vim.list_extend(opts.ensure_installed or {}, {
    "typescript",
    "javascript",
    "tsx",
    "jsx",
  })
  opts.indent = { enable = true }
  return opts
end
