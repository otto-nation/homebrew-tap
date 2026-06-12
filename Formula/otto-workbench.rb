class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.19.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.19.0/otto-workbench-1.19.0.tar.gz"
  sha256 "5f5404e7a861f869ef662437c8e380d85678c9eb594de19b00f8616a67bbe04d"

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
