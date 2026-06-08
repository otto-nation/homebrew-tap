class OttoWorkbench < Formula
  desc "Developer environment manager — shell, git, brew, Claude AI tooling"
  homepage "https://github.com/otto-nation/otto-workbench"
  version "1.13.1"
  license "MIT"

  url "https://github.com/otto-nation/otto-workbench/releases/download/v1.13.1/otto-workbench-1.13.1.tar.gz"
  sha256 "5524cb0a8570fab79c4ce6a5e4820ec3a56c048028e65e79a30caad1fced7e77"

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
