class OttoAiTools < Formula
  desc "AI-powered code review and PR lifecycle tools"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.42.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/otto-ai-tools-v1.42.0/otto-ai-tools-1.42.0.tar.gz"
  sha256 "6a876353d9e0ff91ecea7cbbfa84c7a80484d7c1ca00901ff7b23d1bc85d07c5"

  depends_on "bash"
  depends_on "gh"
  depends_on "python@3"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/pr"
  end

  def caveats
    <<~EOS
      Requires the Claude Code CLI:
        npm install -g @anthropic-ai/claude-code

      The reviewer agent definition is installed at:
        #{libexec}/agents/reviewer.md

      Symlink it to make it discoverable by Claude Code:
        mkdir -p ~/.claude/agents
        ln -sf #{libexec}/agents/reviewer.md ~/.claude/agents/reviewer.md
    EOS
  end

  test do
    assert_match "pr", shell_output("#{bin}/pr --help 2>&1")
  end
end
