local use_ai = os.getenv("USE_NVIM_AI_PLUGIN") == "1"


if use_ai then
  return {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
      { "nvim-lua/plenary.nvim" },  -- for curl, log wrapper
    },
    build = "make tiktoken",        -- Only on MacOS or Linux
    config = function()
      require("CopilotChat").setup {}
    end
  }
else
  return {}
end
