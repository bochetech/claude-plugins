---
type: regex
pattern: "\"version\":\\s*\"0\\.3\\.1\""
match: contains
target: {source: file, path: claude-plugins/dtc/.claude-plugin/plugin.json}
---
