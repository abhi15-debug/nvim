return {
  -- 1. Tell lazy.nvim where to download the plugin from
  "ahmedkhalf/project.nvim",
  
  -- 2. Wait until the plugin is downloaded and loaded, then run configuration
  config = function()
    require("project_nvim").setup({
      detection_methods = { "pattern" },
      patterns = { ".git" },
      exclude_dirs = { "~/", "~/.config", "/var/www/html" },
      silent_chdir = false,
    })

    -- 3. Safely load the extension into telescope if telescope is already loaded
    pcall(require('telescope').load_extension, 'projects')
  end
}

