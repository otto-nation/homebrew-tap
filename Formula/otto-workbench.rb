class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.1.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.1.1/otto-workbench-1.1.1.tar.gz"
  sha256 "f8dca2aa45b912270e2759e6d00d6218801b163c4de75257b1d24140f4f3713c"

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
