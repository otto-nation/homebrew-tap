class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.32.3"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.32.3/otto-workbench-1.32.3.tar.gz"
  sha256 "f7ce06a57012663bebb4a76b83d4d3212aa5b7ac28d4d37841a0ddb4d4549db1"

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
