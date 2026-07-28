class OttoAiTools < Formula
  desc "AI-powered code review and PR lifecycle tools"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.41.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/otto-ai-tools-v1.41.1/otto-ai-tools-1.41.1.tar.gz"
  sha256 "d69a7a00d39f0b15c9d72f92b226acf7ea4b02a75b6dc7251ea036d9fd36976e"

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
