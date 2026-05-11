class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.0.3"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.0.3/otto-workbench-1.0.3.tar.gz"
  sha256 "46f617a00682ab756f9aaced82754787c0e862c2b94d5dcc34419501f01967a3"

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
