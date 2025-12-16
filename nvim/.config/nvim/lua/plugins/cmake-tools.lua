return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
         { "akinsho/toggleterm.nvim", version = "*", config = true }
    },
    opts = {
        cmake_kits_path = "/root/.local/share/CMakeTools/cmake-tools-kits.json"
    }
}
