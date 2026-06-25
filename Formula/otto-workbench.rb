class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.35.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.35.1/otto-workbench-1.35.1.tar.gz"
  sha256 "834b2488ed264b1140d7f68a70340431e684100151835410d93ea9d32671c79f"

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
