class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.10.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.10.0/otto-workbench-1.10.0.tar.gz"
  sha256 "24c22c0d184545025f5314cfb758367af55e100fcaf64198f7f1fc796d27d2ad"

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
