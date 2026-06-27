class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.37.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.37.1/otto-workbench-1.37.1.tar.gz"
  sha256 "c63ac539d08b859f7d1b6d940c32ecdac4a4bca617411a2e334ef73f54ca3a84"

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
