class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.46.3"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.46.3/otto-workbench-1.46.3.tar.gz"
  sha256 "59a72dee4e9c991e6697b490ab70186e22ca5c0fdb8a73f0d4875ed06b7e74ce"

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
