class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.46.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.46.2/otto-workbench-1.46.2.tar.gz"
  sha256 "7804526fef152f20f48747d71c0da944f8821c7cab9715d54b34f5860b4bba54"

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
