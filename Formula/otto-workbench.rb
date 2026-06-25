class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.34.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.34.0/otto-workbench-1.34.0.tar.gz"
  sha256 "ef5a94e6dd3436b171630594a243dc16d3cbe475136e010ddf46e84ac563e226"

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
