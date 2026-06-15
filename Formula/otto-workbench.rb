class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.21.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.21.0/otto-workbench-1.21.0.tar.gz"
  sha256 "d74c8697476a5c2e04c272ec9f0136f744bcc6c9c2c513db4447a4c380a141f0"

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
