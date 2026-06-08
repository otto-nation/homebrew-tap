class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.15.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.15.0/otto-workbench-1.15.0.tar.gz"
  sha256 "949fae425bb308452792de1bd4fdf181f24529fb310bcde17b7602d1c833975a"

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
