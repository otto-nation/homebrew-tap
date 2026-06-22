class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.32.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.32.2/otto-workbench-1.32.2.tar.gz"
  sha256 "b7aaf0eed81c36cff1c588d761a16ac9d27c6c7ed98303deb92c13d0cbd937b7"

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
