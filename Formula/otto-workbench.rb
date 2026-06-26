class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.37.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.37.0/otto-workbench-1.37.0.tar.gz"
  sha256 "8c7db279349b8ecc31eac35cd5f93792e7cde8b5fd034fa326712a736a488c4d"

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
