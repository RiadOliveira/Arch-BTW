require("jdtls").start_or_attach({
  name = "jdtls",
  cmd = { "jdtls" },
  root_dir = vim.fs.root(0, { "gradlew", ".git", "mvnw" }),
  settings = {
    java = {},
  },
  init_options = {
    bundles = {
      vim.fn.glob(
        "~/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
      ),
    },
  },
})
