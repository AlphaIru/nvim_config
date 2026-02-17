return {
  {
    "nvim-pack/nvim-spectre",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("spectre").setup({
        -- アイコンを綺麗に表示したい場合は、Nerd Fontが必要です
        open_cmd = 'vnew',
        live_update = true, -- 入力と同時に検索結果を更新
      })
    end,
  }
}
