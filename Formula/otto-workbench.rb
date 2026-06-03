class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.10.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.10.1/otto-workbench-1.10.1.tar.gz"
  sha256 "1d15d7e545ece41e1e36d0f8c0692acd40017e37eee726137821b2c96e8ce7b5"

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
