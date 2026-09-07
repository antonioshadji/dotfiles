local ok, dap = pcall(require, "dap")
if not ok then
  return
end

dap.adapters.lldb = {
  type = "executable",
  command = "/usr/bin/lldb",
  name = "lldb",
}
