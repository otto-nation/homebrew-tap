class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.3.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.3.0/otto-workbench-1.3.0.tar.gz"
  sha256 "eb6cc55d9a27035e1b39b24ad6d5e364c8edddc3a03d199efeb0684ca39fb2bd"

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
