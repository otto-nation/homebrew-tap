class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.40.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.40.0/otto-workbench-1.40.0.tar.gz"
  sha256 "1a56f1444e62b5365f371e7a63c0d0ae301c460119d35e2bdb6ec5e0ccc59ab1"

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
