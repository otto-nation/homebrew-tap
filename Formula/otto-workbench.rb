class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.45.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.45.2/otto-workbench-1.45.2.tar.gz"
  sha256 "b21a84ec135876a57b6f73226aabfed57fc7ea02dc0e5af40c8868e0c5b1ea9a"

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
