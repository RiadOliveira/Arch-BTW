return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    {
      "mfussenegger/nvim-jdtls",
      ft = { "java" },
    },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    local widgets = require("dap.ui.widgets")
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<F5>", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<F9>", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<F11>", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<F12>", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<leader>b", function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set("n", "<leader>B", function()
      dap.set_breakpoint()
    end)
    vim.keymap.set("n", "<leader>lp", function()
      dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
    end)
    vim.keymap.set("n", "<leader>dr", function()
      dap.repl.open()
    end)
    vim.keymap.set("n", "<leader>dl", function()
      dap.run_last()
    end)

    vim.keymap.set({ "n", "v" }, "<leader>dh", function()
      widgets.hover()
    end)
    vim.keymap.set({ "n", "v" }, "<leader>dp", function()
      widgets.preview()
    end)
    vim.keymap.set("n", "<leader>df", function()
      widgets.centered_float(widgets.frames)
    end)
    vim.keymap.set("n", "<leader>ds", function()
      widgets.centered_float(widgets.scopes)
    end)

    dap.adapters.gdb = {
      type = "executable",
      command = "gdb",
      args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
    }
    dap.configurations.c = {
      {
        name = "Launch",
        type = "gdb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        args = {},
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
      },
      {
        name = "Select and attach to process",
        type = "gdb",
        request = "attach",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        pid = function()
          local name = vim.fn.input("Executable name (filter): ")
          return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}",
      },
      {
        name = "Attach to gdbserver :1234",
        type = "gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
      },
    }
    dap.configurations.cpp = dap.configurations.c

    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = {
          os.getenv("HOME") .. "/.local/share/nvim/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
          "${port}",
        },
      },
    }
    dap.configurations.javascript = {
      {
        type = "pwa-node",
        request = "launch",
        name = "Launch file",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }
  end,
}
