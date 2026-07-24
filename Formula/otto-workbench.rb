class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.46.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.46.1/otto-workbench-1.46.1.tar.gz"
  sha256 "01632cb6df75e9d8a44bc222bdf95e81a875e4299f8855138a23f01020e53e78"

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
