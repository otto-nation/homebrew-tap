class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.33.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.33.1/otto-workbench-1.33.1.tar.gz"
  sha256 "59c8cded4c4a70e8312525a76c475aef5a264e892fe4ce426544b7942bf86708"

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
