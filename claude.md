# Claude Code

## Installing clojure-mcp (MCP Server for Clojure REPL integration)

**What is clojure-mcp?**
ClojureMCP is an MCP (Model Context Protocol) server that connects an LLM client (like Claude Code or Claude Desktop) to your Clojure project's REPL. It provides Clojure-aware tools: REPL evaluation, s-expression editing (handles parentheses/formatting), project search, and more.

**Repository:** https://github.com/bhauman/clojure-mcp

### Prerequisites

- Java JDK 17+ (`java -version`)
- Clojure CLI (`clojure --version`)
- ripgrep (optional but recommended for better grep/glob performance) (`rg --version`)

### Step 1: Install clojure-mcp globally

Uses Clojure's built-in "tools" system to install the library globally, making `clojure -Tmcp` available from any directory:

```bash
clojure -Ttools install-latest :lib io.github.bhauman/clojure-mcp :as mcp
```

This clones the repo from GitHub, downloads all dependencies, and registers the tool under the alias `mcp`.

### Step 2: Register clojure-mcp as an MCP server in Claude Code

For Claude Code (CLI), use the lightweight `:cli-assist` config profile:

```bash
claude mcp add clojure-mcp -- clojure -Tmcp start :config-profile :cli-assist
```

This adds a stdio MCP server entry to `.claude.json` (local project config). Claude Code will auto-spawn this process on startup.

For other CLI assistants:
```bash
# OpenAI Codex
codex mcp add clojure-mcp -- clojure -Tmcp start :config-profile :cli-assist

# Google Gemini
gemini mcp add clojure-mcp clojure -Tmcp start :config-profile :cli-assist
```

### Step 3: Verify installation

Test from your project directory:

```bash
clojure -Tmcp start :config-profile :cli-assist
```

You should see JSON-RPC output confirming connection:
```json
{"jsonrpc":"2.0","method":"notifications/tools/list_changed"}
```

### Claude Desktop Configuration (Alternative)

For Claude Desktop, edit `~/Library/Application Support/Claude/claude_desktop_config.json`:

```json
{
  "mcpServers": {
    "clojure-mcp": {
      "command": "/opt/homebrew/bin/bash",
      "args": [
        "-c",
        "clojure -Tmcp start :not-cwd true :port 7888"
      ]
    }
  }
}
```

For Claude Desktop, you must first start an nREPL on port 7888 in your project directory before launching the app.

### Usage

Restart Claude Code after adding the MCP server. When working in a Clojure project directory with an nREPL running, the MCP server will connect and provide tools for evaluating Clojure code, editing forms, and searching the project.
