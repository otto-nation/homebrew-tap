class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.17.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.17.2/otto-workbench-1.17.2.tar.gz"
  sha256 "23b303b71c571af3ee446025649ff1cbe3877f1a701a15d601620c803af149b6"

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
