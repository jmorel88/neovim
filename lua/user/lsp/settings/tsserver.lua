return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = ".nvm/versions/node/v20.9.0/lib/node_modules/@vue/typescript-plugin",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "vue",
  },
}
