class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.0.4"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.0.4/otto-workbench-1.0.4.tar.gz"
  sha256 "f5744b400251a0b933a7cdce53d02c0d55519acee03ea54bffbb1d1c3784c58e"

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
