return {
	"neovim/nvim-lspconfig",
	opts = function(_, opts)
		opts.servers = opts.servers or {}
		local ok, cmake = pcall(require, "cmake-tools")

		local build_dir = ok and cmake.get_build_directory() or nil
		if build_dir then
			vim.notify("Using the following build dir: " .. tostring(build_dir))
			opts.servers.qmlls = {
				cmd = { "qmlls", "-E", "--build-dir", tostring(build_dir) },
			}
		else
			opts.servers.qmlls = {
				cmd = { "qmlls", "-E" },
			}
		end
	end,
}
