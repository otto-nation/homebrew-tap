class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.6.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.6.0/otto-workbench-1.6.0.tar.gz"
  sha256 "78206563e47c446bb9e06003cfd4eb08ee1c071e43565380069b92e57ce61a5f"

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
