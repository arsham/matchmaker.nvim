local M = {}
local health = require("health")

local libs = {
  arshlib = "arsham/arshlib.nvim",
}

M.check = function()
  health.report_start("MatchMaker Health Check")
  for name, package in pairs(libs) do
    if not pcall(require, name) then
      health.report_error(package .. " was not found", {
        'Please install "' .. package .. '"',
      })
    else
      health.report_ok(package .. " is installed")
    end
  end
end
return M
