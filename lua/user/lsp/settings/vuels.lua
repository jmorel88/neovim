local util = require("lspconfig").util

local root_files = {
  "package.json", "vue.config.js"
}

return {
  root_dir = function(fname)
    local primary = util.root_pattern(unpack(root_files))(fname)
    if primary:find("vuestorefront") then
      return primary
    else
      return nil
    end
  end
}
