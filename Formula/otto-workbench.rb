class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.46.4"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.46.4/otto-workbench-1.46.4.tar.gz"
  sha256 "9398dca1f5756f3a8bcc3ce4761ca43a5309246889a2415a6cdd14fbac1709be"

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
