class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.35.0"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.35.0/otto-workbench-1.35.0.tar.gz"
  sha256 "b853b70e50bf3f024ba9520210050d12e5b44147fe72c231c8c454f7195f7a9b"

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
