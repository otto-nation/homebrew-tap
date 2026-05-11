class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.0.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.0.2/otto-workbench-1.0.2.tar.gz"
  sha256 "1bfc74a1c72e6a78c89d79a54dc650e8455d1d9a12c5d0e676a63cd60f6a1d22"

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
