class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.25.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.25.0/otto-workbench-1.25.0.tar.gz"
  sha256 "f9cc30763383ad2e064fdab9be3339bc67f91a5ebb4b3b64a21b61712fe9c804"

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
