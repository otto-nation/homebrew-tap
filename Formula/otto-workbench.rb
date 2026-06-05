class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.12.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.12.1/otto-workbench-1.12.1.tar.gz"
  sha256 "c8172fe5be7ece4a8379f12fb6f6700ee6303aedfe266b6537fdc4d861befdd3"

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
