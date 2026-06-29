class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.37.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.37.2/otto-workbench-1.37.2.tar.gz"
  sha256 "3e28e5e39d11b493fb0fb0d6ec43027fc0e0e4b516ca62d562a003222e46b1fe"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/otto-workbench"
  end

  def caveats
    <<~EOS
      Run the following to set up your environment:
        otto-workbench install

      This clones the full repo and configures your shell, git, and dev tools.
    EOS
  end

  test do
    assert_match "otto-workbench", shell_output("#{bin}/otto-workbench help 2>&1")
  end
end
