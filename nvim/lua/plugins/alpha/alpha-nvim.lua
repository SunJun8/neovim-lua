-----------------------------------------------------------
-- Dashboard configuration file
-----------------------------------------------------------

-- Plugin: alpha-nvim
-- url: https://github.com/goolord/alpha-nvim

-- For configuration examples see: https://github.com/goolord/alpha-nvim/discussions/16


local alpha = require 'alpha'
local theme = require 'plugins/alpha/theme'

-- alpha.setup(dashboard.config)
alpha.setup(theme.config)
