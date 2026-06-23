class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.32.5"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.32.5/otto-workbench-1.32.5.tar.gz"
  sha256 "2d238cb6bd57a2fff2d805c7a54794443233574175298bfb9ca758bb43f20f2c"

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
