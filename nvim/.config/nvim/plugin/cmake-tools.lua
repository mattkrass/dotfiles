require("cmake-tools").setup({
    cmake_kits_path = "/root/.local/share/CMakeTools/cmake-tools-kits.json",
    cmake_build_directory = "/build",
    cmake_build_options = { "-j20" },
})

vim.keymap.set("n", "<leader>cg", "<cmd>CMakeGenerate<CR>", { desc = "Generate a CMake project" })
vim.keymap.set("n", "<leader>cb", "<cmd>CMakeBuild<CR>", { desc = "Build a CMake project" })
vim.keymap.set("n", "<leader>ct", "<cmd>CMakeRunTest<CR>", { desc = "Test a CMake project" })
