class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.30.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.30.1/otto-workbench-1.30.1.tar.gz"
  sha256 "9b117343ba4b6988cb1a26cbb9df583d67c71e5d3708f2b85e7d0c7a81e67539"

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
