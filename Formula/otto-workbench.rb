class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.22.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.22.0/otto-workbench-1.22.0.tar.gz"
  sha256 "fed97a130d8733da0af1ac60c24deaf8c458a5db2ba02202ec588f2f567f292f"

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
