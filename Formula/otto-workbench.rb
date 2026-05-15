class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.1.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.1.0/otto-workbench-1.1.0.tar.gz"
  sha256 "a6f5a6cd5c204e7a913490ca49075d8db76918a82e45b2e4deb4ed241ceeb96a"

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
