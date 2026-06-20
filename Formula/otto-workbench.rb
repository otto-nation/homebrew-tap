class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.28.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.28.0/otto-workbench-1.28.0.tar.gz"
  sha256 "7b76cc4d79c944a6e7505a6f966e30cb6ac4eaacede3c1ec71cded8f2f18e96e"

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
