class ClaudeReview < Formula
  desc "AI-powered code review tool for GitHub pull requests"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.9.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/claude-review-v1.9.1/claude-review-1.9.1.tar.gz"
  sha256 "037447264193b7c08a62a897f89d089ab5371709c6f393197b47570a1eabd033"

  depends_on "bash"
  depends_on "gh"
  depends_on "python@3"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/claude-review"
  end

  def caveats
    <<~EOS
      claude-review requires the Claude Code CLI:
        npm install -g @anthropic-ai/claude-code

      The reviewer agent definition is installed at:
        #{libexec}/agents/reviewer.md

      Symlink it to make it discoverable by Claude Code:
        mkdir -p ~/.claude/agents
        ln -sf #{libexec}/agents/reviewer.md ~/.claude/agents/reviewer.md
    EOS
  end

  test do
    assert_match "claude-review", shell_output("#{bin}/claude-review --help 2>&1")
  end
end
