class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.32.4"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.32.4/otto-workbench-1.32.4.tar.gz"
  sha256 "c325ea1a604387e3070c5c0a5fb032a7f218f73635394ac1c219a3f03a3ca1fc"

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
