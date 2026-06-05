class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.12.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.12.2/otto-workbench-1.12.2.tar.gz"
  sha256 "bc8212c5bdb1a569effec509f3be1c72052372dab8c645fda718c69c18b48ddb"

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
