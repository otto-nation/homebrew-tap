class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.18.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.18.2/otto-workbench-1.18.2.tar.gz"
  sha256 "180398ac887d2629c520ed0665ecd11d74d3dda4c679757f7f753fd58b62824f"

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
