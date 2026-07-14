class OttoAiTools < Formula
  desc "AI-powered code review and PR lifecycle tools"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.36.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/otto-ai-tools-v1.36.0/otto-ai-tools-1.36.0.tar.gz"
  sha256 "99c34000cc04a1c8f7b3235e9fb0d69cd6ffe98bad35f8b392eb9a202e5461e8"

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
