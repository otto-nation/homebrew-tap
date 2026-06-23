class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.32.7"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.32.7/otto-workbench-1.32.7.tar.gz"
  sha256 "8341ff8a55ff1be2188da24267d19cb1224f52266819179cef00d27c031fe9d1"

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
