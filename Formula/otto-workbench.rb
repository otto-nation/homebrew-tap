class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.47.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.47.0/otto-workbench-1.47.0.tar.gz"
  sha256 "4bdc7669c04da63667a9d3985f2f89272c36a917b97fff66185dd826e0ff8bf8"

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
