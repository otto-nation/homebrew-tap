class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.41.2"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.41.2/otto-workbench-1.41.2.tar.gz"
  sha256 "11261a6ab845bf20f697a94e236cf0c06c7a4af2ed35085ae55a7fae27a96f7f"

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
