class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.20.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.20.0/otto-workbench-1.20.0.tar.gz"
  sha256 "b99ec566efbccfa0ec0bbd2e3d166fb491dffd2b13e4da692b80144e1d07cfcf"

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
